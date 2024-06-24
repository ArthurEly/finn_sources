// ==============================================================
// Generated by Vitis HLS v2023.2
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// ==============================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="finn_feeder_chiplet_finn_feeder_chiplet,hls_ip_2023_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=9.500000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=4,HLS_SYN_DSP=0,HLS_SYN_FF=1541,HLS_SYN_LUT=1710,HLS_VERSION=2023_2}" *)

module finn_feeder_chiplet (
        ap_clk,
        ap_rst_n,
        m_axi_gmem_AWVALID,
        m_axi_gmem_AWREADY,
        m_axi_gmem_AWADDR,
        m_axi_gmem_AWID,
        m_axi_gmem_AWLEN,
        m_axi_gmem_AWSIZE,
        m_axi_gmem_AWBURST,
        m_axi_gmem_AWLOCK,
        m_axi_gmem_AWCACHE,
        m_axi_gmem_AWPROT,
        m_axi_gmem_AWQOS,
        m_axi_gmem_AWREGION,
        m_axi_gmem_AWUSER,
        m_axi_gmem_WVALID,
        m_axi_gmem_WREADY,
        m_axi_gmem_WDATA,
        m_axi_gmem_WSTRB,
        m_axi_gmem_WLAST,
        m_axi_gmem_WID,
        m_axi_gmem_WUSER,
        m_axi_gmem_ARVALID,
        m_axi_gmem_ARREADY,
        m_axi_gmem_ARADDR,
        m_axi_gmem_ARID,
        m_axi_gmem_ARLEN,
        m_axi_gmem_ARSIZE,
        m_axi_gmem_ARBURST,
        m_axi_gmem_ARLOCK,
        m_axi_gmem_ARCACHE,
        m_axi_gmem_ARPROT,
        m_axi_gmem_ARQOS,
        m_axi_gmem_ARREGION,
        m_axi_gmem_ARUSER,
        m_axi_gmem_RVALID,
        m_axi_gmem_RREADY,
        m_axi_gmem_RDATA,
        m_axi_gmem_RLAST,
        m_axi_gmem_RID,
        m_axi_gmem_RUSER,
        m_axi_gmem_RRESP,
        m_axi_gmem_BVALID,
        m_axi_gmem_BREADY,
        m_axi_gmem_BRESP,
        m_axi_gmem_BID,
        m_axi_gmem_BUSER,
        out_stream_TDATA,
        out_stream_TVALID,
        out_stream_TREADY,
        in_stream_TDATA,
        in_stream_TVALID,
        in_stream_TREADY,
        done_irq,
        done_irq_ap_vld,
        s_axi_control_AWVALID,
        s_axi_control_AWREADY,
        s_axi_control_AWADDR,
        s_axi_control_WVALID,
        s_axi_control_WREADY,
        s_axi_control_WDATA,
        s_axi_control_WSTRB,
        s_axi_control_ARVALID,
        s_axi_control_ARREADY,
        s_axi_control_ARADDR,
        s_axi_control_RVALID,
        s_axi_control_RREADY,
        s_axi_control_RDATA,
        s_axi_control_RRESP,
        s_axi_control_BVALID,
        s_axi_control_BREADY,
        s_axi_control_BRESP,
        interrupt
);

parameter    ap_ST_fsm_state1 = 6'd1;
parameter    ap_ST_fsm_state2 = 6'd2;
parameter    ap_ST_fsm_state3 = 6'd4;
parameter    ap_ST_fsm_state4 = 6'd8;
parameter    ap_ST_fsm_state5 = 6'd16;
parameter    ap_ST_fsm_state6 = 6'd32;
parameter    C_S_AXI_CONTROL_DATA_WIDTH = 32;
parameter    C_S_AXI_CONTROL_ADDR_WIDTH = 7;
parameter    C_S_AXI_DATA_WIDTH = 32;
parameter    C_M_AXI_GMEM_ID_WIDTH = 1;
parameter    C_M_AXI_GMEM_ADDR_WIDTH = 64;
parameter    C_M_AXI_GMEM_DATA_WIDTH = 32;
parameter    C_M_AXI_GMEM_AWUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM_ARUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM_WUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM_RUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM_BUSER_WIDTH = 1;
parameter    C_M_AXI_GMEM_USER_VALUE = 0;
parameter    C_M_AXI_GMEM_PROT_VALUE = 0;
parameter    C_M_AXI_GMEM_CACHE_VALUE = 3;
parameter    C_M_AXI_DATA_WIDTH = 32;

