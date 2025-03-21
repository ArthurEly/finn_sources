-- ==============================================================
-- Generated by Vitis HLS v2023.2
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity finn_feeder_chiplet_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    out_stream_TREADY : IN STD_LOGIC;
    m_axi_gmem_AWVALID : OUT STD_LOGIC;
    m_axi_gmem_AWREADY : IN STD_LOGIC;
    m_axi_gmem_AWADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_gmem_AWID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem_AWLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_gmem_AWSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem_AWBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem_AWLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem_AWCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem_AWPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem_AWQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem_AWREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem_AWUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem_WVALID : OUT STD_LOGIC;
    m_axi_gmem_WREADY : IN STD_LOGIC;
    m_axi_gmem_WDATA : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_gmem_WSTRB : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem_WLAST : OUT STD_LOGIC;
    m_axi_gmem_WID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem_WUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem_ARVALID : OUT STD_LOGIC;
    m_axi_gmem_ARREADY : IN STD_LOGIC;
    m_axi_gmem_ARADDR : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axi_gmem_ARID : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem_ARLEN : OUT STD_LOGIC_VECTOR (31 downto 0);
    m_axi_gmem_ARSIZE : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem_ARBURST : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem_ARLOCK : OUT STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem_ARCACHE : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem_ARPROT : OUT STD_LOGIC_VECTOR (2 downto 0);
    m_axi_gmem_ARQOS : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem_ARREGION : OUT STD_LOGIC_VECTOR (3 downto 0);
    m_axi_gmem_ARUSER : OUT STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem_RVALID : IN STD_LOGIC;
    m_axi_gmem_RREADY : OUT STD_LOGIC;
    m_axi_gmem_RDATA : IN STD_LOGIC_VECTOR (31 downto 0);
    m_axi_gmem_RLAST : IN STD_LOGIC;
    m_axi_gmem_RID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem_RFIFONUM : IN STD_LOGIC_VECTOR (8 downto 0);
    m_axi_gmem_RUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem_RRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem_BVALID : IN STD_LOGIC;
    m_axi_gmem_BREADY : OUT STD_LOGIC;
    m_axi_gmem_BRESP : IN STD_LOGIC_VECTOR (1 downto 0);
    m_axi_gmem_BID : IN STD_LOGIC_VECTOR (0 downto 0);
    m_axi_gmem_BUSER : IN STD_LOGIC_VECTOR (0 downto 0);
    zext_ln25 : IN STD_LOGIC_VECTOR (29 downto 0);
    conv3_i_i_i45 : IN STD_LOGIC_VECTOR (31 downto 0);
    ext_mem : IN STD_LOGIC_VECTOR (63 downto 0);
    out_stream_TDATA : OUT STD_LOGIC_VECTOR (7 downto 0);
    out_stream_TVALID : OUT STD_LOGIC );
end;


