#include "finn_feeder_chiplet.h"

void finn_feeder_chiplet(
    hls::stream<AXI_VALUE_pixel> &out_stream,
    hls::stream<AXI_VALUE_label> &in_stream,
    volatile uint8_t* predicted_index,
    volatile uint32_t* ext_mem,
    uint32_t initial_address,
    uint32_t image_size,
    uint32_t num_images,
    volatile bool* done_irq
)
{
    #pragma HLS INTERFACE axis port=out_stream
    #pragma HLS INTERFACE axis port=in_stream
    #pragma HLS INTERFACE s_axilite port=predicted_index
    #pragma HLS INTERFACE s_axilite port=initial_address
    #pragma HLS INTERFACE s_axilite port=image_size
    #pragma HLS INTERFACE s_axilite port=num_images
    #pragma HLS INTERFACE s_axilite port=return
    #pragma HLS INTERFACE mode=m_axi port=ext_mem

    uint32_t img_idx;

    for (img_idx = 0; img_idx < num_images; img_idx++) {
        AXI_VALUE_pixel pixel;
        AXI_VALUE_label label;
        *done_irq = 0;

            //mdc
        ap_int<8> input_buffer[5]; //input/mdc

        int write_ibuff_pointer = 0;
        int valid_bytes = 4; //largura da memória

        int next_write_ibuff_pointer = valid_bytes;
        int next_valid_bytes = 0; //aplicar uma função pra descobrir

        const int max_valid_bytes = 32/8; //mem/mdc

        uint32_t address = (initial_address / 4) + img_idx * (image_size / 4);

        for(uint32_t p = 0; p < (image_size / 4); p++) {
//            #pragma HLS PIPELINE II=1
        	//se o valid_
        	if (valid_bytes == max_valid_bytes){
				#pragma HLS PIPELINE II=1
        		for (int i = 0; i < max_valid_bytes; i++)
        	}

            pixel.data = ext_mem[address + p];
            out_stream.write(pixel);
        }

        // Ler o rótulo do stream de entrada (leitura bloqueante)
        in_stream.read(label);
        *predicted_index = label.data;
        *done_irq = 1;
    }
}
