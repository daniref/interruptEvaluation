-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
-- Date        : Wed Nov 23 19:45:15 2022
-- Host        : oppy running 64-bit Ubuntu 22.04.1 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/oppy/Repositories/interruptEvaluation/Project/vivado/z7_int_test_v1_plat/z7_int_test_v1_plat.gen/sources_1/bd/design_int_test_z7_v1/ip/design_int_test_z7_v1_trace_clock_divider_0_0/design_int_test_z7_v1_trace_clock_divider_0_0_stub.vhdl
-- Design      : design_int_test_z7_v1_trace_clock_divider_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z007sclg400-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_int_test_z7_v1_trace_clock_divider_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    s_clk_i : out STD_LOGIC;
    s_ctl : in STD_LOGIC;
    s_data : in STD_LOGIC_VECTOR ( 7 downto 0 );
    m_clk_o : out STD_LOGIC;
    m_ctl : out STD_LOGIC;
    m_data : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end design_int_test_z7_v1_trace_clock_divider_0_0;

architecture stub of design_int_test_z7_v1_trace_clock_divider_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,s_clk_i,s_ctl,s_data[7:0],m_clk_o,m_ctl,m_data[7:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "trace_clock_divider,Vivado 2021.2";
begin
end;
