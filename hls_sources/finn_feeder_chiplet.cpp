#include "finn_feeder_chiplet.h"
#include <iostream>

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
        ap_int<8> input_buffer[5] = {0, 0, 0, 0, 0}; // input/mdc
        const int input_buffer_size = 5;

        int write_ibuff_pointer = 0;
        int valid_bytes = 32/8; //largura da memória

        int next_write_ibuff_pointer = valid_bytes;
        int next_valid_bytes = 0; //aplicar uma função pra descobrir

        const int max_valid_bytes = 32/8; //mem/mdc

        uint32_t address = initial_address + img_idx * image_size;

        uint32_t back_offset = 0;
        uint32_t p = 0;
        while(p < image_size) {
        	std::cout << "p: " << p << std::endl;
        	std::cout << "vb_n: " << valid_bytes << std::endl;
        	std::cout << "wpi_n: " << write_ibuff_pointer << std::endl;
        	if (valid_bytes == max_valid_bytes){
        		finn_feeder_chiplet_label1:for (int i = write_ibuff_pointer; i < max_valid_bytes; i++){
        			input_buffer[i] = ((ext_mem[address + p] >> (i * 8)) & 0xFF);
        			std::cout << std::hex << ext_mem[address + p] << std::endl;
        			std::cout << std::hex << (ext_mem[address + p] >> (i * 8)) << std::endl;
        			std::cout << std::hex << (0xFF & (ext_mem[address + p] >> (i * 8)) ) << std::endl;
        		}
        	    for (int i = 0; i < 5; ++i) {
        	        std::cout << "input_buffer[" << i << "] = " << input_buffer[i] << std::endl;
        	        p++;
        	    }
        		write_ibuff_pointer += valid_bytes;
        	} else {
        		std::cout << "vou escrever no input" << std::endl;
        		back_offset = 0;
        		finn_feeder_chiplet_label2:for (int i = write_ibuff_pointer; i < input_buffer_size; i++){
        			input_buffer[i] = (ext_mem[address + p] >> (i * 8)) & 0xFF;
        			std::cout << "input_buffer[" << i << "] = " << input_buffer[i] << std::endl;
        			back_offset++;
        		}
        		std::cout << "bckoff: " << back_offset << std::endl;
        		p = p - back_offset;
				std::cout << "p: " << p << std::endl;
				write_ibuff_pointer = 0;
				pixel.data = input_buffer;
				out_stream.write(pixel);
        	}

        	int next_valid_bytes = (40/8) - write_ibuff_pointer;
        	valid_bytes =  next_valid_bytes > max_valid_bytes ? max_valid_bytes : next_valid_bytes; //aplicar uma função pra descobrir o próximo
        	std::cout << "vb_n+1: " << valid_bytes << std::endl;
			std::cout << "wpi_n+1: " << write_ibuff_pointer << std::endl;
        }


        // Ler o rótulo do stream de entrada (leitura bloqueante)
        in_stream.read(label);
        *predicted_index = label.data;
        *done_irq = 1;
    }
}
