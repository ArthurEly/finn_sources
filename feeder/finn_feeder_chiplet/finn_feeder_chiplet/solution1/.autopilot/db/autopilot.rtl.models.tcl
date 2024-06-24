set SynModuleInfo {
  {SRCNAME finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2 MODELNAME finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2 RTLNAME finn_feeder_chiplet_finn_feeder_chiplet_Pipeline_VITIS_LOOP_33_2
    SUBMODULES {
      {MODELNAME finn_feeder_chiplet_flow_control_loop_pipe_sequential_init RTLNAME finn_feeder_chiplet_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME finn_feeder_chiplet_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME finn_feeder_chiplet MODELNAME finn_feeder_chiplet RTLNAME finn_feeder_chiplet IS_TOP 1
    SUBMODULES {
      {MODELNAME finn_feeder_chiplet_mul_32s_30ns_32_1_1 RTLNAME finn_feeder_chiplet_mul_32s_30ns_32_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME finn_feeder_chiplet_gmem_m_axi RTLNAME finn_feeder_chiplet_gmem_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME finn_feeder_chiplet_control_s_axi RTLNAME finn_feeder_chiplet_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME finn_feeder_chiplet_regslice_both RTLNAME finn_feeder_chiplet_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME finn_feeder_chiplet_regslice_both_U}
    }
  }
}
