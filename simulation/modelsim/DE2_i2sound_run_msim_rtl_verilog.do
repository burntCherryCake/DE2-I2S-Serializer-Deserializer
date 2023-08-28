transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Meerkat/Downloads/DE2_v2.0.4_SystemCD/DE2_demonstrations/DE2_i2sound {C:/Users/Meerkat/Downloads/DE2_v2.0.4_SystemCD/DE2_demonstrations/DE2_i2sound/CLOCK_500.v}
vlog -vlog01compat -work work +incdir+C:/Users/Meerkat/Downloads/DE2_v2.0.4_SystemCD/DE2_demonstrations/DE2_i2sound {C:/Users/Meerkat/Downloads/DE2_v2.0.4_SystemCD/DE2_demonstrations/DE2_i2sound/i2c.v}
vlog -vlog01compat -work work +incdir+C:/Users/Meerkat/Downloads/DE2_v2.0.4_SystemCD/DE2_demonstrations/DE2_i2sound {C:/Users/Meerkat/Downloads/DE2_v2.0.4_SystemCD/DE2_demonstrations/DE2_i2sound/keytr.v}
vlog -vlog01compat -work work +incdir+C:/Users/Meerkat/Downloads/DE2_v2.0.4_SystemCD/DE2_demonstrations/DE2_i2sound {C:/Users/Meerkat/Downloads/DE2_v2.0.4_SystemCD/DE2_demonstrations/DE2_i2sound/audio_parallel_to_serial.v}
vlog -vlog01compat -work work +incdir+C:/Users/Meerkat/Downloads/DE2_v2.0.4_SystemCD/DE2_demonstrations/DE2_i2sound {C:/Users/Meerkat/Downloads/DE2_v2.0.4_SystemCD/DE2_demonstrations/DE2_i2sound/LED_STATUS.v}
vlog -vlog01compat -work work +incdir+C:/Users/Meerkat/Downloads/DE2_v2.0.4_SystemCD/DE2_demonstrations/DE2_i2sound {C:/Users/Meerkat/Downloads/DE2_v2.0.4_SystemCD/DE2_demonstrations/DE2_i2sound/MUX-16bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/Meerkat/Downloads/DE2_v2.0.4_SystemCD/DE2_demonstrations/DE2_i2sound {C:/Users/Meerkat/Downloads/DE2_v2.0.4_SystemCD/DE2_demonstrations/DE2_i2sound/audio_deserializer2.v}

