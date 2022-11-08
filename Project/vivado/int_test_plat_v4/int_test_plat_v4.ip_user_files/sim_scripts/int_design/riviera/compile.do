vlib work
vlib riviera

vlib riviera/xilinx_vip
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_vip_v1_1_11
vlib riviera/zynq_ultra_ps_e_vip_v1_0_11
vlib riviera/xil_defaultlib
vlib riviera/xlslice_v1_0_2
vlib riviera/xlconcat_v2_1_4

vmap xilinx_vip riviera/xilinx_vip
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_11 riviera/axi_vip_v1_1_11
vmap zynq_ultra_ps_e_vip_v1_0_11 riviera/zynq_ultra_ps_e_vip_v1_0_11
vmap xil_defaultlib riviera/xil_defaultlib
vmap xlslice_v1_0_2 riviera/xlslice_v1_0_2
vmap xlconcat_v2_1_4 riviera/xlconcat_v2_1_4

vlog -work xilinx_vip  -sv2k12 "+incdir+/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../int_test_plat_v4.gen/sources_1/bd/int_design/ipshared/ec67/hdl" "+incdir+../../../../int_test_plat_v4.gen/sources_1/bd/int_design/ipshared/2fd3/hdl" "+incdir+/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../../int_test_plat_v4.gen/sources_1/bd/int_design/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_11  -sv2k12 "+incdir+../../../../int_test_plat_v4.gen/sources_1/bd/int_design/ipshared/ec67/hdl" "+incdir+../../../../int_test_plat_v4.gen/sources_1/bd/int_design/ipshared/2fd3/hdl" "+incdir+/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../../int_test_plat_v4.gen/sources_1/bd/int_design/ipshared/63b7/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work zynq_ultra_ps_e_vip_v1_0_11  -sv2k12 "+incdir+../../../../int_test_plat_v4.gen/sources_1/bd/int_design/ipshared/ec67/hdl" "+incdir+../../../../int_test_plat_v4.gen/sources_1/bd/int_design/ipshared/2fd3/hdl" "+incdir+/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../../int_test_plat_v4.gen/sources_1/bd/int_design/ipshared/2fd3/hdl/zynq_ultra_ps_e_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../int_test_plat_v4.gen/sources_1/bd/int_design/ipshared/ec67/hdl" "+incdir+../../../../int_test_plat_v4.gen/sources_1/bd/int_design/ipshared/2fd3/hdl" "+incdir+/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../bd/int_design/ip/int_design_zynq_ultra_ps_e_0_0/sim/int_design_zynq_ultra_ps_e_0_0_vip_wrapper.v" \

vlog -work xlslice_v1_0_2  -v2k5 "+incdir+../../../../int_test_plat_v4.gen/sources_1/bd/int_design/ipshared/ec67/hdl" "+incdir+../../../../int_test_plat_v4.gen/sources_1/bd/int_design/ipshared/2fd3/hdl" "+incdir+/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../../int_test_plat_v4.gen/sources_1/bd/int_design/ipshared/11d0/hdl/xlslice_v1_0_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../int_test_plat_v4.gen/sources_1/bd/int_design/ipshared/ec67/hdl" "+incdir+../../../../int_test_plat_v4.gen/sources_1/bd/int_design/ipshared/2fd3/hdl" "+incdir+/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../bd/int_design/ip/int_design_xlslice_0_0/sim/int_design_xlslice_0_0.v" \

vlog -work xlconcat_v2_1_4  -v2k5 "+incdir+../../../../int_test_plat_v4.gen/sources_1/bd/int_design/ipshared/ec67/hdl" "+incdir+../../../../int_test_plat_v4.gen/sources_1/bd/int_design/ipshared/2fd3/hdl" "+incdir+/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../../int_test_plat_v4.gen/sources_1/bd/int_design/ipshared/4b67/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../int_test_plat_v4.gen/sources_1/bd/int_design/ipshared/ec67/hdl" "+incdir+../../../../int_test_plat_v4.gen/sources_1/bd/int_design/ipshared/2fd3/hdl" "+incdir+/tools/Xilinx/Vivado/2021.2/data/xilinx_vip/include" \
"../../../bd/int_design/ip/int_design_xlconcat_0_0/sim/int_design_xlconcat_0_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/int_design/sim/int_design.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

