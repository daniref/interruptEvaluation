// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Wed Nov 23 19:45:15 2022
// Host        : oppy running 64-bit Ubuntu 22.04.1 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/oppy/Repositories/interruptEvaluation/Project/vivado/z7_int_test_v1_plat/z7_int_test_v1_plat.gen/sources_1/bd/design_int_test_z7_v1/ip/design_int_test_z7_v1_trace_clock_divider_0_0/design_int_test_z7_v1_trace_clock_divider_0_0_stub.v
// Design      : design_int_test_z7_v1_trace_clock_divider_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z007sclg400-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "trace_clock_divider,Vivado 2021.2" *)
module design_int_test_z7_v1_trace_clock_divider_0_0(clk, s_clk_i, s_ctl, s_data, m_clk_o, m_ctl, m_data)
/* synthesis syn_black_box black_box_pad_pin="clk,s_clk_i,s_ctl,s_data[7:0],m_clk_o,m_ctl,m_data[7:0]" */;
  input clk;
  output s_clk_i;
  input s_ctl;
  input [7:0]s_data;
  output m_clk_o;
  output m_ctl;
  output [7:0]m_data;
endmodule
