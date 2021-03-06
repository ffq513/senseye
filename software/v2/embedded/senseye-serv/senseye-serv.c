//**************************************************************************************************
// SensEye v2 imager data server with an HTTP 1.0 interface.
// This program is part of the SensEye project.
// Copyright (C) 2012-2013  The University of Michigan
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//**************************************************************************************************

//**************************************************************************************************
// senseye-serv.c
//
//
// SensEye v2 imager data server with an HTTP 1.0 interface.
//
// Runs on uClinux on the SmartFusion.
//
//
// AUTHORS
// Russ Bielawski <jbielaws@umich.edu>
//
//
// VERSION   DATE        DESCRIPTION
// 00.01.00  2012-11-14  Created.
// 01.00.00  2013-03-01  Runs on smartfusion uClinux (no fork()).
//                       Discriminates good vs bad requests (good requests start with the string
//                       "GET" and the rest is ignored).
// 01.01.00  2013-06-18  Added support for multiple cameras.  However, only CAM0 is actually being
//                       used, and its data is being transmitted thrice as if to appear to be three
//                       distinct cameras.  This is because the APB3 bus cannot keep up with all
//                       three cameras and the FIFOs overflow.  By only using CAM0, all the other
//                       FIFOs overflow, but we can keep up with CAM0.
// 01.02.00  2013-07-25  Code reads from device file (/dev/stonymanX for camera X).  It now requires
//                       the stonyman driver loadable kernel module to be loaded.  Also added
//                       command-line parsing (although, only the -h help flag is supported).
// 02.00.00  2013-09-05  Multiple cameras supported (2 currently).
// 02.01.00  2013-09-09  Send NUM_CAMS as response to GET request, supporting this part of the
//                       glasses protocol (finally)
// 02.02.01  2013-09-09  Added real support for the DEBUG_MIMIC_MULTICAMS option.
//**************************************************************************************************


//**************************************************************************************************
// includes
//
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <time.h>
#include <assert.h>
#include <signal.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <fcntl.h>
#include "stonyman.h"


//**************************************************************************************************
// defines / constants
//
typedef  unsigned long   uint32;
typedef  unsigned short  uint16;
typedef  unsigned char   uint8;

#define DEFAULT_PORT              (80)
#define MAX_CONNS                 (1)
#define REQ_MAX_LEN               (1024)  // Bytes (chosen arbitrarily)
#define RESOLUTION_ROWS           (112)
#define RESOLUTION_COLS           (112)
#define RESOLUTION                (RESOLUTION_ROWS*RESOLUTION_COLS)

#define SYMBOL_SOF                ((uint8)0xFF)

#define OPCODE_START              ((uint8)0x01)
#define OPCODE_STOP               ((uint8)0x02)
#define OPCODE_SINGLE_FRAME       ((uint8)0x04)
#define OPCODE_START_ACK          ((uint8)0x81)
#define OPCODE_STOP_ACK           ((uint8)0x82)
#define OPCODE_FRAME              ((uint8)0x84)

#define OPCODE_REQ_NUM_CAMS       ((uint8)0x21)
#define OPCODE_RESP_NUM_CAMS      ((uint8)0xA1)

#define REG_BASE_ADDR             (0x40060000ul)
#define REG_MASK_CAM_IND          (0x00000080ul)
#define REG_CAM_REG_SPACE_WIDTH   (0x00000020ul)
#define REG_SET_OFFSET_CAM0       (REG_MASK_CAM_IND|(REG_CAM_REG_SPACE_WIDTH*0))
#define REG_SET_OFFSET_CAM1       (REG_MASK_CAM_IND|(REG_CAM_REG_SPACE_WIDTH*1))
#define REG_SET_OFFSET_CAM2       (REG_MASK_CAM_IND|(REG_CAM_REG_SPACE_WIDTH*2))
#define REG_SET_OFFSET_CAM3       (REG_MASK_CAM_IND|(REG_CAM_REG_SPACE_WIDTH*3))
#define REG_OFFSET_GLOB_STARTCAP  (0x00000000ul)
#define REG_OFFSET_GLOB_STATUS    (0x00000000ul)
#define REG_OFFSET_CAMX_STATUS    (0x00000000ul)
#define REG_OFFSET_CAMX_PXDATA    (0x00000004ul)

