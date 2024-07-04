from typing import Optional, List
import custom_types
import util 
from functools import reduce
from operator import mul
import math

def generate_tcl_script(proj_base_path: str, project_name: str, bd_name: str, script_dir: str, 
                        sv_file : str, finn_name : str, feeder_name : str, fpga_board_name : str,
                        isWindows : bool, id_width : int, user_width: int, verilog_define : str) -> str:
    # Define o conteúdo do script TCL
    project_path = f"{proj_base_path}/{project_name}.xpr"
    bd_file = f"{proj_base_path}/{project_name}.srcs/sources_1/bd/{bd_name}/{bd_name}.bd"
    gen_bd_dir = f"{proj_base_path}/{project_name}.gen/sources_1/bd/{bd_name}"

    finn_ip_dir = util.get_finn_ip_path(script_dir=script_dir,finn_name=finn_name)
    feeder_ip_dir = f"{script_dir}/IPs/Feeder_ips/{feeder_name}/{fpga_board_name}/ip"

    finn_vlnv = util.extract_ip_vlnv(f"{finn_ip_dir}/component.xml")
    feeder_vlnv = util.extract_ip_vlnv(f"{feeder_ip_dir}/component.xml")

    tcl_script = f"""
# Open the project
open_project {project_path}

# Create block design
create_bd_design "{bd_name}"

import_files {sv_file}

# Update compile order
update_compile_order -fileset sources_1

# Set IP repository paths
set_property ip_repo_paths {{{finn_ip_dir} {feeder_ip_dir}}} [current_project]
update_ip_catalog

open_bd_design {bd_file}

# Create IP blocks
startgroup
create_bd_cell -type ip -vlnv {finn_vlnv['vendor']}:{finn_vlnv['library']}:{finn_vlnv['name']}:{finn_vlnv['version']} {finn_name}
create_bd_cell -type ip -vlnv {feeder_vlnv['vendor']}:{feeder_vlnv['library']}:{feeder_vlnv['name']}:{feeder_vlnv['version']} {feeder_name}
endgroup

# Connect interfaces
connect_bd_intf_net [get_bd_intf_pins {finn_name}/m_axis_0] [get_bd_intf_pins {feeder_name}/in_stream]
connect_bd_intf_net [get_bd_intf_pins {finn_name}/s_axis_0] [get_bd_intf_pins {feeder_name}/out_stream]

# Make pins external
make_bd_pins_external [get_bd_cells {feeder_name}]
make_bd_intf_pins_external [get_bd_cells {feeder_name}]

# Connect clocks and resets
connect_bd_net [get_bd_ports ap_clk_0] [get_bd_pins {finn_name}/ap_clk]
connect_bd_net [get_bd_ports ap_rst_n_0] [get_bd_pins {finn_name}/ap_rst_n]

# Change user and id ports width
startgroup
set_property -dict [list \\
  CONFIG.C_M_AXI_GMEM_ARUSER_WIDTH {{{user_width}}} \\
  CONFIG.C_M_AXI_GMEM_AWUSER_WIDTH {{{user_width}}} \\
  CONFIG.C_M_AXI_GMEM_BUSER_WIDTH {{{user_width}}} \\
  CONFIG.C_M_AXI_GMEM_ENABLE_USER_PORTS {{true}} \\
  CONFIG.C_M_AXI_GMEM_ID_WIDTH {{{id_width}}} \\
  CONFIG.C_M_AXI_GMEM_RUSER_WIDTH {{{user_width}}} \\
  CONFIG.C_M_AXI_GMEM_WUSER_WIDTH {{{user_width}}} \\
] [get_bd_cells {feeder_name}]
endgroup

# Regenerate layout and make wrapper
regenerate_bd_layout
make_wrapper -files [get_files {bd_file}] -top
add_files -norecurse {gen_bd_dir}/hdl/{bd_name}_wrapper.v

set_property verilog_define {verilog_define} [current_fileset]
set_property verilog_define {verilog_define} [get_filesets sim_1]
"""

    return tcl_script