architecture behav of finn_feeder_chiplet_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_ST_fsm_pp0_stage1 : STD_LOGIC_VECTOR (3 downto 0) := "0010";
    constant ap_ST_fsm_pp0_stage2 : STD_LOGIC_VECTOR (3 downto 0) := "0100";
    constant ap_ST_fsm_pp0_stage3 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv3_0 : STD_LOGIC_VECTOR (2 downto 0) := "000";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv16_0 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    constant ap_const_lv16_1 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000001";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv32_8 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001000";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_17 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010111";
    constant ap_const_lv32_18 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011000";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter3 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage3 : signal is "none";
    signal ap_block_state12_pp0_stage3_iter2 : BOOLEAN;
    signal ap_block_pp0_stage3_subdone : BOOLEAN;
    signal icmp_ln33_reg_253 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage3 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal gmem_blk_n_AR : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage1 : signal is "none";
    signal ap_block_pp0_stage1 : BOOLEAN;
    signal gmem_blk_n_R : STD_LOGIC;
    signal out_stream_TDATA_blk_n : STD_LOGIC;
    signal ap_CS_fsm_pp0_stage2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage2 : signal is "none";
    signal ap_block_pp0_stage2 : BOOLEAN;
    signal ap_block_pp0_stage3 : BOOLEAN;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal icmp_ln33_fu_147_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state13_pp0_stage0_iter3 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal icmp_ln33_reg_253_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_ln33_reg_253_pp0_iter2_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal gmem_addr_reg_257 : STD_LOGIC_VECTOR (63 downto 0);
    signal pixel_data_fu_212_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal pixel_data_reg_263 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_block_state2_io : BOOLEAN;
    signal ap_block_state10_pp0_stage1_iter2 : BOOLEAN;
    signal ap_block_state14_pp0_stage1_iter3 : BOOLEAN;
    signal ap_block_pp0_stage1_11001 : BOOLEAN;
    signal pixel_data_1_reg_268 : STD_LOGIC_VECTOR (7 downto 0);
    signal pixel_data_2_reg_273 : STD_LOGIC_VECTOR (7 downto 0);
    signal pixel_data_3_reg_278 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_enable_reg_pp0_iter0_reg : STD_LOGIC := '0';
    signal ap_block_pp0_stage1_subdone : BOOLEAN;
    signal sext_ln35_2_fu_197_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal p_fu_86 : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    signal p_2_fu_153_p2 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_sig_allocacmp_p_1 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_block_state11_pp0_stage2_iter2 : BOOLEAN;
    signal ap_block_pp0_stage2_01001 : BOOLEAN;
    signal ap_block_pp0_stage3_01001 : BOOLEAN;
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal ap_block_pp0_stage1_01001 : BOOLEAN;
    signal ap_block_pp0_stage2_11001 : BOOLEAN;
    signal ap_block_pp0_stage3_11001 : BOOLEAN;
    signal sext_ln33_fu_143_p0 : STD_LOGIC_VECTOR (15 downto 0);
    signal zext_ln25_cast_fu_131_p1 : STD_LOGIC_VECTOR (30 downto 0);
    signal sext_ln33_fu_143_p1 : STD_LOGIC_VECTOR (30 downto 0);
    signal p_2_fu_153_p0 : STD_LOGIC_VECTOR (15 downto 0);
    signal sext_ln35_fu_159_p0 : STD_LOGIC_VECTOR (15 downto 0);
    signal conv3_i_i_i45_cast_fu_127_p1 : STD_LOGIC_VECTOR (33 downto 0);
    signal sext_ln35_fu_159_p1 : STD_LOGIC_VECTOR (33 downto 0);
    signal add_ln35_fu_163_p2 : STD_LOGIC_VECTOR (33 downto 0);
    signal shl_ln_fu_169_p3 : STD_LOGIC_VECTOR (35 downto 0);
    signal sext_ln35_1_fu_177_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal add_ln35_1_fu_181_p2 : STD_LOGIC_VECTOR (63 downto 0);
    signal trunc_ln_fu_187_p4 : STD_LOGIC_VECTOR (61 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter1_reg : STD_LOGIC;
    signal ap_condition_exit_pp0_iter2_stage1 : STD_LOGIC;
    signal ap_idle_pp0_0to1 : STD_LOGIC;
    signal ap_loop_exit_ready_pp0_iter2_reg : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (3 downto 0);
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal ap_idle_pp0_1to3 : STD_LOGIC;
    signal ap_done_pending_pp0 : STD_LOGIC;
    signal ap_block_pp0_stage2_subdone : BOOLEAN;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component finn_feeder_chiplet_flow_control_loop_pipe_sequential_init IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC );
    end component;