#define REG_CTRL                  (*((volatile uint32*)(REG_BASE_ADDR+REG_OFFSET_GLOB_STARTCAP)))
#define REG_FLAGS                 (*((volatile uint32*)(REG_BASE_ADDR+REG_OFFSET_GLOB_STATUS)))
#define REG_CAMX_BASE(xx)         (REG_BASE_ADDR+REG_MASK_CAM_IND+(REG_CAM_REG_SPACE_WIDTH*(xx)))
#define REG_CAMX_STATUS(xx)       (*((volatile uint32*)(REG_CAMX_BASE(xx)+REG_OFFSET_CAMX_STATUS)))
#define REG_CAMX_PXDATA(xx)       (*((volatile uint32*)(REG_CAMX_BASE(xx)+REG_OFFSET_CAMX_PXDATA)))

#define FLAG_SHIFT_BUSY           (0u)
#define FLAG_SHIFT_EMPTY          (0u)
#define FLAG_SHIFT_FULL           (1u)
#define FLAG_SHIFT_AFULL          (2u)

#define NUM_CAMS                  (2)

#define DEBUG_MIMIC_MULTICAM      (0)
#define DEBUG_MIMIC_NUM_CAMS      (3)

const char STONY_DEVICE_FILENAME [NUM_CAMS] [15] = {"/dev/stonyman0","/dev/stonyman1"};

const char RESP_BAD_REQUEST[] = "HTTP/1.0 400 Bad Request\n";
// TODO: a success header is not currently used
const char RESP_SUCCESS_HEADER[] = "HTTP/1.0 200 OK\n";
const char RESP_NUMCAMS_HEADER[] = {SYMBOL_SOF,OPCODE_RESP_NUM_CAMS};
const char RESP_FRAME_HEADER[] = {SYMBOL_SOF,OPCODE_FRAME};


//**************************************************************************************************
// globals
//
unsigned  g_flag_print_help;
int       stony_fd  [NUM_CAMS];
uint8    *img_buf   [NUM_CAMS];


//**************************************************************************************************
// local function prototypes
//
static void request_handler(int sd);
static void request_send_data(int sd);
static void print_usage(char const *const progname);
static void print_help(char const *const progname);
static int  parse_args(int argc, char **argv);


//**************************************************************************************************
// main
//
int main(int argc, char** argv)
{
   // parse cli
   g_flag_print_help=0;
   parse_args(argc,argv);
   if(0!=g_flag_print_help)
   {
      print_help(argv[0]);
      exit(0);
   }
   unsigned ii;
   int sd_listen, sd_client;
   struct sockaddr_in sockaddr_server, sockaddr_client;
   unsigned len;


   // start up the server
   sd_listen = socket(AF_INET, SOCK_STREAM, 0);
   if(0 > sd_listen)
   {
      fprintf(stderr,"ERROR: can't create listening socket\n");
      exit(1);
   }


   // fill in socket details
   memset(&sockaddr_server,0,sizeof(sockaddr_server));
   sockaddr_server.sin_family      = AF_INET;
   sockaddr_server.sin_addr.s_addr = htonl(INADDR_ANY);
   sockaddr_server.sin_port        = htons(DEFAULT_PORT);


   // bind
   if(0 > bind(sd_listen, (struct sockaddr*)&sockaddr_server, sizeof(sockaddr_server)))
   {
      fprintf(stderr,"ERROR: could not bind listening socket\n");
      exit(1);
   }

   // listen
   if(0 > listen(sd_listen, MAX_CONNS))
   {
      fprintf(stderr,"ERROR: listen call failed\n");
      exit(1);
   }


   // malloc the image buffers (this is required for uclinux)
   for(ii=0; ii<NUM_CAMS; ++ii)
   {
      img_buf[ii] = (uint8*)malloc(RESOLUTION*sizeof(uint8));
      if(NULL==img_buf[ii])
      {
         fprintf(stderr,"couldn't malloc %d bytes for the image buffer\n");
         exit(1);
      }
   }

   // and away we go
   //while(1)
   {
      sd_client = accept(sd_listen, (struct sockaddr*)&(sockaddr_client), &len);
      if(0 > sd_client)
      {
         fprintf(stderr,"ERROR: accept call failed\n");
         exit(1);
      }

// FIXME: no fork() in uClinux TODO: use vfork() instead (requires exec() to be called)?
//      pid = fork();
//      if(0 == pid)
//      {
//         // child
         request_handler(sd_client);
         if(0 > close(sd_client))
         {
            fprintf(stderr,"ERROR: close call failed\n");
            fflush(stderr);
            exit(1);
         }
//         exit(0);
//      }
//      else
//      {
//         // parent
//
//         // just close socket
//         if(0 > close(sd_client))
//         {
//            fprintf(stderr,"ERROR: close call failed\n");
//            fflush(stderr);
//            exit(1);
//         }
//
//         // TODO russ: should I wait on the child?  (I don't think so)
//      }
   }

   // unreachable
   return -1;
}


