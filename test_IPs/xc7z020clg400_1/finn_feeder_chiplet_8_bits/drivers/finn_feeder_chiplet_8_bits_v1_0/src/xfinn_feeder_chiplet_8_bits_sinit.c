// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xfinn_feeder_chiplet_8_bits.h"

extern XFinn_feeder_chiplet_8_bits_Config XFinn_feeder_chiplet_8_bits_ConfigTable[];

#ifdef SDT
XFinn_feeder_chiplet_8_bits_Config *XFinn_feeder_chiplet_8_bits_LookupConfig(UINTPTR BaseAddress) {
	XFinn_feeder_chiplet_8_bits_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XFinn_feeder_chiplet_8_bits_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XFinn_feeder_chiplet_8_bits_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XFinn_feeder_chiplet_8_bits_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XFinn_feeder_chiplet_8_bits_Initialize(XFinn_feeder_chiplet_8_bits *InstancePtr, UINTPTR BaseAddress) {
	XFinn_feeder_chiplet_8_bits_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XFinn_feeder_chiplet_8_bits_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XFinn_feeder_chiplet_8_bits_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XFinn_feeder_chiplet_8_bits_Config *XFinn_feeder_chiplet_8_bits_LookupConfig(u16 DeviceId) {
	XFinn_feeder_chiplet_8_bits_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XFINN_FEEDER_CHIPLET_8_BITS_NUM_INSTANCES; Index++) {
		if (XFinn_feeder_chiplet_8_bits_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XFinn_feeder_chiplet_8_bits_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XFinn_feeder_chiplet_8_bits_Initialize(XFinn_feeder_chiplet_8_bits *InstancePtr, u16 DeviceId) {
	XFinn_feeder_chiplet_8_bits_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XFinn_feeder_chiplet_8_bits_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XFinn_feeder_chiplet_8_bits_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