begin
    flow_control_loop_pipe_sequential_init_U : component finn_feeder_chiplet_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter0_stage3,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter0_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter0_reg <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) then 
                    ap_enable_reg_pp0_iter0_reg <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter0_stage3)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage3_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage3))) then 
                    ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if (((ap_const_boolean_0 = ap_block_pp0_stage3_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage3))) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter3_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter3 <= ap_const_logic_0;
            else
                if (((ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                    ap_enable_reg_pp0_iter3 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage3_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage3))) then 
                    ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
                end if; 
            end if;
        end if;
    end process;


    ap_loop_exit_ready_pp0_iter1_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_idle_pp0_0to1 = ap_const_logic_1) and (ap_const_logic_1 = ap_condition_exit_pp0_iter2_stage1))) then 
                ap_loop_exit_ready_pp0_iter1_reg <= ap_const_logic_0;
            elsif (((ap_const_boolean_0 = ap_block_pp0_stage3_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage3))) then 
                ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
            end if; 
        end if;
    end process;

    ap_loop_exit_ready_pp0_iter2_reg_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_idle_pp0_0to1 = ap_const_logic_1) and (ap_const_logic_1 = ap_condition_exit_pp0_iter2_stage1))) then 
                ap_loop_exit_ready_pp0_iter2_reg <= ap_const_logic_0;
            elsif (((ap_const_boolean_0 = ap_block_pp0_stage3_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage3))) then 
                ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
            end if; 
        end if;
    end process;

    p_fu_86_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (icmp_ln33_fu_147_p2 = ap_const_lv1_1))) then 
                    p_fu_86 <= p_2_fu_153_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    p_fu_86 <= ap_const_lv16_0;
                end if;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                gmem_addr_reg_257 <= sext_ln35_2_fu_197_p1;
                icmp_ln33_reg_253 <= icmp_ln33_fu_147_p2;
                icmp_ln33_reg_253_pp0_iter1_reg <= icmp_ln33_reg_253;
                icmp_ln33_reg_253_pp0_iter2_reg <= icmp_ln33_reg_253_pp0_iter1_reg;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then
                pixel_data_1_reg_268 <= m_axi_gmem_RDATA(15 downto 8);
                pixel_data_2_reg_273 <= m_axi_gmem_RDATA(23 downto 16);
                pixel_data_3_reg_278 <= m_axi_gmem_RDATA(31 downto 24);
                pixel_data_reg_263 <= pixel_data_fu_212_p1;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_block_pp0_stage3_subdone, ap_block_pp0_stage1_subdone, ap_condition_exit_pp0_iter2_stage1, ap_idle_pp0_0to1, ap_block_pp0_stage0_subdone, ap_idle_pp0_1to3, ap_done_pending_pp0, ap_block_pp0_stage2_subdone, ap_start_int)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                if ((not(((ap_start_int = ap_const_logic_0) and (ap_done_pending_pp0 = ap_const_logic_0) and (ap_idle_pp0_1to3 = ap_const_logic_1))) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_pp0_stage1 => 
                if (((ap_idle_pp0_0to1 = ap_const_logic_1) and (ap_const_logic_1 = ap_condition_exit_pp0_iter2_stage1))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                elsif ((ap_const_boolean_0 = ap_block_pp0_stage1_subdone)) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage2;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                end if;
            when ap_ST_fsm_pp0_stage2 => 
                if ((ap_const_boolean_0 = ap_block_pp0_stage2_subdone)) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage3;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage2;
                end if;
            when ap_ST_fsm_pp0_stage3 => 
                if ((ap_const_boolean_0 = ap_block_pp0_stage3_subdone)) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage3;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXX";
        end case;
    end process;
    add_ln35_1_fu_181_p2 <= std_logic_vector(signed(sext_ln35_1_fu_177_p1) + signed(ext_mem));
    add_ln35_fu_163_p2 <= std_logic_vector(unsigned(conv3_i_i_i45_cast_fu_127_p1) + unsigned(sext_ln35_fu_159_p1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
    ap_CS_fsm_pp0_stage1 <= ap_CS_fsm(1);
    ap_CS_fsm_pp0_stage2 <= ap_CS_fsm(2);
    ap_CS_fsm_pp0_stage3 <= ap_CS_fsm(3);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_enable_reg_pp0_iter3, ap_block_state13_pp0_stage0_iter3)
    begin
                ap_block_pp0_stage0_01001 <= ((ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_boolean_1 = ap_block_state13_pp0_stage0_iter3));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_enable_reg_pp0_iter3, out_stream_TREADY, ap_block_state13_pp0_stage0_iter3)
    begin
                ap_block_pp0_stage0_11001 <= ((ap_enable_reg_pp0_iter3 = ap_const_logic_1) and ((out_stream_TREADY = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state13_pp0_stage0_iter3)));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_enable_reg_pp0_iter3, out_stream_TREADY, ap_block_state13_pp0_stage0_iter3)
    begin
                ap_block_pp0_stage0_subdone <= ((ap_enable_reg_pp0_iter3 = ap_const_logic_1) and ((out_stream_TREADY = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state13_pp0_stage0_iter3)));
    end process;

        ap_block_pp0_stage1 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage1_01001_assign_proc : process(ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, ap_block_state10_pp0_stage1_iter2, ap_block_state14_pp0_stage1_iter3)
    begin
                ap_block_pp0_stage1_01001 <= (((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_1 = ap_block_state10_pp0_stage1_iter2)) or ((ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_boolean_1 = ap_block_state14_pp0_stage1_iter3)));
    end process;


    ap_block_pp0_stage1_11001_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, out_stream_TREADY, ap_block_state2_io, ap_block_state10_pp0_stage1_iter2, ap_block_state14_pp0_stage1_iter3)
    begin
                ap_block_pp0_stage1_11001 <= (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_1 = ap_block_state2_io)) or ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_1 = ap_block_state10_pp0_stage1_iter2)) or ((ap_enable_reg_pp0_iter3 = ap_const_logic_1) and ((out_stream_TREADY = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state14_pp0_stage1_iter3))));
    end process;


    ap_block_pp0_stage1_subdone_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, out_stream_TREADY, ap_block_state2_io, ap_block_state10_pp0_stage1_iter2, ap_block_state14_pp0_stage1_iter3)
    begin
                ap_block_pp0_stage1_subdone <= (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_1 = ap_block_state2_io)) or ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_1 = ap_block_state10_pp0_stage1_iter2)) or ((ap_enable_reg_pp0_iter3 = ap_const_logic_1) and ((out_stream_TREADY = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state14_pp0_stage1_iter3))));
    end process;

        ap_block_pp0_stage2 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage2_01001_assign_proc : process(ap_enable_reg_pp0_iter2, ap_block_state11_pp0_stage2_iter2)
    begin
                ap_block_pp0_stage2_01001 <= ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_1 = ap_block_state11_pp0_stage2_iter2));
    end process;


    ap_block_pp0_stage2_11001_assign_proc : process(ap_enable_reg_pp0_iter2, out_stream_TREADY, ap_block_state11_pp0_stage2_iter2)
    begin
                ap_block_pp0_stage2_11001 <= ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and ((out_stream_TREADY = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state11_pp0_stage2_iter2)));
    end process;


    ap_block_pp0_stage2_subdone_assign_proc : process(ap_enable_reg_pp0_iter2, out_stream_TREADY, ap_block_state11_pp0_stage2_iter2)
    begin
                ap_block_pp0_stage2_subdone <= ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and ((out_stream_TREADY = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state11_pp0_stage2_iter2)));
    end process;

        ap_block_pp0_stage3 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage3_01001_assign_proc : process(ap_enable_reg_pp0_iter2, ap_block_state12_pp0_stage3_iter2)
    begin
                ap_block_pp0_stage3_01001 <= ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_boolean_1 = ap_block_state12_pp0_stage3_iter2));
    end process;


    ap_block_pp0_stage3_11001_assign_proc : process(ap_enable_reg_pp0_iter2, out_stream_TREADY, ap_block_state12_pp0_stage3_iter2)
    begin
                ap_block_pp0_stage3_11001 <= ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and ((out_stream_TREADY = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state12_pp0_stage3_iter2)));
    end process;


    ap_block_pp0_stage3_subdone_assign_proc : process(ap_enable_reg_pp0_iter2, out_stream_TREADY, ap_block_state12_pp0_stage3_iter2)
    begin
                ap_block_pp0_stage3_subdone <= ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and ((out_stream_TREADY = ap_const_logic_0) or (ap_const_boolean_1 = ap_block_state12_pp0_stage3_iter2)));
    end process;


    ap_block_state10_pp0_stage1_iter2_assign_proc : process(m_axi_gmem_RVALID)
    begin
                ap_block_state10_pp0_stage1_iter2 <= (m_axi_gmem_RVALID = ap_const_logic_0);
    end process;


    ap_block_state11_pp0_stage2_iter2_assign_proc : process(out_stream_TREADY)
    begin
                ap_block_state11_pp0_stage2_iter2 <= (out_stream_TREADY = ap_const_logic_0);
    end process;


    ap_block_state12_pp0_stage3_iter2_assign_proc : process(out_stream_TREADY)
    begin
                ap_block_state12_pp0_stage3_iter2 <= (out_stream_TREADY = ap_const_logic_0);
    end process;


    ap_block_state13_pp0_stage0_iter3_assign_proc : process(out_stream_TREADY)
    begin
                ap_block_state13_pp0_stage0_iter3 <= (out_stream_TREADY = ap_const_logic_0);
    end process;


    ap_block_state14_pp0_stage1_iter3_assign_proc : process(out_stream_TREADY)
    begin
                ap_block_state14_pp0_stage1_iter3 <= (out_stream_TREADY = ap_const_logic_0);
    end process;


    ap_block_state2_io_assign_proc : process(icmp_ln33_reg_253, m_axi_gmem_ARREADY)
    begin
                ap_block_state2_io <= ((m_axi_gmem_ARREADY = ap_const_logic_0) and (icmp_ln33_reg_253 = ap_const_lv1_1));
    end process;


    ap_condition_exit_pp0_iter0_stage3_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage3, ap_block_pp0_stage3_subdone, icmp_ln33_reg_253)
    begin
        if (((icmp_ln33_reg_253 = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage3_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage3))) then 
            ap_condition_exit_pp0_iter0_stage3 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage3 <= ap_const_logic_0;
        end if; 
    end process;


    ap_condition_exit_pp0_iter2_stage1_assign_proc : process(ap_enable_reg_pp0_iter2, ap_CS_fsm_pp0_stage1, icmp_ln33_reg_253_pp0_iter2_reg, ap_block_pp0_stage1_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1) and (icmp_ln33_reg_253_pp0_iter2_reg = ap_const_lv1_0))) then 
            ap_condition_exit_pp0_iter2_stage1 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter2_stage1 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1_subdone, ap_done_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage1_subdone) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;


    ap_done_pending_pp0_assign_proc : process(ap_loop_exit_ready, ap_loop_exit_ready_pp0_iter1_reg, ap_loop_exit_ready_pp0_iter2_reg)
    begin
        if (not(((ap_loop_exit_ready = ap_const_logic_0) and (ap_loop_exit_ready_pp0_iter2_reg = ap_const_logic_0) and (ap_loop_exit_ready_pp0_iter1_reg = ap_const_logic_0)))) then 
            ap_done_pending_pp0 <= ap_const_logic_1;
        else 
            ap_done_pending_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_enable_reg_pp0_iter0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0_reg, ap_start_int)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) then 
            ap_enable_reg_pp0_iter0 <= ap_start_int;
        else 
            ap_enable_reg_pp0_iter0 <= ap_enable_reg_pp0_iter0_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3)
    begin
        if (((ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_0to1_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0_0to1 <= ap_const_logic_1;
        else 
            ap_idle_pp0_0to1 <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_1to3_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3)
    begin
        if (((ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0))) then 
            ap_idle_pp0_1to3 <= ap_const_logic_1;
        else 
            ap_idle_pp0_1to3 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage3;

    ap_ready_int_assign_proc : process(ap_enable_reg_pp0_iter0, ap_CS_fsm_pp0_stage3, ap_block_pp0_stage3_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage3_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage3))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_allocacmp_p_1_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0, p_fu_86, ap_loop_init)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_loop_init = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_sig_allocacmp_p_1 <= ap_const_lv16_0;
        else 
            ap_sig_allocacmp_p_1 <= p_fu_86;
        end if; 
    end process;

    conv3_i_i_i45_cast_fu_127_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(conv3_i_i_i45),34));

    gmem_blk_n_AR_assign_proc : process(ap_enable_reg_pp0_iter0, icmp_ln33_reg_253, m_axi_gmem_ARREADY, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1)
    begin
        if (((icmp_ln33_reg_253 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage1) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            gmem_blk_n_AR <= m_axi_gmem_ARREADY;
        else 
            gmem_blk_n_AR <= ap_const_logic_1;
        end if; 
    end process;


    gmem_blk_n_R_assign_proc : process(ap_enable_reg_pp0_iter2, m_axi_gmem_RVALID, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            gmem_blk_n_R <= m_axi_gmem_RVALID;
        else 
            gmem_blk_n_R <= ap_const_logic_1;
        end if; 
    end process;

    icmp_ln33_fu_147_p2 <= "1" when (unsigned(zext_ln25_cast_fu_131_p1) > unsigned(sext_ln33_fu_143_p1)) else "0";
    m_axi_gmem_ARADDR <= gmem_addr_reg_257;
    m_axi_gmem_ARBURST <= ap_const_lv2_0;
    m_axi_gmem_ARCACHE <= ap_const_lv4_0;
    m_axi_gmem_ARID <= ap_const_lv1_0;
    m_axi_gmem_ARLEN <= ap_const_lv32_1;
    m_axi_gmem_ARLOCK <= ap_const_lv2_0;
    m_axi_gmem_ARPROT <= ap_const_lv3_0;
    m_axi_gmem_ARQOS <= ap_const_lv4_0;
    m_axi_gmem_ARREGION <= ap_const_lv4_0;
    m_axi_gmem_ARSIZE <= ap_const_lv3_0;
    m_axi_gmem_ARUSER <= ap_const_lv1_0;

    m_axi_gmem_ARVALID_assign_proc : process(ap_enable_reg_pp0_iter0, icmp_ln33_reg_253, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1_11001)
    begin
        if (((icmp_ln33_reg_253 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            m_axi_gmem_ARVALID <= ap_const_logic_1;
        else 
            m_axi_gmem_ARVALID <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_gmem_AWADDR <= ap_const_lv64_0;
    m_axi_gmem_AWBURST <= ap_const_lv2_0;
    m_axi_gmem_AWCACHE <= ap_const_lv4_0;
    m_axi_gmem_AWID <= ap_const_lv1_0;
    m_axi_gmem_AWLEN <= ap_const_lv32_0;
    m_axi_gmem_AWLOCK <= ap_const_lv2_0;
    m_axi_gmem_AWPROT <= ap_const_lv3_0;
    m_axi_gmem_AWQOS <= ap_const_lv4_0;
    m_axi_gmem_AWREGION <= ap_const_lv4_0;
    m_axi_gmem_AWSIZE <= ap_const_lv3_0;
    m_axi_gmem_AWUSER <= ap_const_lv1_0;
    m_axi_gmem_AWVALID <= ap_const_logic_0;
    m_axi_gmem_BREADY <= ap_const_logic_0;

    m_axi_gmem_RREADY_assign_proc : process(ap_enable_reg_pp0_iter2, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            m_axi_gmem_RREADY <= ap_const_logic_1;
        else 
            m_axi_gmem_RREADY <= ap_const_logic_0;
        end if; 
    end process;

    m_axi_gmem_WDATA <= ap_const_lv32_0;
    m_axi_gmem_WID <= ap_const_lv1_0;
    m_axi_gmem_WLAST <= ap_const_logic_0;
    m_axi_gmem_WSTRB <= ap_const_lv4_0;
    m_axi_gmem_WUSER <= ap_const_lv1_0;
    m_axi_gmem_WVALID <= ap_const_logic_0;

    out_stream_TDATA_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, ap_CS_fsm_pp0_stage3, ap_CS_fsm_pp0_stage1, ap_CS_fsm_pp0_stage2, pixel_data_reg_263, pixel_data_1_reg_268, pixel_data_2_reg_273, pixel_data_3_reg_278, ap_block_pp0_stage2_01001, ap_block_pp0_stage3_01001, ap_block_pp0_stage0_01001, ap_block_pp0_stage1_01001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage1_01001) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
            out_stream_TDATA <= pixel_data_3_reg_278;
        elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_01001) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            out_stream_TDATA <= pixel_data_2_reg_273;
        elsif (((ap_const_boolean_0 = ap_block_pp0_stage3_01001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage3))) then 
            out_stream_TDATA <= pixel_data_1_reg_268;
        elsif (((ap_const_boolean_0 = ap_block_pp0_stage2_01001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then 
            out_stream_TDATA <= pixel_data_reg_263;
        else 
            out_stream_TDATA <= "XXXXXXXX";
        end if; 
    end process;


    out_stream_TDATA_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, ap_CS_fsm_pp0_stage3, out_stream_TREADY, ap_CS_fsm_pp0_stage1, ap_block_pp0_stage1, ap_CS_fsm_pp0_stage2, ap_block_pp0_stage2, ap_block_pp0_stage3, ap_block_pp0_stage0)
    begin
        if ((((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or ((ap_const_boolean_0 = ap_block_pp0_stage3) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage3)) or ((ap_const_boolean_0 = ap_block_pp0_stage2) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2)) or ((ap_const_boolean_0 = ap_block_pp0_stage1) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1)))) then 
            out_stream_TDATA_blk_n <= out_stream_TREADY;
        else 
            out_stream_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    out_stream_TVALID_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, ap_CS_fsm_pp0_stage3, ap_CS_fsm_pp0_stage1, ap_CS_fsm_pp0_stage2, ap_block_pp0_stage0_11001, ap_block_pp0_stage1_11001, ap_block_pp0_stage2_11001, ap_block_pp0_stage3_11001)
    begin
        if ((((ap_const_boolean_0 = ap_block_pp0_stage3_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage3)) or ((ap_const_boolean_0 = ap_block_pp0_stage2_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2)) or ((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1)) or ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then 
            out_stream_TVALID <= ap_const_logic_1;
        else 
            out_stream_TVALID <= ap_const_logic_0;
        end if; 
    end process;

    p_2_fu_153_p0 <= ap_sig_allocacmp_p_1;
    p_2_fu_153_p2 <= std_logic_vector(signed(p_2_fu_153_p0) + signed(ap_const_lv16_1));
    pixel_data_fu_212_p1 <= m_axi_gmem_RDATA(8 - 1 downto 0);
    sext_ln33_fu_143_p0 <= ap_sig_allocacmp_p_1;
        sext_ln33_fu_143_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(sext_ln33_fu_143_p0),31));

        sext_ln35_1_fu_177_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(shl_ln_fu_169_p3),64));

        sext_ln35_2_fu_197_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln_fu_187_p4),64));

    sext_ln35_fu_159_p0 <= ap_sig_allocacmp_p_1;
        sext_ln35_fu_159_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(sext_ln35_fu_159_p0),34));

    shl_ln_fu_169_p3 <= (add_ln35_fu_163_p2 & ap_const_lv2_0);
    trunc_ln_fu_187_p4 <= add_ln35_1_fu_181_p2(63 downto 2);
    zext_ln25_cast_fu_131_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(zext_ln25),31));
end behav;
