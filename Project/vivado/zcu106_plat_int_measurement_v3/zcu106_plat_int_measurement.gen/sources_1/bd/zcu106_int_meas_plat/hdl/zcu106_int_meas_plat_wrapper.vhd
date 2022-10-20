--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
--Date        : Wed Oct 19 22:47:16 2022
--Host        : oppy running 64-bit Ubuntu 22.04.1 LTS
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
    GPIO_OUT : out STD_LOGIC_VECTOR ( 3 downto 0 );
    INT_SIGNAL : in STD_LOGIC_VECTOR ( 0 to 0 );
    TRACE_CLK : out STD_LOGIC;
    TRACE_CTL : out STD_LOGIC;
    TRACE_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
end zcu106_int_meas_plat_wrapper;

architecture STRUCTURE of zcu106_int_meas_plat_wrapper is
  component zcu106_int_meas_plat is
  port (
    TRACE_CTL : out STD_LOGIC;
    TRACE_CLK : out STD_LOGIC;
    TRACE_DATA : out STD_LOGIC_VECTOR ( 15 downto 0 );
    GPIO_OUT : out STD_LOGIC_VECTOR ( 3 downto 0 );
    INT_SIGNAL : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component zcu106_int_meas_plat;
begin
zcu106_int_meas_plat_i: component zcu106_int_meas_plat
     port map (
      GPIO_OUT(3 downto 0) => GPIO_OUT(3 downto 0),
      INT_SIGNAL(0) => INT_SIGNAL(0),
      TRACE_CLK => TRACE_CLK,
      TRACE_CTL => TRACE_CTL,
      TRACE_DATA(15 downto 0) => TRACE_DATA(15 downto 0)
    );
end STRUCTURE;