def generate_compatible_finn_sv(bd_name: str) -> str:
    compatible_finn_sv = f"""
`timescale 1 ns / 1 ps

`include "axi/assign.svh"
`include "axi/typedef.svh"

module compatible_{bd_name} (
    input wire clk,
    input wire rst_n,
    AXI_BUS.Master axi_master_mem,
    AXI_BUS.Slave axi_slave_ctrl
);  
    AXI_LITE #(
        .AXI_ADDR_WIDTH(32),
        .AXI_DATA_WIDTH(32)
    ) conv();

    axi_to_axi_lite_intf #(
        .AXI_ADDR_WIDTH(32),
        .AXI_DATA_WIDTH(32),
        .AXI_ID_WIDTH(2),
        .AXI_USER_WIDTH(2)
    ) axi_to_axi_lite (
        .clk_i (clk),
        .rst_ni(rst_n),
        .testmode_i('0),
        .slv(axi_slave_ctrl),
        .mst(conv)
    );
             
    // Instance of {bd_name}_wrapper
    {bd_name}_wrapper finn_chiplet_inst (
      .ap_clk_0                 (clk),
      .ap_rst_n_0               (rst_n),
      .done_irq_0               (),
      .done_irq_ap_vld_0        (),
      .interrupt_0              (),
      .m_axi_gmem_0_araddr      (axi_master_mem.ar_addr),
      .m_axi_gmem_0_arburst     (axi_master_mem.ar_burst),
      .m_axi_gmem_0_arcache     (axi_master_mem.ar_cache),
      .m_axi_gmem_0_arid        (axi_master_mem.ar_id),
      .m_axi_gmem_0_arlen       (axi_master_mem.ar_len),
      .m_axi_gmem_0_arlock      (axi_master_mem.ar_lock),
      .m_axi_gmem_0_arprot      (axi_master_mem.ar_prot),
      .m_axi_gmem_0_arqos       (axi_master_mem.ar_qos),
      .m_axi_gmem_0_arready     (axi_master_mem.ar_ready),
      .m_axi_gmem_0_arregion    (axi_master_mem.ar_region),
      .m_axi_gmem_0_arsize      (axi_master_mem.ar_size),
      .m_axi_gmem_0_arvalid     (axi_master_mem.ar_valid),
      .m_axi_gmem_0_aruser      (axi_master_mem.ar_user),
      .m_axi_gmem_0_awaddr      (),
      .m_axi_gmem_0_awburst     (axi_master_mem.aw_burst),
      .m_axi_gmem_0_awcache     (axi_master_mem.aw_cache),
      .m_axi_gmem_0_awid        (axi_master_mem.aw_id),
      .m_axi_gmem_0_awlen       (),
      .m_axi_gmem_0_awlock      (axi_master_mem.aw_lock),
      .m_axi_gmem_0_awprot      (axi_master_mem.aw_prot),
      .m_axi_gmem_0_awqos       (axi_master_mem.aw_qos),
      .m_axi_gmem_0_awready     (axi_master_mem.aw_ready),
      .m_axi_gmem_0_awregion    (axi_master_mem.aw_region),
      .m_axi_gmem_0_awsize      (axi_master_mem.aw_size),
      .m_axi_gmem_0_awuser      (axi_master_mem.aw_user),
      .m_axi_gmem_0_awvalid     (axi_master_mem.aw_valid),
      .m_axi_gmem_0_bid         (axi_master_mem.b_id),
      .m_axi_gmem_0_bready      (axi_master_mem.b_ready),
      .m_axi_gmem_0_bresp       (axi_master_mem.b_resp),
      .m_axi_gmem_0_buser       (axi_master_mem.b_user),
      .m_axi_gmem_0_bvalid      (axi_master_mem.b_valid),
      .m_axi_gmem_0_rdata       (axi_master_mem.r_data),
      .m_axi_gmem_0_rid         (axi_master_mem.r_id),
      .m_axi_gmem_0_rlast       (axi_master_mem.r_last),
      .m_axi_gmem_0_rready      (axi_master_mem.r_ready),
      .m_axi_gmem_0_rresp       (axi_master_mem.r_resp),
      .m_axi_gmem_0_ruser       (axi_master_mem.r_user),
      .m_axi_gmem_0_rvalid      (axi_master_mem.r_valid),
      .m_axi_gmem_0_wdata       (axi_master_mem.w_data),
      .m_axi_gmem_0_wlast       (axi_master_mem.w_last),
      .m_axi_gmem_0_wready      (axi_master_mem.w_ready),
      .m_axi_gmem_0_wstrb       (axi_master_mem.w_strb),
      .m_axi_gmem_0_wuser       (axi_master_mem.w_user),
      .m_axi_gmem_0_wvalid      (axi_master_mem.w_valid),
      
      .s_axi_control_0_araddr   (conv.ar_addr),
      .s_axi_control_0_arready  (conv.ar_ready),
      .s_axi_control_0_arvalid  (conv.ar_valid),
      .s_axi_control_0_awaddr   (conv.aw_addr),
      .s_axi_control_0_awready  (conv.aw_ready),
      .s_axi_control_0_awvalid  (conv.aw_valid),
      .s_axi_control_0_bready   (conv.b_ready),
      .s_axi_control_0_bresp    (conv.b_resp),
      .s_axi_control_0_bvalid   (conv.b_valid),
      .s_axi_control_0_rdata    (conv.r_data),
      .s_axi_control_0_rready   (conv.r_ready),
      .s_axi_control_0_rresp    (conv.r_resp),
      .s_axi_control_0_rvalid   (conv.r_valid),
      .s_axi_control_0_wdata    (conv.w_data),
      .s_axi_control_0_wready   (conv.w_ready),
      .s_axi_control_0_wstrb    (conv.w_strb),
      .s_axi_control_0_wvalid   (conv.w_valid)

    );

endmodule
"""
    return compatible_finn_sv

