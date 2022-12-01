--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
--Date        : Fri Nov 25 16:32:06 2022
--Host        : oppy running 64-bit Ubuntu 22.04.1 LTS
--Command     : generate_target design_int_test_z7_v1.bd
--Design      : design_int_test_z7_v1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_int_test_z7_v1 is
  port (
    DDR_0_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_0_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_0_cas_n : inout STD_LOGIC;
    DDR_0_ck_n : inout STD_LOGIC;
    DDR_0_ck_p : inout STD_LOGIC;
    DDR_0_cke : inout STD_LOGIC;
    DDR_0_cs_n : inout STD_LOGIC;
    DDR_0_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_0_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_0_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_0_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_0_odt : inout STD_LOGIC;
    DDR_0_ras_n : inout STD_LOGIC;
    DDR_0_reset_n : inout STD_LOGIC;
    DDR_0_we_n : inout STD_LOGIC;
    FIXED_IO_0_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_0_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_0_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_0_ps_clk : inout STD_LOGIC;
    FIXED_IO_0_ps_porb : inout STD_LOGIC;
    FIXED_IO_0_ps_srstb : inout STD_LOGIC;
    GPIO_SIGN_tri_i : in STD_LOGIC_VECTOR ( 4 downto 0 );
    GPIO_SIGN_tri_o : out STD_LOGIC_VECTOR ( 4 downto 0 );
    GPIO_SIGN_tri_t : out STD_LOGIC_VECTOR ( 4 downto 0 );
    TRACE_OUT_clk_o : out STD_LOGIC;
    TRACE_OUT_ctl : out STD_LOGIC;
    TRACE_OUT_data : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute core_generation_info : string;
  attribute core_generation_info of design_int_test_z7_v1 : entity is "design_int_test_z7_v1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_int_test_z7_v1,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=2,numReposBlks=2,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute hw_handoff : string;
  attribute hw_handoff of design_int_test_z7_v1 : entity is "design_int_test_z7_v1.hwdef";
end design_int_test_z7_v1;

architecture STRUCTURE of design_int_test_z7_v1 is
  component design_int_test_z7_v1_processing_system7_0_0 is
  port (
    GPIO_I : in STD_LOGIC_VECTOR ( 4 downto 0 );
    GPIO_O : out STD_LOGIC_VECTOR ( 4 downto 0 );
    GPIO_T : out STD_LOGIC_VECTOR ( 4 downto 0 );
    TRACE_CLK : in STD_LOGIC;
    TRACE_CLK_OUT : out STD_LOGIC;
    TRACE_CTL : out STD_LOGIC;
    TRACE_DATA : out STD_LOGIC_VECTOR ( 7 downto 0 );
    FCLK_CLK0 : out STD_LOGIC;
    MIO : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    DDR_CAS_n : inout STD_LOGIC;
    DDR_CKE : inout STD_LOGIC;
    DDR_Clk_n : inout STD_LOGIC;
    DDR_Clk : inout STD_LOGIC;
    DDR_CS_n : inout STD_LOGIC;
    DDR_DRSTB : inout STD_LOGIC;
    DDR_ODT : inout STD_LOGIC;
    DDR_RAS_n : inout STD_LOGIC;
    DDR_WEB : inout STD_LOGIC;
    DDR_BankAddr : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_Addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_VRN : inout STD_LOGIC;
    DDR_VRP : inout STD_LOGIC;
    DDR_DM : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_DQ : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_DQS_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_DQS : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    PS_SRSTB : inout STD_LOGIC;
    PS_CLK : inout STD_LOGIC;
    PS_PORB : inout STD_LOGIC
  );
  end component design_int_test_z7_v1_processing_system7_0_0;
  component design_int_test_z7_v1_trace_clock_divider_0_0 is
  port (
    clk : in STD_LOGIC;
    s_clk_i : out STD_LOGIC;
    s_ctl : in STD_LOGIC;
    s_data : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_clk_o : out STD_LOGIC;
    m_ctl : out STD_LOGIC;
    m_data : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  end component design_int_test_z7_v1_trace_clock_divider_0_0;
  signal processing_system7_0_DDR_ADDR : STD_LOGIC_VECTOR ( 14 downto 0 );
  signal processing_system7_0_DDR_BA : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal processing_system7_0_DDR_CAS_N : STD_LOGIC;
  signal processing_system7_0_DDR_CKE : STD_LOGIC;
  signal processing_system7_0_DDR_CK_N : STD_LOGIC;
  signal processing_system7_0_DDR_CK_P : STD_LOGIC;
  signal processing_system7_0_DDR_CS_N : STD_LOGIC;
  signal processing_system7_0_DDR_DM : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_DDR_DQ : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal processing_system7_0_DDR_DQS_N : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_DDR_DQS_P : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal processing_system7_0_DDR_ODT : STD_LOGIC;
  signal processing_system7_0_DDR_RAS_N : STD_LOGIC;
  signal processing_system7_0_DDR_RESET_N : STD_LOGIC;
  signal processing_system7_0_DDR_WE_N : STD_LOGIC;
  signal processing_system7_0_FCLK_CLK0 : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_DDR_VRN : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_DDR_VRP : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_MIO : STD_LOGIC_VECTOR ( 53 downto 0 );
  signal processing_system7_0_FIXED_IO_PS_CLK : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_PS_PORB : STD_LOGIC;
  signal processing_system7_0_FIXED_IO_PS_SRSTB : STD_LOGIC;
  signal processing_system7_0_GPIO_0_TRI_I : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal processing_system7_0_GPIO_0_TRI_O : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal processing_system7_0_GPIO_0_TRI_T : STD_LOGIC_VECTOR ( 4 downto 0 );
  signal processing_system7_0_TRACE_0_CLK_I : STD_LOGIC;
  signal processing_system7_0_TRACE_0_CTL : STD_LOGIC;
  signal processing_system7_0_TRACE_0_DATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal trace_clock_divider_0_TRACE_OUT_CLK_O : STD_LOGIC;
  signal trace_clock_divider_0_TRACE_OUT_CTL : STD_LOGIC;
  signal trace_clock_divider_0_TRACE_OUT_DATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal NLW_processing_system7_0_TRACE_CLK_OUT_UNCONNECTED : STD_LOGIC;
  attribute x_interface_info : string;
  attribute x_interface_info of DDR_0_cas_n : signal is "xilinx.com:interface:ddrx:1.0 DDR_0 CAS_N";
  attribute x_interface_info of DDR_0_ck_n : signal is "xilinx.com:interface:ddrx:1.0 DDR_0 CK_N";
  attribute x_interface_info of DDR_0_ck_p : signal is "xilinx.com:interface:ddrx:1.0 DDR_0 CK_P";
  attribute x_interface_info of DDR_0_cke : signal is "xilinx.com:interface:ddrx:1.0 DDR_0 CKE";
  attribute x_interface_info of DDR_0_cs_n : signal is "xilinx.com:interface:ddrx:1.0 DDR_0 CS_N";
  attribute x_interface_info of DDR_0_odt : signal is "xilinx.com:interface:ddrx:1.0 DDR_0 ODT";
  attribute x_interface_info of DDR_0_ras_n : signal is "xilinx.com:interface:ddrx:1.0 DDR_0 RAS_N";
  attribute x_interface_info of DDR_0_reset_n : signal is "xilinx.com:interface:ddrx:1.0 DDR_0 RESET_N";
  attribute x_interface_info of DDR_0_we_n : signal is "xilinx.com:interface:ddrx:1.0 DDR_0 WE_N";
  attribute x_interface_info of FIXED_IO_0_ddr_vrn : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO_0 DDR_VRN";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of FIXED_IO_0_ddr_vrn : signal is "XIL_INTERFACENAME FIXED_IO_0, CAN_DEBUG false";
  attribute x_interface_info of FIXED_IO_0_ddr_vrp : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO_0 DDR_VRP";
  attribute x_interface_info of FIXED_IO_0_ps_clk : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO_0 PS_CLK";
  attribute x_interface_info of FIXED_IO_0_ps_porb : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO_0 PS_PORB";
  attribute x_interface_info of FIXED_IO_0_ps_srstb : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO_0 PS_SRSTB";
  attribute x_interface_info of TRACE_OUT_clk_o : signal is "xilinx.com:interface:zynq_trace:1.0 TRACE_OUT CLK_O";
  attribute x_interface_info of TRACE_OUT_ctl : signal is "xilinx.com:interface:zynq_trace:1.0 TRACE_OUT CTL";
  attribute x_interface_info of DDR_0_addr : signal is "xilinx.com:interface:ddrx:1.0 DDR_0 ADDR";
  attribute x_interface_parameter of DDR_0_addr : signal is "XIL_INTERFACENAME DDR_0, AXI_ARBITRATION_SCHEME TDM, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 11, CAS_WRITE_LATENCY 11, CS_ENABLED true, DATA_MASK_ENABLED true, DATA_WIDTH 8, MEMORY_TYPE COMPONENTS, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 1250";
  attribute x_interface_info of DDR_0_ba : signal is "xilinx.com:interface:ddrx:1.0 DDR_0 BA";
  attribute x_interface_info of DDR_0_dm : signal is "xilinx.com:interface:ddrx:1.0 DDR_0 DM";
  attribute x_interface_info of DDR_0_dq : signal is "xilinx.com:interface:ddrx:1.0 DDR_0 DQ";
  attribute x_interface_info of DDR_0_dqs_n : signal is "xilinx.com:interface:ddrx:1.0 DDR_0 DQS_N";
  attribute x_interface_info of DDR_0_dqs_p : signal is "xilinx.com:interface:ddrx:1.0 DDR_0 DQS_P";
  attribute x_interface_info of FIXED_IO_0_mio : signal is "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO_0 MIO";
  attribute x_interface_info of GPIO_SIGN_tri_i : signal is "xilinx.com:interface:gpio:1.0 GPIO_SIGN ";
  attribute x_interface_info of GPIO_SIGN_tri_o : signal is "xilinx.com:interface:gpio:1.0 GPIO_SIGN ";
  attribute x_interface_info of GPIO_SIGN_tri_t : signal is "xilinx.com:interface:gpio:1.0 GPIO_SIGN ";
  attribute x_interface_info of TRACE_OUT_data : signal is "xilinx.com:interface:zynq_trace:1.0 TRACE_OUT DATA";
begin
  GPIO_SIGN_tri_o(4 downto 0) <= processing_system7_0_GPIO_0_TRI_O(4 downto 0);
  GPIO_SIGN_tri_t(4 downto 0) <= processing_system7_0_GPIO_0_TRI_T(4 downto 0);
  TRACE_OUT_clk_o <= trace_clock_divider_0_TRACE_OUT_CLK_O;
  TRACE_OUT_ctl <= trace_clock_divider_0_TRACE_OUT_CTL;
  TRACE_OUT_data(7 downto 0) <= trace_clock_divider_0_TRACE_OUT_DATA(7 downto 0);
  processing_system7_0_GPIO_0_TRI_I(4 downto 0) <= GPIO_SIGN_tri_i(4 downto 0);
processing_system7_0: component design_int_test_z7_v1_processing_system7_0_0
     port map (
      DDR_Addr(14 downto 0) => DDR_0_addr(14 downto 0),
      DDR_BankAddr(2 downto 0) => DDR_0_ba(2 downto 0),
      DDR_CAS_n => DDR_0_cas_n,
      DDR_CKE => DDR_0_cke,
      DDR_CS_n => DDR_0_cs_n,
      DDR_Clk => DDR_0_ck_p,
      DDR_Clk_n => DDR_0_ck_n,
      DDR_DM(3 downto 0) => DDR_0_dm(3 downto 0),
      DDR_DQ(31 downto 0) => DDR_0_dq(31 downto 0),
      DDR_DQS(3 downto 0) => DDR_0_dqs_p(3 downto 0),
      DDR_DQS_n(3 downto 0) => DDR_0_dqs_n(3 downto 0),
      DDR_DRSTB => DDR_0_reset_n,
      DDR_ODT => DDR_0_odt,
      DDR_RAS_n => DDR_0_ras_n,
      DDR_VRN => FIXED_IO_0_ddr_vrn,
      DDR_VRP => FIXED_IO_0_ddr_vrp,
      DDR_WEB => DDR_0_we_n,
      FCLK_CLK0 => processing_system7_0_FCLK_CLK0,
      GPIO_I(4 downto 0) => processing_system7_0_GPIO_0_TRI_I(4 downto 0),
      GPIO_O(4 downto 0) => processing_system7_0_GPIO_0_TRI_O(4 downto 0),
      GPIO_T(4 downto 0) => processing_system7_0_GPIO_0_TRI_T(4 downto 0),
      MIO(53 downto 0) => FIXED_IO_0_mio(53 downto 0),
      PS_CLK => FIXED_IO_0_ps_clk,
      PS_PORB => FIXED_IO_0_ps_porb,
      PS_SRSTB => FIXED_IO_0_ps_srstb,
      TRACE_CLK => processing_system7_0_TRACE_0_CLK_I,
      TRACE_CLK_OUT => NLW_processing_system7_0_TRACE_CLK_OUT_UNCONNECTED,
      TRACE_CTL => processing_system7_0_TRACE_0_CTL,
      TRACE_DATA(7 downto 0) => processing_system7_0_TRACE_0_DATA(7 downto 0)
    );
trace_clock_divider_0: component design_int_test_z7_v1_trace_clock_divider_0_0
     port map (
      clk => processing_system7_0_FCLK_CLK0,
      m_clk_o => trace_clock_divider_0_TRACE_OUT_CLK_O,
      m_ctl => trace_clock_divider_0_TRACE_OUT_CTL,
      m_data(7 downto 0) => trace_clock_divider_0_TRACE_OUT_DATA(7 downto 0),
      s_clk_i => processing_system7_0_TRACE_0_CLK_I,
      s_ctl => processing_system7_0_TRACE_0_CTL,
      s_data(7 downto 0) => processing_system7_0_TRACE_0_DATA(7 downto 0)
    );
end STRUCTURE;
