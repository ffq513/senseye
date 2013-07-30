#ifndef STONYMAN_H
#define STONYMAN_H

///////////////////////////////////////////////////////////////////////////////////////////////////
// Russ Bielawski (russ)
// University of Michigan
//
// stonyman.h
//
// VER    DATE        AUTHOR        DESC
// 0.01   2013-07-23  russ          created.  supports starting and stopping capture, and reading
//                                  from the FIFO in the interrupt (although data is merely
//                                  discarded).  there is some code for multiple cameras, but the
//                                  functional code supports a single camera only.
// 0.02   2013-07-25  russ          implemented stonyman_read.  a user-space program can now read
//                                  from the device file.  THERE IS NO CONCURRENCY PROTECTION.
// 0.03   2013-07-29  russ          added spinlocks to address the glaring race condition between
//                                  stonyman_read and stonyman_interrupt.
//
// Stonyman linux device driver (LKM).
///////////////////////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////////////////////////
// includes
//
#include <asm/ioctl.h>


////////////////////////////////////////////////////////////////////////////////////////////////////
// defines / constants
//
#define STONYMAN_IOC_MAGIC          (0xBB) // arbitrarily chosen (unused in ioctl-number.txt)
#define STONYMAN_IOC_START_CAPTURE  _IO(STONYMAN_IOC_MAGIC, 0)
#define STONYMAN_IOC_STOP_CAPTURE   _IO(STONYMAN_IOC_MAGIC, 1)
#define STONYMAN_IOC_SINGLE_FRAME   _IO(STONYMAN_IOC_MAGIC, 2) // TODO: currently unimplemented
#define STONYMAN_IOC_CMD_CNT        (3)


#endif // STONYMAN_H
