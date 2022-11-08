onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+int_design -L xilinx_vip -L axi_infrastructure_v1_1_0 -L axi_vip_v1_1_11 -L zynq_ultra_ps_e_vip_v1_0_11 -L xil_defaultlib -L xlslice_v1_0_2 -L xlconcat_v2_1_4 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.int_design xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {int_design.udo}

run -all

endsim

quit -force
