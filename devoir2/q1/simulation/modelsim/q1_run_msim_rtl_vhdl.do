transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/martin/coding/ift1227/devoir2/q1/sillyfunction.vhd}

