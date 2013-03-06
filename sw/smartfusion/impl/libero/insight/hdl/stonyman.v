///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: University of Michigan
//
// File: stonyman.v
// File history:
//      0.01: 2013-02-05: created
//
// Description: 
//
// Driver for the CentEye Stonyman imager
//
// Targeted device: <Family::SmartFusion> <Die::A2F500M3G> <Package::484 FBGA>
// Author: Russ Bielawski
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

`define CLK_FREQ                   (20000000)  // FIXME (shouldn't be) hardcoded to 20MHz
`define RESOLUTION_ROWS            (112)
`define RESOLUTION_COLS            (112)
`define TIME_PULSE_WAIT            (300)       // ns  // TODO: could be lower possibly (try 200ns)
`define TICKS_PULSE_WAIT           (6)         // FIXME: should be: ((`TIME_PULSE_WAIT*`CLK_FREQ)/1000000000)
`define TIME_PULSE_WAIT_AFTER      (300)       // ns  // TODO: could be lower possibly (try 200ns)
`define TICKS_PULSE_WAIT_AFTER     (6)         // FIXME: should be: ((`TIME_PULSE_WAIT_AFTER*`CLK_FREQ)/1000000000)
`define TIME_PULSE_INPHI           (1000)      // ns
`define TICKS_PULSE_INPHI          (20)        // FIXME: should be: ((`TIME_PULSE_INPHI*`CLK_FREQ)/1000000000)
`define TIME_PULSE_INPHI_AFTER     (1000)      // ns
`define TICKS_PULSE_INPHI_AFTER    (20)        // FIXME: should be: ((`TIME_PULSE_INPHI_AFTER*`CLK_FREQ)/1000000000)
// TODO: is this a reasonable value?
`define TIME_STARTCAP_WAIT_AFTER   (300)       // ns
`define TICKS_STARTCAP_WAIT_AFTER  (6)         // FIXME: should be: ((`TIME_STARTCAP_WAIT_AFTER*`CLK_FREQ)/1000000000)
`define TIME_WAIT_STARTUP          (500)       // ms
`define TICKS_WAIT_STARTUP         (10000000)  // FIXME: should be: ((`TIME_WAIT_START*`CLK_FREQ)/1000)

`define REG_COLSEL                 (0)
`define REG_ROWSEL                 (1)
`define REG_VSW                    (2)
`define REG_HSW                    (3)
`define REG_VREF                   (4)
`define REG_CONFIG                 (5)
`define REG_NBIAS                  (6)
`define REG_AOBIAS                 (7)
`define REG_CNT                    (8)

`define VAL_VREF_3V3               (41)
`define VAL_NBIAS_3V3              (50)
`define VAL_AOBIAS_3V3             (37)

`define VAL_GAIN                   (2)
`define VAL_USE_AMP                (1)
`define VAL_CVDDA                  (16)
`define VAL_CONFIG                 (`VAL_GAIN + (`VAL_USE_AMP<<3) + `VAL_CVDDA)

