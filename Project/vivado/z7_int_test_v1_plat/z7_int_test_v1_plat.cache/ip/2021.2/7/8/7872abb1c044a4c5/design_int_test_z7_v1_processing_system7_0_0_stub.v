// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Wed Nov 23 19:45:18 2022
// Host        : oppy running 64-bit Ubuntu 22.04.1 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_int_test_z7_v1_processing_system7_0_0_stub.v
// Design      : design_int_test_z7_v1_processing_system7_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z007sclg400-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "processing_system7_v5_5_processing_system7,Vivado 2021.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(GPIO_I, GPIO_O, GPIO_T, TRACE_CLK, TRACE_CLK_OUT, 
  TRACE_CTL, TRACE_DATA, FCLK_CLK0, MIO, PS_SRSTB, PS_CLK, PS_PORB)
/* synthesis syn_black_box black_box_pad_pin="GPIO_I[4:0],GPIO_O[4:0],GPIO_T[4:0],TRACE_CLK,TRACE_CLK_OUT,TRACE_CTL,TRACE_DATA[7:0],FCLK_CLK0,MIO[53:0],PS_SRSTB,PS_CLK,PS_PORB" */;
  input [4:0]GPIO_I;
  output [4:0]GPIO_O;
  output [4:0]GPIO_T;
  input TRACE_CLK;
  output TRACE_CLK_OUT;
  output TRACE_CTL;
  output [7:0]TRACE_DATA;
  output FCLK_CLK0;
  inout [53:0]MIO;
  inout PS_SRSTB;
  inout PS_CLK;
  inout PS_PORB;
endmodule
