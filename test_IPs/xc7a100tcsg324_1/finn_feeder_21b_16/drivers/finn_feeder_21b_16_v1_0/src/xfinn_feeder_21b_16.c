// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xfinn_feeder_21b_16.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XFinn_feeder_21b_16_CfgInitialize(XFinn_feeder_21b_16 *InstancePtr, XFinn_feeder_21b_16_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XFinn_feeder_21b_16_Start(XFinn_feeder_21b_16 *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFinn_feeder_21b_16_ReadReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_AP_CTRL) & 0x80;
    XFinn_feeder_21b_16_WriteReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XFinn_feeder_21b_16_IsDone(XFinn_feeder_21b_16 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFinn_feeder_21b_16_ReadReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XFinn_feeder_21b_16_IsIdle(XFinn_feeder_21b_16 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFinn_feeder_21b_16_ReadReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XFinn_feeder_21b_16_IsReady(XFinn_feeder_21b_16 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFinn_feeder_21b_16_ReadReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XFinn_feeder_21b_16_Continue(XFinn_feeder_21b_16 *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFinn_feeder_21b_16_ReadReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_AP_CTRL) & 0x80;
    XFinn_feeder_21b_16_WriteReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_AP_CTRL, Data | 0x10);
}

void XFinn_feeder_21b_16_EnableAutoRestart(XFinn_feeder_21b_16 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFinn_feeder_21b_16_WriteReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XFinn_feeder_21b_16_DisableAutoRestart(XFinn_feeder_21b_16 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFinn_feeder_21b_16_WriteReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_AP_CTRL, 0);
}

u32 XFinn_feeder_21b_16_Get_predicted_index(XFinn_feeder_21b_16 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFinn_feeder_21b_16_ReadReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_PREDICTED_INDEX_DATA);
    return Data;
}

void XFinn_feeder_21b_16_Set_ext_mem(XFinn_feeder_21b_16 *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFinn_feeder_21b_16_WriteReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_EXT_MEM_DATA, (u32)(Data));
    XFinn_feeder_21b_16_WriteReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_EXT_MEM_DATA + 4, (u32)(Data >> 32));
}

u64 XFinn_feeder_21b_16_Get_ext_mem(XFinn_feeder_21b_16 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFinn_feeder_21b_16_ReadReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_EXT_MEM_DATA);
    Data += (u64)XFinn_feeder_21b_16_ReadReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_EXT_MEM_DATA + 4) << 32;
    return Data;
}

void XFinn_feeder_21b_16_Set_initial_address(XFinn_feeder_21b_16 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFinn_feeder_21b_16_WriteReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_INITIAL_ADDRESS_DATA, Data);
}

u32 XFinn_feeder_21b_16_Get_initial_address(XFinn_feeder_21b_16 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFinn_feeder_21b_16_ReadReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_INITIAL_ADDRESS_DATA);
    return Data;
}

void XFinn_feeder_21b_16_Set_image_size(XFinn_feeder_21b_16 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFinn_feeder_21b_16_WriteReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_IMAGE_SIZE_DATA, Data);
}

u32 XFinn_feeder_21b_16_Get_image_size(XFinn_feeder_21b_16 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFinn_feeder_21b_16_ReadReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_IMAGE_SIZE_DATA);
    return Data;
}

void XFinn_feeder_21b_16_Set_num_images(XFinn_feeder_21b_16 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFinn_feeder_21b_16_WriteReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_NUM_IMAGES_DATA, Data);
}

u32 XFinn_feeder_21b_16_Get_num_images(XFinn_feeder_21b_16 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFinn_feeder_21b_16_ReadReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_NUM_IMAGES_DATA);
    return Data;
}

void XFinn_feeder_21b_16_Set_done_irq(XFinn_feeder_21b_16 *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFinn_feeder_21b_16_WriteReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_DONE_IRQ_DATA, (u32)(Data));
    XFinn_feeder_21b_16_WriteReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_DONE_IRQ_DATA + 4, (u32)(Data >> 32));
}

u64 XFinn_feeder_21b_16_Get_done_irq(XFinn_feeder_21b_16 *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFinn_feeder_21b_16_ReadReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_DONE_IRQ_DATA);
    Data += (u64)XFinn_feeder_21b_16_ReadReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_DONE_IRQ_DATA + 4) << 32;
    return Data;
}

void XFinn_feeder_21b_16_InterruptGlobalEnable(XFinn_feeder_21b_16 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFinn_feeder_21b_16_WriteReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_GIE, 1);
}

void XFinn_feeder_21b_16_InterruptGlobalDisable(XFinn_feeder_21b_16 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFinn_feeder_21b_16_WriteReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_GIE, 0);
}

void XFinn_feeder_21b_16_InterruptEnable(XFinn_feeder_21b_16 *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XFinn_feeder_21b_16_ReadReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_IER);
    XFinn_feeder_21b_16_WriteReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_IER, Register | Mask);
}

void XFinn_feeder_21b_16_InterruptDisable(XFinn_feeder_21b_16 *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XFinn_feeder_21b_16_ReadReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_IER);
    XFinn_feeder_21b_16_WriteReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_IER, Register & (~Mask));
}

void XFinn_feeder_21b_16_InterruptClear(XFinn_feeder_21b_16 *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFinn_feeder_21b_16_WriteReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_ISR, Mask);
}

u32 XFinn_feeder_21b_16_InterruptGetEnabled(XFinn_feeder_21b_16 *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XFinn_feeder_21b_16_ReadReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_IER);
}

u32 XFinn_feeder_21b_16_InterruptGetStatus(XFinn_feeder_21b_16 *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XFinn_feeder_21b_16_ReadReg(InstancePtr->Control_BaseAddress, XFINN_FEEDER_21B_16_CONTROL_ADDR_ISR);
}