`define S_INIT_FRESH               (4'd0)
`define S_INIT_REG_CLEARALL        (4'd1)
// !!! order of setting these config registers during init matters!
`define S_INIT_REG_SET_VREF        (4'd2)
`define S_INIT_REG_SET_NBIAS       (4'd3)
`define S_INIT_REG_SET_AOBIAS      (4'd4)
`define S_INIT_REG_SET_CONFIG      (4'd5)
`define S_IDLE                     (4'd6)
`define S_CAP_SET_ROW              (4'd7)
`define S_CAP_SET_COL              (4'd8)
`define S_CAP_PULSE_INPHI          (4'd9)
`define S_CAP_AQUIRE_PIXEL         (4'd10)
`define S_CAP_INC_COL              (4'd11)
`define S_CAP_INC_ROW              (4'd12)

// russ: ordered this way because I'm more likely to add states than registers
`define SUB_S_RESP_RAISE           (5'd0)
`define SUB_S_INCP_RAISE           (5'd1)
`define SUB_S_RESV_RAISE           (5'd2)
`define SUB_S_INCV_RAISE           (5'd3)
`define SUB_S_INPHI_RAISE          (5'd4)
`define SUB_S_RESP_WAIT            (5'd5)
`define SUB_S_INCP_WAIT            (5'd6)
`define SUB_S_RESV_WAIT            (5'd7)
`define SUB_S_INCV_WAIT            (5'd8)
`define SUB_S_INPHI_WAIT           (5'd9)
`define SUB_S_RESP_WAIT_AFTER      (5'd10)
`define SUB_S_INCP_WAIT_AFTER      (5'd11)
`define SUB_S_RESV_WAIT_AFTER      (5'd12)
`define SUB_S_INCV_WAIT_AFTER      (5'd13)
`define SUB_S_INPHI_WAIT_AFTER     (5'd14)
`define SUB_S_STARTCAP_LOWER       (5'd15)
`define SUB_S_STARTCAP_WAIT        (5'd16)
`define SUB_S_STARTCAP_WAIT_AFTER  (5'd17)


module stonyman( clk, reset, startCapture, pixelin, adcConvComplete, resp, incp, resv, incv, inphi,
                 writeEnable, pixelout, startAdcCapture, tp_stateout, tp_substateout );

input clk;
input reset;
input startCapture;          // active low
input [7:0] pixelin;
input adcConvComplete;       // active low
output reg resp;
output reg incp;
output reg resv;
output reg incv;
output reg inphi;
output reg writeEnable;      // active low
output reg [7:0] pixelout;
output reg startAdcCapture;  // active low

output wire [3:0] tp_stateout;
output wire [3:0] tp_substateout;

reg [31:0] counterWait;
reg [15:0] counterPixelsCaptured;

reg [2:0] cachedPOINTER;
reg [7:0] cachedValue [0:`REG_CNT];
reg [3:0] state;
reg [4:0] substate;


assign tp_stateout = ~state;
assign tp_substateout = ~substate;


always@ (posedge clk) // or negedge reset)
begin
   if(0 == reset)
   begin
      state <= `S_INIT_FRESH;
      substate <= 0; // unused in fresh init state
      counterWait <= `TICKS_WAIT_STARTUP;
      cachedPOINTER <= 0;
      resp <= 1'b0;
      incp <= 1'b0;
      resv <= 1'b0;
      incv <= 1'b0;
      inphi <= 1'b0;
      writeEnable <= 1'b1;
      startAdcCapture <= 1'b1;
   end
   else
   begin

//////////////////////////////////////////////////////////////////////
// case  -  state
      case(state)

         `S_INIT_FRESH:
         begin
            if(0 < counterWait)
            begin
               counterWait <= counterWait-1;
            end
            else
            begin
               state <= `S_INIT_REG_CLEARALL;
               substate <= `SUB_S_RESP_RAISE;
            end
         end

         `S_INIT_REG_CLEARALL:

//////////////////////////////////////////////////////////////////////
// case  -  substate
         begin
            case(substate)
        ////////////////////////////////////////////////////////////
        // RESP - reset pointer
               `SUB_S_RESP_RAISE:
               begin
                  resp <= 1'b1;
                  counterWait <= `TICKS_PULSE_WAIT-1;
                  substate <= `SUB_S_RESP_WAIT;
               end
               `SUB_S_RESP_WAIT:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     resp <= 1'b0;
                     cachedPOINTER <= 0;
                     substate <= `SUB_S_RESP_WAIT_AFTER;
                     counterWait <= `TICKS_PULSE_WAIT_AFTER-2;
                  end
               end
               `SUB_S_RESP_WAIT_AFTER:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     substate <= `SUB_S_RESV_RAISE;
                  end
               end
        ////////////////////////////////////////////////////////////
        // RESV - reset value: loops over all registers
               `SUB_S_RESV_RAISE:
               begin
                  resv <= 1'b1;
                  counterWait <= `TICKS_PULSE_WAIT-1;
                  substate <= `SUB_S_RESV_WAIT;
               end
               `SUB_S_RESV_WAIT:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     resv <= 1'b0;
                     cachedValue[cachedPOINTER] <= 8'd0;
                     counterWait <= `TICKS_PULSE_WAIT_AFTER-2;
                     substate <= `SUB_S_RESV_WAIT_AFTER;
                  end
               end
               `SUB_S_RESV_WAIT_AFTER:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     // have we covered all of our registers?
                     if((`REG_CNT-1) == cachedPOINTER)
                     begin
                        // yes: go on to the next state
                        state <= `S_INIT_REG_SET_VREF;
                        substate <= `SUB_S_RESP_RAISE;
                     end
                     else
                     begin
                        // no: keep going
                        substate <= `SUB_S_INCP_RAISE;
                     end
                  end
               end
        ////////////////////////////////////////////////////////////
        // INCP - increment pointer: loops over all registers with RESV
               `SUB_S_INCP_RAISE:
               begin
                  incp <= 1'b1;
                  counterWait <= `TICKS_PULSE_WAIT-1;
                  substate <= `SUB_S_INCP_WAIT;
               end
               `SUB_S_INCP_WAIT:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     incp <= 1'b0;
                     cachedPOINTER <= cachedPOINTER+1;
                     counterWait <= `TICKS_PULSE_WAIT_AFTER-2;
                     substate <= `SUB_S_INCP_WAIT_AFTER;
                  end
               end
               `SUB_S_INCP_WAIT_AFTER:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     substate <= `SUB_S_RESV_RAISE;
                  end
               end
               default:
               begin
                  // badness!
               end
            endcase
         end
// endcase  -  substate
//////////////////////////////////////////////////////////////////////

         `S_INIT_REG_SET_VREF:

//////////////////////////////////////////////////////////////////////
// case  -  substate
         begin
            case(substate)
        ////////////////////////////////////////////////////////////
        // RESP - reset pointer
               `SUB_S_RESP_RAISE:
               begin
                  resp <= 1'b1;
                  counterWait <= `TICKS_PULSE_WAIT-1;
                  substate <= `SUB_S_RESP_WAIT;
               end
               `SUB_S_RESP_WAIT:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     resp <= 1'b0;
                     cachedPOINTER <= 0;
                     counterWait <= `TICKS_PULSE_WAIT_AFTER-2;
                     substate <= `SUB_S_RESP_WAIT_AFTER;
                  end
               end
               `SUB_S_RESP_WAIT_AFTER:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     substate <= `SUB_S_INCP_RAISE;
                  end
               end
        ////////////////////////////////////////////////////////////
        // INCP - increment until you get to the VREF register
            `SUB_S_INCP_RAISE:
               begin
                  incp <= 1'b1;
                  counterWait <= `TICKS_PULSE_WAIT-1;
                  substate <= `SUB_S_INCP_WAIT;
               end
               `SUB_S_INCP_WAIT:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     incp <= 1'b0;
                     cachedPOINTER <= cachedPOINTER+1;
                     counterWait <= `TICKS_PULSE_WAIT_AFTER-2;
                     substate <= `SUB_S_INCP_WAIT_AFTER;
                  end
               end
               `SUB_S_INCP_WAIT_AFTER:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     // have we incremented the pointer enough times?
                     if(`REG_VREF == cachedPOINTER)
                     begin
                        // yes: go to setting the value with INCV
                        substate <= `SUB_S_INCV_RAISE;
                     end
                     else
                     begin
                        // no: keep incrementing
                        substate <= `SUB_S_INCP_RAISE;
                     end
                  end
               end
        ////////////////////////////////////////////////////////////
        // INCV - increment until we have the value we want
               `SUB_S_INCV_RAISE:
               begin
                  incv <= 1'b1;
                  counterWait <= `SUB_S_INCV_WAIT-1;
                  substate <= `SUB_S_INCV_WAIT;
               end
               `SUB_S_INCV_WAIT:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     incv <= 1'b0;
                     cachedValue[cachedPOINTER] <= cachedValue[cachedPOINTER]+1;
                     counterWait <= `TICKS_PULSE_WAIT_AFTER-2;
                     substate <= `SUB_S_INCV_WAIT_AFTER;
                  end
               end
               `SUB_S_INCV_WAIT_AFTER:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     // have we incremented the value enough times?
                     if(`VAL_VREF_3V3 == cachedValue[cachedPOINTER])
                     begin
                        // yes: go on to the next state
                        state <= `S_INIT_REG_SET_NBIAS;
                        substate <= `SUB_S_INCP_RAISE;
                     end
                     else
                     begin
                        // no: keep incrementing
                        substate <= `SUB_S_INCV_RAISE;
                     end
                  end
               end
               default:
               begin
                  // badness!
               end
            endcase
         end
// endcase  -  substate
//////////////////////////////////////////////////////////////////////

         `S_INIT_REG_SET_NBIAS:

//////////////////////////////////////////////////////////////////////
// case  -  substate
         begin
            case(substate)
        ////////////////////////////////////////////////////////////
        // INCP - increment until you get to the NBIAS register
               `SUB_S_INCP_RAISE:
               begin
                  incp <= 1'b1;
                  counterWait <= `TICKS_PULSE_WAIT-1;
                  substate <= `SUB_S_INCP_WAIT;
               end
               `SUB_S_INCP_WAIT:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     incp <= 1'b0;
                     cachedPOINTER <= cachedPOINTER+1;
                     counterWait <= `TICKS_PULSE_WAIT_AFTER-2;
                     substate <= `SUB_S_INCP_WAIT_AFTER;
                  end
               end
               `SUB_S_INCP_WAIT_AFTER:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     // have we incremented the pointer enough times?
                     if(`REG_NBIAS == cachedPOINTER)
                     begin
                        // yes: go to setting the value with INCV
                        substate <= `SUB_S_INCV_RAISE;
                     end
                     else
                     begin
                        // no: keep incrementing
                        substate <= `SUB_S_INCP_RAISE;
                     end
                  end
               end
        ////////////////////////////////////////////////////////////
        // INCV - increment until we have the value we want
               `SUB_S_INCV_RAISE:
               begin
                  incv <= 1'b1;
                  counterWait <= `TICKS_PULSE_WAIT-1;
                  substate <= `SUB_S_INCV_WAIT;
               end
               `SUB_S_INCV_WAIT:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     incv <= 1'b0;
                     cachedValue[cachedPOINTER] <= cachedValue[cachedPOINTER]+1;
                     counterWait <= `TICKS_PULSE_WAIT_AFTER-2;
                     substate <= `SUB_S_INCV_WAIT_AFTER;
                  end
               end
               `SUB_S_INCV_WAIT_AFTER:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     // have we incremented the value enough times?
                     if(`VAL_NBIAS_3V3 == cachedValue[cachedPOINTER])
                     begin
                        // yes: go on to the next state
                        state <= `S_INIT_REG_SET_AOBIAS;
                        substate <= `SUB_S_INCP_RAISE;
                     end
                     else
                     begin
                        // no: keep incrementing
                        substate <= `SUB_S_INCV_RAISE;
                     end
                  end
               end
               default:
               begin
                  // badness!
               end
            endcase
         end
// endcase  -  substate
//////////////////////////////////////////////////////////////////////

         `S_INIT_REG_SET_AOBIAS:

//////////////////////////////////////////////////////////////////////
// case  -  substate
         begin
            case(substate)
        ////////////////////////////////////////////////////////////
        // INCP - increment until you get to the AOBIAS register
               `SUB_S_INCP_RAISE:
               begin
                  incp <= 1'b1;
                  counterWait <= `TICKS_PULSE_WAIT-1;
                  substate <= `SUB_S_INCP_WAIT;
               end
               `SUB_S_INCP_WAIT:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     incp <= 1'b0;
                     cachedPOINTER <= cachedPOINTER+1;
                     counterWait <= `TICKS_PULSE_WAIT_AFTER-2;
                     substate <= `SUB_S_INCP_WAIT_AFTER;
                  end
               end
               `SUB_S_INCP_WAIT_AFTER:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     // have we incremented the pointer enough times?
                     if(`REG_AOBIAS == cachedPOINTER)
                     begin
                        // yes: go to setting the value with INCV
                        substate <= `SUB_S_INCV_RAISE;
                     end
                     else
                     begin
                        // no: keep incrementing
                        substate <= `SUB_S_INCP_RAISE;
                     end
                  end
               end
        ////////////////////////////////////////////////////////////
        // INCV - increment until we have the value we want
               `SUB_S_INCV_RAISE:
               begin
                  incv <= 1'b1;
                  counterWait <= `TICKS_PULSE_WAIT-1;
                  substate <= `SUB_S_INCV_WAIT;
               end
               `SUB_S_INCV_WAIT:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     incv <= 1'b0;
                     cachedValue[cachedPOINTER] <= cachedValue[cachedPOINTER]+1;
                     counterWait <= `TICKS_PULSE_WAIT_AFTER-2;
                     substate <= `SUB_S_INCV_WAIT_AFTER;
                  end
               end
               `SUB_S_INCV_WAIT_AFTER:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     // have we incremented the value enough times?
                     if(`VAL_AOBIAS_3V3 == cachedValue[cachedPOINTER])
                     begin
                        // yes: go on to the next state
                        state <= `S_INIT_REG_SET_CONFIG;
                        substate <= `SUB_S_RESP_RAISE;
                     end
                     else
                     begin
                        // no: keep incrementing
                        substate <= `SUB_S_INCV_RAISE;
                     end
                  end
               end
               default:
               begin
                  // badness!
               end
            endcase
         end
// endcase  -  substate
//////////////////////////////////////////////////////////////////////

         `S_INIT_REG_SET_CONFIG:

//////////////////////////////////////////////////////////////////////
// case  -  substate
         begin
            case(substate)
        ////////////////////////////////////////////////////////////
        // RESP - reset pointer
               `SUB_S_RESP_RAISE:
               begin
                  resp <= 1'b1;
                  counterWait <= `TICKS_PULSE_WAIT-1;
                  substate <= `SUB_S_RESP_WAIT;
               end
               `SUB_S_RESP_WAIT:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     resp <= 1'b0;
                     cachedPOINTER <= 0;
                     counterWait <= `TICKS_PULSE_WAIT_AFTER-2;
                     substate <= `SUB_S_RESP_WAIT_AFTER;
                  end
               end
               `SUB_S_RESP_WAIT_AFTER:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     substate <= `SUB_S_INCP_RAISE;
                  end
               end
        ////////////////////////////////////////////////////////////
        // INCP - increment until you get to the CONFIG register
               `SUB_S_INCP_RAISE:
               begin
                  incp <= 1'b1;
                  counterWait <= `TICKS_PULSE_WAIT-1;
                  substate <= `SUB_S_INCP_WAIT;
               end
               `SUB_S_INCP_WAIT:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     incp <= 1'b0;
                     cachedPOINTER <= cachedPOINTER+1;
                     counterWait <= `TICKS_PULSE_WAIT_AFTER-2;
                     substate <= `SUB_S_INCP_WAIT_AFTER;
                  end
               end
               `SUB_S_INCP_WAIT_AFTER:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     // have we incremented the pointer enough times?
                     if(`REG_CONFIG == cachedPOINTER)
                     begin
                        // yes: go to setting the value with INCV
                        substate <= `SUB_S_INCV_RAISE;
                     end
                     else
                     begin
                        // no: keep incrementing
                        substate <= `SUB_S_INCP_RAISE;
                     end
                  end
               end
        ////////////////////////////////////////////////////////////
        // INCV - increment until we have the value we want
               `SUB_S_INCV_RAISE:
               begin
                  incv <= 1'b1;
                  counterWait <= `TICKS_PULSE_WAIT-1;
                  substate <= `SUB_S_INCV_WAIT;
               end
               `SUB_S_INCV_WAIT:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     incv <= 1'b0;
                     cachedValue[cachedPOINTER] <= cachedValue[cachedPOINTER]+1;
                     counterWait <= `TICKS_PULSE_WAIT_AFTER-2;
                     substate <= `SUB_S_INCV_WAIT_AFTER;
                  end
               end
               `SUB_S_INCV_WAIT_AFTER:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     // have we incremented the value enough times?
                     if(`VAL_CONFIG == cachedValue[cachedPOINTER])
                     begin
                        // yes: go on to the next state
                        // inited!  finally!
                        state <= `S_IDLE;
                        substate <= 0; // unnecessary
                     end
                     else
                     begin
                        // no: keep incrementing
                        substate <= `SUB_S_INCV_RAISE;
                     end
                  end
               end
               default:
               begin
                  // badness!
               end
            endcase
         end
// endcase  -  substate
//////////////////////////////////////////////////////////////////////

         `S_IDLE:
         begin
            if(0 < counterWait)
            begin
               counterWait <= counterWait-1;
            end
            else
            begin
               if(1'b0 == startCapture)
               begin
                  counterPixelsCaptured <= 0;
                  state <= `S_CAP_SET_ROW;
                  substate <= `SUB_S_RESP_RAISE;
               end
            end
         end

         // TODO: setting column before row makes more sense given the order of
         // COLSEL(->reg[0]) and ROWSEL(->reg[1]) register numbers.
         `S_CAP_SET_ROW:

//////////////////////////////////////////////////////////////////////
// case  -  substate
         begin
            case(substate)
        ////////////////////////////////////////////////////////////
        // RESP - reset pointer
               `SUB_S_RESP_RAISE:
               begin
                  // don't reset the pointer with RESP if it's not necessary
                  if(`REG_ROWSEL >= cachedPOINTER)
                  begin
                     substate <= `SUB_S_INCP_RAISE;
                  end
                  else
                  begin
                     resp <= 1'b1;
                     counterWait <= `TICKS_PULSE_WAIT-1;
                     substate <= `SUB_S_RESP_WAIT;
                  end
               end
               `SUB_S_RESP_WAIT:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     resp <= 1'b0;
                     cachedPOINTER <= 0;
                     counterWait <= `TICKS_PULSE_WAIT_AFTER-2;
                     substate <= `SUB_S_RESP_WAIT_AFTER;
                  end
               end
               `SUB_S_RESP_WAIT_AFTER:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     substate <= `SUB_S_INCP_RAISE;
                  end
               end
        ////////////////////////////////////////////////////////////
        // INCP - increment until you get to the ROWSEL register
               `SUB_S_INCP_RAISE:
               begin
                  // we need to check here because we might already be at the
                  // desired register
                  if(`REG_ROWSEL == cachedPOINTER)
                  begin
                     substate <= `SUB_S_RESV_RAISE;
                  end
                  else
                  begin
                     incp <= 1'b1;
                     counterWait <= `TICKS_PULSE_WAIT-1;
                     substate <= `SUB_S_INCP_WAIT;
                  end
               end
               `SUB_S_INCP_WAIT:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     incp <= 1'b0;
                     cachedPOINTER <= cachedPOINTER+1;
                     counterWait <= `TICKS_PULSE_WAIT_AFTER-2;
                     substate <= `SUB_S_INCP_WAIT_AFTER;
                  end
               end
               `SUB_S_INCP_WAIT_AFTER:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     // have we incremented the pointer enough times?
                     if(`REG_ROWSEL == cachedPOINTER)
                     begin
                        // yes: go to (re)setting the value with RESV/INCV
                        substate <= `SUB_S_RESV_RAISE;
                     end
                     else
                     begin
                        // no: keep incrementing
                        substate <= `SUB_S_INCP_RAISE;
                     end
                  end
               end
        ////////////////////////////////////////////////////////////
        // RESV - reset value: loops over all registers
               `SUB_S_RESV_RAISE:
               begin
                  // don't reset the value with RESV if it's not necessary
                  // TODO: this is dumb right!?
                  if(0 == cachedValue[cachedPOINTER])
                  begin
                     state <= `S_CAP_SET_COL;
                     substate <= `SUB_S_RESP_RAISE;
                  end
                  else
                  begin
                     resv <= 1'b1;
                     counterWait <= `TICKS_PULSE_WAIT-1;
                     substate <= `SUB_S_RESV_WAIT;
                  end
               end
               `SUB_S_RESV_WAIT:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     resv <= 1'b0;
                     cachedValue[cachedPOINTER] <= 0;
                     counterWait <= `TICKS_PULSE_WAIT_AFTER-2;
                     substate <= `SUB_S_RESV_WAIT_AFTER;
                  end
               end
               `SUB_S_RESV_WAIT_AFTER:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     state <= `S_CAP_SET_COL;
                     substate <= `SUB_S_RESP_RAISE;
                  end
               end
               default:
               begin
                  // badness!
               end
            endcase
         end
// endcase  -  substate
//////////////////////////////////////////////////////////////////////

         `S_CAP_SET_COL:

//////////////////////////////////////////////////////////////////////
// case  -  substate
         begin
            case(substate)
        ////////////////////////////////////////////////////////////
        // RESP - reset pointer
               `SUB_S_RESP_RAISE:
               begin
                  // don't reset the pointer with RESP if it's not necessary
                  if(`REG_COLSEL >= cachedPOINTER)
                  begin
                     substate <= `SUB_S_INCP_RAISE;
                  end
                  else
                  begin
                     resp <= 1'b1;
                     counterWait <= `TICKS_PULSE_WAIT-1;
                     substate <= `SUB_S_RESP_WAIT;
                  end
               end
               `SUB_S_RESP_WAIT:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     resp <= 1'b0;
                     cachedPOINTER <= 0;
                     counterWait <= `TICKS_PULSE_WAIT_AFTER-2;
                     substate <= `SUB_S_RESP_WAIT_AFTER;
                  end
               end
               `SUB_S_RESP_WAIT_AFTER:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     substate <= `SUB_S_INCP_RAISE;
                  end
               end
        ////////////////////////////////////////////////////////////
        // INCP - increment until you get to the COLSEL register
               // TODO russ remove all INCP logic, COLSEL is reg 0
               `SUB_S_INCP_RAISE:
               begin
                  // we need to check here because we might already be at the
                  // desired register
                  if(`REG_COLSEL == cachedPOINTER)
                  begin
                     substate <= `SUB_S_RESV_RAISE;
                  end
                  else
                  begin
                     incp <= 1'b1;
                     counterWait <= `TICKS_PULSE_WAIT-1;
                     substate <= `SUB_S_INCP_WAIT;
                  end
               end
               `SUB_S_INCP_WAIT:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     incp <= 1'b0;
                     cachedPOINTER <= cachedPOINTER+1;
                     counterWait <= `TICKS_PULSE_WAIT_AFTER-2;
                     substate <= `SUB_S_INCP_WAIT_AFTER;
                  end
               end
               `SUB_S_INCP_WAIT_AFTER:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     // have we incremented the pointer enough times?
                     if(`REG_ROWSEL == cachedPOINTER)
                     begin
                        // yes: go to (re)setting the value with RESV/INCV
                        substate <= `SUB_S_RESV_RAISE;
                     end
                     else
                     begin
                        // no: keep incrementing
                        substate <= `SUB_S_INCP_RAISE;
                     end
                  end
               end
        ////////////////////////////////////////////////////////////
        // RESV - reset value: loops over all registers
               `SUB_S_RESV_RAISE:
               begin
                  // don't reset the value with RESV if it's not necessary
                  if(0 == cachedValue[cachedPOINTER])
                  begin
                     state <= `S_CAP_PULSE_INPHI;
                     substate <= `SUB_S_INPHI_RAISE;
                  end
                  else
                  begin
                     resv <= 1'b1;
                     counterWait <= `TICKS_PULSE_WAIT-1;
                     substate <= `SUB_S_RESV_WAIT;
                  end
               end
               `SUB_S_RESV_WAIT:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     resv <= 1'b0;
                     cachedValue[cachedPOINTER] <= 0;
                     counterWait <= `TICKS_PULSE_WAIT_AFTER-2;
                     substate <= `SUB_S_RESV_WAIT_AFTER;
                  end
               end
               `SUB_S_RESV_WAIT_AFTER:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     state <= `S_CAP_PULSE_INPHI;
                     substate <= `SUB_S_INPHI_RAISE;
                  end
               end
               default:
               begin
                  // badness!
               end
            endcase
         end
// endcase  -  substate
//////////////////////////////////////////////////////////////////////

         `S_CAP_PULSE_INPHI:

