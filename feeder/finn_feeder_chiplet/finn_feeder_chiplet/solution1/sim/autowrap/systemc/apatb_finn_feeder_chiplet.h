// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================

extern "C" void AESL_WRAP_finn_feeder_chiplet (
hls::stream<struct ap_axis<32, 0, 0, 0 > > (&OUTPUT_STREAM),
hls::stream<struct ap_axis<32, 0, 0, 0 > > (&INPUT_STREAM),
volatile void* predicted_index,
volatile void* ext_mem,
int initial_address,
int image_size,
int num_images);
