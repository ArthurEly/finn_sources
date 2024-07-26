#include "finn_feeder_chiplet.h"
#include <iostream>
#include <hls_stream.h>
#include <ap_int.h>
#include <iomanip> // Para std::setw e std::setfill

#define TEST_IMAGE_COUNT     1
#define TEST_IMAGE_HEIGHT    10
#define TEST_IMAGE_WIDTH     103
#define TEST_IMAGE_CHANNELS  4
#define TEST_IMAGE_SIZE      (TEST_IMAGE_HEIGHT * TEST_IMAGE_WIDTH * TEST_IMAGE_CHANNELS / 8)
#define TEST_MEMORY_SIZE     (TEST_IMAGE_COUNT * TEST_IMAGE_SIZE)

void initialize_memory(volatile uint32_t* ext_mem, uint32_t num_images, uint32_t image_size, uint32_t initial_address) {
    for (uint32_t img = 0; img < num_images; img++) {
        for (uint32_t i = 0; i < image_size; i++) {
            ext_mem[img * (image_size) + i] = (0x11223344 * (img + 1));
        }
    }
}

ap_uint<40> modify_bytes(ap_uint<40> num, unsigned int shift, unsigned int width) {
    // Shift para a direita removendo o último byte
    ap_uint<40> shifted_num = num >> shift;

    // Isolar o novo último byte depois do shift
    ap_uint<40> new_last_byte = (shifted_num) << (width - shift);

    // Colocar o novo último byte na frente
    ap_uint<40> result = new_last_byte | shifted_num;

    return result;
}

int main() {
    uint32_t ext_mem[TEST_MEMORY_SIZE];
    uint32_t initial_address = 0x00000000;

    initialize_memory(ext_mem, TEST_IMAGE_COUNT, TEST_IMAGE_SIZE, initial_address);

    hls::stream<AXI_VALUE_pixel> out_stream;
    hls::stream<AXI_VALUE_label> in_stream;

    volatile uint8_t predicted_index;
    volatile bool done_irq = false;

    uint32_t image_size = TEST_IMAGE_SIZE;
    uint32_t num_images = TEST_IMAGE_COUNT;

    // Write labels to the input stream
    for (int i = 0; i < TEST_IMAGE_COUNT; i++) {
        AXI_VALUE_label label;
        label.data = 1; // Arbitrary label value
        in_stream.write(label);
    }

//    std::cout << "Primeiros 500 valores de ext_mem:" << std::endl;
//    for (int i = 0; i < 513; i++) {
//        std::cout << std::hex << std::setw(8) << std::setfill('0') << ext_mem[i] << " ";
//        if ((i + 1) % 10 == 0) { // 10 valores por linha
//            std::cout << std::endl;
//        }
//    }

    // Call the DUT
    finn_feeder_chiplet(out_stream, in_stream, &predicted_index, ext_mem, initial_address, image_size, num_images, &done_irq);

    // Check the output stream
    bool success = true;
    ap_uint<40> base_data = 0x4411223344;

    for (uint32_t img_idx = 0; img_idx < num_images; ++img_idx) {
    	base_data = base_data * (img_idx + 1);
        for (uint32_t p = 0; p < image_size; p += 5) {
            if (out_stream.empty()) {
                std::cout << "Erro: Stream vazio antes do esperado!" << std::endl;
                success = false;
                break;
            }
            AXI_VALUE_pixel pixel = out_stream.read();
//            std::cout << std::hex << (ap_int<40>)pixel.data << std::endl;
//            std::cout << base_data << std::endl;
//            ap_uint<40> expected_value = (0x4411223344 * (img_idx + 1));

            if (pixel.data != base_data) {
                std::cout << "Erro: pixel[" << img_idx << "][" << p / 5 << "] = "
                          << std::hex << pixel.data
                          << ", esperado = " << base_data << std::endl;
                success = false;
            }

            base_data = modify_bytes(base_data, 8, 40);
//            std::cout << "oi caralho" << std::endl;
//            std::cout << std::hex << base_data << std::endl;
        }

        if (predicted_index != 1) {
            std::cout << "Erro: predicted_index = " << (uint32_t)predicted_index << ", esperado = 1" << std::endl;
            success = false;
        }
    }

    if (success) {
        std::cout << "Teste concluído com sucesso!" << std::endl;
    } else {
        std::cout << "Teste falhou!" << std::endl;
    }

    return 0;
}
