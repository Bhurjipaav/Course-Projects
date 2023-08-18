transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {DUT.vho}

vcom -93 -work work {D:/Quartus-lite-20.1.1.720-windows/vowel detector/Testbench.vhdl}

vsim -t 1ps +transport_int_delays +transport_path_delays -sdftyp /DUT_instance=DUT_vhd.sdo -L maxv -L gate_work -L work -voptargs="+acc"  Testbench

add wave *
view structure
view signals
run -all
