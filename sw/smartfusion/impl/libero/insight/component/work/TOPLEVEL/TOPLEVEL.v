//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Wed Mar 27 13:32:43 2013
// Version: 10.1 SP3 10.1.3.1
//////////////////////////////////////////////////////////////////////

`timescale 1 ns/100 ps

// TOPLEVEL
module TOPLEVEL(
    // Inputs
    CAPTURE,
    CLK50,
    MAC_CRSDV,
    MAC_RXD,
    MAC_RXER,
    MAINXIN,
    MISO,
    MSS_RESET_N,
    UART_0_RXD,
    // Outputs
    CS,
    MAC_MDC,
    MAC_TXD,
    MAC_TXEN,
    SCLK,
    TP_BUSY,
    TP_EMPTY,
    TP_FULL,
    TP_PADDR_BIT2,
    TP_PENABLE,
    TP_PREADY,
    TP_PSEL,
    TP_PWRITE,
    TP_RDEN,
    TP_START_CAPTURE,
    TP_WREN,
    UART_0_TXD,
    incp,
    incv,
    inphi,
    led,
    psram_address,
    psram_nbyte_en,
    psram_ncs0,
    psram_ncs1,
    psram_noe0,
    psram_noe1,
    psram_nwe,
    resp,
    resv,
    rs485_de,
    rs485_nre,
    // Inouts
    MAC_MDIO,
    psram_data
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input         CAPTURE;
input         CLK50;
input         MAC_CRSDV;
input  [1:0]  MAC_RXD;
input         MAC_RXER;
input         MAINXIN;
input         MISO;
input         MSS_RESET_N;
input         UART_0_RXD;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output        CS;
output        MAC_MDC;
output [1:0]  MAC_TXD;
output        MAC_TXEN;
output        SCLK;
output        TP_BUSY;
output        TP_EMPTY;
output        TP_FULL;
output        TP_PADDR_BIT2;
output        TP_PENABLE;
output        TP_PREADY;
output        TP_PSEL;
output        TP_PWRITE;
output        TP_RDEN;
output        TP_START_CAPTURE;
output        TP_WREN;
output        UART_0_TXD;
output        incp;
output        incv;
output        inphi;
output [7:0]  led;
output [24:0] psram_address;
output [1:0]  psram_nbyte_en;
output        psram_ncs0;
output        psram_ncs1;
output        psram_noe0;
output        psram_noe1;
output        psram_nwe;
output        resp;
output        resv;
output        rs485_de;
output        rs485_nre;
//--------------------------------------------------------------------
// Inout
//--------------------------------------------------------------------
inout         MAC_MDIO;
inout  [15:0] psram_data;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   [7:0]  adc081s101_0_dataout;
wire          CAPTURE;
wire          CLK50;
wire   [31:0] CoreAHBLite_0_AHBmslave5_HADDR;
wire   [2:0]  CoreAHBLite_0_AHBmslave5_HBURST;
wire          CoreAHBLite_0_AHBmslave5_HMASTLOCK;
wire   [3:0]  CoreAHBLite_0_AHBmslave5_HPROT;
wire   [31:0] CoreAHBLite_0_AHBmslave5_HRDATA;
wire          CoreAHBLite_0_AHBmslave5_HREADY;
wire          CoreAHBLite_0_AHBmslave5_HREADYOUT;
wire   [1:0]  CoreAHBLite_0_AHBmslave5_HRESP;
wire          CoreAHBLite_0_AHBmslave5_HSELx;
wire   [2:0]  CoreAHBLite_0_AHBmslave5_HSIZE;
wire   [1:0]  CoreAHBLite_0_AHBmslave5_HTRANS;
wire   [31:0] CoreAHBLite_0_AHBmslave5_HWDATA;
wire          CoreAHBLite_0_AHBmslave5_HWRITE;
wire   [2:0]  CoreAHBLite_0_AHBmslave6_HBURST;
wire          CoreAHBLite_0_AHBmslave6_HMASTLOCK;
wire   [3:0]  CoreAHBLite_0_AHBmslave6_HPROT;
wire   [31:0] CoreAHBLite_0_AHBmslave6_HRDATA;
wire          CoreAHBLite_0_AHBmslave6_HREADY;
wire          CoreAHBLite_0_AHBmslave6_HREADYOUT;
wire   [1:0]  CoreAHBLite_0_AHBmslave6_HRESP;
wire          CoreAHBLite_0_AHBmslave6_HSELx;
wire   [2:0]  CoreAHBLite_0_AHBmslave6_HSIZE;
wire   [1:0]  CoreAHBLite_0_AHBmslave6_HTRANS;
wire   [31:0] CoreAHBLite_0_AHBmslave6_HWDATA;
wire          CoreAHBLite_0_AHBmslave6_HWRITE;
wire   [23:0] COREAHBTOAPB3_0_APBmaster_PADDR;
wire          COREAHBTOAPB3_0_APBmaster_PENABLE;
wire   [31:0] COREAHBTOAPB3_0_APBmaster_PRDATA;
wire          COREAHBTOAPB3_0_APBmaster_PREADY;
wire          COREAHBTOAPB3_0_APBmaster_PSELx;
wire          COREAHBTOAPB3_0_APBmaster_PSLVERR;
wire   [31:0] COREAHBTOAPB3_0_APBmaster_PWDATA;
wire          COREAHBTOAPB3_0_APBmaster_PWRITE;
wire          CoreAPB3_0_APBmslave0_1_PENABLE;
wire   [31:0] CoreAPB3_0_APBmslave0_1_PRDATA;
wire          CoreAPB3_0_APBmslave0_1_PREADY;
wire          CoreAPB3_0_APBmslave0_1_PSELx;
wire          CoreAPB3_0_APBmslave0_1_PSLVERR;
wire   [31:0] CoreAPB3_0_APBmslave0_1_PWDATA;
wire          CoreAPB3_0_APBmslave0_1_PWRITE;
wire   [31:0] CoreAPB3_0_APBmslave1_PRDATA;
wire          CoreAPB3_0_APBmslave1_PREADY;
wire          CoreAPB3_0_APBmslave1_PSELx;
wire          CoreAPB3_0_APBmslave1_PSLVERR;
wire   [31:0] counter_0_COUNT;
wire          counter_0_WRITEEN;
wire          CS_net_0;
wire   [15:0] psram_data;
wire          fifo_32bit_apb3_0_RDEN;
wire   [31:0] FIFO_PIXEL_0_Q_0;
wire          FIFO_TEST_COUNTER_0_EMPTY;
wire          FIFO_TEST_COUNTER_0_FULL;
wire   [31:0] FIFO_TEST_COUNTER_0_Q;
wire          incp_net_0;
wire          incv_net_0;
wire          inphi_net_0;
wire   [7:0]  led_net_0;
wire   [3:0]  led_0;
wire   [3:0]  led_1;
wire          MAC_CRSDV;
wire          MAC_MDC_net_0;
wire          MAC_MDIO;
wire   [1:0]  MAC_RXD;
wire          MAC_RXER;
wire   [1:0]  MAC_TXD_net_0;
wire          MAC_TXEN_net_0;
wire          MAINXIN;
wire          MISO;
wire          MSS_CORE2_0_FAB_CLK;
wire          MSS_CORE2_0_M2F_RESET_N;
wire          MSS_CORE2_0_MSS_MASTER_AHB_LITE_HLOCK;
wire   [31:0] MSS_CORE2_0_MSS_MASTER_AHB_LITE_HRDATA;
wire          MSS_CORE2_0_MSS_MASTER_AHB_LITE_HREADY;
wire   [1:0]  MSS_CORE2_0_MSS_MASTER_AHB_LITE_HTRANS;
wire   [31:0] MSS_CORE2_0_MSS_MASTER_AHB_LITE_HWDATA;
wire          MSS_CORE2_0_MSS_MASTER_AHB_LITE_HWRITE;
wire          MSS_RESET_N;
wire   [1:0]  nbyte_en;
wire          ncs0;
wire          ncs1;
wire          noe0;
wire          noe1;
wire          nwe;
wire   [24:0] psram_address_net_0;
wire          resp_net_0;
wire          resv_net_0;
wire          SCLK_net_0;
wire          TP_adcConvComplete;
wire          TP_adcStartCapture;
wire          TP_BUSY_net_0;
wire          TP_EMPTY_net_0;
wire          TP_FULL_net_0;
wire   [2:2]  TP_PADDR_BIT2_net_0;
wire          TP_RDEN_net_0;
wire          TP_START_CAPTURE_net_0;
wire          TP_WREN_net_0;
wire          UART_0_RXD;
wire          UART_0_TXD_net_0;
wire          ncs0_net_0;
wire          nwe_net_0;
wire          ncs1_net_0;
wire          noe1_net_0;
wire          noe0_net_0;
wire          UART_0_TXD_net_1;
wire          MAC_MDC_net_1;
wire          MAC_TXEN_net_1;
wire          incp_net_1;
wire          incv_net_1;
wire          inphi_net_1;
wire          resp_net_1;
wire          resv_net_1;
wire          CS_net_1;
wire          SCLK_net_1;
wire          TP_RDEN_net_1;
wire          TP_FULL_net_1;
wire          TP_EMPTY_net_1;
wire          CoreAPB3_0_APBmslave0_1_PREADY_net_0;
wire          CoreAPB3_0_APBmslave0_1_PWRITE_net_0;
wire          CoreAPB3_0_APBmslave0_1_PENABLE_net_0;
wire          CoreAPB3_0_APBmslave0_1_PSELx_net_0;
wire          TP_PADDR_BIT2_net_1;
wire          TP_WREN_net_1;
wire          TP_BUSY_net_1;
wire          TP_START_CAPTURE_net_1;
wire   [1:0]  nbyte_en_net_0;
wire   [24:0] psram_address_net_1;
wire   [1:0]  MAC_TXD_net_1;
wire   [3:0]  led_1_net_0;
wire   [7:4]  led_0_net_0;
wire   [0:1]  PADDRS0_slice_0;
wire   [3:23] PADDRS0_slice_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire          GND_net;
wire          VCC_net;
wire   [31:0] HADDR_M0_const_net_0;
wire   [1:0]  HTRANS_M0_const_net_0;
wire   [2:0]  HSIZE_M0_const_net_0;
wire   [2:0]  HBURST_M0_const_net_0;
wire   [3:0]  HPROT_M0_const_net_0;
wire   [31:0] HWDATA_M0_const_net_0;
wire   [2:0]  HBURST_M1_const_net_0;
wire   [3:0]  HPROT_M1_const_net_0;
wire   [31:0] HRDATA_S0_const_net_0;
wire   [1:0]  HRESP_S0_const_net_0;
wire   [31:0] HRDATA_S1_const_net_0;
wire   [1:0]  HRESP_S1_const_net_0;
wire   [31:0] HRDATA_S2_const_net_0;
wire   [1:0]  HRESP_S2_const_net_0;
wire   [31:0] HRDATA_S3_const_net_0;
wire   [1:0]  HRESP_S3_const_net_0;
wire   [31:0] HRDATA_S4_const_net_0;
wire   [1:0]  HRESP_S4_const_net_0;
wire   [31:0] HRDATA_S7_const_net_0;
wire   [1:0]  HRESP_S7_const_net_0;
wire   [31:0] HRDATA_S8_const_net_0;
wire   [1:0]  HRESP_S8_const_net_0;
wire   [31:0] HRDATA_S9_const_net_0;
wire   [1:0]  HRESP_S9_const_net_0;
wire   [31:0] HRDATA_S10_const_net_0;
wire   [1:0]  HRESP_S10_const_net_0;
wire   [31:0] HRDATA_S11_const_net_0;
wire   [1:0]  HRESP_S11_const_net_0;
wire   [31:0] HRDATA_S12_const_net_0;
wire   [1:0]  HRESP_S12_const_net_0;
wire   [31:0] HRDATA_S13_const_net_0;
wire   [1:0]  HRESP_S13_const_net_0;
wire   [31:0] HRDATA_S14_const_net_0;
wire   [1:0]  HRESP_S14_const_net_0;
wire   [31:0] HRDATA_S15_const_net_0;
wire   [1:0]  HRESP_S15_const_net_0;
wire   [31:0] HRDATA_SHG_const_net_0;
wire   [1:0]  HRESP_SHG_const_net_0;
wire   [31:0] PRDATAS2_const_net_0;
wire   [31:0] PRDATAS3_const_net_0;
wire   [31:0] PRDATAS4_const_net_0;
wire   [31:0] PRDATAS5_const_net_0;
wire   [31:0] PRDATAS6_const_net_0;
wire   [31:0] PRDATAS7_const_net_0;
wire   [31:0] PRDATAS8_const_net_0;
wire   [31:0] PRDATAS9_const_net_0;
wire   [31:0] PRDATAS10_const_net_0;
wire   [31:0] PRDATAS11_const_net_0;
wire   [31:0] PRDATAS12_const_net_0;
wire   [31:0] PRDATAS13_const_net_0;
wire   [31:0] PRDATAS14_const_net_0;
wire   [31:0] PRDATAS15_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net                = 1'b0;
assign VCC_net                = 1'b1;
assign HADDR_M0_const_net_0   = 32'h00000000;
assign HTRANS_M0_const_net_0  = 2'h0;
assign HSIZE_M0_const_net_0   = 3'h0;
assign HBURST_M0_const_net_0  = 3'h0;
assign HPROT_M0_const_net_0   = 4'h0;
assign HWDATA_M0_const_net_0  = 32'h00000000;
assign HBURST_M1_const_net_0  = 3'h0;
assign HPROT_M1_const_net_0   = 4'h0;
assign HRDATA_S0_const_net_0  = 32'h00000000;
assign HRESP_S0_const_net_0   = 2'h0;
assign HRDATA_S1_const_net_0  = 32'h00000000;
assign HRESP_S1_const_net_0   = 2'h0;
assign HRDATA_S2_const_net_0  = 32'h00000000;
assign HRESP_S2_const_net_0   = 2'h0;
assign HRDATA_S3_const_net_0  = 32'h00000000;
assign HRESP_S3_const_net_0   = 2'h0;
assign HRDATA_S4_const_net_0  = 32'h00000000;
assign HRESP_S4_const_net_0   = 2'h0;
assign HRDATA_S7_const_net_0  = 32'h00000000;
assign HRESP_S7_const_net_0   = 2'h0;
assign HRDATA_S8_const_net_0  = 32'h00000000;
assign HRESP_S8_const_net_0   = 2'h0;
assign HRDATA_S9_const_net_0  = 32'h00000000;
assign HRESP_S9_const_net_0   = 2'h0;
assign HRDATA_S10_const_net_0 = 32'h00000000;
assign HRESP_S10_const_net_0  = 2'h0;
assign HRDATA_S11_const_net_0 = 32'h00000000;
assign HRESP_S11_const_net_0  = 2'h0;
assign HRDATA_S12_const_net_0 = 32'h00000000;
assign HRESP_S12_const_net_0  = 2'h0;
assign HRDATA_S13_const_net_0 = 32'h00000000;
assign HRESP_S13_const_net_0  = 2'h0;
assign HRDATA_S14_const_net_0 = 32'h00000000;
assign HRESP_S14_const_net_0  = 2'h0;
assign HRDATA_S15_const_net_0 = 32'h00000000;
assign HRESP_S15_const_net_0  = 2'h0;
assign HRDATA_SHG_const_net_0 = 32'h00000000;
assign HRESP_SHG_const_net_0  = 2'h0;
assign PRDATAS2_const_net_0   = 32'h00000000;
assign PRDATAS3_const_net_0   = 32'h00000000;
assign PRDATAS4_const_net_0   = 32'h00000000;
assign PRDATAS5_const_net_0   = 32'h00000000;
assign PRDATAS6_const_net_0   = 32'h00000000;
assign PRDATAS7_const_net_0   = 32'h00000000;
assign PRDATAS8_const_net_0   = 32'h00000000;
assign PRDATAS9_const_net_0   = 32'h00000000;
assign PRDATAS10_const_net_0  = 32'h00000000;
assign PRDATAS11_const_net_0  = 32'h00000000;
assign PRDATAS12_const_net_0  = 32'h00000000;
assign PRDATAS13_const_net_0  = 32'h00000000;
assign PRDATAS14_const_net_0  = 32'h00000000;
assign PRDATAS15_const_net_0  = 32'h00000000;
//--------------------------------------------------------------------
// TieOff assignments
//--------------------------------------------------------------------
assign rs485_nre                             = 1'b0;
assign rs485_de                              = 1'b1;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign ncs0_net_0                            = ncs0;
assign psram_ncs0                            = ncs0_net_0;
assign nwe_net_0                             = nwe;
assign psram_nwe                             = nwe_net_0;
assign ncs1_net_0                            = ncs1;
assign psram_ncs1                            = ncs1_net_0;
assign noe1_net_0                            = noe1;
assign psram_noe1                            = noe1_net_0;
assign noe0_net_0                            = noe0;
assign psram_noe0                            = noe0_net_0;
assign UART_0_TXD_net_1                      = UART_0_TXD_net_0;
assign UART_0_TXD                            = UART_0_TXD_net_1;
assign MAC_MDC_net_1                         = MAC_MDC_net_0;
assign MAC_MDC                               = MAC_MDC_net_1;
assign MAC_TXEN_net_1                        = MAC_TXEN_net_0;
assign MAC_TXEN                              = MAC_TXEN_net_1;
assign incp_net_1                            = incp_net_0;
assign incp                                  = incp_net_1;
assign incv_net_1                            = incv_net_0;
assign incv                                  = incv_net_1;
assign inphi_net_1                           = inphi_net_0;
assign inphi                                 = inphi_net_1;
assign resp_net_1                            = resp_net_0;
assign resp                                  = resp_net_1;
assign resv_net_1                            = resv_net_0;
assign resv                                  = resv_net_1;
assign CS_net_1                              = CS_net_0;
assign CS                                    = CS_net_1;
assign SCLK_net_1                            = SCLK_net_0;
assign SCLK                                  = SCLK_net_1;
assign TP_RDEN_net_1                         = TP_RDEN_net_0;
assign TP_RDEN                               = TP_RDEN_net_1;
assign TP_FULL_net_1                         = TP_FULL_net_0;
assign TP_FULL                               = TP_FULL_net_1;
assign TP_EMPTY_net_1                        = TP_EMPTY_net_0;
assign TP_EMPTY                              = TP_EMPTY_net_1;
assign CoreAPB3_0_APBmslave0_1_PREADY_net_0  = CoreAPB3_0_APBmslave0_1_PREADY;
assign TP_PREADY                             = CoreAPB3_0_APBmslave0_1_PREADY_net_0;
assign CoreAPB3_0_APBmslave0_1_PWRITE_net_0  = CoreAPB3_0_APBmslave0_1_PWRITE;
assign TP_PWRITE                             = CoreAPB3_0_APBmslave0_1_PWRITE_net_0;
assign CoreAPB3_0_APBmslave0_1_PENABLE_net_0 = CoreAPB3_0_APBmslave0_1_PENABLE;
assign TP_PENABLE                            = CoreAPB3_0_APBmslave0_1_PENABLE_net_0;
assign CoreAPB3_0_APBmslave0_1_PSELx_net_0   = CoreAPB3_0_APBmslave0_1_PSELx;
assign TP_PSEL                               = CoreAPB3_0_APBmslave0_1_PSELx_net_0;
assign TP_PADDR_BIT2_net_1                   = TP_PADDR_BIT2_net_0[2];
assign TP_PADDR_BIT2                         = TP_PADDR_BIT2_net_1;
assign TP_WREN_net_1                         = TP_WREN_net_0;
assign TP_WREN                               = TP_WREN_net_1;
assign TP_BUSY_net_1                         = TP_BUSY_net_0;
assign TP_BUSY                               = TP_BUSY_net_1;
assign TP_START_CAPTURE_net_1                = TP_START_CAPTURE_net_0;
assign TP_START_CAPTURE                      = TP_START_CAPTURE_net_1;
assign nbyte_en_net_0                        = nbyte_en;
assign psram_nbyte_en[1:0]                   = nbyte_en_net_0;
assign psram_address_net_1                   = psram_address_net_0;
assign psram_address[24:0]                   = psram_address_net_1;
assign MAC_TXD_net_1                         = MAC_TXD_net_0;
assign MAC_TXD[1:0]                          = MAC_TXD_net_1;
assign led_1_net_0                           = led_1;
assign led[3:0]                              = led_1_net_0;
assign led_0_net_0                           = led_0;
assign led[7:4]                              = led_0_net_0;
//--------------------------------------------------------------------
// Bus Interface Nets - Unequal Pin Widths
//--------------------------------------------------------------------
wire   [31:0] CoreAHBLite_0_AHBmslave6_HADDR;
wire   [23:0] CoreAHBLite_0_AHBmslave6_HADDR_0_23to0;
wire   [23:0] CoreAHBLite_0_AHBmslave6_HADDR_0;
assign CoreAHBLite_0_AHBmslave6_HADDR_0_23to0 = CoreAHBLite_0_AHBmslave6_HADDR[23:0];
assign CoreAHBLite_0_AHBmslave6_HADDR_0 = { CoreAHBLite_0_AHBmslave6_HADDR_0_23to0 };

wire   [23:0] CoreAPB3_0_APBmslave0_1_PADDR;
wire   [31:24]CoreAPB3_0_APBmslave0_1_PADDR_0_31to24;
wire   [23:0] CoreAPB3_0_APBmslave0_1_PADDR_0_23to0;
wire   [31:0] CoreAPB3_0_APBmslave0_1_PADDR_0;
assign CoreAPB3_0_APBmslave0_1_PADDR_0_31to24 = 8'h0;
assign CoreAPB3_0_APBmslave0_1_PADDR_0_23to0 = CoreAPB3_0_APBmslave0_1_PADDR[23:0];
assign CoreAPB3_0_APBmslave0_1_PADDR_0 = { CoreAPB3_0_APBmslave0_1_PADDR_0_31to24, CoreAPB3_0_APBmslave0_1_PADDR_0_23to0 };

wire   [23:0] CoreAPB3_0_APBmslave1_PADDR;
wire   [31:24]CoreAPB3_0_APBmslave1_PADDR_0_31to24;
wire   [23:0] CoreAPB3_0_APBmslave1_PADDR_0_23to0;
wire   [31:0] CoreAPB3_0_APBmslave1_PADDR_0;
assign CoreAPB3_0_APBmslave1_PADDR_0_31to24 = 8'h0;
assign CoreAPB3_0_APBmslave1_PADDR_0_23to0 = CoreAPB3_0_APBmslave1_PADDR[23:0];
assign CoreAPB3_0_APBmslave1_PADDR_0 = { CoreAPB3_0_APBmslave1_PADDR_0_31to24, CoreAPB3_0_APBmslave1_PADDR_0_23to0 };

wire   [31:20]MSS_CORE2_0_MSS_MASTER_AHB_LITE_HADDR_0_31to20;
wire   [19:0] MSS_CORE2_0_MSS_MASTER_AHB_LITE_HADDR_0_19to0;
wire   [31:0] MSS_CORE2_0_MSS_MASTER_AHB_LITE_HADDR_0;
wire   [19:0] MSS_CORE2_0_MSS_MASTER_AHB_LITE_HADDR;
assign MSS_CORE2_0_MSS_MASTER_AHB_LITE_HADDR_0_31to20 = 12'h0;
assign MSS_CORE2_0_MSS_MASTER_AHB_LITE_HADDR_0_19to0 = MSS_CORE2_0_MSS_MASTER_AHB_LITE_HADDR[19:0];
assign MSS_CORE2_0_MSS_MASTER_AHB_LITE_HADDR_0 = { MSS_CORE2_0_MSS_MASTER_AHB_LITE_HADDR_0_31to20, MSS_CORE2_0_MSS_MASTER_AHB_LITE_HADDR_0_19to0 };

wire   [1:0]  MSS_CORE2_0_MSS_MASTER_AHB_LITE_HRESP;
wire   [0:0]  MSS_CORE2_0_MSS_MASTER_AHB_LITE_HRESP_0_0to0;
wire          MSS_CORE2_0_MSS_MASTER_AHB_LITE_HRESP_0;
assign MSS_CORE2_0_MSS_MASTER_AHB_LITE_HRESP_0_0to0 = MSS_CORE2_0_MSS_MASTER_AHB_LITE_HRESP[0:0];
assign MSS_CORE2_0_MSS_MASTER_AHB_LITE_HRESP_0 = { MSS_CORE2_0_MSS_MASTER_AHB_LITE_HRESP_0_0to0 };

wire   [2:2]  MSS_CORE2_0_MSS_MASTER_AHB_LITE_HSIZE_0_2to2;
wire   [1:0]  MSS_CORE2_0_MSS_MASTER_AHB_LITE_HSIZE_0_1to0;
wire   [2:0]  MSS_CORE2_0_MSS_MASTER_AHB_LITE_HSIZE_0;
wire   [1:0]  MSS_CORE2_0_MSS_MASTER_AHB_LITE_HSIZE;
assign MSS_CORE2_0_MSS_MASTER_AHB_LITE_HSIZE_0_2to2 = 1'b0;
assign MSS_CORE2_0_MSS_MASTER_AHB_LITE_HSIZE_0_1to0 = MSS_CORE2_0_MSS_MASTER_AHB_LITE_HSIZE[1:0];
assign MSS_CORE2_0_MSS_MASTER_AHB_LITE_HSIZE_0 = { MSS_CORE2_0_MSS_MASTER_AHB_LITE_HSIZE_0_2to2, MSS_CORE2_0_MSS_MASTER_AHB_LITE_HSIZE_0_1to0 };

//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------adc081s101
adc081s101 adc081s101_0(
        // Inputs
        .clk                ( SCLK_net_0 ),
        .reset              ( MSS_CORE2_0_M2F_RESET_N ),
        .startCapture       ( TP_adcStartCapture ),
        .miso               ( MISO ),
        // Outputs
        .cs                 ( CS_net_0 ),
        .conversionComplete ( TP_adcConvComplete ),
        .dataout            ( adc081s101_0_dataout ) 
        );

//--------clkgenerator
clkgenerator clkgenerator_0(
        // Inputs
        .clk         ( MSS_CORE2_0_FAB_CLK ),
        .rst         ( MSS_CORE2_0_M2F_RESET_N ),
        // Outputs
        .clkCameraSS ( SCLK_net_0 ) 
        );

//--------CoreAHBLite   -   Actel:DirectCore:CoreAHBLite:3.1.102
CoreAHBLite #( 
        .FAMILY             ( 15 ),
        .HADDR_SHG_CFG      ( 1 ),
        .M0_AHBSLOT0ENABLE  ( 0 ),
        .M0_AHBSLOT1ENABLE  ( 0 ),
        .M0_AHBSLOT2ENABLE  ( 0 ),
        .M0_AHBSLOT3ENABLE  ( 0 ),
        .M0_AHBSLOT4ENABLE  ( 0 ),
        .M0_AHBSLOT5ENABLE  ( 0 ),
        .M0_AHBSLOT6ENABLE  ( 0 ),
        .M0_AHBSLOT7ENABLE  ( 0 ),
        .M0_AHBSLOT8ENABLE  ( 0 ),
        .M0_AHBSLOT9ENABLE  ( 0 ),
        .M0_AHBSLOT10ENABLE ( 0 ),
        .M0_AHBSLOT11ENABLE ( 0 ),
        .M0_AHBSLOT12ENABLE ( 0 ),
        .M0_AHBSLOT13ENABLE ( 0 ),
        .M0_AHBSLOT14ENABLE ( 0 ),
        .M0_AHBSLOT15ENABLE ( 0 ),
        .M0_HUGESLOTENABLE  ( 0 ),
        .M0_INITCFG0ENABLE  ( 0 ),
        .M0_INITCFG1ENABLE  ( 0 ),
        .M0_INITCFG2ENABLE  ( 0 ),
        .M0_INITCFG3ENABLE  ( 0 ),
        .M0_INITCFG4ENABLE  ( 0 ),
        .M0_INITCFG5ENABLE  ( 0 ),
        .M0_INITCFG6ENABLE  ( 0 ),
        .M0_INITCFG7ENABLE  ( 0 ),
        .M0_INITCFG8ENABLE  ( 0 ),
        .M0_INITCFG9ENABLE  ( 0 ),
        .M0_INITCFG10ENABLE ( 0 ),
        .M0_INITCFG11ENABLE ( 0 ),
        .M0_INITCFG12ENABLE ( 0 ),
        .M0_INITCFG13ENABLE ( 0 ),
        .M0_INITCFG14ENABLE ( 0 ),
        .M0_INITCFG15ENABLE ( 0 ),
        .M1_AHBSLOT0ENABLE  ( 0 ),
        .M1_AHBSLOT1ENABLE  ( 0 ),
        .M1_AHBSLOT2ENABLE  ( 0 ),
        .M1_AHBSLOT3ENABLE  ( 0 ),
        .M1_AHBSLOT4ENABLE  ( 0 ),
        .M1_AHBSLOT5ENABLE  ( 1 ),
        .M1_AHBSLOT6ENABLE  ( 1 ),
        .M1_AHBSLOT7ENABLE  ( 0 ),
        .M1_AHBSLOT8ENABLE  ( 0 ),
        .M1_AHBSLOT9ENABLE  ( 0 ),
        .M1_AHBSLOT10ENABLE ( 0 ),
        .M1_AHBSLOT11ENABLE ( 0 ),
        .M1_AHBSLOT12ENABLE ( 0 ),
        .M1_AHBSLOT13ENABLE ( 0 ),
        .M1_AHBSLOT14ENABLE ( 0 ),
        .M1_AHBSLOT15ENABLE ( 0 ),
        .M1_HUGESLOTENABLE  ( 0 ),
        .M1_INITCFG0ENABLE  ( 0 ),
        .M1_INITCFG1ENABLE  ( 0 ),
        .M1_INITCFG2ENABLE  ( 0 ),
        .M1_INITCFG3ENABLE  ( 0 ),
        .M1_INITCFG4ENABLE  ( 0 ),
        .M1_INITCFG5ENABLE  ( 0 ),
        .M1_INITCFG6ENABLE  ( 0 ),
        .M1_INITCFG7ENABLE  ( 0 ),
        .M1_INITCFG8ENABLE  ( 0 ),
        .M1_INITCFG9ENABLE  ( 0 ),
        .M1_INITCFG10ENABLE ( 0 ),
        .M1_INITCFG11ENABLE ( 0 ),
        .M1_INITCFG12ENABLE ( 0 ),
        .M1_INITCFG13ENABLE ( 0 ),
        .M1_INITCFG14ENABLE ( 0 ),
        .M1_INITCFG15ENABLE ( 0 ),
        .MODE_CFG           ( 1 ) )
CoreAHBLite_0(
        // Inputs
        .HCLK           ( MSS_CORE2_0_FAB_CLK ),
        .HRESETN        ( MSS_CORE2_0_M2F_RESET_N ),
        .REMAP_M0       ( GND_net ), // tied to 1'b0 from definition
        .HMASTLOCK_M0   ( GND_net ), // tied to 1'b0 from definition
        .HWRITE_M0      ( GND_net ), // tied to 1'b0 from definition
        .HMASTLOCK_M1   ( MSS_CORE2_0_MSS_MASTER_AHB_LITE_HLOCK ),
        .HWRITE_M1      ( MSS_CORE2_0_MSS_MASTER_AHB_LITE_HWRITE ),
        .HREADYOUT_S0   ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S1   ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S2   ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S3   ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S4   ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S5   ( CoreAHBLite_0_AHBmslave5_HREADYOUT ),
        .HREADYOUT_S6   ( CoreAHBLite_0_AHBmslave6_HREADYOUT ),
        .HREADYOUT_S7   ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S8   ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S9   ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S10  ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S11  ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S12  ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S13  ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S14  ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_S15  ( VCC_net ), // tied to 1'b1 from definition
        .HREADYOUT_SHG  ( VCC_net ), // tied to 1'b1 from definition
        .HADDR_M0       ( HADDR_M0_const_net_0 ), // tied to 32'h00000000 from definition
        .HSIZE_M0       ( HSIZE_M0_const_net_0 ), // tied to 3'h0 from definition
        .HTRANS_M0      ( HTRANS_M0_const_net_0 ), // tied to 2'h0 from definition
        .HWDATA_M0      ( HWDATA_M0_const_net_0 ), // tied to 32'h00000000 from definition
        .HBURST_M0      ( HBURST_M0_const_net_0 ), // tied to 3'h0 from definition
        .HPROT_M0       ( HPROT_M0_const_net_0 ), // tied to 4'h0 from definition
        .HADDR_M1       ( MSS_CORE2_0_MSS_MASTER_AHB_LITE_HADDR_0 ),
        .HSIZE_M1       ( MSS_CORE2_0_MSS_MASTER_AHB_LITE_HSIZE_0 ),
        .HTRANS_M1      ( MSS_CORE2_0_MSS_MASTER_AHB_LITE_HTRANS ),
        .HWDATA_M1      ( MSS_CORE2_0_MSS_MASTER_AHB_LITE_HWDATA ),
        .HBURST_M1      ( HBURST_M1_const_net_0 ), // tied to 3'h0 from definition
        .HPROT_M1       ( HPROT_M1_const_net_0 ), // tied to 4'h0 from definition
        .HRDATA_S0      ( HRDATA_S0_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S0       ( HRESP_S0_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S1      ( HRDATA_S1_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S1       ( HRESP_S1_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S2      ( HRDATA_S2_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S2       ( HRESP_S2_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S3      ( HRDATA_S3_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S3       ( HRESP_S3_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S4      ( HRDATA_S4_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S4       ( HRESP_S4_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S5      ( CoreAHBLite_0_AHBmslave5_HRDATA ),
        .HRESP_S5       ( CoreAHBLite_0_AHBmslave5_HRESP ),
        .HRDATA_S6      ( CoreAHBLite_0_AHBmslave6_HRDATA ),
        .HRESP_S6       ( CoreAHBLite_0_AHBmslave6_HRESP ),
        .HRDATA_S7      ( HRDATA_S7_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S7       ( HRESP_S7_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S8      ( HRDATA_S8_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S8       ( HRESP_S8_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S9      ( HRDATA_S9_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S9       ( HRESP_S9_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S10     ( HRDATA_S10_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S10      ( HRESP_S10_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S11     ( HRDATA_S11_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S11      ( HRESP_S11_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S12     ( HRDATA_S12_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S12      ( HRESP_S12_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S13     ( HRDATA_S13_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S13      ( HRESP_S13_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S14     ( HRDATA_S14_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S14      ( HRESP_S14_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_S15     ( HRDATA_S15_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_S15      ( HRESP_S15_const_net_0 ), // tied to 2'h0 from definition
        .HRDATA_SHG     ( HRDATA_SHG_const_net_0 ), // tied to 32'h00000000 from definition
        .HRESP_SHG      ( HRESP_SHG_const_net_0 ), // tied to 2'h0 from definition
        // Outputs
        .HREADY_M0      (  ),
        .HREADY_M1      ( MSS_CORE2_0_MSS_MASTER_AHB_LITE_HREADY ),
        .HSEL_S0        (  ),
        .HWRITE_S0      (  ),
        .HREADY_S0      (  ),
        .HMASTLOCK_S0   (  ),
        .HSEL_S1        (  ),
        .HWRITE_S1      (  ),
        .HREADY_S1      (  ),
        .HMASTLOCK_S1   (  ),
        .HSEL_S2        (  ),
        .HWRITE_S2      (  ),
        .HREADY_S2      (  ),
        .HMASTLOCK_S2   (  ),
        .HSEL_S3        (  ),
        .HWRITE_S3      (  ),
        .HREADY_S3      (  ),
        .HMASTLOCK_S3   (  ),
        .HSEL_S4        (  ),
        .HWRITE_S4      (  ),
        .HREADY_S4      (  ),
        .HMASTLOCK_S4   (  ),
        .HSEL_S5        ( CoreAHBLite_0_AHBmslave5_HSELx ),
        .HWRITE_S5      ( CoreAHBLite_0_AHBmslave5_HWRITE ),
        .HREADY_S5      ( CoreAHBLite_0_AHBmslave5_HREADY ),
        .HMASTLOCK_S5   ( CoreAHBLite_0_AHBmslave5_HMASTLOCK ),
        .HSEL_S6        ( CoreAHBLite_0_AHBmslave6_HSELx ),
        .HWRITE_S6      ( CoreAHBLite_0_AHBmslave6_HWRITE ),
        .HREADY_S6      ( CoreAHBLite_0_AHBmslave6_HREADY ),
        .HMASTLOCK_S6   ( CoreAHBLite_0_AHBmslave6_HMASTLOCK ),
        .HSEL_S7        (  ),
        .HWRITE_S7      (  ),
        .HREADY_S7      (  ),
        .HMASTLOCK_S7   (  ),
        .HSEL_S8        (  ),
        .HWRITE_S8      (  ),
        .HREADY_S8      (  ),
        .HMASTLOCK_S8   (  ),
        .HSEL_S9        (  ),
        .HWRITE_S9      (  ),
        .HREADY_S9      (  ),
        .HMASTLOCK_S9   (  ),
        .HSEL_S10       (  ),
        .HWRITE_S10     (  ),
        .HREADY_S10     (  ),
        .HMASTLOCK_S10  (  ),
        .HSEL_S11       (  ),
        .HWRITE_S11     (  ),
        .HREADY_S11     (  ),
        .HMASTLOCK_S11  (  ),
        .HSEL_S12       (  ),
        .HWRITE_S12     (  ),
        .HREADY_S12     (  ),
        .HMASTLOCK_S12  (  ),
        .HSEL_S13       (  ),
        .HWRITE_S13     (  ),
        .HREADY_S13     (  ),
        .HMASTLOCK_S13  (  ),
        .HSEL_S14       (  ),
        .HWRITE_S14     (  ),
        .HREADY_S14     (  ),
        .HMASTLOCK_S14  (  ),
        .HSEL_S15       (  ),
        .HWRITE_S15     (  ),
        .HREADY_S15     (  ),
        .HMASTLOCK_S15  (  ),
        .HSEL_SHG       (  ),
        .HWRITE_SHG     (  ),
        .HREADY_SHG     (  ),
        .HMASTLOCK_SHG  (  ),
        .INITDATVAL_C0  (  ),
        .INITDONE_C0    (  ),
        .INITDATVAL_C1  (  ),
        .INITDONE_C1    (  ),
        .INITDATVAL_C2  (  ),
        .INITDONE_C2    (  ),
        .INITDATVAL_C3  (  ),
        .INITDONE_C3    (  ),
        .INITDATVAL_C4  (  ),
        .INITDONE_C4    (  ),
        .INITDATVAL_C5  (  ),
        .INITDONE_C5    (  ),
        .INITDATVAL_C6  (  ),
        .INITDONE_C6    (  ),
        .INITDATVAL_C7  (  ),
        .INITDONE_C7    (  ),
        .INITDATVAL_C8  (  ),
        .INITDONE_C8    (  ),
        .INITDATVAL_C9  (  ),
        .INITDONE_C9    (  ),
        .INITDATVAL_C10 (  ),
        .INITDONE_C10   (  ),
        .INITDATVAL_C11 (  ),
        .INITDONE_C11   (  ),
        .INITDATVAL_C12 (  ),
        .INITDONE_C12   (  ),
        .INITDATVAL_C13 (  ),
        .INITDONE_C13   (  ),
        .INITDATVAL_C14 (  ),
        .INITDONE_C14   (  ),
        .INITDATVAL_C15 (  ),
        .INITDONE_C15   (  ),
        .HRESP_M0       (  ),
        .HRDATA_M0      (  ),
        .HRESP_M1       ( MSS_CORE2_0_MSS_MASTER_AHB_LITE_HRESP ),
        .HRDATA_M1      ( MSS_CORE2_0_MSS_MASTER_AHB_LITE_HRDATA ),
        .HADDR_S0       (  ),
        .HSIZE_S0       (  ),
        .HTRANS_S0      (  ),
        .HWDATA_S0      (  ),
        .HBURST_S0      (  ),
        .HPROT_S0       (  ),
        .HADDR_S1       (  ),
        .HSIZE_S1       (  ),
        .HTRANS_S1      (  ),
        .HWDATA_S1      (  ),
        .HBURST_S1      (  ),
        .HPROT_S1       (  ),
        .HADDR_S2       (  ),
        .HSIZE_S2       (  ),
        .HTRANS_S2      (  ),
        .HWDATA_S2      (  ),
        .HBURST_S2      (  ),
        .HPROT_S2       (  ),
        .HADDR_S3       (  ),
        .HSIZE_S3       (  ),
        .HTRANS_S3      (  ),
        .HWDATA_S3      (  ),
        .HBURST_S3      (  ),
        .HPROT_S3       (  ),
        .HADDR_S4       (  ),
        .HSIZE_S4       (  ),
        .HTRANS_S4      (  ),
        .HWDATA_S4      (  ),
        .HBURST_S4      (  ),
        .HPROT_S4       (  ),
        .HADDR_S5       ( CoreAHBLite_0_AHBmslave5_HADDR ),
        .HSIZE_S5       ( CoreAHBLite_0_AHBmslave5_HSIZE ),
        .HTRANS_S5      ( CoreAHBLite_0_AHBmslave5_HTRANS ),
        .HWDATA_S5      ( CoreAHBLite_0_AHBmslave5_HWDATA ),
        .HBURST_S5      ( CoreAHBLite_0_AHBmslave5_HBURST ),
        .HPROT_S5       ( CoreAHBLite_0_AHBmslave5_HPROT ),
        .HADDR_S6       ( CoreAHBLite_0_AHBmslave6_HADDR ),
        .HSIZE_S6       ( CoreAHBLite_0_AHBmslave6_HSIZE ),
        .HTRANS_S6      ( CoreAHBLite_0_AHBmslave6_HTRANS ),
        .HWDATA_S6      ( CoreAHBLite_0_AHBmslave6_HWDATA ),
        .HBURST_S6      ( CoreAHBLite_0_AHBmslave6_HBURST ),
        .HPROT_S6       ( CoreAHBLite_0_AHBmslave6_HPROT ),
        .HADDR_S7       (  ),
        .HSIZE_S7       (  ),
        .HTRANS_S7      (  ),
        .HWDATA_S7      (  ),
        .HBURST_S7      (  ),
        .HPROT_S7       (  ),
        .HADDR_S8       (  ),
        .HSIZE_S8       (  ),
        .HTRANS_S8      (  ),
        .HWDATA_S8      (  ),
        .HBURST_S8      (  ),
        .HPROT_S8       (  ),
        .HADDR_S9       (  ),
        .HSIZE_S9       (  ),
        .HTRANS_S9      (  ),
        .HWDATA_S9      (  ),
        .HBURST_S9      (  ),
        .HPROT_S9       (  ),
        .HADDR_S10      (  ),
        .HSIZE_S10      (  ),
        .HTRANS_S10     (  ),
        .HWDATA_S10     (  ),
        .HBURST_S10     (  ),
        .HPROT_S10      (  ),
        .HADDR_S11      (  ),
        .HSIZE_S11      (  ),
        .HTRANS_S11     (  ),
        .HWDATA_S11     (  ),
        .HBURST_S11     (  ),
        .HPROT_S11      (  ),
        .HADDR_S12      (  ),
        .HSIZE_S12      (  ),
        .HTRANS_S12     (  ),
        .HWDATA_S12     (  ),
        .HBURST_S12     (  ),
        .HPROT_S12      (  ),
        .HADDR_S13      (  ),
        .HSIZE_S13      (  ),
        .HTRANS_S13     (  ),
        .HWDATA_S13     (  ),
        .HBURST_S13     (  ),
        .HPROT_S13      (  ),
        .HADDR_S14      (  ),
        .HSIZE_S14      (  ),
        .HTRANS_S14     (  ),
        .HWDATA_S14     (  ),
        .HBURST_S14     (  ),
        .HPROT_S14      (  ),
        .HADDR_S15      (  ),
        .HSIZE_S15      (  ),
        .HTRANS_S15     (  ),
        .HWDATA_S15     (  ),
        .HBURST_S15     (  ),
        .HPROT_S15      (  ),
        .HADDR_SHG      (  ),
        .HSIZE_SHG      (  ),
        .HTRANS_SHG     (  ),
        .HWDATA_SHG     (  ),
        .HBURST_SHG     (  ),
        .HPROT_SHG      (  ),
        .INITADDR_C0    (  ),
        .INITDATA_C0    (  ),
        .INITADDR_C1    (  ),
        .INITDATA_C1    (  ),
        .INITADDR_C2    (  ),
        .INITDATA_C2    (  ),
        .INITADDR_C3    (  ),
        .INITDATA_C3    (  ),
        .INITADDR_C4    (  ),
        .INITDATA_C4    (  ),
        .INITADDR_C5    (  ),
        .INITDATA_C5    (  ),
        .INITADDR_C6    (  ),
        .INITDATA_C6    (  ),
        .INITADDR_C7    (  ),
        .INITDATA_C7    (  ),
        .INITADDR_C8    (  ),
        .INITDATA_C8    (  ),
        .INITADDR_C9    (  ),
        .INITDATA_C9    (  ),
        .INITADDR_C10   (  ),
        .INITDATA_C10   (  ),
        .INITADDR_C11   (  ),
        .INITDATA_C11   (  ),
        .INITADDR_C12   (  ),
        .INITDATA_C12   (  ),
        .INITADDR_C13   (  ),
        .INITDATA_C13   (  ),
        .INITADDR_C14   (  ),
        .INITDATA_C14   (  ),
        .INITADDR_C15   (  ),
        .INITDATA_C15   (  ) 
        );

//--------COREAHBTOAPB3   -   Actel:DirectCore:COREAHBTOAPB3:2.0.116
COREAHBTOAPB3 #( 
        .FAMILY ( 15 ) )
COREAHBTOAPB3_0(
        // Inputs
        .HCLK      ( MSS_CORE2_0_FAB_CLK ),
        .HRESETN   ( MSS_CORE2_0_M2F_RESET_N ),
        .HWRITE    ( CoreAHBLite_0_AHBmslave6_HWRITE ),
        .HSEL      ( CoreAHBLite_0_AHBmslave6_HSELx ),
        .HREADY    ( CoreAHBLite_0_AHBmslave6_HREADY ),
        .PREADY    ( COREAHBTOAPB3_0_APBmaster_PREADY ),
        .PSLVERR   ( COREAHBTOAPB3_0_APBmaster_PSLVERR ),
        .HADDR     ( CoreAHBLite_0_AHBmslave6_HADDR_0 ),
        .HTRANS    ( CoreAHBLite_0_AHBmslave6_HTRANS ),
        .HWDATA    ( CoreAHBLite_0_AHBmslave6_HWDATA ),
        .PRDATA    ( COREAHBTOAPB3_0_APBmaster_PRDATA ),
        // Outputs
        .HREADYOUT ( CoreAHBLite_0_AHBmslave6_HREADYOUT ),
        .PENABLE   ( COREAHBTOAPB3_0_APBmaster_PENABLE ),
        .PWRITE    ( COREAHBTOAPB3_0_APBmaster_PWRITE ),
        .PSEL      ( COREAHBTOAPB3_0_APBmaster_PSELx ),
        .HRDATA    ( CoreAHBLite_0_AHBmslave6_HRDATA ),
        .HRESP     ( CoreAHBLite_0_AHBmslave6_HRESP ),
        .PWDATA    ( COREAHBTOAPB3_0_APBmaster_PWDATA ),
        .PADDR     ( COREAHBTOAPB3_0_APBmaster_PADDR ) 
        );

//--------CoreAPB3   -   Actel:DirectCore:CoreAPB3:3.0.103
CoreAPB3 #( 
        .APB_DWIDTH      ( 32 ),
        .APBSLOT0ENABLE  ( 1 ),
        .APBSLOT1ENABLE  ( 1 ),
        .APBSLOT2ENABLE  ( 0 ),
        .APBSLOT3ENABLE  ( 0 ),
        .APBSLOT4ENABLE  ( 0 ),
        .APBSLOT5ENABLE  ( 0 ),
        .APBSLOT6ENABLE  ( 0 ),
        .APBSLOT7ENABLE  ( 0 ),
        .APBSLOT8ENABLE  ( 0 ),
        .APBSLOT9ENABLE  ( 0 ),
        .APBSLOT10ENABLE ( 0 ),
        .APBSLOT11ENABLE ( 0 ),
        .APBSLOT12ENABLE ( 0 ),
        .APBSLOT13ENABLE ( 0 ),
        .APBSLOT14ENABLE ( 0 ),
        .APBSLOT15ENABLE ( 0 ),
        .IADDR_ENABLE    ( 0 ),
        .RANGESIZE       ( 256 ) )
CoreAPB3_0(
        // Inputs
        .PRESETN    ( GND_net ), // tied to 1'b0 from definition
        .PCLK       ( GND_net ), // tied to 1'b0 from definition
        .PWRITE     ( COREAHBTOAPB3_0_APBmaster_PWRITE ),
        .PENABLE    ( COREAHBTOAPB3_0_APBmaster_PENABLE ),
        .PSEL       ( COREAHBTOAPB3_0_APBmaster_PSELx ),
        .PREADYS0   ( CoreAPB3_0_APBmslave0_1_PREADY ),
        .PSLVERRS0  ( CoreAPB3_0_APBmslave0_1_PSLVERR ),
        .PREADYS1   ( CoreAPB3_0_APBmslave1_PREADY ),
        .PSLVERRS1  ( CoreAPB3_0_APBmslave1_PSLVERR ),
        .PREADYS2   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS2  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS3   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS3  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS4   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS4  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS5   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS5  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS6   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS6  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS7   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS7  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS8   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS8  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS9   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS9  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS10  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS10 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS11  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS11 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS12  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS12 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS13  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS13 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS14  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS14 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS15  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS15 ( GND_net ), // tied to 1'b0 from definition
        .PADDR      ( COREAHBTOAPB3_0_APBmaster_PADDR ),
        .PWDATA     ( COREAHBTOAPB3_0_APBmaster_PWDATA ),
        .PRDATAS0   ( CoreAPB3_0_APBmslave0_1_PRDATA ),
        .PRDATAS1   ( CoreAPB3_0_APBmslave1_PRDATA ),
        .PRDATAS2   ( PRDATAS2_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS3   ( PRDATAS3_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS4   ( PRDATAS4_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS5   ( PRDATAS5_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS6   ( PRDATAS6_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS7   ( PRDATAS7_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS8   ( PRDATAS8_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS9   ( PRDATAS9_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS10  ( PRDATAS10_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS11  ( PRDATAS11_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS12  ( PRDATAS12_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS13  ( PRDATAS13_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS14  ( PRDATAS14_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS15  ( PRDATAS15_const_net_0 ), // tied to 32'h00000000 from definition
        // Outputs
        .PREADY     ( COREAHBTOAPB3_0_APBmaster_PREADY ),
        .PSLVERR    ( COREAHBTOAPB3_0_APBmaster_PSLVERR ),
        .PWRITES    ( CoreAPB3_0_APBmslave0_1_PWRITE ),
        .PENABLES   ( CoreAPB3_0_APBmslave0_1_PENABLE ),
        .PSELS0     ( CoreAPB3_0_APBmslave0_1_PSELx ),
        .PSELS1     ( CoreAPB3_0_APBmslave1_PSELx ),
        .PSELS2     (  ),
        .PSELS3     (  ),
        .PSELS4     (  ),
        .PSELS5     (  ),
        .PSELS6     (  ),
        .PSELS7     (  ),
        .PSELS8     (  ),
        .PSELS9     (  ),
        .PSELS10    (  ),
        .PSELS11    (  ),
        .PSELS12    (  ),
        .PSELS13    (  ),
        .PSELS14    (  ),
        .PSELS15    (  ),
        .PRDATA     ( COREAHBTOAPB3_0_APBmaster_PRDATA ),
        .PADDRS     ( CoreAPB3_0_APBmslave1_PADDR ),
        .PADDRS0    ( CoreAPB3_0_APBmslave0_1_PADDR ),
        .PWDATAS    ( CoreAPB3_0_APBmslave0_1_PWDATA ) 
        );

//--------counter
counter counter_0(
        // Inputs
        .CLK     ( SCLK_net_0 ),
        .RESET   ( MSS_CORE2_0_M2F_RESET_N ),
        // Outputs
        .WRITEEN ( counter_0_WRITEEN ),
        .COUNT   ( counter_0_COUNT ) 
        );

//--------fifo_32bit_apb3
fifo_32bit_apb3 fifo_32bit_apb3_0(
        // Inputs
        .PCLK    ( SCLK_net_0 ),
        .PRESERN ( MSS_CORE2_0_M2F_RESET_N ),
        .PSEL    ( CoreAPB3_0_APBmslave1_PSELx ),
        .PENABLE ( CoreAPB3_0_APBmslave0_1_PENABLE ),
        .PWRITE  ( CoreAPB3_0_APBmslave0_1_PWRITE ),
        .FULL    ( FIFO_TEST_COUNTER_0_FULL ),
        .EMPTY   ( FIFO_TEST_COUNTER_0_EMPTY ),
        .PADDR   ( CoreAPB3_0_APBmslave1_PADDR_0 ),
        .PWDATA  ( CoreAPB3_0_APBmslave0_1_PWDATA ),
        .DATAIN  ( FIFO_TEST_COUNTER_0_Q ),
        // Outputs
        .PREADY  ( CoreAPB3_0_APBmslave1_PREADY ),
        .PSLVERR ( CoreAPB3_0_APBmslave1_PSLVERR ),
        .WREN    (  ),
        .RDEN    ( fifo_32bit_apb3_0_RDEN ),
        .PRDATA  ( CoreAPB3_0_APBmslave1_PRDATA ) 
        );

//--------FIFO_PIXEL
FIFO_PIXEL FIFO_PIXEL_0(
        // Inputs
        .DATA  ( led_net_0 ),
        .WEN   ( TP_WREN_net_0 ),
        .REN   ( TP_RDEN_net_0 ),
        .CLK   ( SCLK_net_0 ),
        .RESET ( MSS_CORE2_0_M2F_RESET_N ),
        // Outputs
        .Q     ( FIFO_PIXEL_0_Q_0 ),
        .FULL  ( TP_FULL_net_0 ),
        .EMPTY ( TP_EMPTY_net_0 ) 
        );

//--------FIFO_TEST_COUNTER
FIFO_TEST_COUNTER FIFO_TEST_COUNTER_0(
        // Inputs
        .WE    ( counter_0_WRITEEN ),
        .RE    ( fifo_32bit_apb3_0_RDEN ),
        .CLK   ( SCLK_net_0 ),
        .RESET ( MSS_CORE2_0_M2F_RESET_N ),
        .DATA  ( counter_0_COUNT ),
        // Outputs
        .FULL  ( FIFO_TEST_COUNTER_0_FULL ),
        .EMPTY ( FIFO_TEST_COUNTER_0_EMPTY ),
        .Q     ( FIFO_TEST_COUNTER_0_Q ) 
        );

//--------inputConditioner
inputConditioner inputConditioner_0(
        // Inputs
        .clk ( SCLK_net_0 ),
        .rst ( MSS_CORE2_0_M2F_RESET_N ),
        .ip  ( CAPTURE ),
        // Outputs
        .op  (  ) 
        );

//--------MSS_CORE2
MSS_CORE2 MSS_CORE2_0(
        // Inputs
        .MSS_RESET_N ( MSS_RESET_N ),
        .MAC_CRSDV   ( MAC_CRSDV ),
        .MAC_RXER    ( MAC_RXER ),
        .CLKC        ( CLK50 ),
        .MAINXIN     ( MAINXIN ),
        .FABINT      ( GND_net ),
        .UART_0_RXD  ( UART_0_RXD ),
        .MSSHREADY   ( MSS_CORE2_0_MSS_MASTER_AHB_LITE_HREADY ),
        .MSSHRESP    ( MSS_CORE2_0_MSS_MASTER_AHB_LITE_HRESP_0 ),
        .MAC_RXD     ( MAC_RXD ),
        .MSSHRDATA   ( MSS_CORE2_0_MSS_MASTER_AHB_LITE_HRDATA ),
        // Outputs
        .MAC_TXEN    ( MAC_TXEN_net_0 ),
        .MAC_MDC     ( MAC_MDC_net_0 ),
        .GLC         (  ),
        .FAB_CLK     ( MSS_CORE2_0_FAB_CLK ),
        .M2F_RESET_N ( MSS_CORE2_0_M2F_RESET_N ),
        .UART_0_TXD  ( UART_0_TXD_net_0 ),
        .MSSHWRITE   ( MSS_CORE2_0_MSS_MASTER_AHB_LITE_HWRITE ),
        .MSSHLOCK    ( MSS_CORE2_0_MSS_MASTER_AHB_LITE_HLOCK ),
        .M2F_GPO_1   (  ),
        .M2F_GPO_0   (  ),
        .MAC_TXD     ( MAC_TXD_net_0 ),
        .MSSHADDR    ( MSS_CORE2_0_MSS_MASTER_AHB_LITE_HADDR ),
        .MSSHTRANS   ( MSS_CORE2_0_MSS_MASTER_AHB_LITE_HTRANS ),
        .MSSHSIZE    ( MSS_CORE2_0_MSS_MASTER_AHB_LITE_HSIZE ),
        .MSSHWDATA   ( MSS_CORE2_0_MSS_MASTER_AHB_LITE_HWDATA ),
        // Inouts
        .MAC_MDIO    ( MAC_MDIO ) 
        );

//--------psram_cr
psram_cr psram_cr_0(
        // Inputs
        .HSEL      ( CoreAHBLite_0_AHBmslave5_HSELx ),
        .HWRITE    ( CoreAHBLite_0_AHBmslave5_HWRITE ),
        .HMASTLOCK ( CoreAHBLite_0_AHBmslave5_HMASTLOCK ),
        .HREADY    ( CoreAHBLite_0_AHBmslave5_HREADY ),
        .HRESETn   ( MSS_CORE2_0_M2F_RESET_N ),
        .HCLK      ( MSS_CORE2_0_FAB_CLK ),
        .HADDR     ( CoreAHBLite_0_AHBmslave5_HADDR ),
        .HWDATA    ( CoreAHBLite_0_AHBmslave5_HWDATA ),
        .HSIZE     ( CoreAHBLite_0_AHBmslave5_HSIZE ),
        .HBURST    ( CoreAHBLite_0_AHBmslave5_HBURST ),
        .HPROT     ( CoreAHBLite_0_AHBmslave5_HPROT ),
        .HTRANS    ( CoreAHBLite_0_AHBmslave5_HTRANS ),
        // Outputs
        .HREADYOUT ( CoreAHBLite_0_AHBmslave5_HREADYOUT ),
        .ncs0      ( ncs0 ),
        .ncs1      ( ncs1 ),
        .noe0      ( noe0 ),
        .noe1      ( noe1 ),
        .nwe       ( nwe ),
        .HRESP     ( CoreAHBLite_0_AHBmslave5_HRESP ),
        .HRDATA    ( CoreAHBLite_0_AHBmslave5_HRDATA ),
        .address   ( psram_address_net_0 ),
        .nbyte_en  ( nbyte_en ),
        // Inouts
        .data      ( psram_data ) 
        );

//--------stonyman
stonyman stonyman_0(
        // Inputs
        .clk             ( SCLK_net_0 ),
        .reset           ( MSS_CORE2_0_M2F_RESET_N ),
        .startCapture    ( TP_START_CAPTURE_net_0 ),
        .adcConvComplete ( TP_adcConvComplete ),
        .pixelin         ( adc081s101_0_dataout ),
        // Outputs
        .resp            ( resp_net_0 ),
        .incp            ( incp_net_0 ),
        .resv            ( resv_net_0 ),
        .incv            ( incv_net_0 ),
        .inphi           ( inphi_net_0 ),
        .writeEnable     ( TP_WREN_net_0 ),
        .startAdcCapture ( TP_adcStartCapture ),
        .busy            ( TP_BUSY_net_0 ),
        .pixelout        ( led_net_0 ),
        .tp_stateout     ( led_0 ),
        .tp_substateout  ( led_1 ) 
        );

//--------stonyman_apb3
stonyman_apb3 stonyman_apb3_0(
        // Inputs
        .PCLK          ( SCLK_net_0 ),
        .PRESERN       ( MSS_CORE2_0_M2F_RESET_N ),
        .PSEL          ( CoreAPB3_0_APBmslave0_1_PSELx ),
        .PENABLE       ( CoreAPB3_0_APBmslave0_1_PENABLE ),
        .PWRITE        ( CoreAPB3_0_APBmslave0_1_PWRITE ),
        .PADDR         ( CoreAPB3_0_APBmslave0_1_PADDR_0 ),
        .PWDATA        ( CoreAPB3_0_APBmslave0_1_PWDATA ),
        .FULL          ( TP_FULL_net_0 ),
        .EMPTY         ( TP_EMPTY_net_0 ),
        .BUSY          ( TP_BUSY_net_0 ),
        .PIXELSIN      ( FIFO_PIXEL_0_Q_0 ),
        // Outputs
        .PREADY        ( CoreAPB3_0_APBmslave0_1_PREADY ),
        .PSLVERR       ( CoreAPB3_0_APBmslave0_1_PSLVERR ),
        .PRDATA        ( CoreAPB3_0_APBmslave0_1_PRDATA ),
        .RDEN          ( TP_RDEN_net_0 ),
        .START_CAPTURE ( TP_START_CAPTURE_net_0 ) 
        );


endmodule
