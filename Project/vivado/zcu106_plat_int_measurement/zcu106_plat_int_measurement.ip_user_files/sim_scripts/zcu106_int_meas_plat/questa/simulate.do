onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib zcu106_int_meas_plat_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {zcu106_int_meas_plat.udo}

run -all

quit -force