def generate_feeder_main(cfg_json : custom_types.FeederConfig, finn_name: str, script_dir : str ) -> str:

    finn_ip_dir = util.get_finn_ip_path(script_dir=script_dir,finn_name=finn_name)
    io_bits = util.extract_io_bits(finn_ip_dir + "/component.xml")

    input_bits = io_bits['m_axis_0']
    output_bits = io_bits['m_axis_0']

    input_size = int(util.multiply_elements(cfg_json['input_shape']))
    input_ptr_max_size = int(math.log(input_size,2))
    print(input_ptr_max_size)
    
    n_batchs = int(cfg_json['memory_address_width'] / input_bits)
    print(n_batchs)

    return f"""#include "finn_feeder.h"

{get_feeder_main_assignature(cfg_json=cfg_json)}
{{

    #pragma HLS INTERFACE axis port=out_stream
    #pragma HLS INTERFACE axis port=in_stream
    #pragma HLS INTERFACE s_axilite port=predicted_index
    #pragma HLS INTERFACE s_axilite port=initial_address
    #pragma HLS INTERFACE s_axilite port=image_size
    #pragma HLS INTERFACE s_axilite port=num_images
    #pragma HLS INTERFACE s_axilite port=return
    #pragma HLS INTERFACE mode=m_axi port=ext_mem

	uint{cfg_json['memory_address_width']}_t  img_idx;

    for (img_idx = 0; img_idx < num_images; img_idx++) {{
    	ap_int<{input_ptr_max_size}> p;
        AXI_VALUE_pixel pixel;
        AXI_VALUE_label label;
        *done_irq = 0;

        uint32_t address = (initial_address / {n_batchs}) + img_idx * (image_size / {n_batchs});

        for(p = 0; p < image_size / {n_batchs}; p++) {{  // Read 32 bits (4 bytes) at a time
        	#pragma HLS PIPELINE II={n_batchs}
            uint{cfg_json['memory_data_width']}_t word = ext_mem[address + p];

            // Extract each byte from the 32-bit word and write to the stream
            for (ap_int<{int(math.log(n_batchs,2))}> i = 0; i < {n_batchs}; i++) {{
                pixel.data = (word >> (i * {input_bits})) & 0x{'F' * int(input_bits / 4)};  // Extract byte
                out_stream.write(pixel);
            }}
        }}

        // Ler o rótulo do stream de entrada (leitura bloqueante)
        in_stream.read(label);
        *predicted_index = label.data;
        *done_irq = 1;
    }}
}}
"""

def generate_feeder_main_header(cfg_json : custom_types.FeederConfig, finn_name: str, script_dir : str) -> str:
    finn_ip_dir = util.get_finn_ip_path(script_dir=script_dir,finn_name=finn_name)
    io_bits = util.extract_io_bits(finn_ip_dir + "/component.xml")

    input_bits = io_bits['m_axis_0']
    output_bits = io_bits['m_axis_0']
    
    return f"""
// Based on Xilinx XAPP1170

#ifndef __FINN_FEEDER_H__
#define __FINN_FEEDER_H__

#include <cmath>
#include <ap_axi_sdata.h>
#include <hls_stream.h>

#define IMAGESET_IMAGE_HEIGHT         (32)
#define IMAGESET_IMAGE_WIDTH          (32)
#define IMAGESET_IMAGE_CHANNELS       (4)
#define IMAGESET_IMAGE_CHANNEL_BYTES  (1)
#define IMAGESET_CLASSES              (6)
#define IMAGESET_CLASS_SAMPLES        (1)


// Xilinx UG1399 AXI4-Stream Interfaces without Side-Channels
typedef ap_axiu<{input_bits}, 0, 0, 0, 0> AXI_VALUE_pixel; // {input_bits} bits for pixel data
typedef ap_axiu<{output_bits}, 0, 0, 0, 0> AXI_VALUE_label; // {output_bits} bits for label data

{get_feeder_main_assignature(cfg_json=cfg_json)};

#endif /* __FINN_FEEDER_H__ */
"""

def get_feeder_main_assignature(cfg_json : custom_types.FeederConfig) -> str:   
    return f"""
void finn_feeder_chiplet(
    hls::stream<AXI_VALUE_pixel> &out_stream,
    hls::stream<AXI_VALUE_label> &in_stream,
    volatile uint{cfg_json['memory_data_width']}_t* predicted_index,
    volatile uint{cfg_json['memory_data_width']}_t* ext_mem,
    uint{cfg_json['memory_address_width']}_t initial_address,
    uint{cfg_json['memory_address_width']}_t image_size,
    uint{cfg_json['memory_address_width']}_t num_images,
    volatile bool* done_irq
)"""

def generate_feeder_test(a:str) -> str:
    return f"""


"""