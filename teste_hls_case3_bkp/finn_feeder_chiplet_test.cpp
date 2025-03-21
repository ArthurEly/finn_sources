#include "finn_feeder_chiplet.h"
#include <iostream>
#include <hls_stream.h>
#include <ap_int.h>

#define TEST_IMAGE_COUNT     6
#define TEST_IMAGE_HEIGHT    32
#define TEST_IMAGE_WIDTH     32
#define TEST_IMAGE_CHANNELS  4
#define TEST_IMAGE_SIZE      (TEST_IMAGE_HEIGHT * TEST_IMAGE_WIDTH * TEST_IMAGE_CHANNELS * 5 / 8)
#define TEST_MEMORY_SIZE     (TEST_IMAGE_COUNT * TEST_IMAGE_SIZE + 0x1000)

void initialize_memory(volatile ap_int<40>* ext_mem, uint32_t num_images, uint32_t image_size, uint32_t initial_address) {
    for (uint32_t img = 0; img < num_images; img++) {
        for (uint32_t i = 0; i < image_size / 5; i++) {
            ext_mem[initial_address / 5 + img * (image_size / 5) + i] = (img << 32) + i;
        }
    }
}

int main() {
    ap_int<40> ext_mem[TEST_MEMORY_SIZE / 5];
    uint32_t initial_address = 0x00001000;

    initialize_memory(ext_mem, TEST_IMAGE_COUNT, TEST_IMAGE_SIZE, initial_address);

    hls::stream<AXI_VALUE_pixel> out_stream;
    hls::stream<AXI_VALUE_label> in_stream;

    volatile uint8_t predicted_index;
    volatile bool done_irq = false;

    uint32_t image_size = TEST_IMAGE_SIZE;
    uint32_t num_images = TEST_IMAGE_COUNT;

    for (int i = 0; i < TEST_IMAGE_COUNT; i++) {
        AXI_VALUE_label label;
        label.data = 1;
        in_stream.write(label);
    }

    finn_feeder_chiplet(out_stream, in_stream, &predicted_index, ext_mem, initial_address, image_size, num_images, &done_irq);

    bool success = true;

    for (uint32_t img_idx = 0; img_idx < num_images; ++img_idx) {
        for (uint32_t i = 0; i < image_size; i += 5) {
            AXI_VALUE_pixel pixel = out_stream.read();
            ap_int<40> expected_value = (img_idx << 32) + (i / 5);

            if (pixel.data != expected_value) {
                std::cout << "Erro: pixel[" << img_idx << "][" << i / 5 << "] = " << std::hex << pixel.data << ", esperado = " << expected_value << std::endl;
                success = false;
            }
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