//////////////////////////////////////////////////////////////////////
// case  -  substate
         begin
            case(substate)
        ////////////////////////////////////////////////////////////
        // INPHI - pulse the INPHI line to operate the preamp
               `SUB_S_INPHI_RAISE:
               begin
                  inphi <= 1'b1;
                  counterWait <= `TICKS_PULSE_INPHI-1;
                  substate <= `SUB_S_INPHI_WAIT;
               end
               `SUB_S_INPHI_WAIT:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     inphi <= 1'b0;
                     counterWait <= `TICKS_PULSE_INPHI_AFTER-1;
                     substate <= `SUB_S_INPHI_WAIT_AFTER;
                  end
               end
               `SUB_S_INPHI_WAIT_AFTER:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     state <= `S_CAP_AQUIRE_PIXEL;
                     substate <= `SUB_S_STARTCAP_LOWER;
                  end
               end
               default:
               begin
                  // badness!
               end
            endcase
         end
// endcase  -  substate
//////////////////////////////////////////////////////////////////////

         `S_CAP_AQUIRE_PIXEL:

//////////////////////////////////////////////////////////////////////
// case  -  substate
         begin
            case(substate)
               `SUB_S_STARTCAP_LOWER:
               begin
                  startAdcCapture <= 1'b0;
                  // wait on conversion complete flag from ADC driver
                  substate <= `SUB_S_STARTCAP_WAIT;
               end
               `SUB_S_STARTCAP_WAIT:
               begin
                  // there should be sufficient space between raising of
                  // startAdcCapture line and lowering of this line (by the ADC
                  // driver)
                  if(0 == adcConvComplete)
                  begin
                     startAdcCapture <= 1'b1;
                     pixelout <= pixelin;
                     writeEnable <= 1'b0;
                     counterPixelsCaptured <= counterPixelsCaptured+1;
                     // TODO: is this a reasonable value?
                     counterWait <= `TICKS_STARTCAP_WAIT_AFTER;
                     substate <= `SUB_S_STARTCAP_WAIT_AFTER;
                  end
               end
               `SUB_S_STARTCAP_WAIT_AFTER:
               begin
                  if(1'b0 == writeEnable)
                  begin
                     writeEnable <= 1'b1;
                  end
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     if((`RESOLUTION_ROWS*`RESOLUTION_COLS) == counterPixelsCaptured)
                     begin
                        // we've captured all the pixels
                        state <= `S_IDLE;
                        substate <= 0; // unnecessary
                        // FIXME russ: remove this!  it's only here for when
                        // the "button press"
                        counterWait <= `TICKS_WAIT_STARTUP;
                     end
                     else if(0 == (counterPixelsCaptured%`RESOLUTION_COLS))
                     begin
                        // upon incrementing the row, the logic will also reset the
                        // COLSEL val
                        state <= `S_CAP_INC_ROW;
                        // OPTIMIZATION
                        substate <= `SUB_S_INCP_RAISE;
                     end
                     else
                     begin
                        state <= `S_CAP_INC_COL;
                        substate <= `SUB_S_RESP_RAISE;
                     end
                  end
               end
               default:
               begin
                  // badness!
               end
            endcase
         end
// endcase  -  substate
//////////////////////////////////////////////////////////////////////

         `S_CAP_INC_COL:

//////////////////////////////////////////////////////////////////////
// case  -  substate
         begin
            case(substate)
        ////////////////////////////////////////////////////////////
        // RESP - reset pointer
               `SUB_S_RESP_RAISE:
               begin
                  // don't reset the pointer with RESP if it's not necessary
                  if(`REG_COLSEL >= cachedPOINTER)
                  begin
                     substate <= `SUB_S_INCP_RAISE;
                  end
                  else
                  begin
                     resp <= 1'b1;
                     counterWait <= `TICKS_PULSE_WAIT-1;
                     substate <= `SUB_S_RESP_WAIT;
                  end
               end
               `SUB_S_RESP_WAIT:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     resp <= 1'b0;
                     cachedPOINTER <= 0;
                     counterWait <= `TICKS_PULSE_WAIT_AFTER-2;
                     substate <= `SUB_S_RESP_WAIT_AFTER;
                  end
               end
               `SUB_S_RESP_WAIT_AFTER:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     substate <= `SUB_S_INCP_RAISE;
                  end
               end
        ////////////////////////////////////////////////////////////
        // INCP - increment until you get to the COLSEL register
               // TODO russ remove all INCP logic, COLSEL is reg 0
               `SUB_S_INCP_RAISE:
               begin
                  // we need to check here because we might already be at the
                  // desired register
                  if(`REG_COLSEL == cachedPOINTER)
                  begin
                     substate <= `SUB_S_INCV_RAISE;
                  end
                  else
                  begin
                     incp <= 1'b1;
                     counterWait <= `TICKS_PULSE_WAIT-1;
                     substate <= `SUB_S_INCP_WAIT;
                  end
               end
               `SUB_S_INCP_WAIT:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     incp <= 1'b0;
                     cachedPOINTER <= cachedPOINTER+1;
                     counterWait <= `TICKS_PULSE_WAIT_AFTER-2;
                     substate <= `SUB_S_INCP_WAIT_AFTER;
                  end
               end
               `SUB_S_INCP_WAIT_AFTER:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     // have we incremented the pointer enough times?
                     if(`REG_ROWSEL == cachedPOINTER)
                     begin
                        // yes: go to (re)setting the value with RESV/INCV
                        substate <= `SUB_S_INCV_RAISE;
                     end
                     else
                     begin
                        // no: keep incrementing
                        substate <= `SUB_S_INCP_RAISE;
                     end
                  end
               end
        ////////////////////////////////////////////////////////////
        // INCV - increment ONCE
               `SUB_S_INCV_RAISE:
               begin
                  incv <= 1'b1;
                  counterWait <= `TICKS_PULSE_WAIT-1;
                  substate <= `SUB_S_INCV_WAIT;
               end
               `SUB_S_INCV_WAIT:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     incv <= 1'b0;
                     cachedValue[cachedPOINTER] <= cachedValue[cachedPOINTER]+1;
                     counterWait <= `TICKS_PULSE_WAIT_AFTER-2;
                     substate <= `SUB_S_INCV_WAIT_AFTER;
                  end
               end
               `SUB_S_INCV_WAIT_AFTER:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     // one increment is all we want
                     // we don't need to change the ROW value
                     state <= `S_CAP_PULSE_INPHI;
                     substate <= `SUB_S_INPHI_RAISE;
                  end
               end
               default:
               begin
                  // badness!
               end
            endcase
         end
// endcase  -  substate
//////////////////////////////////////////////////////////////////////

         `S_CAP_INC_ROW:

