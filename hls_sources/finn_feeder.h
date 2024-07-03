// Based on Xilinx XAPP1170

#ifndef __FINN_FEEDER_H__
#define __FINN_FEEDER_H__

#include <cmath>
#include <ap_axi_sdata.h>
#include <hls_stream.h>

#define IMAGESET_IMAGE_HEIGHT         (32)
#define IMAGESET_IMAGE_WIDTH          (32)
#define IMAGESET_IMAGE_CHANNELS       (4)
#define IMAGESET_IMAGE_CHANNEL_BYTES  (1)
#define IMAGESET_CLASSES              (6)
#define IMAGESET_CLASS_SAMPLES        (1)

#define IMAGESET_BYTES (                                \
   IMAGESET_CLASSES*IMAGESET_CLASS_SAMPLES*             \
   IMAGESET_IMAGE_HEIGHT*IMAGESET_IMAGE_WIDTH*          \
   IMAGESET_IMAGE_CHANNELS*IMAGESET_IMAGE_CHANNEL_BYTES \
)

#define IMAGE_BYTES (                 \
		IMAGESET_IMAGE_HEIGHT*IMAGESET_IMAGE_WIDTH*          \
		IMAGESET_IMAGE_CHANNELS*IMAGESET_IMAGE_CHANNEL_BYTES \
)

// Xilinx UG1399 AXI4-Stream Interfaces without Side-Channels
typedef ap_axiu<8, 0, 0, 0, 0> AXI_VALUE_pixel; // 8 bits for pixel data
typedef ap_axiu<8, 0, 0, 0, 0> AXI_VALUE_label; // 8 bits for label data

void finn_feeder_chiplet(
    hls::stream<AXI_VALUE_pixel> &out_stream,
	hls::stream<AXI_VALUE_label> &in_stream,
	volatile uint8_t* predicted_array,
    volatile uint32_t* ext_mem,
    uint32_t initial_address,
    uint32_t image_size,
    uint32_t num_images,
    volatile bool* done_irq
);

#endif /* __FINN_FEEDER_H__ */
