-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
-- Date        : Wed Oct 19 07:25:55 2022
-- Host        : oppy running 64-bit Ubuntu 22.04.1 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/oppy/vivado_workspace/zcu106_plat_int_measurement_v2/zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ip/zcu106_int_meas_plat_zynq_ultra_ps_e_0_0/zcu106_int_meas_plat_zynq_ultra_ps_e_0_0_stub.vhdl
-- Design      : zcu106_int_meas_plat_zynq_ultra_ps_e_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu7ev-ffvc1156-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity zcu106_int_meas_plat_zynq_ultra_ps_e_0_0 is
  Port ( 
    emio_gpio_i : in STD_LOGIC_VECTOR ( 3 downto 0 );
    emio_gpio_o : out STD_LOGIC_VECTOR ( 3 downto 0 );
    emio_gpio_t : out STD_LOGIC_VECTOR ( 3 downto 0 );
    pl_ps_trace_clk : in STD_LOGIC;
    ps_pl_tracectl : out STD_LOGIC;
    ps_pl_tracedata : out STD_LOGIC_VECTOR ( 15 downto 0 );
    trace_clk_out : out STD_LOGIC;
    pl_ps_irq0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    pl_clk1 : out STD_LOGIC
  );

end zcu106_int_meas_plat_zynq_ultra_ps_e_0_0;

architecture stub of zcu106_int_meas_plat_zynq_ultra_ps_e_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "emio_gpio_i[3:0],emio_gpio_o[3:0],emio_gpio_t[3:0],pl_ps_trace_clk,ps_pl_tracectl,ps_pl_tracedata[15:0],trace_clk_out,pl_ps_irq0[0:0],pl_clk1";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "zynq_ultra_ps_e_v3_3_6_zynq_ultra_ps_e,Vivado 2021.2";
begin
end;
