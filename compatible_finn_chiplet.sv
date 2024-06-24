`timescale 1 ns / 1 ps

`include "axi/assign.svh"
`include "axi/typedef.svh"

module compatible_finn_chiplet (
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
             
    // Instance of finn_chiplet_wrapper
    finn_chiplet_wrapper finn_chiplet_inst (
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
