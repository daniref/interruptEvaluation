--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
--Date        : Sat Apr 16 20:59:24 2022
--Host        : oppy running 64-bit Ubuntu 20.04.4 LTS
--Command     : generate_target zcu106_int_meas_plat_wrapper.bd
--Design      : zcu106_int_meas_plat_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity zcu106_int_meas_plat_wrapper is
  port (
    ACK_SIGNAL : out STD_LOGIC_VECTOR ( 1 downto 0 );
    IRQ_SIGNAL : out STD_LOGIC_VECTOR ( 0 to 0 );
    TRACE_CLK : out STD_LOGIC;
    TRACE_CTL : out STD_LOGIC;
    TRACE_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
end zcu106_int_meas_plat_wrapper;

architecture STRUCTURE of zcu106_int_meas_plat_wrapper is
  component zcu106_int_meas_plat is
  port (
    ACK_SIGNAL : out STD_LOGIC_VECTOR ( 1 downto 0 );
    IRQ_SIGNAL : out STD_LOGIC_VECTOR ( 0 to 0 );
    TRACE_CTL : out STD_LOGIC;
    TRACE_CLK : out STD_LOGIC;
    TRACE_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component zcu106_int_meas_plat;
  signal wTraceClkSdr:std_logic;
  signal wTraceDataSdr:std_logic_vector(15 downto 0);
begin
yZynq: component zcu106_int_meas_plat
     port map (
      ACK_SIGNAL(1 downto 0) => ACK_SIGNAL(1 downto 0),
      IRQ_SIGNAL(0) => IRQ_SIGNAL(0),
      TRACE_CLK => wTraceClkSdr,
      TRACE_CTL => TRACE_CTL,
      TRACE_DATA => wTraceDataSdr
    );
yAdapter: entity work.parallel_trace_adapter 
    generic map (
        gPlatform => "ULTRASCALE",
        gBitsIn => 16,
        gBitsOut => 16
    ) port map (
        iClk  => wTraceClkSdr,
        iData => wTraceDataSdr,
        oClk  => TRACE_CLK,
        oData => TRACE_DATA
    );
        
end STRUCTURE;
