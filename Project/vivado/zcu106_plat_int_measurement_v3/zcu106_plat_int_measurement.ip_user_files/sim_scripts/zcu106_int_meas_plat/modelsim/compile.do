vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_vip_v1_1_11
vlib modelsim_lib/msim/zynq_ultra_ps_e_vip_v1_0_11
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/axi_lite_ipif_v3_0_4
vlib modelsim_lib/msim/lib_cdc_v1_0_2
vlib modelsim_lib/msim/interrupt_control_v3_1_4
vlib modelsim_lib/msim/axi_gpio_v2_0_27
vlib modelsim_lib/msim/proc_sys_reset_v5_0_13
vlib modelsim_lib/msim/generic_baseblocks_v2_1_0
vlib modelsim_lib/msim/axi_register_slice_v2_1_25
vlib modelsim_lib/msim/fifo_generator_v13_2_6
vlib modelsim_lib/msim/axi_data_fifo_v2_1_24
vlib modelsim_lib/msim/axi_crossbar_v2_1_26
vlib modelsim_lib/msim/axi_protocol_converter_v2_1_25
vlib modelsim_lib/msim/axi_clock_converter_v2_1_24
vlib modelsim_lib/msim/blk_mem_gen_v8_4_5
vlib modelsim_lib/msim/axi_dwidth_converter_v2_1_25

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap xpm modelsim_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_11 modelsim_lib/msim/axi_vip_v1_1_11
vmap zynq_ultra_ps_e_vip_v1_0_11 modelsim_lib/msim/zynq_ultra_ps_e_vip_v1_0_11
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap axi_lite_ipif_v3_0_4 modelsim_lib/msim/axi_lite_ipif_v3_0_4
vmap lib_cdc_v1_0_2 modelsim_lib/msim/lib_cdc_v1_0_2
vmap interrupt_control_v3_1_4 modelsim_lib/msim/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_27 modelsim_lib/msim/axi_gpio_v2_0_27
vmap proc_sys_reset_v5_0_13 modelsim_lib/msim/proc_sys_reset_v5_0_13
vmap generic_baseblocks_v2_1_0 modelsim_lib/msim/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_25 modelsim_lib/msim/axi_register_slice_v2_1_25
vmap fifo_generator_v13_2_6 modelsim_lib/msim/fifo_generator_v13_2_6
vmap axi_data_fifo_v2_1_24 modelsim_lib/msim/axi_data_fifo_v2_1_24
vmap axi_crossbar_v2_1_26 modelsim_lib/msim/axi_crossbar_v2_1_26
vmap axi_protocol_converter_v2_1_25 modelsim_lib/msim/axi_protocol_converter_v2_1_25
vmap axi_clock_converter_v2_1_24 modelsim_lib/msim/axi_clock_converter_v2_1_24
vmap blk_mem_gen_v8_4_5 modelsim_lib/msim/blk_mem_gen_v8_4_5
vmap axi_dwidth_converter_v2_1_25 modelsim_lib/msim/axi_dwidth_converter_v2_1_25

vlog -work xilinx_vip -64 -incr -mfcu -sv -L axi_vip_v1_1_11 -L zynq_ultra_ps_e_vip_v1_0_11 -L xilinx_vip "+incdir+/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm -64 -incr -mfcu -sv -L axi_vip_v1_1_11 -L zynq_ultra_ps_e_vip_v1_0_11 -L xilinx_vip "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/ec67/hdl" "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/2fd3/hdl" "+incdir+/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"/tools/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/tools/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/tools/Xilinx/Vivado/2021.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr -mfcu "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/ec67/hdl" "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/2fd3/hdl" "+incdir+/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_11 -64 -incr -mfcu -sv -L axi_vip_v1_1_11 -L zynq_ultra_ps_e_vip_v1_0_11 -L xilinx_vip "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/ec67/hdl" "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/2fd3/hdl" "+incdir+/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/63b7/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work zynq_ultra_ps_e_vip_v1_0_11 -64 -incr -mfcu -sv -L axi_vip_v1_1_11 -L zynq_ultra_ps_e_vip_v1_0_11 -L xilinx_vip "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/ec67/hdl" "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/2fd3/hdl" "+incdir+/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/2fd3/hdl/zynq_ultra_ps_e_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/ec67/hdl" "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/2fd3/hdl" "+incdir+/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../bd/zcu106_int_meas_plat/ip/zcu106_int_meas_plat_zynq_ultra_ps_e_0_0/sim/zcu106_int_meas_plat_zynq_ultra_ps_e_0_0_vip_wrapper.v" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work interrupt_control_v3_1_4 -64 -93 \
"../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_27 -64 -93 \
"../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/a5bb/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/zcu106_int_meas_plat/ip/zcu106_int_meas_plat_axi_gpio_0_0/sim/zcu106_int_meas_plat_axi_gpio_0_0.vhd" \
"../../../bd/zcu106_int_meas_plat/ip/zcu106_int_meas_plat_axi_gpio_0_1/sim/zcu106_int_meas_plat_axi_gpio_0_1.vhd" \

