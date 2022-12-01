-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
-- Date        : Wed Nov 23 19:45:15 2022
-- Host        : oppy running 64-bit Ubuntu 22.04.1 LTS
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_int_test_z7_v1_trace_clock_divider_0_0_sim_netlist.vhdl
-- Design      : design_int_test_z7_v1_trace_clock_divider_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z007sclg400-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_trace_clock_divider is
  port (
    m_clk_o : out STD_LOGIC;
    m_ctl : out STD_LOGIC;
    m_data : out STD_LOGIC_VECTOR ( 7 downto 0 );
    clk : in STD_LOGIC;
    s_ctl : in STD_LOGIC;
    s_data : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_trace_clock_divider;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_trace_clock_divider is
  signal ctl_q : STD_LOGIC;
  signal data_q : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^m_clk_o\ : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  attribute x_interface_info : string;
  attribute x_interface_info of clk_ddr_reg : label is "xilinx.com:interface:zynq_trace:1.0 TRACE_OUT CLK_O";
  attribute x_interface_info of m_ctl_reg : label is "xilinx.com:interface:zynq_trace:1.0 TRACE_OUT CTL";
  attribute x_interface_info of \m_data_reg[0]\ : label is "xilinx.com:interface:zynq_trace:1.0 TRACE_OUT DATA";
  attribute x_interface_info of \m_data_reg[1]\ : label is "xilinx.com:interface:zynq_trace:1.0 TRACE_OUT DATA";
  attribute x_interface_info of \m_data_reg[2]\ : label is "xilinx.com:interface:zynq_trace:1.0 TRACE_OUT DATA";
  attribute x_interface_info of \m_data_reg[3]\ : label is "xilinx.com:interface:zynq_trace:1.0 TRACE_OUT DATA";
  attribute x_interface_info of \m_data_reg[4]\ : label is "xilinx.com:interface:zynq_trace:1.0 TRACE_OUT DATA";
  attribute x_interface_info of \m_data_reg[5]\ : label is "xilinx.com:interface:zynq_trace:1.0 TRACE_OUT DATA";
  attribute x_interface_info of \m_data_reg[6]\ : label is "xilinx.com:interface:zynq_trace:1.0 TRACE_OUT DATA";
  attribute x_interface_info of \m_data_reg[7]\ : label is "xilinx.com:interface:zynq_trace:1.0 TRACE_OUT DATA";
begin
  m_clk_o <= \^m_clk_o\;
clk_ddr_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^m_clk_o\,
      O => p_0_in
    );
clk_ddr_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => '1',
      D => p_0_in,
      Q => \^m_clk_o\,
      R => '0'
    );
ctl_q_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_ctl,
      Q => ctl_q,
      R => '0'
    );
\data_q_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_data(0),
      Q => data_q(0),
      R => '0'
    );
\data_q_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_data(1),
      Q => data_q(1),
      R => '0'
    );
\data_q_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_data(2),
      Q => data_q(2),
      R => '0'
    );
\data_q_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_data(3),
      Q => data_q(3),
      R => '0'
    );
\data_q_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_data(4),
      Q => data_q(4),
      R => '0'
    );
\data_q_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_data(5),
      Q => data_q(5),
      R => '0'
    );
\data_q_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_data(6),
      Q => data_q(6),
      R => '0'
    );
\data_q_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => s_data(7),
      Q => data_q(7),
      R => '0'
    );
m_ctl_reg: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => ctl_q,
      Q => m_ctl,
      R => '0'
    );
\m_data_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data_q(0),
      Q => m_data(0),
      R => '0'
    );
\m_data_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data_q(1),
      Q => m_data(1),
      R => '0'
    );
\m_data_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data_q(2),
      Q => m_data(2),
      R => '0'
    );
\m_data_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data_q(3),
      Q => m_data(3),
      R => '0'
    );
\m_data_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data_q(4),
      Q => m_data(4),
      R => '0'
    );
\m_data_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data_q(5),
      Q => m_data(5),
      R => '0'
    );
\m_data_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data_q(6),
      Q => m_data(6),
      R => '0'
    );
\m_data_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => clk,
      CE => '1',
      D => data_q(7),
      Q => m_data(7),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    clk : in STD_LOGIC;
    s_clk_i : out STD_LOGIC;
    s_ctl : in STD_LOGIC;
    s_data : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_clk_o : out STD_LOGIC;
    m_ctl : out STD_LOGIC;
    m_data : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_int_test_z7_v1_trace_clock_divider_0_0,trace_clock_divider,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "trace_clock_divider,Vivado 2021.2";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \^clk\ : STD_LOGIC;
  attribute x_interface_info : string;
  attribute x_interface_info of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of clk : signal is "XIL_INTERFACENAME clk, FREQ_HZ 200000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_int_test_z7_v1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute x_interface_info of m_clk_o : signal is "xilinx.com:interface:zynq_trace:1.0 TRACE_OUT CLK_O";
  attribute x_interface_info of m_ctl : signal is "xilinx.com:interface:zynq_trace:1.0 TRACE_OUT CTL";
  attribute x_interface_info of s_clk_i : signal is "xilinx.com:interface:zynq_trace:1.0 TRACE_ZYNQ CLK_I";
  attribute x_interface_info of s_ctl : signal is "xilinx.com:interface:zynq_trace:1.0 TRACE_ZYNQ CTL";
  attribute x_interface_info of m_data : signal is "xilinx.com:interface:zynq_trace:1.0 TRACE_OUT DATA";
  attribute x_interface_info of s_data : signal is "xilinx.com:interface:zynq_trace:1.0 TRACE_ZYNQ DATA";
begin
  \^clk\ <= clk;
  s_clk_i <= \^clk\;
U0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_trace_clock_divider
     port map (
      clk => \^clk\,
      m_clk_o => m_clk_o,
      m_ctl => m_ctl,
      m_data(7 downto 0) => m_data(7 downto 0),
      s_ctl => s_ctl,
      s_data(7 downto 0) => s_data(7 downto 0)
    );
end STRUCTURE;
