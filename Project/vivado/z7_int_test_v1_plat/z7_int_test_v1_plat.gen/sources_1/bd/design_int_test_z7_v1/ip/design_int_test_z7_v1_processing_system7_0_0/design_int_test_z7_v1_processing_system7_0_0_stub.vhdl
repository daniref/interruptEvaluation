-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
-- Date        : Thu Nov 24 15:02:52 2022
-- Host        : oppy running 64-bit Ubuntu 22.04.1 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/oppy/Repositories/interruptEvaluation/Project/vivado/z7_int_test_v1_plat/z7_int_test_v1_plat.gen/sources_1/bd/design_int_test_z7_v1/ip/design_int_test_z7_v1_processing_system7_0_0/design_int_test_z7_v1_processing_system7_0_0_stub.vhdl
-- Design      : design_int_test_z7_v1_processing_system7_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z007sclg400-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_int_test_z7_v1_processing_system7_0_0 is
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

end design_int_test_z7_v1_processing_system7_0_0;

architecture stub of design_int_test_z7_v1_processing_system7_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "GPIO_I[4:0],GPIO_O[4:0],GPIO_T[4:0],TRACE_CLK,TRACE_CLK_OUT,TRACE_CTL,TRACE_DATA[7:0],FCLK_CLK0,MIO[53:0],DDR_CAS_n,DDR_CKE,DDR_Clk_n,DDR_Clk,DDR_CS_n,DDR_DRSTB,DDR_ODT,DDR_RAS_n,DDR_WEB,DDR_BankAddr[2:0],DDR_Addr[14:0],DDR_VRN,DDR_VRP,DDR_DM[3:0],DDR_DQ[31:0],DDR_DQS_n[3:0],DDR_DQS[3:0],PS_SRSTB,PS_CLK,PS_PORB";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "processing_system7_v5_5_processing_system7,Vivado 2021.2";
begin
end;
