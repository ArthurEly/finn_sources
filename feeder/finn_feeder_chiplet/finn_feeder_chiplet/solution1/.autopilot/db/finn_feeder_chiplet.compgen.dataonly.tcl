# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
predicted_index { 
	dir O
	width 8
	depth 1
	mode ap_vld
	offset 16
	offset_end 23
}
ext_mem { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 32
	offset_end 43
}
initial_address { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 44
	offset_end 51
}
image_size { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 52
	offset_end 59
}
num_images { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 60
	offset_end 67
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict control $port_control


