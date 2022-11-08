--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
--Date        : Tue Nov  8 15:48:54 2022
--Host        : oppy running 64-bit Ubuntu 22.04.1 LTS
--Command     : generate_target int_design_wrapper.bd
--Design      : int_design_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity int_design_wrapper is
  port (
    GPIO_OUT : out STD_LOGIC_VECTOR ( 3 downto 0 );
    INT_SIGNAL : in STD_LOGIC_VECTOR ( 0 to 0 );
    oTRACE_CLK : out STD_LOGIC;
    oTRACE_CTL :out STD_LOGIC;
    oTRACE_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
end int_design_wrapper;

architecture STRUCTURE of int_design_wrapper is
 signal wTraceClkSdr: std_logic;
 signal wTraceDataSdr: std_logic_vector(31 downto 0);


begin
int_design_i: entity work.int_design
     port map (
      GPIO_OUT(3 downto 0) => GPIO_OUT(3 downto 0),
      INT_SIGNAL(0) => INT_SIGNAL(0),
      TRACE_CLK => wTraceClkSdr,
      TRACE_CTL => oTRACE_CTL,
      TRACE_DATA(31 downto 0) => wTraceDataSdr(31 downto 0)
    );
yAdapter: entity work.parallel_trace_adapter generic map (
 gPlatform => "ULTRASCALE",
 gBitsIn => 32,
 gBitsOut => 16
 ) port map (
 iClk => wTraceClkSdr,
 iData => wTraceDataSdr,
 oClk => oTRACE_CLK,
 oData => oTRACE_DATA
 );   
    
    
    
end STRUCTURE;