//////////////////////////////////////////////////////////////////////
// case  -  substate
         begin
            case(substate)
               // OPTIMIZATION: we can only get here from the COLSEL logic, so no
               // need to pulse RESP
        ////////////////////////////////////////////////////////////
        // INCP - increment until you get to the ROWSEL register
               `SUB_S_INCP_RAISE:
               begin
                  // we need to check here because we might already be at the
                  // desired register (in actuality, our optimization assumptions
                  // also assumpes that we WON'T be at the ROWSEL register)
                  if(`REG_ROWSEL == cachedPOINTER)
                  begin
                     substate <= `SUB_S_INCV_RAISE;
                  end
                  else
                  begin
                     incp <= 1'b1;
                     counterWait <= `TICKS_PULSE_WAIT-1;
                     substate <= `SUB_S_INCP_WAIT;
                  end
               end
               `SUB_S_INCP_WAIT:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     incp <= 1'b0;
                     cachedPOINTER <= cachedPOINTER+1;
                     counterWait <= `TICKS_PULSE_WAIT_AFTER-2;
                     substate <= `SUB_S_INCP_WAIT_AFTER;
                  end
               end
               `SUB_S_INCP_WAIT_AFTER:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     // have we incremented the pointer enough times?
                     if(`REG_ROWSEL == cachedPOINTER)
                     begin
                        // yes: go to (re)setting the value with RESV/INCV
                        substate <= `SUB_S_INCV_RAISE;
                     end
                     else
                     begin
                        // SHOULD NEVER GET HERE!
                        // no: keep incrementing
                        substate <= `SUB_S_INCP_RAISE;
                     end
                  end
               end
        ////////////////////////////////////////////////////////////
        // INCV - increment ONCE
               `SUB_S_INCV_RAISE:
               begin
                  incv <= 1'b1;
                  counterWait <= `TICKS_PULSE_WAIT-1;
                  substate <= `SUB_S_INCV_WAIT;
               end
               `SUB_S_INCV_WAIT:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     incv <= 1'b0;
                     cachedValue[cachedPOINTER] <= cachedValue[cachedPOINTER]+1;
                     counterWait <= `TICKS_PULSE_WAIT_AFTER-2;
                     substate <= `SUB_S_INCV_WAIT_AFTER;
                  end
               end
               `SUB_S_INCV_WAIT_AFTER:
               begin
                  if(0 < counterWait)
                  begin
                     counterWait <= counterWait-1;
                  end
                  else
                  begin
                     // one increment is all we want
                     // need to (re)set col val
                     state <= `S_CAP_SET_COL;
                     substate <= `SUB_S_RESP_RAISE;
                  end
               end
               default:
               begin
                  // badness!
               end
            endcase
         end
// endcase  -  substate
//////////////////////////////////////////////////////////////////////

      endcase
// endcase  -  state
//////////////////////////////////////////////////////////////////////

   end
end

endmodule

