--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
--Date        : Fri Nov 11 14:03:37 2022
--Host        : oppy running 64-bit Ubuntu 22.04.1 LTS
--Command     : generate_target zcu102_design_int_wrapper.bd
--Design      : zcu102_design_int_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity zcu102_design_int_wrapper is
  port (
    GPIO_OUT : out STD_LOGIC_VECTOR ( 3 downto 0 );
    INT_SIGNAL : in STD_LOGIC_VECTOR ( 0 to 0 );
    oTRACE_CLK : out STD_LOGIC;
    oTRACE_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
end zcu102_design_int_wrapper;

architecture STRUCTURE of zcu102_design_int_wrapper is
  signal temp_trace_clk : std_logic;
  signal temp_trace_data : std_logic_vector (31 downto 0);
  
  component zcu102_design_int is
  port (
    TRACE_CLK : out STD_LOGIC;
    GPIO_OUT : out STD_LOGIC_VECTOR ( 3 downto 0 );
    INT_SIGNAL : in STD_LOGIC_VECTOR ( 0 to 0 );
    TRACE_DATA : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component zcu102_design_int;
  
begin

zcu102_design_int_i: component zcu102_design_int
     port map (
      GPIO_OUT(3 downto 0) => GPIO_OUT(3 downto 0),
      INT_SIGNAL(0) => INT_SIGNAL(0),
      TRACE_CLK => temp_trace_clk,
      TRACE_DATA(31 downto 0) => temp_trace_data(31 downto 0)
    );
 yAdapter: entity work.parallel_trace_adapter generic map (
     gPlatform => "ULTRASCALE",
     gBitsIn => 32,
     gBitsOut => 16
     ) port map (
     iClk => temp_trace_clk,
     iData => temp_trace_data,
     oClk => oTRACE_CLK,
     oData => oTRACE_DATA
     );
 
end STRUCTURE;
