// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Tue Nov  8 17:11:06 2022
// Host        : oppy running 64-bit Ubuntu 22.04.1 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/oppy/Repositories/interruptEvaluation/Project/vivado/int_test_platform_v4/int_test_platform_v4.gen/sources_1/bd/int_design/ip/int_design_zynq_ultra_ps_e_0_0/int_design_zynq_ultra_ps_e_0_0_stub.v
// Design      : int_design_zynq_ultra_ps_e_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu7ev-ffvc1156-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "zynq_ultra_ps_e_v3_3_6_zynq_ultra_ps_e,Vivado 2021.2" *)
module int_design_zynq_ultra_ps_e_0_0(emio_gpio_i, emio_gpio_o, emio_gpio_t, 
  pl_ps_trace_clk, ps_pl_tracectl, ps_pl_tracedata, trace_clk_out, pl_clk0)
/* synthesis syn_black_box black_box_pad_pin="emio_gpio_i[4:0],emio_gpio_o[4:0],emio_gpio_t[4:0],pl_ps_trace_clk,ps_pl_tracectl,ps_pl_tracedata[31:0],trace_clk_out,pl_clk0" */;
  input [4:0]emio_gpio_i;
  output [4:0]emio_gpio_o;
  output [4:0]emio_gpio_t;
  input pl_ps_trace_clk;
  output ps_pl_tracectl;
  output [31:0]ps_pl_tracedata;
  output trace_clk_out;
  output pl_clk0;
endmodule
