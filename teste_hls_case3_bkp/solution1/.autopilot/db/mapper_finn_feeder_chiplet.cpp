#include "hls_signal_handler.h"
#include <algorithm>
#include <cassert>
#include <fstream>
#include <iostream>
#include <list>
#include <map>
#include <vector>
#include "ap_fixed.h"
#include "ap_int.h"
#include "hls_stream.h"
using namespace std;

namespace hls::sim
{
  template<size_t n>
  struct Byte {
    unsigned char a[n];

    Byte()
    {
      for (size_t i = 0; i < n; ++i) {
        a[i] = 0;
      }
    }

    template<typename T>
    Byte<n>& operator= (const T &val)
    {
      std::memcpy(a, &val, n);
      return *this;
    }
  };

  struct SimException : public std::exception {
    const std::string msg;
    const size_t line;
    SimException(const std::string &msg, const size_t line)
      : msg(msg), line(line)
    {
    }
  };

  void errExit(const size_t line, const std::string &msg)
  {
    std::string s;
    s += "ERROR";
//  s += '(';
//  s += __FILE__;
//  s += ":";
//  s += std::to_string(line);
//  s += ')';
    s += ": ";
    s += msg;
    s += "\n";
    fputs(s.c_str(), stderr);
    exit(1);
  }
}


namespace hls::sim
{
  struct Buffer {
    char *first;
    Buffer(char *addr) : first(addr)
    {
    }
  };

  struct DBuffer : public Buffer {
    static const size_t total = 1<<10;
    size_t ufree;

    DBuffer(size_t usize) : Buffer(nullptr), ufree(total)
    {
      first = new char[usize*ufree];
    }

    ~DBuffer()
    {
      delete[] first;
    }
  };

  struct CStream {
    char *front;
    char *back;
    size_t num;
    size_t usize;
    std::list<Buffer*> bufs;
    bool dynamic;

    CStream() : front(nullptr), back(nullptr),
                num(0), usize(0), dynamic(true)
    {
    }

    ~CStream()
    {
      for (Buffer *p : bufs) {
        delete p;
      }
    }

    template<typename T>
    T* data()
    {
      return (T*)front;
    }

    template<typename T>
    void transfer(hls::stream<T> *param)
    {
      while (!empty()) {
        param->write(*(T*)nextRead());
      }
    }

    bool empty();
    char* nextRead();
    char* nextWrite();
  };

  bool CStream::empty()
  {
    return num == 0;
  }

  char* CStream::nextRead()
  {
    assert(num > 0);
    char *res = front;
    front += usize;
    if (dynamic) {
      if (++static_cast<DBuffer*>(bufs.front())->ufree == DBuffer::total) {
        if (bufs.size() > 1) {
          bufs.pop_front();
          front = bufs.front()->first;
        } else {
          front = back = bufs.front()->first;
        }
      }
    }
    --num;
    return res;
  }

  char* CStream::nextWrite()
  {
    if (dynamic) {
      if (static_cast<DBuffer*>(bufs.back())->ufree == 0) {
        bufs.push_back(new DBuffer(usize));
        back = bufs.back()->first;
      }
      --static_cast<DBuffer*>(bufs.back())->ufree;
    }
    char *res = back;
    back += usize;
    ++num;
    return res;
  }

  std::list<CStream> streams;
  std::map<char*, CStream*> prebuilt;

  CStream* createStream(size_t usize)
  {
    streams.emplace_front();
    CStream &s = streams.front();
    {
      s.dynamic = true;
      s.bufs.push_back(new DBuffer(usize));
      s.front = s.bufs.back()->first;
      s.back = s.front;
      s.num = 0;
      s.usize = usize;
    }
    return &s;
  }

  template<typename T>
  CStream* createStream(hls::stream<T> *param)
  {
    CStream *s = createStream(sizeof(T));
    {
      s->dynamic = true;
      while (!param->empty()) {
        T data = param->read();
        memcpy(s->nextWrite(), (char*)&data, sizeof(T));
      }
      prebuilt[s->front] = s;
    }
    return s;
  }

  template<typename T>
  CStream* createStream(T *param, size_t usize)
  {
    streams.emplace_front();
    CStream &s = streams.front();
    {
      s.dynamic = false;
      s.bufs.push_back(new Buffer((char*)param));
      s.front = s.back = s.bufs.back()->first;
      s.usize = usize;
      s.num = ~0UL;
    }
    prebuilt[s.front] = &s;
    return &s;
  }

