#include <iostream>
#include "hls_stream.h"

using namespace std;

struct __cosim_T_1__ {char data[1];};
extern "C" void fpga_fifo_push_1(__cosim_T_1__* val, hls::stream<__cosim_T_1__>* fifo) {
  fifo->write(*val);
}
extern "C" void fpga_fifo_pop_1(__cosim_T_1__* val, hls::stream<__cosim_T_1__>* fifo) {
  *val = fifo->read();
}
extern "C" bool fpga_fifo_not_empty_1(hls::stream<__cosim_T_1__>* fifo) {
  return !fifo->empty();
}
extern "C" bool fpga_fifo_exist_1(hls::stream<__cosim_T_1__>* fifo) {
  return fifo->exist();
}
struct __cosim_T_7__ {char data[7];};
extern "C" void fpga_fifo_push_7(__cosim_T_7__* val, hls::stream<__cosim_T_7__>* fifo) {
  fifo->write(*val);
}
extern "C" void fpga_fifo_pop_7(__cosim_T_7__* val, hls::stream<__cosim_T_7__>* fifo) {
  *val = fifo->read();
}
extern "C" bool fpga_fifo_not_empty_7(hls::stream<__cosim_T_7__>* fifo) {
  return !fifo->empty();
}
extern "C" bool fpga_fifo_exist_7(hls::stream<__cosim_T_7__>* fifo) {
  return fifo->exist();
}
struct __cosim_T_16__ {char data[16];};
extern "C" void fpga_fifo_push_16(__cosim_T_16__* val, hls::stream<__cosim_T_16__>* fifo) {
  fifo->write(*val);
}
extern "C" void fpga_fifo_pop_16(__cosim_T_16__* val, hls::stream<__cosim_T_16__>* fifo) {
  *val = fifo->read();
}
extern "C" bool fpga_fifo_not_empty_16(hls::stream<__cosim_T_16__>* fifo) {
  return !fifo->empty();
}
extern "C" bool fpga_fifo_exist_16(hls::stream<__cosim_T_16__>* fifo) {
  return fifo->exist();
}
struct __cosim_T_32__ {char data[32];};
extern "C" void fpga_fifo_push_32(__cosim_T_32__* val, hls::stream<__cosim_T_32__>* fifo) {
  fifo->write(*val);
}
extern "C" void fpga_fifo_pop_32(__cosim_T_32__* val, hls::stream<__cosim_T_32__>* fifo) {
  *val = fifo->read();
}
extern "C" bool fpga_fifo_not_empty_32(hls::stream<__cosim_T_32__>* fifo) {
  return !fifo->empty();
}
extern "C" bool fpga_fifo_exist_32(hls::stream<__cosim_T_32__>* fifo) {
  return fifo->exist();
}
