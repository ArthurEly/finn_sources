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

// Função para deslocar à direita e mover o último byte para o início
ap_uint<40> shift_right_and_move_last_byte(ap_uint<40> value, unsigned int shift, unsigned int width) {
    // Desloca o valor para a direita
    ap_uint<40> shifted_value = value >> shift;

    // Obtém o último byte do valor deslocado
    ap_uint<8> last_byte = shifted_value & 0xFF;

    // Obtém a parte restante do valor deslocado sem o último byte
    ap_uint<32> remaining_value = shifted_value >> 8;

    // Cria o resultado final colocando o último byte no início
    ap_uint<40> result = (last_byte << (width - 8)) | remaining_value;

    // Impressão para depuração
    std::cout << "Valor original: " << std::hex << value << std::endl;
    std::cout << "Valor deslocado: " << std::hex << shifted_value << std::endl;
    std::cout << "Último byte após deslocamento: " << std::hex << (int)last_byte << std::endl;
    std::cout << "Resultado final: " << std::hex << result << std::endl;

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

    // Call the DUT
    finn_feeder_chiplet(out_stream, in_stream, &predicted_index, ext_mem, initial_address, image_size, num_images, &done_irq);

    // Check the output stream
    bool success = true;
    int base_data = 0x4411223344;

    for (uint32_t img_idx = 0; img_idx < num_images; ++img_idx) {
        for (uint32_t p = 0; p < image_size; p += 5) {
            if (out_stream.empty()) {
                std::cout << "Erro: Stream vazio antes do esperado!" << std::endl;
                success = false;
                break;
            }
            AXI_VALUE_pixel pixel = out_stream.read();
//            std::cout << std::hex << (ap_int<40>)pixel.data << std::endl;
            ap_uint<40> base_data = 0x4411223344;
//            std::cout << base_data << std::endl;
            ap_uint<40> expected_value = (0x4411223344 * (img_idx + 1));
            base_data = shift_right_and_move_last_byte(base_data,8,40);
//            std::cout << std::hex << base_data << std::endl;

            if (pixel.data != expected_value) {
                std::cout << "Erro: pixel[" << img_idx << "][" << p / 5 << "] = "
                          << std::hex << pixel.data
                          << ", esperado = " << expected_value << std::endl;
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