parameter C_S_AXI_CONTROL_WSTRB_WIDTH = (32 / 8);
parameter C_S_AXI_WSTRB_WIDTH = (32 / 8);
parameter C_M_AXI_GMEM_WSTRB_WIDTH = (32 / 8);
parameter C_M_AXI_WSTRB_WIDTH = (32 / 8);

input   ap_clk;
input   ap_rst_n;
output   m_axi_gmem_AWVALID;
input   m_axi_gmem_AWREADY;
output  [C_M_AXI_GMEM_ADDR_WIDTH - 1:0] m_axi_gmem_AWADDR;
output  [C_M_AXI_GMEM_ID_WIDTH - 1:0] m_axi_gmem_AWID;
output  [7:0] m_axi_gmem_AWLEN;
output  [2:0] m_axi_gmem_AWSIZE;
output  [1:0] m_axi_gmem_AWBURST;
output  [1:0] m_axi_gmem_AWLOCK;
output  [3:0] m_axi_gmem_AWCACHE;
output  [2:0] m_axi_gmem_AWPROT;
output  [3:0] m_axi_gmem_AWQOS;
output  [3:0] m_axi_gmem_AWREGION;
output  [C_M_AXI_GMEM_AWUSER_WIDTH - 1:0] m_axi_gmem_AWUSER;
output   m_axi_gmem_WVALID;
input   m_axi_gmem_WREADY;
output  [C_M_AXI_GMEM_DATA_WIDTH - 1:0] m_axi_gmem_WDATA;
output  [C_M_AXI_GMEM_WSTRB_WIDTH - 1:0] m_axi_gmem_WSTRB;
output   m_axi_gmem_WLAST;
output  [C_M_AXI_GMEM_ID_WIDTH - 1:0] m_axi_gmem_WID;
output  [C_M_AXI_GMEM_WUSER_WIDTH - 1:0] m_axi_gmem_WUSER;
output   m_axi_gmem_ARVALID;
input   m_axi_gmem_ARREADY;
output  [C_M_AXI_GMEM_ADDR_WIDTH - 1:0] m_axi_gmem_ARADDR;
output  [C_M_AXI_GMEM_ID_WIDTH - 1:0] m_axi_gmem_ARID;
output  [7:0] m_axi_gmem_ARLEN;
output  [2:0] m_axi_gmem_ARSIZE;
output  [1:0] m_axi_gmem_ARBURST;
output  [1:0] m_axi_gmem_ARLOCK;
output  [3:0] m_axi_gmem_ARCACHE;
output  [2:0] m_axi_gmem_ARPROT;
output  [3:0] m_axi_gmem_ARQOS;
output  [3:0] m_axi_gmem_ARREGION;
output  [C_M_AXI_GMEM_ARUSER_WIDTH - 1:0] m_axi_gmem_ARUSER;
input   m_axi_gmem_RVALID;
output   m_axi_gmem_RREADY;
input  [C_M_AXI_GMEM_DATA_WIDTH - 1:0] m_axi_gmem_RDATA;
input   m_axi_gmem_RLAST;
input  [C_M_AXI_GMEM_ID_WIDTH - 1:0] m_axi_gmem_RID;
input  [C_M_AXI_GMEM_RUSER_WIDTH - 1:0] m_axi_gmem_RUSER;
input  [1:0] m_axi_gmem_RRESP;
input   m_axi_gmem_BVALID;
output   m_axi_gmem_BREADY;
input  [1:0] m_axi_gmem_BRESP;
input  [C_M_AXI_GMEM_ID_WIDTH - 1:0] m_axi_gmem_BID;
input  [C_M_AXI_GMEM_BUSER_WIDTH - 1:0] m_axi_gmem_BUSER;
output  [7:0] out_stream_TDATA;
output   out_stream_TVALID;
input   out_stream_TREADY;
input  [7:0] in_stream_TDATA;
input   in_stream_TVALID;
output   in_stream_TREADY;
output  [0:0] done_irq;
output   done_irq_ap_vld;
input   s_axi_control_AWVALID;
output   s_axi_control_AWREADY;
input  [C_S_AXI_CONTROL_ADDR_WIDTH - 1:0] s_axi_control_AWADDR;
input   s_axi_control_WVALID;
output   s_axi_control_WREADY;
input  [C_S_AXI_CONTROL_DATA_WIDTH - 1:0] s_axi_control_WDATA;
input  [C_S_AXI_CONTROL_WSTRB_WIDTH - 1:0] s_axi_control_WSTRB;
input   s_axi_control_ARVALID;
output   s_axi_control_ARREADY;
input  [C_S_AXI_CONTROL_ADDR_WIDTH - 1:0] s_axi_control_ARADDR;
output   s_axi_control_RVALID;
input   s_axi_control_RREADY;
output  [C_S_AXI_CONTROL_DATA_WIDTH - 1:0] s_axi_control_RDATA;
output  [1:0] s_axi_control_RRESP;
output   s_axi_control_BVALID;
input   s_axi_control_BREADY;
output  [1:0] s_axi_control_BRESP;
output   interrupt;

