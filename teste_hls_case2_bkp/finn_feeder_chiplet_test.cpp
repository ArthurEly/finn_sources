#include "finn_feeder_chiplet.h"
#include <iostream>
#include <hls_stream.h>
#include <ap_int.h> // Inclua a biblioteca apropriada

// Define valores de teste
#define TEST_IMAGE_COUNT     6
#define TEST_IMAGE_HEIGHT    32
#define TEST_IMAGE_WIDTH     32
#define TEST_IMAGE_CHANNELS  4
#define TEST_IMAGE_SIZE      (TEST_IMAGE_HEIGHT * TEST_IMAGE_WIDTH * TEST_IMAGE_CHANNELS)
#define TEST_MEMORY_SIZE     (TEST_IMAGE_COUNT * TEST_IMAGE_SIZE + 0x1000)  // Adicionando espaço para initial_address

void initialize_memory(uint32_t* ext_mem, uint32_t num_images, uint32_t image_size, uint32_t initial_address) {
    for (uint32_t img = 0; img < num_images; img++) {
        for (uint32_t i = 0; i < image_size / 4; i++) {
            ext_mem[initial_address / 4 + img * (image_size / 4) + i] = (img << 8) + (i % 256);  // Valor diferenciado para cada imagem
        }
    }
}

int main() {
    uint32_t ext_mem[TEST_MEMORY_SIZE / 4];  // Dividido por 4 para se alinhar com as leituras de 32 bits
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
        label.data = 1; // Exemplo de dado de rótulo
        in_stream.write(label);
    }

    finn_feeder_chiplet(out_stream, in_stream, &predicted_index, ext_mem, initial_address, image_size, num_images, &done_irq);

    bool success = true;

    // Verifica se done_irq foi configurado corretamente após o processamento de cada imagem
    for (uint32_t img_idx = 0; img_idx < num_images; ++img_idx) {
        for (uint32_t i = 0; i < image_size; i += 16) { // Incrementar em 16 para processar blocos de 128 bits
            AXI_VALUE_pixel pixel = out_stream.read();
            uint32_t expected_value[4];
            for (int j = 0; j < 4; j++) {
                expected_value[j] = (img_idx << 8) + ((i / 4 + j) % 256);
            }

            ap_int<128> expected_128bit_value = 0;
            for (int j = 0; j < 4; j++) {
                expected_128bit_value |= (ap_int<128>(expected_value[j]) << (j * 32));
            }

            if (pixel.data != expected_128bit_value) {
                std::cout << "Erro: pixel[" << img_idx << "][" << i / 16 << "] = " << pixel.data << ", esperado = " << expected_128bit_value << std::endl;
                success = false;
            }
        }

        if (predicted_index != 1) {
            std::cout << "Erro: predicted_index = " << (uint32_t)predicted_index << ", esperado = " << img_idx << std::endl;
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