vcom -work proc_sys_reset_v5_0_13 -64 -93 \
"../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/zcu106_int_meas_plat/ip/zcu106_int_meas_plat_rst_ps8_0_99M_0/sim/zcu106_int_meas_plat_rst_ps8_0_99M_0.vhd" \

vlog -work generic_baseblocks_v2_1_0 -64 -incr -mfcu "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/ec67/hdl" "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/2fd3/hdl" "+incdir+/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_25 -64 -incr -mfcu "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/ec67/hdl" "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/2fd3/hdl" "+incdir+/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/e1e6/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_6 -64 -incr -mfcu "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/ec67/hdl" "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/2fd3/hdl" "+incdir+/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/8ae1/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_6 -64 -93 \
"../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/8ae1/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_6 -64 -incr -mfcu "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/ec67/hdl" "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/2fd3/hdl" "+incdir+/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/8ae1/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_24 -64 -incr -mfcu "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/ec67/hdl" "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/2fd3/hdl" "+incdir+/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/fa53/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_26 -64 -incr -mfcu "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/ec67/hdl" "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/2fd3/hdl" "+incdir+/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/ac57/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/ec67/hdl" "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/2fd3/hdl" "+incdir+/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../bd/zcu106_int_meas_plat/ip/zcu106_int_meas_plat_xbar_0/sim/zcu106_int_meas_plat_xbar_0.v" \

vlog -work axi_protocol_converter_v2_1_25 -64 -incr -mfcu "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/ec67/hdl" "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/2fd3/hdl" "+incdir+/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/8fe4/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work axi_clock_converter_v2_1_24 -64 -incr -mfcu "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/ec67/hdl" "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/2fd3/hdl" "+incdir+/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/23c0/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work blk_mem_gen_v8_4_5 -64 -incr -mfcu "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/ec67/hdl" "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/2fd3/hdl" "+incdir+/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/25a8/simulation/blk_mem_gen_v8_4.v" \

vlog -work axi_dwidth_converter_v2_1_25 -64 -incr -mfcu "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/ec67/hdl" "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/2fd3/hdl" "+incdir+/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/38b4/hdl/axi_dwidth_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/ec67/hdl" "+incdir+../../../../zcu106_plat_int_measurement.gen/sources_1/bd/zcu106_int_meas_plat/ipshared/2fd3/hdl" "+incdir+/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../bd/zcu106_int_meas_plat/ip/zcu106_int_meas_plat_auto_ds_0/sim/zcu106_int_meas_plat_auto_ds_0.v" \
"../../../bd/zcu106_int_meas_plat/ip/zcu106_int_meas_plat_auto_pc_0/sim/zcu106_int_meas_plat_auto_pc_0.v" \
"../../../bd/zcu106_int_meas_plat/ip/zcu106_int_meas_plat_auto_ds_1/sim/zcu106_int_meas_plat_auto_ds_1.v" \
"../../../bd/zcu106_int_meas_plat/ip/zcu106_int_meas_plat_auto_pc_1/sim/zcu106_int_meas_plat_auto_pc_1.v" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/zcu106_int_meas_plat/sim/zcu106_int_meas_plat.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

