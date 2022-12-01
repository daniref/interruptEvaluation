-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
-- Date        : Wed Nov 23 19:45:18 2022
-- Host        : oppy running 64-bit Ubuntu 22.04.1 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_int_test_z7_v1_processing_system7_0_0_stub.vhdl
-- Design      : design_int_test_z7_v1_processing_system7_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z007sclg400-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    GPIO_I : in STD_LOGIC_VECTOR ( 4 downto 0 );
    GPIO_O : out STD_LOGIC_VECTOR ( 4 downto 0 );
    GPIO_T : out STD_LOGIC_VECTOR ( 4 downto 0 );
    TRACE_CLK : in STD_LOGIC;
    TRACE_CLK_OUT : out STD_LOGIC;
    TRACE_CTL : out STD_LOGIC;
    TRACE_DATA : out STD_LOGIC_VECTOR ( 7 downto 0 );
    FCLK_CLK0 : out STD_LOGIC;
    MIO : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    PS_SRSTB : inout STD_LOGIC;
    PS_CLK : inout STD_LOGIC;
    PS_PORB : inout STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "GPIO_I[4:0],GPIO_O[4:0],GPIO_T[4:0],TRACE_CLK,TRACE_CLK_OUT,TRACE_CTL,TRACE_DATA[7:0],FCLK_CLK0,MIO[53:0],PS_SRSTB,PS_CLK,PS_PORB";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "processing_system7_v5_5_processing_system7,Vivado 2021.2";
begin
end;
