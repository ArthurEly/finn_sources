#ifndef __FINN_FEEDER_CHIPLET_H__
#define __FINN_FEEDER_CHIPLET_H__

#include <cmath>
#include <ap_axi_sdata.h>
#include <hls_stream.h>

#define MEM_DATA_WIDTH 32
#define INPUT_WIDTH 40
#define MEM_INPUT_GDC 8

// Xilinx UG1399 AXI4-Stream Interfaces without Side-Channels
typedef ap_axiu<INPUT_WIDTH, 0, 0, 0, 0> AXI_VALUE_pixel; // 40 bits for pixel data
typedef ap_axiu<8, 0, 0, 0, 0> AXI_VALUE_label; // 8 bits for label data

void finn_feeder_chiplet(
    hls::stream<AXI_VALUE_pixel> &out_stream,
    hls::stream<AXI_VALUE_label> &in_stream,
    volatile uint8_t* predicted_index,
    volatile uint32_t* ext_mem,
    uint32_t initial_address,
    uint32_t image_size,
    uint32_t num_images,
    volatile bool* done_irq
);

#endif /* __FINN_FEEDER_CHIPLET_H__ */
