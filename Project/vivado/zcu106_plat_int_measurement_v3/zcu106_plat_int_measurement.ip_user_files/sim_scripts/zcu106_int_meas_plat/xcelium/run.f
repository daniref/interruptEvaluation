-makelib xcelium_lib/xilinx_vip -sv \
  "/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
  "/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
  "/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
  "/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
  "/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
  "/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
  "/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
  "/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
  "/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/rst_vip_if.sv" \
-endlib
-makelib xcelium_lib/xpm -sv \
  "/tools/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "/tools/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "/tools/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_vip_v1_1_11 -sv \
  "../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/63b7/hdl/axi_vip_v1_1_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/zynq_ultra_ps_e_vip_v1_0_11 -sv \
  "../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/2fd3/hdl/zynq_ultra_ps_e_vip_v1_0_vl_rfs.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/zcu106_int_meas_plat/ip/zcu106_int_meas_plat_zynq_ultra_ps_e_0_0/sim/zcu106_int_meas_plat_zynq_ultra_ps_e_0_0_vip_wrapper.v" \
-endlib
-makelib xcelium_lib/axi_lite_ipif_v3_0_4 \
  "../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_cdc_v1_0_2 \
  "../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/interrupt_control_v3_1_4 \
  "../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_gpio_v2_0_27 \
  "../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/a5bb/hdl/axi_gpio_v2_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/zcu106_int_meas_plat/ip/zcu106_int_meas_plat_axi_gpio_0_0/sim/zcu106_int_meas_plat_axi_gpio_0_0.vhd" \
  "../../../bd/zcu106_int_meas_plat/ip/zcu106_int_meas_plat_axi_gpio_0_1/sim/zcu106_int_meas_plat_axi_gpio_0_1.vhd" \
-endlib
-makelib xcelium_lib/proc_sys_reset_v5_0_13 \
  "../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/zcu106_int_meas_plat/ip/zcu106_int_meas_plat_rst_ps8_0_99M_0/sim/zcu106_int_meas_plat_rst_ps8_0_99M_0.vhd" \
-endlib
-makelib xcelium_lib/generic_baseblocks_v2_1_0 \
  "../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_register_slice_v2_1_25 \
  "../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/e1e6/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_6 \
  "../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/8ae1/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_6 \
  "../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/8ae1/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_6 \
  "../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/8ae1/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib xcelium_lib/axi_data_fifo_v2_1_24 \
  "../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/fa53/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_crossbar_v2_1_26 \
  "../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/ac57/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/zcu106_int_meas_plat/ip/zcu106_int_meas_plat_xbar_0/sim/zcu106_int_meas_plat_xbar_0.v" \
-endlib
-makelib xcelium_lib/axi_protocol_converter_v2_1_25 \
  "../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/8fe4/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_clock_converter_v2_1_24 \
  "../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/23c0/hdl/axi_clock_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/blk_mem_gen_v8_4_5 \
  "../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/25a8/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib xcelium_lib/axi_dwidth_converter_v2_1_25 \
  "../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/38b4/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/zcu106_int_meas_plat/ip/zcu106_int_meas_plat_auto_ds_0/sim/zcu106_int_meas_plat_auto_ds_0.v" \
  "../../../bd/zcu106_int_meas_plat/ip/zcu106_int_meas_plat_auto_pc_0/sim/zcu106_int_meas_plat_auto_pc_0.v" \
  "../../../bd/zcu106_int_meas_plat/ip/zcu106_int_meas_plat_auto_ds_1/sim/zcu106_int_meas_plat_auto_ds_1.v" \
  "../../../bd/zcu106_int_meas_plat/ip/zcu106_int_meas_plat_auto_pc_1/sim/zcu106_int_meas_plat_auto_pc_1.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/zcu106_int_meas_plat/sim/zcu106_int_meas_plat.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

