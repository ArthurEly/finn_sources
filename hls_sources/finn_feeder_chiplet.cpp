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
        ap_int<MEM_INPUT_GDC> input_buffer[INPUT_WIDTH/MEM_INPUT_GDC] = {0, 0, 0, 0, 0}; // input/mdc
	    ap_int<INPUT_WIDTH> input = 0;
        const int input_buffer_size = INPUT_WIDTH/MEM_INPUT_GDC;

        int write_ibuff_pointer = 0;
        int valid_bytes = MEM_DATA_WIDTH/MEM_INPUT_GDC; //largura da memória

        int next_write_ibuff_pointer = valid_bytes;
        int next_valid_bytes = 0;

        const int max_valid_bytes = MEM_DATA_WIDTH/MEM_INPUT_GDC; //mem/mdc

        //32 -> MEM_DATA_WIDTH
        ap_int<MEM_DATA_WIDTH> address = initial_address + img_idx * image_size;

        uint32_t back_offset = 0;
        uint32_t p = 0;
        while(p < image_size) {
//        	std::cout << "________________________" << std::endl;
//        	std::cout << "p: " << p << std::endl;
//        	std::cout << "vb_n: " << valid_bytes << std::endl;
//        	std::cout << "wpi_n: " << write_ibuff_pointer << std::endl;
        	if (valid_bytes == max_valid_bytes){
        		finn_feeder_chiplet_label1:for (int i = write_ibuff_pointer; i < max_valid_bytes; i++){
        			input_buffer[i] = ((ext_mem[address + p] >> (p%max_valid_bytes*MEM_INPUT_GDC)) & 0xFF);
//        			std::cout << (p%max_valid_bytes) << std::endl;
//        			std::cout << std::hex << ext_mem[address + p] << std::endl;
//        			std::cout << std::hex << (ext_mem[address + p] >> (p%max_valid_bytes)*MEM_INPUT_GDC) << std::endl;
//        			std::cout << std::hex << (0xFF & (ext_mem[address + p] >> (p%max_valid_bytes)*MEM_INPUT_GDC)) << std::endl;
        	        p++;
        		}
        	    for (int i = 0; i < INPUT_WIDTH/MEM_INPUT_GDC; ++i) {
//        	        std::cout << "input_buffer[" << i << "] = " << input_buffer[i] << std::endl;
        	    }
        		write_ibuff_pointer += valid_bytes;
        	} else {
//        		std::cout << "vou escrever no input" << std::endl;
//        		back_offset = 0;
        		finn_feeder_chiplet_label2:for (int i = write_ibuff_pointer; i < input_buffer_size; i++){
        			input_buffer[i] = (ext_mem[address + p] >> (p%max_valid_bytes*MEM_INPUT_GDC)) & 0xFF;
//        			std::cout << "input_buffer[" << i << "] = " << input_buffer[i] << std::endl;
        			p++;
        		}
        		for (int i = 0; i < INPUT_WIDTH/MEM_INPUT_GDC; ++i) {
//					std::cout << "input_buffer[" << i << "] = " << std::hex << input_buffer[i] << std::endl;
				}
//        		std::cout << "bckoff: " << back_offset << std::endl;
//        		p = p + back_offset;
//				std::cout << "p: " << p << std::endl;
				write_ibuff_pointer = 0;
			    finn_feeder_chiplet_label0:for (int i = 0; i < (INPUT_WIDTH/MEM_INPUT_GDC); i++) {
			        input |= (ap_int<INPUT_WIDTH>(input_buffer[i]) << (i * MEM_INPUT_GDC));
			    }
				pixel.data = input;
				out_stream.write(pixel);
        	}

        	int next_valid_bytes = (INPUT_WIDTH/MEM_INPUT_GDC) - write_ibuff_pointer;
        	valid_bytes =  next_valid_bytes > max_valid_bytes ? max_valid_bytes : next_valid_bytes; //aplicar uma função pra descobrir o próximo
//        	std::cout << "vb_n+1: " << valid_bytes << std::endl;
//			std::cout << "wpi_n+1: " << write_ibuff_pointer << std::endl;
        }


        // Ler o rótulo do stream de entrada (leitura bloqueante)
        in_stream.read(label);
        *predicted_index = label.data;
        *done_irq = 1;
    }
}