reg[0:0] done_irq;
reg done_irq_ap_vld;

 reg    ap_rst_n_inv;
wire    ap_start;
reg    ap_done;
reg    ap_idle;
(* fsm_encoding = "none" *) reg   [5:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    ap_ready;
reg    predicted_index_ap_vld;
wire   [63:0] ext_mem;
wire   [31:0] initial_address;
wire   [31:0] image_size;
wire   [31:0] num_images;
reg    in_stream_TDATA_blk_n;
wire    ap_CS_fsm_state5;
reg   [31:0] num_images_read_reg_231;
reg   [63:0] ext_mem_read_reg_236;
wire   [31:0] shr_cast_fu_176_p1;
reg   [31:0] shr_cast_reg_241;
wire   [29:0] shr1_fu_180_p4;
reg   [29:0] shr1_reg_246;
wire   [31:0] shr1_cast_fu_190_p1;
reg   [31:0] shr1_cast_reg_251;
wire   [31:0] mul_ln31_fu_162_p2;
reg   [31:0] mul_ln31_reg_259;
wire    ap_CS_fsm_state2;
wire   [31:0] address_fu_219_p2;
reg   [31:0] address_reg_264;
wire    ap_CS_fsm_state3;
wire    grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_ap_start;
wire    grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_ap_done;
wire    grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_ap_idle;
wire    grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_ap_ready;
wire    grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_out_stream_TREADY;
wire    grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_AWVALID;
wire   [63:0] grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_AWADDR;
wire   [0:0] grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_AWID;
wire   [31:0] grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_AWLEN;
wire   [2:0] grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_AWSIZE;
wire   [1:0] grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_AWBURST;
wire   [1:0] grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_AWLOCK;
wire   [3:0] grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_AWCACHE;
wire   [2:0] grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_AWPROT;
wire   [3:0] grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_AWQOS;
wire   [3:0] grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_AWREGION;
wire   [0:0] grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_AWUSER;
wire    grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_WVALID;
wire   [31:0] grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_WDATA;
wire   [3:0] grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_WSTRB;
wire    grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_WLAST;
wire   [0:0] grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_WID;
wire   [0:0] grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_WUSER;
wire    grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_ARVALID;
wire   [63:0] grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_ARADDR;
wire   [0:0] grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_ARID;
wire   [31:0] grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_ARLEN;
wire   [2:0] grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_ARSIZE;
wire   [1:0] grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_ARBURST;
wire   [1:0] grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_ARLOCK;
wire   [3:0] grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_ARCACHE;
wire   [2:0] grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_ARPROT;
wire   [3:0] grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_ARQOS;
wire   [3:0] grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_ARREGION;
wire   [0:0] grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_ARUSER;
wire    grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_RREADY;
wire    grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_BREADY;
wire   [7:0] grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_out_stream_TDATA;
wire    grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_out_stream_TVALID;
wire    gmem_AWREADY;
wire    gmem_WREADY;
reg    gmem_ARVALID;
wire    gmem_ARREADY;
wire    gmem_RVALID;
reg    gmem_RREADY;
wire   [31:0] gmem_RDATA;
wire   [8:0] gmem_RFIFONUM;
wire    gmem_BVALID;
reg    grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_ap_start_reg;
wire    ap_CS_fsm_state4;
reg  signed [31:0] img_idx_fu_100;
wire   [31:0] img_idx_2_fu_208_p2;
wire   [0:0] icmp_ln25_fu_203_p2;
wire   [29:0] mul_ln31_fu_162_p1;
wire   [29:0] shr_fu_166_p4;
wire  signed [31:0] icmp_ln25_fu_203_p0;
wire  signed [31:0] img_idx_2_fu_208_p0;
wire    ap_CS_fsm_state6;
wire    regslice_both_out_stream_V_data_V_U_apdone_blk;
reg   [5:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_ST_fsm_state2_blk;
wire    ap_ST_fsm_state3_blk;
reg    ap_ST_fsm_state4_blk;
reg    ap_ST_fsm_state5_blk;
reg    ap_ST_fsm_state6_blk;
wire    out_stream_TREADY_int_regslice;
wire    regslice_both_out_stream_V_data_V_U_vld_out;
wire    regslice_both_in_stream_V_data_V_U_apdone_blk;
wire   [7:0] in_stream_TDATA_int_regslice;
wire    in_stream_TVALID_int_regslice;
reg    in_stream_TREADY_int_regslice;
wire    regslice_both_in_stream_V_data_V_U_ack_in;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 6'd1;
#0 grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_ap_start_reg = 1'b0;
#0 img_idx_fu_100 = 32'd0;
end

finn_feeder_chiplet_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2 grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_ap_start),
    .ap_done(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_ap_done),
    .ap_idle(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_ap_idle),
    .ap_ready(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_ap_ready),
    .out_stream_TREADY(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_out_stream_TREADY),
    .m_axi_gmem_AWVALID(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_AWVALID),
    .m_axi_gmem_AWREADY(1'b0),
    .m_axi_gmem_AWADDR(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_AWADDR),
    .m_axi_gmem_AWID(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_AWID),
    .m_axi_gmem_AWLEN(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_AWLEN),
    .m_axi_gmem_AWSIZE(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_AWSIZE),
    .m_axi_gmem_AWBURST(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_AWBURST),
    .m_axi_gmem_AWLOCK(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_AWLOCK),
    .m_axi_gmem_AWCACHE(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_AWCACHE),
    .m_axi_gmem_AWPROT(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_AWPROT),
    .m_axi_gmem_AWQOS(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_AWQOS),
    .m_axi_gmem_AWREGION(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_AWREGION),
    .m_axi_gmem_AWUSER(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_AWUSER),
    .m_axi_gmem_WVALID(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_WVALID),
    .m_axi_gmem_WREADY(1'b0),
    .m_axi_gmem_WDATA(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_WDATA),
    .m_axi_gmem_WSTRB(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_WSTRB),
    .m_axi_gmem_WLAST(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_WLAST),
    .m_axi_gmem_WID(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_WID),
    .m_axi_gmem_WUSER(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_WUSER),
    .m_axi_gmem_ARVALID(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_ARVALID),
    .m_axi_gmem_ARREADY(gmem_ARREADY),
    .m_axi_gmem_ARADDR(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_ARADDR),
    .m_axi_gmem_ARID(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_ARID),
    .m_axi_gmem_ARLEN(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_ARLEN),
    .m_axi_gmem_ARSIZE(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_ARSIZE),
    .m_axi_gmem_ARBURST(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_ARBURST),
    .m_axi_gmem_ARLOCK(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_ARLOCK),
    .m_axi_gmem_ARCACHE(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_ARCACHE),
    .m_axi_gmem_ARPROT(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_ARPROT),
    .m_axi_gmem_ARQOS(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_ARQOS),
    .m_axi_gmem_ARREGION(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_ARREGION),
    .m_axi_gmem_ARUSER(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_ARUSER),
    .m_axi_gmem_RVALID(gmem_RVALID),
    .m_axi_gmem_RREADY(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_RREADY),
    .m_axi_gmem_RDATA(gmem_RDATA),
    .m_axi_gmem_RLAST(1'b0),
    .m_axi_gmem_RID(1'd0),
    .m_axi_gmem_RFIFONUM(gmem_RFIFONUM),
    .m_axi_gmem_RUSER(1'd0),
    .m_axi_gmem_RRESP(2'd0),
    .m_axi_gmem_BVALID(1'b0),
    .m_axi_gmem_BREADY(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_BREADY),
    .m_axi_gmem_BRESP(2'd0),
    .m_axi_gmem_BID(1'd0),
    .m_axi_gmem_BUSER(1'd0),
    .zext_ln25(shr1_reg_246),
    .conv3_i_i_i45(address_reg_264),
    .ext_mem(ext_mem_read_reg_236),
    .out_stream_TDATA(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_out_stream_TDATA),
    .out_stream_TVALID(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_out_stream_TVALID)
);

finn_feeder_chiplet_control_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_CONTROL_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_CONTROL_DATA_WIDTH ))
control_s_axi_U(
    .AWVALID(s_axi_control_AWVALID),
    .AWREADY(s_axi_control_AWREADY),
    .AWADDR(s_axi_control_AWADDR),
    .WVALID(s_axi_control_WVALID),
    .WREADY(s_axi_control_WREADY),
    .WDATA(s_axi_control_WDATA),
    .WSTRB(s_axi_control_WSTRB),
    .ARVALID(s_axi_control_ARVALID),
    .ARREADY(s_axi_control_ARREADY),
    .ARADDR(s_axi_control_ARADDR),
    .RVALID(s_axi_control_RVALID),
    .RREADY(s_axi_control_RREADY),
    .RDATA(s_axi_control_RDATA),
    .RRESP(s_axi_control_RRESP),
    .BVALID(s_axi_control_BVALID),
    .BREADY(s_axi_control_BREADY),
    .BRESP(s_axi_control_BRESP),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .predicted_index(in_stream_TDATA_int_regslice),
    .predicted_index_ap_vld(predicted_index_ap_vld),
    .ext_mem(ext_mem),
    .initial_address(initial_address),
    .image_size(image_size),
    .num_images(num_images),
    .ap_start(ap_start),
    .interrupt(interrupt),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_idle(ap_idle)
);

finn_feeder_chiplet_gmem_m_axi #(
    .CONSERVATIVE( 1 ),
    .USER_MAXREQS( 7 ),
    .MAX_READ_BURST_LENGTH( 16 ),
    .MAX_WRITE_BURST_LENGTH( 16 ),
    .C_M_AXI_ID_WIDTH( C_M_AXI_GMEM_ID_WIDTH ),
    .C_M_AXI_ADDR_WIDTH( C_M_AXI_GMEM_ADDR_WIDTH ),
    .C_M_AXI_DATA_WIDTH( C_M_AXI_GMEM_DATA_WIDTH ),
    .C_M_AXI_AWUSER_WIDTH( C_M_AXI_GMEM_AWUSER_WIDTH ),
    .C_M_AXI_ARUSER_WIDTH( C_M_AXI_GMEM_ARUSER_WIDTH ),
    .C_M_AXI_WUSER_WIDTH( C_M_AXI_GMEM_WUSER_WIDTH ),
    .C_M_AXI_RUSER_WIDTH( C_M_AXI_GMEM_RUSER_WIDTH ),
    .C_M_AXI_BUSER_WIDTH( C_M_AXI_GMEM_BUSER_WIDTH ),
    .C_USER_VALUE( C_M_AXI_GMEM_USER_VALUE ),
    .C_PROT_VALUE( C_M_AXI_GMEM_PROT_VALUE ),
    .C_CACHE_VALUE( C_M_AXI_GMEM_CACHE_VALUE ),
    .USER_RFIFONUM_WIDTH( 9 ),
    .USER_DW( 32 ),
    .USER_AW( 64 ),
    .NUM_READ_OUTSTANDING( 16 ),
    .NUM_WRITE_OUTSTANDING( 16 ))
gmem_m_axi_U(
    .AWVALID(m_axi_gmem_AWVALID),
    .AWREADY(m_axi_gmem_AWREADY),
    .AWADDR(m_axi_gmem_AWADDR),
    .AWID(m_axi_gmem_AWID),
    .AWLEN(m_axi_gmem_AWLEN),
    .AWSIZE(m_axi_gmem_AWSIZE),
    .AWBURST(m_axi_gmem_AWBURST),
    .AWLOCK(m_axi_gmem_AWLOCK),
    .AWCACHE(m_axi_gmem_AWCACHE),
    .AWPROT(m_axi_gmem_AWPROT),
    .AWQOS(m_axi_gmem_AWQOS),
    .AWREGION(m_axi_gmem_AWREGION),
    .AWUSER(m_axi_gmem_AWUSER),
    .WVALID(m_axi_gmem_WVALID),
    .WREADY(m_axi_gmem_WREADY),
    .WDATA(m_axi_gmem_WDATA),
    .WSTRB(m_axi_gmem_WSTRB),
    .WLAST(m_axi_gmem_WLAST),
    .WID(m_axi_gmem_WID),
    .WUSER(m_axi_gmem_WUSER),
    .ARVALID(m_axi_gmem_ARVALID),
    .ARREADY(m_axi_gmem_ARREADY),
    .ARADDR(m_axi_gmem_ARADDR),
    .ARID(m_axi_gmem_ARID),
    .ARLEN(m_axi_gmem_ARLEN),
    .ARSIZE(m_axi_gmem_ARSIZE),
    .ARBURST(m_axi_gmem_ARBURST),
    .ARLOCK(m_axi_gmem_ARLOCK),
    .ARCACHE(m_axi_gmem_ARCACHE),
    .ARPROT(m_axi_gmem_ARPROT),
    .ARQOS(m_axi_gmem_ARQOS),
    .ARREGION(m_axi_gmem_ARREGION),
    .ARUSER(m_axi_gmem_ARUSER),
    .RVALID(m_axi_gmem_RVALID),
    .RREADY(m_axi_gmem_RREADY),
    .RDATA(m_axi_gmem_RDATA),
    .RLAST(m_axi_gmem_RLAST),
    .RID(m_axi_gmem_RID),
    .RUSER(m_axi_gmem_RUSER),
    .RRESP(m_axi_gmem_RRESP),
    .BVALID(m_axi_gmem_BVALID),
    .BREADY(m_axi_gmem_BREADY),
    .BRESP(m_axi_gmem_BRESP),
    .BID(m_axi_gmem_BID),
    .BUSER(m_axi_gmem_BUSER),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .I_ARVALID(gmem_ARVALID),
    .I_ARREADY(gmem_ARREADY),
    .I_ARADDR(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_ARADDR),
    .I_ARLEN(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_ARLEN),
    .I_RVALID(gmem_RVALID),
    .I_RREADY(gmem_RREADY),
    .I_RDATA(gmem_RDATA),
    .I_RFIFONUM(gmem_RFIFONUM),
    .I_AWVALID(1'b0),
    .I_AWREADY(gmem_AWREADY),
    .I_AWADDR(64'd0),
    .I_AWLEN(32'd0),
    .I_WVALID(1'b0),
    .I_WREADY(gmem_WREADY),
    .I_WDATA(32'd0),
    .I_WSTRB(4'd0),
    .I_BVALID(gmem_BVALID),
    .I_BREADY(1'b0)
);

finn_feeder_chiplet_mul_32s_30ns_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 30 ),
    .dout_WIDTH( 32 ))
mul_32s_30ns_32_1_1_U6(
    .din0(img_idx_fu_100),
    .din1(mul_ln31_fu_162_p1),
    .dout(mul_ln31_fu_162_p2)
);

finn_feeder_chiplet_regslice_both #(
    .DataWidth( 8 ))
regslice_both_out_stream_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_out_stream_TDATA),
    .vld_in(grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_out_stream_TVALID),
    .ack_in(out_stream_TREADY_int_regslice),
    .data_out(out_stream_TDATA),
    .vld_out(regslice_both_out_stream_V_data_V_U_vld_out),
    .ack_out(out_stream_TREADY),
    .apdone_blk(regslice_both_out_stream_V_data_V_U_apdone_blk)
);

finn_feeder_chiplet_regslice_both #(
    .DataWidth( 8 ))
regslice_both_in_stream_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .data_in(in_stream_TDATA),
    .vld_in(in_stream_TVALID),
    .ack_in(regslice_both_in_stream_V_data_V_U_ack_in),
    .data_out(in_stream_TDATA_int_regslice),
    .vld_out(in_stream_TVALID_int_regslice),
    .ack_out(in_stream_TREADY_int_regslice),
    .apdone_blk(regslice_both_in_stream_V_data_V_U_apdone_blk)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_ap_start_reg <= 1'b1;
        end else if ((grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_ap_ready == 1'b1)) begin
            grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        img_idx_fu_100 <= 32'd0;
    end else if (((icmp_ln25_fu_203_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        img_idx_fu_100 <= img_idx_2_fu_208_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        address_reg_264 <= address_fu_219_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        ext_mem_read_reg_236 <= ext_mem;
        num_images_read_reg_231 <= num_images;
        shr1_cast_reg_251[29 : 0] <= shr1_cast_fu_190_p1[29 : 0];
        shr1_reg_246 <= {{image_size[31:2]}};
        shr_cast_reg_241[29 : 0] <= shr_cast_fu_176_p1[29 : 0];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        mul_ln31_reg_259 <= mul_ln31_fu_162_p2;
    end
end

always @ (*) begin
    if ((ap_start == 1'b0)) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

assign ap_ST_fsm_state2_blk = 1'b0;

assign ap_ST_fsm_state3_blk = 1'b0;

always @ (*) begin
    if ((grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_ap_done == 1'b0)) begin
        ap_ST_fsm_state4_blk = 1'b1;
    end else begin
        ap_ST_fsm_state4_blk = 1'b0;
    end
end

always @ (*) begin
    if ((in_stream_TVALID_int_regslice == 1'b0)) begin
        ap_ST_fsm_state5_blk = 1'b1;
    end else begin
        ap_ST_fsm_state5_blk = 1'b0;
    end
end

always @ (*) begin
    if ((regslice_both_out_stream_V_data_V_U_apdone_blk == 1'b1)) begin
        ap_ST_fsm_state6_blk = 1'b1;
    end else begin
        ap_ST_fsm_state6_blk = 1'b0;
    end
end

always @ (*) begin
    if (((regslice_both_out_stream_V_data_V_U_apdone_blk == 1'b0) & (1'b1 == ap_CS_fsm_state6))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((regslice_both_out_stream_V_data_V_U_apdone_blk == 1'b0) & (1'b1 == ap_CS_fsm_state6))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((in_stream_TVALID_int_regslice == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
        done_irq = 1'd1;
    end else if (((icmp_ln25_fu_203_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        done_irq = 1'd0;
    end else begin
        done_irq = 'bx;
    end
end

always @ (*) begin
    if ((((in_stream_TVALID_int_regslice == 1'b1) & (1'b1 == ap_CS_fsm_state5)) | ((icmp_ln25_fu_203_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2)))) begin
        done_irq_ap_vld = 1'b1;
    end else begin
        done_irq_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3))) begin
        gmem_ARVALID = grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_ARVALID;
    end else begin
        gmem_ARVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state3))) begin
        gmem_RREADY = grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_m_axi_gmem_RREADY;
    end else begin
        gmem_RREADY = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        in_stream_TDATA_blk_n = in_stream_TVALID_int_regslice;
    end else begin
        in_stream_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((in_stream_TVALID_int_regslice == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
        in_stream_TREADY_int_regslice = 1'b1;
    end else begin
        in_stream_TREADY_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((in_stream_TVALID_int_regslice == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
        predicted_index_ap_vld = 1'b1;
    end else begin
        predicted_index_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((icmp_ln25_fu_203_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end
        end
        ap_ST_fsm_state3 : begin
            ap_NS_fsm = ap_ST_fsm_state4;
        end
        ap_ST_fsm_state4 : begin
            if (((1'b1 == ap_CS_fsm_state4) & (grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state5 : begin
            if (((in_stream_TVALID_int_regslice == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state6 : begin
            if (((regslice_both_out_stream_V_data_V_U_apdone_blk == 1'b0) & (1'b1 == ap_CS_fsm_state6))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign address_fu_219_p2 = (mul_ln31_reg_259 + shr_cast_reg_241);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_ap_start = grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_ap_start_reg;

assign grp_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2_fu_151_out_stream_TREADY = (out_stream_TREADY_int_regslice & ap_CS_fsm_state4);

assign icmp_ln25_fu_203_p0 = img_idx_fu_100;

assign icmp_ln25_fu_203_p2 = ((icmp_ln25_fu_203_p0 == num_images_read_reg_231) ? 1'b1 : 1'b0);

assign img_idx_2_fu_208_p0 = img_idx_fu_100;

assign img_idx_2_fu_208_p2 = ($signed(img_idx_2_fu_208_p0) + $signed(32'd1));

assign in_stream_TREADY = regslice_both_in_stream_V_data_V_U_ack_in;

assign mul_ln31_fu_162_p1 = shr1_cast_reg_251;

assign out_stream_TVALID = regslice_both_out_stream_V_data_V_U_vld_out;

assign shr1_cast_fu_190_p1 = shr1_fu_180_p4;

assign shr1_fu_180_p4 = {{image_size[31:2]}};

assign shr_cast_fu_176_p1 = shr_fu_166_p4;

assign shr_fu_166_p4 = {{initial_address[31:2]}};

always @ (posedge ap_clk) begin
    shr_cast_reg_241[31:30] <= 2'b00;
    shr1_cast_reg_251[31:30] <= 2'b00;
end


reg find_kernel_block = 0;
// synthesis translate_off
`include "finn_feeder_chiplet_hls_deadlock_kernel_monitor_top.vh"
// synthesis translate_on

endmodule //finn_feeder_chiplet

