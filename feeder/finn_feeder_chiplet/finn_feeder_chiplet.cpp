#include "finn_feeder.h"

void finn_feeder_chiplet(
    hls::stream<AXI_VALUE_pixel> &out_stream,
    hls::stream<AXI_VALUE_label> &in_stream,
    volatile uint8_t* predicted_index,
    volatile uint32_t* ext_mem,
    uint32_t initial_address,
    uint32_t image_size,
    uint32_t num_images,
    volatile bool* done_irq
) {

    #pragma HLS INTERFACE axis port=out_stream
    #pragma HLS INTERFACE axis port=in_stream
    #pragma HLS INTERFACE s_axilite port=predicted_index
    #pragma HLS INTERFACE s_axilite port=initial_address
    #pragma HLS INTERFACE s_axilite port=image_size
    #pragma HLS INTERFACE s_axilite port=num_images
    #pragma HLS INTERFACE s_axilite port=return
    #pragma HLS INTERFACE mode=m_axi port=ext_mem

	uint32_t  img_idx;

    for (img_idx = 0; img_idx < num_images; img_idx++) {
    	ap_int<16> p; //mudar isso se image_size definida for muito grande
        AXI_VALUE_pixel pixel;
        AXI_VALUE_label label;
        *done_irq = 0;

        uint32_t address = (initial_address >> 2) + img_idx * (image_size >> 2);

        for(p = 0; p < image_size / 4; p++) {  // Read 32 bits (4 bytes) at a time
        	#pragma HLS PIPELINE II=4
            uint32_t word = ext_mem[address + p];

            // Extract each byte from the 32-bit word and write to the stream
            for (ap_int<4> i = 0; i < 4; i++) {
                pixel.data = (word >> (i * 8)) & 0xFF;  // Extract byte
                out_stream.write(pixel);
            }
        }

        // Ler o rótulo do stream de entrada (leitura bloqueante)
        in_stream.read(label);
        *predicted_index = label.data;
        *done_irq = 1;
    }
}