  CStream* findStream(char *buf)
  {
    return prebuilt.at(buf);
  }
}
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
unsigned int ap_apatb_out_stream_V_data_V_cap_bc;
static AESL_RUNTIME_BC __xlx_out_stream_V_data_V_V_size_Reader("../tv/stream_size/stream_size_out_out_stream_V_data_V.dat");
unsigned int ap_apatb_in_stream_V_data_V_cap_bc;
static AESL_RUNTIME_BC __xlx_in_stream_V_data_V_V_size_Reader("../tv/stream_size/stream_size_in_in_stream_V_data_V.dat");
using hls::sim::Byte;
extern "C" void finn_feeder_chiplet(Byte<8>*, volatile void *, volatile void *, volatile void *, int, int, int, int, int);
extern "C" void apatb_finn_feeder_chiplet_hw(volatile void * __xlx_apatb_param_out_stream_V_data_V, volatile void * __xlx_apatb_param_in_stream_V_data_V, volatile void * __xlx_apatb_param_predicted_index, volatile void * __xlx_apatb_param_ext_mem, int __xlx_apatb_param_initial_address, int __xlx_apatb_param_image_size, int __xlx_apatb_param_num_images, volatile void * __xlx_apatb_param_done_irq) {
using hls::sim::createStream;
  // Collect __xlx_ext_mem_done_irq__tmp_vec
std::vector<Byte<8>> __xlx_ext_mem_done_irq__tmp_vec;
for (size_t i = 0; i < 1; ++i){
__xlx_ext_mem_done_irq__tmp_vec.push_back(((Byte<8>*)__xlx_apatb_param_ext_mem)[i]);
}
  int __xlx_size_param_ext_mem = 1;
  int __xlx_offset_param_ext_mem = 0;
  int __xlx_offset_byte_param_ext_mem = 0*8;
for (size_t i = 0; i < 1; ++i){
__xlx_ext_mem_done_irq__tmp_vec.push_back(((Byte<8>*)__xlx_apatb_param_done_irq)[i]);
}
  int __xlx_size_param_done_irq = 1;
  int __xlx_offset_param_done_irq = 1;
  int __xlx_offset_byte_param_done_irq = 1*8;
  //Create input buffer for out_stream_V_data_V
  ap_apatb_out_stream_V_data_V_cap_bc = __xlx_out_stream_V_data_V_V_size_Reader.read_size();
  long long* __xlx_out_stream_V_data_V_input_buffer= new long long[ap_apatb_out_stream_V_data_V_cap_bc];
auto* sout_stream_V_data_V = createStream((hls::stream<long long>*)__xlx_apatb_param_out_stream_V_data_V);
auto* sin_stream_V_data_V = createStream((hls::stream<char>*)__xlx_apatb_param_in_stream_V_data_V);
  // DUT call
  finn_feeder_chiplet(__xlx_ext_mem_done_irq__tmp_vec.data(), sout_stream_V_data_V->data<long long>(), sin_stream_V_data_V->data<char>(), __xlx_apatb_param_predicted_index, __xlx_offset_byte_param_ext_mem, __xlx_apatb_param_initial_address, __xlx_apatb_param_image_size, __xlx_apatb_param_num_images, __xlx_offset_byte_param_done_irq);
// print __xlx_apatb_param_ext_mem
for (size_t i = 0; i < __xlx_size_param_ext_mem; ++i) {
((Byte<8>*)__xlx_apatb_param_ext_mem)[i] = __xlx_ext_mem_done_irq__tmp_vec[__xlx_offset_param_ext_mem+i];
}
// print __xlx_apatb_param_done_irq
for (size_t i = 0; i < __xlx_size_param_done_irq; ++i) {
((Byte<8>*)__xlx_apatb_param_done_irq)[i] = __xlx_ext_mem_done_irq__tmp_vec[__xlx_offset_param_done_irq+i];
}
sout_stream_V_data_V->transfer((hls::stream<long long>*)__xlx_apatb_param_out_stream_V_data_V);
sin_stream_V_data_V->transfer((hls::stream<char>*)__xlx_apatb_param_in_stream_V_data_V);
}
