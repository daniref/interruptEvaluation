// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Thu Nov 24 15:02:52 2022
// Host        : oppy running 64-bit Ubuntu 22.04.1 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/oppy/Repositories/interruptEvaluation/Project/vivado/z7_int_test_v1_plat/z7_int_test_v1_plat.gen/sources_1/bd/design_int_test_z7_v1/ip/design_int_test_z7_v1_processing_system7_0_0/design_int_test_z7_v1_processing_system7_0_0_stub.v
// Design      : design_int_test_z7_v1_processing_system7_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z007sclg400-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "processing_system7_v5_5_processing_system7,Vivado 2021.2" *)
module design_int_test_z7_v1_processing_system7_0_0(GPIO_I, GPIO_O, GPIO_T, TRACE_CLK, TRACE_CLK_OUT, 
  TRACE_CTL, TRACE_DATA, FCLK_CLK0, MIO, DDR_CAS_n, DDR_CKE, DDR_Clk_n, DDR_Clk, DDR_CS_n, DDR_DRSTB, 
  DDR_ODT, DDR_RAS_n, DDR_WEB, DDR_BankAddr, DDR_Addr, DDR_VRN, DDR_VRP, DDR_DM, DDR_DQ, DDR_DQS_n, 
  DDR_DQS, PS_SRSTB, PS_CLK, PS_PORB)
/* synthesis syn_black_box black_box_pad_pin="GPIO_I[4:0],GPIO_O[4:0],GPIO_T[4:0],TRACE_CLK,TRACE_CLK_OUT,TRACE_CTL,TRACE_DATA[7:0],FCLK_CLK0,MIO[53:0],DDR_CAS_n,DDR_CKE,DDR_Clk_n,DDR_Clk,DDR_CS_n,DDR_DRSTB,DDR_ODT,DDR_RAS_n,DDR_WEB,DDR_BankAddr[2:0],DDR_Addr[14:0],DDR_VRN,DDR_VRP,DDR_DM[3:0],DDR_DQ[31:0],DDR_DQS_n[3:0],DDR_DQS[3:0],PS_SRSTB,PS_CLK,PS_PORB" */;
  input [4:0]GPIO_I;
  output [4:0]GPIO_O;
  output [4:0]GPIO_T;
  input TRACE_CLK;
  output TRACE_CLK_OUT;
  output TRACE_CTL;
  output [7:0]TRACE_DATA;
  output FCLK_CLK0;
  inout [53:0]MIO;
  inout DDR_CAS_n;
  inout DDR_CKE;
  inout DDR_Clk_n;
  inout DDR_Clk;
  inout DDR_CS_n;
  inout DDR_DRSTB;
  inout DDR_ODT;
  inout DDR_RAS_n;
  inout DDR_WEB;
  inout [2:0]DDR_BankAddr;
  inout [14:0]DDR_Addr;
  inout DDR_VRN;
  inout DDR_VRP;
  inout [3:0]DDR_DM;
  inout [31:0]DDR_DQ;
  inout [3:0]DDR_DQS_n;
  inout [3:0]DDR_DQS;
  inout PS_SRSTB;
  inout PS_CLK;
  inout PS_PORB;
endmodule
