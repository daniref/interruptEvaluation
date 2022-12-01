// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Wed Nov 23 19:45:15 2022
// Host        : oppy running 64-bit Ubuntu 22.04.1 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/oppy/Repositories/interruptEvaluation/Project/vivado/z7_int_test_v1_plat/z7_int_test_v1_plat.gen/sources_1/bd/design_int_test_z7_v1/ip/design_int_test_z7_v1_trace_clock_divider_0_0/design_int_test_z7_v1_trace_clock_divider_0_0_sim_netlist.v
// Design      : design_int_test_z7_v1_trace_clock_divider_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z007sclg400-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_int_test_z7_v1_trace_clock_divider_0_0,trace_clock_divider,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "module_ref" *) 
(* x_core_info = "trace_clock_divider,Vivado 2021.2" *) 
(* NotValidForBitStream *)
module design_int_test_z7_v1_trace_clock_divider_0_0
   (clk,
    s_clk_i,
    s_ctl,
    s_data,
    m_clk_o,
    m_ctl,
    m_data);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk, FREQ_HZ 200000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_int_test_z7_v1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input clk;
  (* x_interface_info = "xilinx.com:interface:zynq_trace:1.0 TRACE_ZYNQ CLK_I" *) output s_clk_i;
  (* x_interface_info = "xilinx.com:interface:zynq_trace:1.0 TRACE_ZYNQ CTL" *) input s_ctl;
  (* x_interface_info = "xilinx.com:interface:zynq_trace:1.0 TRACE_ZYNQ DATA" *) input [7:0]s_data;
  (* x_interface_info = "xilinx.com:interface:zynq_trace:1.0 TRACE_OUT CLK_O" *) output m_clk_o;
  (* x_interface_info = "xilinx.com:interface:zynq_trace:1.0 TRACE_OUT CTL" *) output m_ctl;
  (* x_interface_info = "xilinx.com:interface:zynq_trace:1.0 TRACE_OUT DATA" *) output [7:0]m_data;

  wire clk;
  wire m_clk_o;
  wire m_ctl;
  wire [7:0]m_data;
  wire s_ctl;
  wire [7:0]s_data;

  assign s_clk_i = clk;
  design_int_test_z7_v1_trace_clock_divider_0_0_trace_clock_divider U0
       (.clk(clk),
        .m_clk_o(m_clk_o),
        .m_ctl(m_ctl),
        .m_data(m_data),
        .s_ctl(s_ctl),
        .s_data(s_data));
endmodule

(* ORIG_REF_NAME = "trace_clock_divider" *) 
module design_int_test_z7_v1_trace_clock_divider_0_0_trace_clock_divider
   (m_clk_o,
    m_ctl,
    m_data,
    clk,
    s_ctl,
    s_data);
  output m_clk_o;
  output m_ctl;
  output [7:0]m_data;
  input clk;
  input s_ctl;
  input [7:0]s_data;

  wire clk;
  wire ctl_q;
  wire [7:0]data_q;
  wire m_clk_o;
  wire m_ctl;
  wire [7:0]m_data;
  wire p_0_in;
  wire s_ctl;
  wire [7:0]s_data;

  LUT1 #(
    .INIT(2'h1)) 
    clk_ddr_i_1
       (.I0(m_clk_o),
        .O(p_0_in));
  (* x_interface_info = "xilinx.com:interface:zynq_trace:1.0 TRACE_OUT CLK_O" *) 
  FDRE #(
    .INIT(1'b0)) 
    clk_ddr_reg
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in),
        .Q(m_clk_o),
        .R(1'b0));
  FDRE ctl_q_reg
       (.C(clk),
        .CE(1'b1),
        .D(s_ctl),
        .Q(ctl_q),
        .R(1'b0));
  FDRE \data_q_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(s_data[0]),
        .Q(data_q[0]),
        .R(1'b0));
  FDRE \data_q_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(s_data[1]),
        .Q(data_q[1]),
        .R(1'b0));
  FDRE \data_q_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(s_data[2]),
        .Q(data_q[2]),
        .R(1'b0));
  FDRE \data_q_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(s_data[3]),
        .Q(data_q[3]),
        .R(1'b0));
  FDRE \data_q_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(s_data[4]),
        .Q(data_q[4]),
        .R(1'b0));
  FDRE \data_q_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(s_data[5]),
        .Q(data_q[5]),
        .R(1'b0));
  FDRE \data_q_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(s_data[6]),
        .Q(data_q[6]),
        .R(1'b0));
  FDRE \data_q_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(s_data[7]),
        .Q(data_q[7]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:zynq_trace:1.0 TRACE_OUT CTL" *) 
  FDRE m_ctl_reg
       (.C(clk),
        .CE(1'b1),
        .D(ctl_q),
        .Q(m_ctl),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:zynq_trace:1.0 TRACE_OUT DATA" *) 
  FDRE \m_data_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(data_q[0]),
        .Q(m_data[0]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:zynq_trace:1.0 TRACE_OUT DATA" *) 
  FDRE \m_data_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(data_q[1]),
        .Q(m_data[1]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:zynq_trace:1.0 TRACE_OUT DATA" *) 
  FDRE \m_data_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(data_q[2]),
        .Q(m_data[2]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:zynq_trace:1.0 TRACE_OUT DATA" *) 
  FDRE \m_data_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(data_q[3]),
        .Q(m_data[3]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:zynq_trace:1.0 TRACE_OUT DATA" *) 
  FDRE \m_data_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(data_q[4]),
        .Q(m_data[4]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:zynq_trace:1.0 TRACE_OUT DATA" *) 
  FDRE \m_data_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(data_q[5]),
        .Q(m_data[5]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:zynq_trace:1.0 TRACE_OUT DATA" *) 
  FDRE \m_data_reg[6] 
       (.C(clk),
        .CE(1'b1),
        .D(data_q[6]),
        .Q(m_data[6]),
        .R(1'b0));
  (* x_interface_info = "xilinx.com:interface:zynq_trace:1.0 TRACE_OUT DATA" *) 
  FDRE \m_data_reg[7] 
       (.C(clk),
        .CE(1'b1),
        .D(data_q[7]),
        .Q(m_data[7]),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
