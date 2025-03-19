// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XFINN_FEEDER_CHIPLET_8_BITS_H
#define XFINN_FEEDER_CHIPLET_8_BITS_H

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
#include "xfinn_feeder_chiplet_8_bits_hw.h"

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
} XFinn_feeder_chiplet_8_bits_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XFinn_feeder_chiplet_8_bits;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XFinn_feeder_chiplet_8_bits_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XFinn_feeder_chiplet_8_bits_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XFinn_feeder_chiplet_8_bits_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XFinn_feeder_chiplet_8_bits_ReadReg(BaseAddress, RegOffset) \
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
int XFinn_feeder_chiplet_8_bits_Initialize(XFinn_feeder_chiplet_8_bits *InstancePtr, UINTPTR BaseAddress);
XFinn_feeder_chiplet_8_bits_Config* XFinn_feeder_chiplet_8_bits_LookupConfig(UINTPTR BaseAddress);
#else
int XFinn_feeder_chiplet_8_bits_Initialize(XFinn_feeder_chiplet_8_bits *InstancePtr, u16 DeviceId);
XFinn_feeder_chiplet_8_bits_Config* XFinn_feeder_chiplet_8_bits_LookupConfig(u16 DeviceId);
#endif
int XFinn_feeder_chiplet_8_bits_CfgInitialize(XFinn_feeder_chiplet_8_bits *InstancePtr, XFinn_feeder_chiplet_8_bits_Config *ConfigPtr);
#else
int XFinn_feeder_chiplet_8_bits_Initialize(XFinn_feeder_chiplet_8_bits *InstancePtr, const char* InstanceName);
int XFinn_feeder_chiplet_8_bits_Release(XFinn_feeder_chiplet_8_bits *InstancePtr);
#endif

void XFinn_feeder_chiplet_8_bits_Start(XFinn_feeder_chiplet_8_bits *InstancePtr);
u32 XFinn_feeder_chiplet_8_bits_IsDone(XFinn_feeder_chiplet_8_bits *InstancePtr);
u32 XFinn_feeder_chiplet_8_bits_IsIdle(XFinn_feeder_chiplet_8_bits *InstancePtr);
u32 XFinn_feeder_chiplet_8_bits_IsReady(XFinn_feeder_chiplet_8_bits *InstancePtr);
void XFinn_feeder_chiplet_8_bits_Continue(XFinn_feeder_chiplet_8_bits *InstancePtr);
void XFinn_feeder_chiplet_8_bits_EnableAutoRestart(XFinn_feeder_chiplet_8_bits *InstancePtr);
void XFinn_feeder_chiplet_8_bits_DisableAutoRestart(XFinn_feeder_chiplet_8_bits *InstancePtr);

u32 XFinn_feeder_chiplet_8_bits_Get_predicted_index(XFinn_feeder_chiplet_8_bits *InstancePtr);
void XFinn_feeder_chiplet_8_bits_Set_ext_mem(XFinn_feeder_chiplet_8_bits *InstancePtr, u64 Data);
u64 XFinn_feeder_chiplet_8_bits_Get_ext_mem(XFinn_feeder_chiplet_8_bits *InstancePtr);
void XFinn_feeder_chiplet_8_bits_Set_initial_address(XFinn_feeder_chiplet_8_bits *InstancePtr, u32 Data);
u32 XFinn_feeder_chiplet_8_bits_Get_initial_address(XFinn_feeder_chiplet_8_bits *InstancePtr);
void XFinn_feeder_chiplet_8_bits_Set_image_size(XFinn_feeder_chiplet_8_bits *InstancePtr, u32 Data);
u32 XFinn_feeder_chiplet_8_bits_Get_image_size(XFinn_feeder_chiplet_8_bits *InstancePtr);
void XFinn_feeder_chiplet_8_bits_Set_num_images(XFinn_feeder_chiplet_8_bits *InstancePtr, u32 Data);
u32 XFinn_feeder_chiplet_8_bits_Get_num_images(XFinn_feeder_chiplet_8_bits *InstancePtr);
void XFinn_feeder_chiplet_8_bits_Set_done_irq(XFinn_feeder_chiplet_8_bits *InstancePtr, u64 Data);
u64 XFinn_feeder_chiplet_8_bits_Get_done_irq(XFinn_feeder_chiplet_8_bits *InstancePtr);

void XFinn_feeder_chiplet_8_bits_InterruptGlobalEnable(XFinn_feeder_chiplet_8_bits *InstancePtr);
void XFinn_feeder_chiplet_8_bits_InterruptGlobalDisable(XFinn_feeder_chiplet_8_bits *InstancePtr);
void XFinn_feeder_chiplet_8_bits_InterruptEnable(XFinn_feeder_chiplet_8_bits *InstancePtr, u32 Mask);
void XFinn_feeder_chiplet_8_bits_InterruptDisable(XFinn_feeder_chiplet_8_bits *InstancePtr, u32 Mask);
void XFinn_feeder_chiplet_8_bits_InterruptClear(XFinn_feeder_chiplet_8_bits *InstancePtr, u32 Mask);
u32 XFinn_feeder_chiplet_8_bits_InterruptGetEnabled(XFinn_feeder_chiplet_8_bits *InstancePtr);
u32 XFinn_feeder_chiplet_8_bits_InterruptGetStatus(XFinn_feeder_chiplet_8_bits *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
