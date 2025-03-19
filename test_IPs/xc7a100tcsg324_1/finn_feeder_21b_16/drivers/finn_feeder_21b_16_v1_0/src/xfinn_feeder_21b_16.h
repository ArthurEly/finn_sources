// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XFINN_FEEDER_21B_16_H
#define XFINN_FEEDER_21B_16_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xfinn_feeder_21b_16_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Control_BaseAddress;
} XFinn_feeder_21b_16_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XFinn_feeder_21b_16;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XFinn_feeder_21b_16_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XFinn_feeder_21b_16_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XFinn_feeder_21b_16_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XFinn_feeder_21b_16_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XFinn_feeder_21b_16_Initialize(XFinn_feeder_21b_16 *InstancePtr, UINTPTR BaseAddress);
XFinn_feeder_21b_16_Config* XFinn_feeder_21b_16_LookupConfig(UINTPTR BaseAddress);
#else
int XFinn_feeder_21b_16_Initialize(XFinn_feeder_21b_16 *InstancePtr, u16 DeviceId);
XFinn_feeder_21b_16_Config* XFinn_feeder_21b_16_LookupConfig(u16 DeviceId);
#endif
int XFinn_feeder_21b_16_CfgInitialize(XFinn_feeder_21b_16 *InstancePtr, XFinn_feeder_21b_16_Config *ConfigPtr);
#else
int XFinn_feeder_21b_16_Initialize(XFinn_feeder_21b_16 *InstancePtr, const char* InstanceName);
int XFinn_feeder_21b_16_Release(XFinn_feeder_21b_16 *InstancePtr);
#endif

void XFinn_feeder_21b_16_Start(XFinn_feeder_21b_16 *InstancePtr);
u32 XFinn_feeder_21b_16_IsDone(XFinn_feeder_21b_16 *InstancePtr);
u32 XFinn_feeder_21b_16_IsIdle(XFinn_feeder_21b_16 *InstancePtr);
u32 XFinn_feeder_21b_16_IsReady(XFinn_feeder_21b_16 *InstancePtr);
void XFinn_feeder_21b_16_Continue(XFinn_feeder_21b_16 *InstancePtr);
void XFinn_feeder_21b_16_EnableAutoRestart(XFinn_feeder_21b_16 *InstancePtr);
void XFinn_feeder_21b_16_DisableAutoRestart(XFinn_feeder_21b_16 *InstancePtr);

u32 XFinn_feeder_21b_16_Get_predicted_index(XFinn_feeder_21b_16 *InstancePtr);
void XFinn_feeder_21b_16_Set_ext_mem(XFinn_feeder_21b_16 *InstancePtr, u64 Data);
u64 XFinn_feeder_21b_16_Get_ext_mem(XFinn_feeder_21b_16 *InstancePtr);
void XFinn_feeder_21b_16_Set_initial_address(XFinn_feeder_21b_16 *InstancePtr, u32 Data);
u32 XFinn_feeder_21b_16_Get_initial_address(XFinn_feeder_21b_16 *InstancePtr);
void XFinn_feeder_21b_16_Set_image_size(XFinn_feeder_21b_16 *InstancePtr, u32 Data);
u32 XFinn_feeder_21b_16_Get_image_size(XFinn_feeder_21b_16 *InstancePtr);
void XFinn_feeder_21b_16_Set_num_images(XFinn_feeder_21b_16 *InstancePtr, u32 Data);
u32 XFinn_feeder_21b_16_Get_num_images(XFinn_feeder_21b_16 *InstancePtr);
void XFinn_feeder_21b_16_Set_done_irq(XFinn_feeder_21b_16 *InstancePtr, u64 Data);
u64 XFinn_feeder_21b_16_Get_done_irq(XFinn_feeder_21b_16 *InstancePtr);

void XFinn_feeder_21b_16_InterruptGlobalEnable(XFinn_feeder_21b_16 *InstancePtr);
void XFinn_feeder_21b_16_InterruptGlobalDisable(XFinn_feeder_21b_16 *InstancePtr);
void XFinn_feeder_21b_16_InterruptEnable(XFinn_feeder_21b_16 *InstancePtr, u32 Mask);
void XFinn_feeder_21b_16_InterruptDisable(XFinn_feeder_21b_16 *InstancePtr, u32 Mask);
void XFinn_feeder_21b_16_InterruptClear(XFinn_feeder_21b_16 *InstancePtr, u32 Mask);
u32 XFinn_feeder_21b_16_InterruptGetEnabled(XFinn_feeder_21b_16 *InstancePtr);
u32 XFinn_feeder_21b_16_InterruptGetStatus(XFinn_feeder_21b_16 *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
