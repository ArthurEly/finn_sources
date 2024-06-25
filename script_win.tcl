
# Create block design
create_bd_design "finn_chiplet_win"

import_files C:/Users/Usuario/Desktop/Bolsa/finn_sources/compatible_finn_chiplet_win.sv

# Update compile order
update_compile_order -fileset sources_1

# Set IP repository paths
set_property ip_repo_paths {C:/Users/Usuario/Desktop/Bolsa/finn_sources/IPs/FINN_ips/t2w8_5000fps/ip C:/Users/Usuario/Desktop/Bolsa/finn_sources/IPs/Feeder_ips/feeder_21b/ip} [current_project]
update_ip_catalog

open_bd_design C:/Users/Usuario/Desktop/Bolsa/teste/teste.srcs/sources_1/bd/finn_chiplet_win/finn_chiplet_win.bd

# Create IP blocks
startgroup
create_bd_cell -type ip -vlnv xilinx_finn:finn:finn_design_t2w8_2:1.0 t2w8_5000fps
create_bd_cell -type ip -vlnv xilinx.com:hls:finn_feeder_chiplet:2.1 feeder_21b
endgroup

# Connect interfaces
connect_bd_intf_net [get_bd_intf_pins t2w8_5000fps/m_axis_0] [get_bd_intf_pins feeder_21b/in_stream]
connect_bd_intf_net [get_bd_intf_pins t2w8_5000fps/s_axis_0] [get_bd_intf_pins feeder_21b/out_stream]

# Make pins external
make_bd_pins_external [get_bd_cells feeder_21b]
make_bd_intf_pins_external [get_bd_cells feeder_21b]

# Connect clocks and resets
connect_bd_net [get_bd_ports ap_clk_0] [get_bd_pins t2w8_5000fps/ap_clk]
connect_bd_net [get_bd_ports ap_rst_n_0] [get_bd_pins t2w8_5000fps/ap_rst_n]

# Change user and id ports width
startgroup
set_property -dict [list \
  CONFIG.C_M_AXI_GMEM_ARUSER_WIDTH {2} \
  CONFIG.C_M_AXI_GMEM_AWUSER_WIDTH {2} \
  CONFIG.C_M_AXI_GMEM_BUSER_WIDTH {2} \
  CONFIG.C_M_AXI_GMEM_ENABLE_USER_PORTS {true} \
  CONFIG.C_M_AXI_GMEM_ID_WIDTH {2} \
  CONFIG.C_M_AXI_GMEM_RUSER_WIDTH {2} \
  CONFIG.C_M_AXI_GMEM_WUSER_WIDTH {2} \
] [get_bd_cells feeder_21b]
endgroup

# Regenerate layout and make wrapper
regenerate_bd_layout
make_wrapper -files [get_files C:/Users/Usuario/Desktop/Bolsa/teste/teste.srcs/sources_1/bd/finn_chiplet_win/finn_chiplet_win.bd] -top
add_files -norecurse C:/Users/Usuario/Desktop/Bolsa/teste/teste.gen/sources_1/bd/finn_chiplet_win/hdl/finn_chiplet_win_wrapper.v