//**************************************************************************************************
// local function definitions
//
static void request_handler(int sd)
{
   unsigned ii;
   uint8_t recvBuf[REQ_MAX_LEN];
   unsigned recvLen, recvLenTotal;
   unsigned flag_bad_request;
   unsigned send_len_ret;
   uint8 send_buf_numcams[1];


#if(0 == DEBUG_MIMIC_MULTICAM)
   send_buf_numcams[0]=((uint8)NUM_CAMS);
#else
   send_buf_numcams[0]=((uint8)DEBUG_MIMIC_NUM_CAMS);
#endif


   flag_bad_request=0;

   recvLenTotal=0;
   recvBuf[0] = '\0';
   do
   {
      recvLen = recv(sd, (void*)(&(recvBuf[recvLenTotal])), (REQ_MAX_LEN-recvLenTotal), 0);
      if(0 > recvLen)
      {
         if(EAGAIN == errno)
         {
            // do nothing, just try again later
         }
         else
         {
            fprintf(stderr, "request_handler: recv call returns failure");
            fflush(stderr);
            exit(1);
         }
      }
      else if(0 == recvLen)
      {
         flag_bad_request = 1;
      }
      else
      {
         recvLenTotal += recvLen;
         for(ii=0; ii<recvLen; ++ii)
         {
            // I'll just treat a null char as a new line
            if(    ('\0' == recvBuf[recvLenTotal-recvLen+ii])
                || ('\n' == recvBuf[recvLenTotal-recvLen+ii]) )
            {
               // null terminate the request string (we'll ignore the rest)
               recvBuf[recvLenTotal-recvLen+ii] = '\0';
               recvLenTotal = recvLenTotal-recvLen+ii;
               break;
            }
         }
      }
   } while((REQ_MAX_LEN > recvLenTotal) && (0 != recvLen) && ('\0' != recvBuf[recvLenTotal]));

   if(0 == flag_bad_request)
   {
      if((3 <= recvLenTotal) && ('G' == recvBuf[0]) && ('E' == recvBuf[1]) && ('T' == recvBuf[2]))
      {
         // good request!
         // return data
         // TODO: remove debug output (maybe)
         fprintf(stderr, "good request!\n");
         /*FIXME put this back in (right?)
          * send_len_ret = send(sd, (const void*)(&RESP_SUCCESS_HEADER), sizeof(RESP_SUCCESS_HEADER), 0);
         if(sizeof(RESP_SUCCESS_HEADER) != send_len_ret)
         {
            fprintf(stderr, "request_handler: send call returns wrong length");
            fflush(stderr);
            exit(1);
         }*/
         for(ii=0; ii<NUM_CAMS; ++ii)
         {
            stony_fd[ii]=open(STONY_DEVICE_FILENAME[ii], O_RDONLY, NULL);
            if(0>stony_fd[ii])
            {
               fprintf( stderr,"ERROR: opening file %s failed (errno=%d)\n",
                        STONY_DEVICE_FILENAME[ii],errno );
               fprintf(stderr,"%s\n",strerror(errno));
               exit(1);
            }
            //fprintf(stderr,"DEBUG: opened dev file %s with descriptor %d\n",STONY_DEVICE_FILENAME[ii],stony_fd[ii]);
            //fflush(stderr);
         }

         // send numcams message
         send_len_ret=send(sd, (const void*)(&RESP_NUMCAMS_HEADER), sizeof(RESP_NUMCAMS_HEADER), 0);
         if(sizeof(RESP_NUMCAMS_HEADER) != send_len_ret)
         {
            fprintf(stderr, "request_handler: send call returns wrong length (%d)\n",send_len_ret);
            fflush(stderr);
            exit(1);
         }
         send_len_ret = send( sd, (const void*)(&send_buf_numcams),
                              sizeof(send_buf_numcams), 0 );
         if(sizeof(send_buf_numcams) != send_len_ret)
         {
            fprintf(stderr, "request_handler: send call returns wrong length (%d)\n",send_len_ret);
            fflush(stderr);
            exit(1);
         }

         // stonyman driver: start capture
         for(ii=0; ii<NUM_CAMS; ++ii)
         {
            //fprintf(stderr,"DEBUG: starting capture on cam %d (descriptor %d)\n",ii,stony_fd[ii]);
            //fflush(stderr);
            ioctl(stony_fd[ii],STONYMAN_IOC_START_CAPTURE);
         }

         // send data!
         while(1)
         {
            request_send_data(sd);
         }
      }
      else
      {
         // bad request :(
         // TODO: remove debug output (maybe)
         flag_bad_request=1; // unnecessary
         fprintf(stderr, "bad request :(\n");
         send_len_ret = send(sd, (const void*)(&RESP_BAD_REQUEST), sizeof(RESP_BAD_REQUEST), 0);
         if(sizeof(RESP_BAD_REQUEST) != send_len_ret)
         {
            fprintf(stderr, "request_handler: send call returns wrong length");
            fflush(stderr);
            exit(1);
         }
      }
   }
}

