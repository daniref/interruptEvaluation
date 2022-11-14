--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
--Date        : Fri Nov 11 14:27:06 2022
--Host        : oppy running 64-bit Ubuntu 22.04.1 LTS
--Command     : generate_target zcu102_design_int.bd
--Design      : zcu102_design_int
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity zcu102_design_int is
  port (
    GPIO_OUT : out STD_LOGIC_VECTOR ( 3 downto 0 );
    INT_SIGNAL : in STD_LOGIC_VECTOR ( 0 to 0 );
    TRACE_CLK : out STD_LOGIC;
    TRACE_DATA : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  attribute core_generation_info : string;
  attribute core_generation_info of zcu102_design_int : entity is "zcu102_design_int,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=zcu102_design_int,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_zynq_ultra_ps_e_cnt=1,synth_mode=OOC_per_IP}";
  attribute hw_handoff : string;
  attribute hw_handoff of zcu102_design_int : entity is "zcu102_design_int.hwdef";
end zcu102_design_int;

architecture STRUCTURE of zcu102_design_int is
  component zcu102_design_int_zynq_ultra_ps_e_0_0 is
  port (
    emio_gpio_i : in STD_LOGIC_VECTOR ( 4 downto 0 );
    emio_gpio_o : out STD_LOGIC_VECTOR ( 4 downto 0 );
    emio_gpio_t : out STD_LOGIC_VECTOR ( 4 downto 0 );
    pl_ps_trace_clk : in STD_LOGIC;
    ps_pl_tracectl : out STD_LOGIC;
    ps_pl_tracedata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    trace_clk_out : out STD_LOGIC;
    pl_clk0 : out STD_LOGIC
  );
  end component zcu102_design_int_zynq_ultra_ps_e_0_0;
  component zcu102_design_int_xlslice_0_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 4 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  end component zcu102_design_int_xlslice_0_0;
  component zcu102_design_int_xlconcat_0_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    In1 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    dout : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component zcu102_design_int_xlconcat_0_0;
  signal In0_0_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlconcat_0_dout : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal xlslice_0_Dout : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal zynq_ultra_ps_e_0_emio_gpio_o : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal zynq_ultra_ps_e_0_pl_clk0 : STD_LOGIC;
  signal zynq_ultra_ps_e_0_ps_pl_tracedata : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_zynq_ultra_ps_e_0_ps_pl_tracectl_UNCONNECTED : STD_LOGIC;
  signal NLW_zynq_ultra_ps_e_0_trace_clk_out_UNCONNECTED : STD_LOGIC;
  signal NLW_zynq_ultra_ps_e_0_emio_gpio_t_UNCONNECTED : STD_LOGIC_VECTOR ( 4 downto 0 );
  attribute x_interface_info : string;
  attribute x_interface_info of TRACE_CLK : signal is "xilinx.com:signal:clock:1.0 CLK.TRACE_CLK CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of TRACE_CLK : signal is "XIL_INTERFACENAME CLK.TRACE_CLK, CLK_DOMAIN zcu102_design_int_zynq_ultra_ps_e_0_0_pl_clk0, FREQ_HZ 99990005, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
begin
  GPIO_OUT(3 downto 0) <= xlslice_0_Dout(3 downto 0);
  In0_0_1(0) <= INT_SIGNAL(0);
  TRACE_CLK <= zynq_ultra_ps_e_0_pl_clk0;
  TRACE_DATA(31 downto 0) <= zynq_ultra_ps_e_0_ps_pl_tracedata(31 downto 0);
xlconcat_0: component zcu102_design_int_xlconcat_0_0
     port map (
      In0(0) => In0_0_1(0),
      In1(3 downto 0) => B"0000",
      dout(4 downto 0) => xlconcat_0_dout(4 downto 0)
    );
xlslice_0: component zcu102_design_int_xlslice_0_0
     port map (
      Din(4 downto 0) => zynq_ultra_ps_e_0_emio_gpio_o(4 downto 0),
      Dout(3 downto 0) => xlslice_0_Dout(3 downto 0)
    );
zynq_ultra_ps_e_0: component zcu102_design_int_zynq_ultra_ps_e_0_0
     port map (
      emio_gpio_i(4 downto 0) => xlconcat_0_dout(4 downto 0),
      emio_gpio_o(4 downto 0) => zynq_ultra_ps_e_0_emio_gpio_o(4 downto 0),
      emio_gpio_t(4 downto 0) => NLW_zynq_ultra_ps_e_0_emio_gpio_t_UNCONNECTED(4 downto 0),
      pl_clk0 => zynq_ultra_ps_e_0_pl_clk0,
      pl_ps_trace_clk => zynq_ultra_ps_e_0_pl_clk0,
      ps_pl_tracectl => NLW_zynq_ultra_ps_e_0_ps_pl_tracectl_UNCONNECTED,
      ps_pl_tracedata(31 downto 0) => zynq_ultra_ps_e_0_ps_pl_tracedata(31 downto 0),
      trace_clk_out => NLW_zynq_ultra_ps_e_0_trace_clk_out_UNCONNECTED
    );
end STRUCTURE;
