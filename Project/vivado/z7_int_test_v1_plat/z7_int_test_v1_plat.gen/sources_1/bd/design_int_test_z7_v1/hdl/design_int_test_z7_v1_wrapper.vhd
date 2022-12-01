--Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
--Date        : Fri Nov 25 16:32:07 2022
--Host        : oppy running 64-bit Ubuntu 22.04.1 LTS
--Command     : generate_target design_int_test_z7_v1_wrapper.bd
--Design      : design_int_test_z7_v1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_int_test_z7_v1_wrapper is
  port (
    DDR_0_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_0_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_0_cas_n : inout STD_LOGIC;
    DDR_0_ck_n : inout STD_LOGIC;
    DDR_0_ck_p : inout STD_LOGIC;
    DDR_0_cke : inout STD_LOGIC;
    DDR_0_cs_n : inout STD_LOGIC;
    DDR_0_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_0_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_0_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_0_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_0_odt : inout STD_LOGIC;
    DDR_0_ras_n : inout STD_LOGIC;
    DDR_0_reset_n : inout STD_LOGIC;
    DDR_0_we_n : inout STD_LOGIC;
    FIXED_IO_0_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_0_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_0_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_0_ps_clk : inout STD_LOGIC;
    FIXED_IO_0_ps_porb : inout STD_LOGIC;
    FIXED_IO_0_ps_srstb : inout STD_LOGIC;
    GPIO_SIGN_tri_io : inout STD_LOGIC_VECTOR ( 4 downto 0 );
    TRACE_OUT_clk_o : out STD_LOGIC;
    TRACE_OUT_ctl : out STD_LOGIC;
    TRACE_OUT_data : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end design_int_test_z7_v1_wrapper;

architecture STRUCTURE of design_int_test_z7_v1_wrapper is
  component design_int_test_z7_v1 is
  port (
    DDR_0_cas_n : inout STD_LOGIC;
    DDR_0_cke : inout STD_LOGIC;
    DDR_0_ck_n : inout STD_LOGIC;
    DDR_0_ck_p : inout STD_LOGIC;
    DDR_0_cs_n : inout STD_LOGIC;
    DDR_0_reset_n : inout STD_LOGIC;
    DDR_0_odt : inout STD_LOGIC;
    DDR_0_ras_n : inout STD_LOGIC;
    DDR_0_we_n : inout STD_LOGIC;
    DDR_0_ba : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR_0_addr : inout STD_LOGIC_VECTOR ( 14 downto 0 );
    DDR_0_dm : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_0_dq : inout STD_LOGIC_VECTOR ( 31 downto 0 );
    DDR_0_dqs_n : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    DDR_0_dqs_p : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    FIXED_IO_0_mio : inout STD_LOGIC_VECTOR ( 53 downto 0 );
    FIXED_IO_0_ddr_vrn : inout STD_LOGIC;
    FIXED_IO_0_ddr_vrp : inout STD_LOGIC;
    FIXED_IO_0_ps_srstb : inout STD_LOGIC;
    FIXED_IO_0_ps_clk : inout STD_LOGIC;
    FIXED_IO_0_ps_porb : inout STD_LOGIC;
    TRACE_OUT_clk_o : out STD_LOGIC;
    TRACE_OUT_ctl : out STD_LOGIC;
    TRACE_OUT_data : out STD_LOGIC_VECTOR ( 7 downto 0 );
    GPIO_SIGN_tri_i : in STD_LOGIC_VECTOR ( 4 downto 0 );
    GPIO_SIGN_tri_o : out STD_LOGIC_VECTOR ( 4 downto 0 );
    GPIO_SIGN_tri_t : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );
  end component design_int_test_z7_v1;
  component IOBUF is
  port (
    I : in STD_LOGIC;
    O : out STD_LOGIC;
    T : in STD_LOGIC;
    IO : inout STD_LOGIC
  );
  end component IOBUF;
  signal GPIO_SIGN_tri_i_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal GPIO_SIGN_tri_i_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal GPIO_SIGN_tri_i_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal GPIO_SIGN_tri_i_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal GPIO_SIGN_tri_i_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal GPIO_SIGN_tri_io_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal GPIO_SIGN_tri_io_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal GPIO_SIGN_tri_io_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal GPIO_SIGN_tri_io_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal GPIO_SIGN_tri_io_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal GPIO_SIGN_tri_o_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal GPIO_SIGN_tri_o_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal GPIO_SIGN_tri_o_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal GPIO_SIGN_tri_o_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal GPIO_SIGN_tri_o_4 : STD_LOGIC_VECTOR ( 4 to 4 );
  signal GPIO_SIGN_tri_t_0 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal GPIO_SIGN_tri_t_1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal GPIO_SIGN_tri_t_2 : STD_LOGIC_VECTOR ( 2 to 2 );
  signal GPIO_SIGN_tri_t_3 : STD_LOGIC_VECTOR ( 3 to 3 );
  signal GPIO_SIGN_tri_t_4 : STD_LOGIC_VECTOR ( 4 to 4 );
begin
GPIO_SIGN_tri_iobuf_0: component IOBUF
     port map (
      I => GPIO_SIGN_tri_o_0(0),
      IO => GPIO_SIGN_tri_io(0),
      O => GPIO_SIGN_tri_i_0(0),
      T => GPIO_SIGN_tri_t_0(0)
    );
GPIO_SIGN_tri_iobuf_1: component IOBUF
     port map (
      I => GPIO_SIGN_tri_o_1(1),
      IO => GPIO_SIGN_tri_io(1),
      O => GPIO_SIGN_tri_i_1(1),
      T => GPIO_SIGN_tri_t_1(1)
    );
GPIO_SIGN_tri_iobuf_2: component IOBUF
     port map (
      I => GPIO_SIGN_tri_o_2(2),
      IO => GPIO_SIGN_tri_io(2),
      O => GPIO_SIGN_tri_i_2(2),
      T => GPIO_SIGN_tri_t_2(2)
    );
GPIO_SIGN_tri_iobuf_3: component IOBUF
     port map (
      I => GPIO_SIGN_tri_o_3(3),
      IO => GPIO_SIGN_tri_io(3),
      O => GPIO_SIGN_tri_i_3(3),
      T => GPIO_SIGN_tri_t_3(3)
    );
GPIO_SIGN_tri_iobuf_4: component IOBUF
     port map (
      I => GPIO_SIGN_tri_o_4(4),
      IO => GPIO_SIGN_tri_io(4),
      O => GPIO_SIGN_tri_i_4(4),
      T => GPIO_SIGN_tri_t_4(4)
    );
design_int_test_z7_v1_i: component design_int_test_z7_v1
     port map (
      DDR_0_addr(14 downto 0) => DDR_0_addr(14 downto 0),
      DDR_0_ba(2 downto 0) => DDR_0_ba(2 downto 0),
      DDR_0_cas_n => DDR_0_cas_n,
      DDR_0_ck_n => DDR_0_ck_n,
      DDR_0_ck_p => DDR_0_ck_p,
      DDR_0_cke => DDR_0_cke,
      DDR_0_cs_n => DDR_0_cs_n,
      DDR_0_dm(3 downto 0) => DDR_0_dm(3 downto 0),
      DDR_0_dq(31 downto 0) => DDR_0_dq(31 downto 0),
      DDR_0_dqs_n(3 downto 0) => DDR_0_dqs_n(3 downto 0),
      DDR_0_dqs_p(3 downto 0) => DDR_0_dqs_p(3 downto 0),
      DDR_0_odt => DDR_0_odt,
      DDR_0_ras_n => DDR_0_ras_n,
      DDR_0_reset_n => DDR_0_reset_n,
      DDR_0_we_n => DDR_0_we_n,
      FIXED_IO_0_ddr_vrn => FIXED_IO_0_ddr_vrn,
      FIXED_IO_0_ddr_vrp => FIXED_IO_0_ddr_vrp,
      FIXED_IO_0_mio(53 downto 0) => FIXED_IO_0_mio(53 downto 0),
      FIXED_IO_0_ps_clk => FIXED_IO_0_ps_clk,
      FIXED_IO_0_ps_porb => FIXED_IO_0_ps_porb,
      FIXED_IO_0_ps_srstb => FIXED_IO_0_ps_srstb,
      GPIO_SIGN_tri_i(4) => GPIO_SIGN_tri_i_4(4),
      GPIO_SIGN_tri_i(3) => GPIO_SIGN_tri_i_3(3),
      GPIO_SIGN_tri_i(2) => GPIO_SIGN_tri_i_2(2),
      GPIO_SIGN_tri_i(1) => GPIO_SIGN_tri_i_1(1),
      GPIO_SIGN_tri_i(0) => GPIO_SIGN_tri_i_0(0),
      GPIO_SIGN_tri_o(4) => GPIO_SIGN_tri_o_4(4),
      GPIO_SIGN_tri_o(3) => GPIO_SIGN_tri_o_3(3),
      GPIO_SIGN_tri_o(2) => GPIO_SIGN_tri_o_2(2),
      GPIO_SIGN_tri_o(1) => GPIO_SIGN_tri_o_1(1),
      GPIO_SIGN_tri_o(0) => GPIO_SIGN_tri_o_0(0),
      GPIO_SIGN_tri_t(4) => GPIO_SIGN_tri_t_4(4),
      GPIO_SIGN_tri_t(3) => GPIO_SIGN_tri_t_3(3),
      GPIO_SIGN_tri_t(2) => GPIO_SIGN_tri_t_2(2),
      GPIO_SIGN_tri_t(1) => GPIO_SIGN_tri_t_1(1),
      GPIO_SIGN_tri_t(0) => GPIO_SIGN_tri_t_0(0),
      TRACE_OUT_clk_o => TRACE_OUT_clk_o,
      TRACE_OUT_ctl => TRACE_OUT_ctl,
      TRACE_OUT_data(7 downto 0) => TRACE_OUT_data(7 downto 0)
    );
end STRUCTURE;