static void request_send_data(int sd)
{
   unsigned ii;
   uint32 regflags;
   uint32 regdata;
   int tmp_px_read;
   uint16 pixelcount[NUM_CAMS];
   unsigned send_len_ret;


   // send header
   send_len_ret = send(sd, (const void*)(&RESP_FRAME_HEADER), sizeof(RESP_FRAME_HEADER), 0);
   //fprintf(stderr,"send_len: %d\n",send_len_ret);
   if(sizeof(RESP_FRAME_HEADER) != send_len_ret)
   {
      fprintf(stderr, "request_send_data: send call returns wrong length (%d)\n",send_len_ret);
      fflush(stderr);
      exit(1);
   }


   // read from stonyman device file
   for(ii=0; ii<NUM_CAMS; ++ii)
   {
      pixelcount[ii]=0;
   }
   // FIXME: this shouldn't be hardcoded (it should be parameterized to NUM_CAMS)
   while((RESOLUTION>pixelcount[0]) || (RESOLUTION>pixelcount[1]))
   {
      for(ii=0; ii<NUM_CAMS; ++ii)
      {
         if(RESOLUTION>pixelcount[ii])
         {
            tmp_px_read=0;
            // FIXME: shouln't it be (uint8*)(&(img_buf[ii][pixelcount[ii]]))?
            tmp_px_read = read(stony_fd[ii], img_buf[ii], RESOLUTION-pixelcount[ii]);
            if((0 > tmp_px_read) && ((EAGAIN == errno) || (EWOULDBLOCK == errno)))
            {
               // do nothing, just try again
               //fprintf(stderr,"EAGAIN while attempting to read from %s\n",STONY_DEVICE_FILENAME[ii]);
               //fflush(stderr);
            }
            else if(0 > tmp_px_read)
            {
               // error
               fprintf(stderr,"read error from %s (errno=%d)!\n",STONY_DEVICE_FILENAME[ii],errno);
               fprintf(stderr,"%s\n",strerror(errno));
               fflush(stderr);
               assert(0 < tmp_px_read);
            }
            else
            {
               pixelcount[ii] += tmp_px_read;
               //fprintf(stderr,"DEBUG: read %d pixels from cam %d (total read=%d)\n",tmp_px_read,ii,pixelcount[ii]);
               //fflush(stderr);
            }
         }
      }
   }


   // transmit data
#if (0 == DEBUG_MIMIC_MULTICAM)
   for(ii=0; ii<NUM_CAMS; ++ii)
   {
      send_len_ret = send(sd, (const void*)(img_buf[ii]), RESOLUTION, 0);
      //fprintf(stderr,"send_len: %d\n",send_len_ret);
      if(RESOLUTION != send_len_ret)
      {
         fprintf(stderr, "request_send_data: send call returns wrong length (%d)\n",send_len_ret);
         fflush(stderr);
         exit(1);
      }
   }
#else
   // FOR DEBUGGING: mimic multiple cameras with only CAM0
   for(ii=0; ii<DEBUG_MIMIC_NUM_CAMS; ++ii)
   {
      send_len_ret = send(sd, (const void*)(img_buf[0]), RESOLUTION, 0);
      //fprintf(stderr,"send_len: %d\n",send_len_ret);
      if(RESOLUTION != send_len_ret)
      {
         fprintf(stderr, "request_send_data: send call returns wrong length (%d)\n",send_len_ret);
         fflush(stderr);
         exit(1);
      }
   }
#endif

   //fprintf(stderr,"frame complete\n");
}

//
// print_usage: prints a usage string for the program
//
static void print_usage(char const *const progname)
{
   fprintf(stderr, "Usage: %s\n", progname);
}

//
// print_help: prints the help for the program
//
static void print_help(char const *const progname)
{
   print_usage(progname);
   fprintf(stderr, "No flags need to be supplied to this program.\n");
}

//
// parse_args: parse cli
//
static int parse_args(int argc, char **argv)
{
   char cc;
   extern char *optarg;

   errno=0;

   // for some reason, checking for EOF wasn't working (maybe a uClinux peculiarity)
   // so, check against optind used instead
   while(argc>optind)
   {
      // (still safest to check against EOF here)
      if((cc = getopt(argc, argv, "h")) == EOF)
      {
         break;
      }
      switch (cc) {
         case 'h':
            g_flag_print_help=1;
            break;
         default:
            errno=EINVAL;
            break;
      }
   }

   return(errno);
}
