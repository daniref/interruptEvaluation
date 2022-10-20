--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
--Date        : Wed Oct 19 15:11:21 2022
--Host        : oppy running 64-bit Ubuntu 22.04.1 LTS
--Command     : generate_target zcu106_int_meas_plat.bd
--Design      : zcu106_int_meas_plat
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity zcu106_int_meas_plat is
  port (
    GPIO_OUT : out STD_LOGIC_VECTOR ( 3 downto 0 );
    INT_SIGNAL : in STD_LOGIC_VECTOR ( 0 to 0 );
    TRACE_CLK : out STD_LOGIC;
    TRACE_CTL : out STD_LOGIC;
    TRACE_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute core_generation_info : string;
  attribute core_generation_info of zcu106_int_meas_plat : entity is "zcu106_int_meas_plat,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=zcu106_int_meas_plat,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=3,da_board_cnt=2,da_zynq_ultra_ps_e_cnt=1,synth_mode=OOC_per_IP}";
  attribute hw_handoff : string;
  attribute hw_handoff of zcu106_int_meas_plat : entity is "zcu106_int_meas_plat.hwdef";
end zcu106_int_meas_plat;

architecture STRUCTURE of zcu106_int_meas_plat is
  component zcu106_int_meas_plat_zynq_ultra_ps_e_0_0 is
  port (
    emio_gpio_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    emio_gpio_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    emio_gpio_t : out STD_LOGIC_VECTOR ( 3 downto 0 );
    pl_ps_trace_clk : in STD_LOGIC;
    ps_pl_tracectl : out STD_LOGIC;
    ps_pl_tracedata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    trace_clk_out : out STD_LOGIC;
    pl_ps_irq0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    pl_clk1 : out STD_LOGIC
  );
  end component zcu106_int_meas_plat_zynq_ultra_ps_e_0_0;
  signal INT_SOURCE_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal zynq_ultra_ps_e_0_emio_gpio_o : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal zynq_ultra_ps_e_0_pl_clk1 : STD_LOGIC;
  signal zynq_ultra_ps_e_0_ps_pl_tracectl : STD_LOGIC;
  signal zynq_ultra_ps_e_0_ps_pl_tracedata : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal zynq_ultra_ps_e_0_trace_clk_out : STD_LOGIC;
  signal NLW_zynq_ultra_ps_e_0_emio_gpio_t_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute x_interface_info : string;
  attribute x_interface_info of TRACE_CLK : signal is "xilinx.com:signal:clock:1.0 CLK.TRACE_CLK CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of TRACE_CLK : signal is "XIL_INTERFACENAME CLK.TRACE_CLK, CLK_DOMAIN zcu106_int_meas_plat_zynq_ultra_ps_e_0_0_trace_clk_out, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute x_interface_info of INT_SIGNAL : signal is "xilinx.com:signal:interrupt:1.0 INTR.INT_SIGNAL INTERRUPT";
  attribute x_interface_parameter of INT_SIGNAL : signal is "XIL_INTERFACENAME INTR.INT_SIGNAL, PortWidth 1, SENSITIVITY EDGE_RISING";
begin
  GPIO_OUT(3 downto 0) <= zynq_ultra_ps_e_0_emio_gpio_o(3 downto 0);
  INT_SOURCE_1(0) <= INT_SIGNAL(0);
  TRACE_CLK <= zynq_ultra_ps_e_0_trace_clk_out;
  TRACE_CTL <= zynq_ultra_ps_e_0_ps_pl_tracectl;
  TRACE_DATA(15 downto 0) <= zynq_ultra_ps_e_0_ps_pl_tracedata(15 downto 0);
zynq_ultra_ps_e_0: component zcu106_int_meas_plat_zynq_ultra_ps_e_0_0
     port map (
      emio_gpio_i(3 downto 0) => B"0000",
      emio_gpio_o(3 downto 0) => zynq_ultra_ps_e_0_emio_gpio_o(3 downto 0),
      emio_gpio_t(3 downto 0) => NLW_zynq_ultra_ps_e_0_emio_gpio_t_UNCONNECTED(3 downto 0),
      pl_clk1 => zynq_ultra_ps_e_0_pl_clk1,
      pl_ps_irq0(0) => INT_SOURCE_1(0),
      pl_ps_trace_clk => zynq_ultra_ps_e_0_pl_clk1,
      ps_pl_tracectl => zynq_ultra_ps_e_0_ps_pl_tracectl,
      ps_pl_tracedata(15 downto 0) => zynq_ultra_ps_e_0_ps_pl_tracedata(15 downto 0),
      trace_clk_out => zynq_ultra_ps_e_0_trace_clk_out
    );
end STRUCTURE;
