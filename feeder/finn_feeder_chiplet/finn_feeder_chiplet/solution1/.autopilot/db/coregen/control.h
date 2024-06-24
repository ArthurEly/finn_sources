// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 7  - auto_restart (Read/Write)
//        bit 9  - interrupt (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0 - enable ap_done interrupt (Read/Write)
//        bit 1 - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0 - ap_done (Read/TOW)
//        bit 1 - ap_ready (Read/TOW)
//        others - reserved
// 0x10 : Data signal of predicted_index
//        bit 7~0 - predicted_index[7:0] (Read)
//        others  - reserved
// 0x14 : Control signal of predicted_index
//        bit 0  - predicted_index_ap_vld (Read/COR)
//        others - reserved
// 0x20 : Data signal of ext_mem
//        bit 31~0 - ext_mem[31:0] (Read/Write)
// 0x24 : Data signal of ext_mem
//        bit 31~0 - ext_mem[63:32] (Read/Write)
// 0x28 : reserved
// 0x2c : Data signal of initial_address
//        bit 31~0 - initial_address[31:0] (Read/Write)
// 0x30 : reserved
// 0x34 : Data signal of image_size
//        bit 31~0 - image_size[31:0] (Read/Write)
// 0x38 : reserved
// 0x3c : Data signal of num_images
//        bit 31~0 - num_images[31:0] (Read/Write)
// 0x40 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define CONTROL_ADDR_AP_CTRL              0x00
#define CONTROL_ADDR_GIE                  0x04
#define CONTROL_ADDR_IER                  0x08
#define CONTROL_ADDR_ISR                  0x0c
#define CONTROL_ADDR_PREDICTED_INDEX_DATA 0x10
#define CONTROL_BITS_PREDICTED_INDEX_DATA 8
#define CONTROL_ADDR_PREDICTED_INDEX_CTRL 0x14
#define CONTROL_ADDR_EXT_MEM_DATA         0x20
#define CONTROL_BITS_EXT_MEM_DATA         64
#define CONTROL_ADDR_INITIAL_ADDRESS_DATA 0x2c
#define CONTROL_BITS_INITIAL_ADDRESS_DATA 32
#define CONTROL_ADDR_IMAGE_SIZE_DATA      0x34
#define CONTROL_BITS_IMAGE_SIZE_DATA      32
#define CONTROL_ADDR_NUM_IMAGES_DATA      0x3c
#define CONTROL_BITS_NUM_IMAGES_DATA      32
