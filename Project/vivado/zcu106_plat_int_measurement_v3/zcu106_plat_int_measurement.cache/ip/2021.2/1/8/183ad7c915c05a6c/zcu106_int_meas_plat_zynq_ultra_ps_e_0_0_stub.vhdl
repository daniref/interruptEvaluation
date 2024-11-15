-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
-- Date        : Wed Oct 19 22:44:29 2022
-- Host        : oppy running 64-bit Ubuntu 22.04.1 LTS
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ zcu106_int_meas_plat_zynq_ultra_ps_e_0_0_stub.vhdl
-- Design      : zcu106_int_meas_plat_zynq_ultra_ps_e_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu7ev-ffvc1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    emio_gpio_i : in STD_LOGIC_VECTOR ( 4 downto 0 );
    emio_gpio_o : out STD_LOGIC_VECTOR ( 4 downto 0 );
    emio_gpio_t : out STD_LOGIC_VECTOR ( 4 downto 0 );
    pl_ps_trace_clk : in STD_LOGIC;
    ps_pl_tracectl : out STD_LOGIC;
    ps_pl_tracedata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    trace_clk_out : out STD_LOGIC;
    pl_clk1 : out STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "emio_gpio_i[4:0],emio_gpio_o[4:0],emio_gpio_t[4:0],pl_ps_trace_clk,ps_pl_tracectl,ps_pl_tracedata[15:0],trace_clk_out,pl_clk1";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "zynq_ultra_ps_e_v3_3_6_zynq_ultra_ps_e,Vivado 2021.2";
begin
end;
