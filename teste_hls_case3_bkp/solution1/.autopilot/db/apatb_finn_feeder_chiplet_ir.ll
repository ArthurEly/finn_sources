; ModuleID = '/home/artti/Desktop/finn_sources/teste_hls/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>" = type { %"struct.hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>" }
%"struct.hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>" = type { %"struct.ap_uint<40>", %"struct.hls::axis_disabled_signal", %"struct.hls::axis_disabled_signal", %"struct.hls::axis_disabled_signal", %"struct.hls::axis_disabled_signal", %"struct.hls::axis_disabled_signal", %"struct.hls::axis_disabled_signal" }
%"struct.ap_uint<40>" = type { %"struct.ap_int_base<40, false>" }
%"struct.ap_int_base<40, false>" = type { %"struct.ssdm_int<40, false>" }
%"struct.ssdm_int<40, false>" = type { i40 }
%"struct.hls::axis_disabled_signal" = type { i8 }
%"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>" = type { %"struct.hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>" }
%"struct.hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>" = type { %"struct.ap_uint<8>", %"struct.hls::axis_disabled_signal", %"struct.hls::axis_disabled_signal", %"struct.hls::axis_disabled_signal", %"struct.hls::axis_disabled_signal", %"struct.hls::axis_disabled_signal", %"struct.hls::axis_disabled_signal" }
%"struct.ap_uint<8>" = type { %"struct.ap_int_base<8, false>" }
%"struct.ap_int_base<8, false>" = type { %"struct.hls::axis_disabled_signal" }

; Function Attrs: noinline
define void @apatb_finn_feeder_chiplet_ir(%"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"* noalias nonnull dereferenceable(16) %out_stream, %"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"* noalias nonnull dereferenceable(7) %in_stream, i8* noalias nonnull %predicted_index, %"struct.ap_uint<40>"* noalias nocapture nonnull readonly "maxi" %ext_mem, i32 %initial_address, i32 %image_size, i32 %num_images, i1* noalias nonnull %done_irq) local_unnamed_addr #0 {
entry:
  %out_stream_copy.data = alloca i40, align 512
  %in_stream_copy.data = alloca i8, align 512
  %predicted_index_copy = alloca i8, align 512
  %ext_mem_copy = alloca i40, align 512
  %done_irq_copy = alloca i1, align 512
  call fastcc void @copy_in(%"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"* nonnull %out_stream, i40* nonnull align 512 %out_stream_copy.data, %"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"* nonnull %in_stream, i8* nonnull align 512 %in_stream_copy.data, i8* nonnull %predicted_index, i8* nonnull align 512 %predicted_index_copy, %"struct.ap_uint<40>"* nonnull %ext_mem, i40* nonnull align 512 %ext_mem_copy, i1* nonnull %done_irq, i1* nonnull align 512 %done_irq_copy)
  call void @apatb_finn_feeder_chiplet_hw(i40* %out_stream_copy.data, i8* %in_stream_copy.data, i8* %predicted_index_copy, i40* %ext_mem_copy, i32 %initial_address, i32 %image_size, i32 %num_images, i1* %done_irq_copy)
  call void @copy_back(%"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"* %out_stream, i40* %out_stream_copy.data, %"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"* %in_stream, i8* %in_stream_copy.data, i8* %predicted_index, i8* %predicted_index_copy, %"struct.ap_uint<40>"* %ext_mem, i40* %ext_mem_copy, i1* %done_irq, i1* %done_irq_copy)
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @copy_in(%"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"* noalias "unpacked"="0", i40* noalias align 512 "unpacked"="1.0" %_V_data_V, %"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"* noalias "unpacked"="2", i8* noalias align 512 "unpacked"="3.0" %_V_data_V1, i8* noalias readonly "unpacked"="4", i8* noalias align 512 "unpacked"="5", %"struct.ap_uint<40>"* noalias readonly "unpacked"="6", i40* noalias nocapture align 512 "unpacked"="7.0", i1* noalias readonly "unpacked"="8", i1* noalias align 512 "unpacked"="9") unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"(i40* align 512 %_V_data_V, %"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"* %0)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>.11"(i8* align 512 %_V_data_V1, %"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"* %1)
  call fastcc void @onebyonecpy_hls.p0i8(i8* align 512 %3, i8* %2)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<40>"(i40* align 512 %5, %"struct.ap_uint<40>"* %4)
  call fastcc void @onebyonecpy_hls.p0i1(i1* align 512 %7, i1* %6)
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"(i40* noalias align 512 "unpacked"="0.0" %dst_V_data_V, %"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"* noalias %src) unnamed_addr #2 {
entry:
  %0 = icmp eq %"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"(i40* align 512 %dst_V_data_V, %"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"* nonnull %src)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"(i40* noalias nocapture align 512 "unpacked"="0.0" %_V_data_V, %"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"* noalias nocapture) unnamed_addr #3 {
entry:
  %1 = alloca %"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"
  %2 = alloca i40
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"* %0 to i8*
  %4 = call i1 @fpga_fifo_not_empty_16(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"* %1 to i8*
  %6 = bitcast %"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"* %0 to i8*
  call void @fpga_fifo_pop_16(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>", %"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"* %1
  %.fca.0.0.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>" %7, 0, 0, 0, 0, 0
  store i40 %.fca.0.0.0.0.0.extract, i40* %2
  %8 = bitcast i40* %2 to i8*
  %9 = bitcast i40* %_V_data_V to i8*
  call void @fpga_fifo_push_8(i8* %8, i8* %9)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"(%"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"* noalias %dst, i8* noalias align 512 "unpacked"="1.0" %src_V_data_V) unnamed_addr #2 {
entry:
  %0 = icmp eq %"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"(%"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"* nonnull %dst, i8* align 512 %src_V_data_V)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"(%"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"* noalias nocapture, i8* noalias nocapture align 512 "unpacked"="1.0" %_V_data_V) unnamed_addr #3 {
entry:
  %1 = alloca i8
  %2 = alloca %"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = call i1 @fpga_fifo_not_empty_1(i8* %_V_data_V)
  br i1 %3, label %push, label %ret

push:                                             ; preds = %empty
  call void @fpga_fifo_pop_1(i8* %1, i8* %_V_data_V)
  %4 = load volatile i8, i8* %1
  %.fca.0.0.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>" undef, i8 %4, 0, 0, 0, 0, 0
  store %"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>" %.fca.0.0.0.0.0.insert, %"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"* %2
  %5 = bitcast %"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"* %2 to i8*
  %6 = bitcast %"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"* %0 to i8*
  call void @fpga_fifo_push_7(i8* %5, i8* %6)
  br label %empty, !llvm.loop !7

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0i8(i8* noalias align 512 %dst, i8* noalias readonly %src) unnamed_addr #4 {
entry:
  %0 = icmp eq i8* %dst, null
  %1 = icmp eq i8* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %3 = load i8, i8* %src, align 1
  store i8 %3, i8* %dst, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<40>"(i40* noalias nocapture align 512 "unpacked"="0.0" %dst, %"struct.ap_uint<40>"* noalias readonly "unpacked"="1" %src) unnamed_addr #4 {
entry:
  %0 = icmp eq %"struct.ap_uint<40>"* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %src.0.0.03 = getelementptr %"struct.ap_uint<40>", %"struct.ap_uint<40>"* %src, i64 0, i32 0, i32 0, i32 0
  %1 = load i40, i40* %src.0.0.03, align 8
  store i40 %1, i40* %dst, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0i1(i1* noalias align 512 %dst, i1* noalias readonly %src) unnamed_addr #4 {
entry:
  %0 = icmp eq i1* %dst, null
  %1 = icmp eq i1* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %3 = bitcast i1* %src to i8*
  %4 = load i8, i8* %3
  %5 = trunc i8 %4 to i1
  store i1 %5, i1* %dst, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @copy_out(%"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"* noalias "unpacked"="0", i40* noalias align 512 "unpacked"="1.0" %_V_data_V, %"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"* noalias "unpacked"="2", i8* noalias align 512 "unpacked"="3.0" %_V_data_V1, i8* noalias "unpacked"="4", i8* noalias readonly align 512 "unpacked"="5", %"struct.ap_uint<40>"* noalias "unpacked"="6", i40* noalias nocapture readonly align 512 "unpacked"="7.0", i1* noalias "unpacked"="8", i1* noalias readonly align 512 "unpacked"="9") unnamed_addr #5 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>.22"(%"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"* %0, i40* align 512 %_V_data_V)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"(%"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"* %1, i8* align 512 %_V_data_V1)
  call fastcc void @onebyonecpy_hls.p0i8(i8* %2, i8* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<40>.4"(%"struct.ap_uint<40>"* %4, i40* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0i1(i1* %6, i1* align 512 %7)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<40>.4"(%"struct.ap_uint<40>"* noalias "unpacked"="0" %dst, i40* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #4 {
entry:
  %0 = icmp eq %"struct.ap_uint<40>"* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %dst.0.0.04 = getelementptr %"struct.ap_uint<40>", %"struct.ap_uint<40>"* %dst, i64 0, i32 0, i32 0, i32 0
  %1 = load i40, i40* %src, align 512
  store i40 %1, i40* %dst.0.0.04, align 8
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>.11"(i8* noalias align 512 "unpacked"="0.0" %dst_V_data_V, %"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"* noalias %src) unnamed_addr #2 {
entry:
  %0 = icmp eq %"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>.14"(i8* align 512 %dst_V_data_V, %"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"* nonnull %src)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>.14"(i8* noalias nocapture align 512 "unpacked"="0.0" %_V_data_V, %"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"* noalias nocapture) unnamed_addr #3 {
entry:
  %1 = alloca %"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"
  %2 = alloca i8
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast %"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"* %0 to i8*
  %4 = call i1 @fpga_fifo_not_empty_7(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast %"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"* %1 to i8*
  %6 = bitcast %"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"* %0 to i8*
  call void @fpga_fifo_pop_7(i8* %5, i8* %6)
  %7 = load volatile %"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>", %"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"* %1
  %.fca.0.0.0.0.0.extract = extractvalue %"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>" %7, 0, 0, 0, 0, 0
  store i8 %.fca.0.0.0.0.0.extract, i8* %2
  call void @fpga_fifo_push_1(i8* %2, i8* %_V_data_V)
  br label %empty, !llvm.loop !7

ret:                                              ; preds = %empty
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>.22"(%"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"* noalias %dst, i40* noalias align 512 "unpacked"="1.0" %src_V_data_V) unnamed_addr #2 {
entry:
  %0 = icmp eq %"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>.25"(%"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"* nonnull %dst, i40* align 512 %src_V_data_V)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @"streamcpy_hls.p0class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>.25"(%"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"* noalias nocapture, i40* noalias nocapture align 512 "unpacked"="1.0" %_V_data_V) unnamed_addr #3 {
entry:
  %1 = alloca i40
  %2 = alloca %"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"
  br label %empty

empty:                                            ; preds = %push, %entry
  %3 = bitcast i40* %_V_data_V to i8*
  %4 = call i1 @fpga_fifo_not_empty_8(i8* %3)
  br i1 %4, label %push, label %ret

push:                                             ; preds = %empty
  %5 = bitcast i40* %1 to i8*
  %6 = bitcast i40* %_V_data_V to i8*
  call void @fpga_fifo_pop_8(i8* %5, i8* %6)
  %7 = load volatile i40, i40* %1
  %.fca.0.0.0.0.0.insert = insertvalue %"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>" undef, i40 %7, 0, 0, 0, 0, 0
  store %"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>" %.fca.0.0.0.0.0.insert, %"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"* %2
  %8 = bitcast %"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"* %2 to i8*
  %9 = bitcast %"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"* %0 to i8*
  call void @fpga_fifo_push_16(i8* %8, i8* %9)
  br label %empty, !llvm.loop !5

ret:                                              ; preds = %empty
  ret void
}

declare void @apatb_finn_feeder_chiplet_hw(i40*, i8*, i8*, i40*, i32, i32, i32, i1*)

; Function Attrs: argmemonly noinline willreturn
define internal fastcc void @copy_back(%"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"* noalias "unpacked"="0", i40* noalias align 512 "unpacked"="1.0" %_V_data_V, %"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"* noalias "unpacked"="2", i8* noalias align 512 "unpacked"="3.0" %_V_data_V1, i8* noalias "unpacked"="4", i8* noalias readonly align 512 "unpacked"="5", %"struct.ap_uint<40>"* noalias "unpacked"="6", i40* noalias nocapture readonly align 512 "unpacked"="7.0", i1* noalias "unpacked"="8", i1* noalias readonly align 512 "unpacked"="9") unnamed_addr #5 {
entry:
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>.22"(%"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"* %0, i40* align 512 %_V_data_V)
  call fastcc void @"onebyonecpy_hls.p0class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"(%"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"* %1, i8* align 512 %_V_data_V1)
  call fastcc void @onebyonecpy_hls.p0i8(i8* %2, i8* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0i1(i1* %6, i1* align 512 %7)
  ret void
}

define void @finn_feeder_chiplet_hw_stub_wrapper(i40*, i8*, i8*, i40*, i32, i32, i32, i1*) #6 {
entry:
  %8 = alloca %"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"
  %9 = alloca %"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"
  %10 = alloca %"struct.ap_uint<40>"
  call void @copy_out(%"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"* %8, i40* %0, %"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"* %9, i8* %1, i8* null, i8* %2, %"struct.ap_uint<40>"* %10, i40* %3, i1* null, i1* %7)
  call void @finn_feeder_chiplet_hw_stub(%"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"* %8, %"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"* %9, i8* %2, %"struct.ap_uint<40>"* %10, i32 %4, i32 %5, i32 %6, i1* %7)
  call void @copy_in(%"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"* %8, i40* %0, %"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"* %9, i8* %1, i8* null, i8* %2, %"struct.ap_uint<40>"* %10, i40* %3, i1* null, i1* %7)
  ret void
}

declare void @finn_feeder_chiplet_hw_stub(%"class.hls::stream<hls::axis<ap_uint<40>, 0, 0, 0, '\5Cx00', false>, 0>"*, %"class.hls::stream<hls::axis<ap_uint<8>, 0, 0, 0, '\5Cx00', false>, 0>"*, i8*, %"struct.ap_uint<40>"*, i32, i32, i32, i1*)

declare i1 @fpga_fifo_not_empty_16(i8*)

declare i1 @fpga_fifo_not_empty_7(i8*)

declare i1 @fpga_fifo_not_empty_1(i8*)

declare i1 @fpga_fifo_not_empty_8(i8*)

declare void @fpga_fifo_pop_16(i8*, i8*)

declare void @fpga_fifo_pop_7(i8*, i8*)

declare void @fpga_fifo_pop_1(i8*, i8*)

declare void @fpga_fifo_pop_8(i8*, i8*)

declare void @fpga_fifo_push_16(i8*, i8*)

declare void @fpga_fifo_push_7(i8*, i8*)

declare void @fpga_fifo_push_1(i8*, i8*)

declare void @fpga_fifo_push_8(i8*, i8*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline willreturn "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline willreturn "fpga.wrapper.func"="streamcpy_hls" }
attributes #4 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #5 = { argmemonly noinline willreturn "fpga.wrapper.func"="copyout" }
attributes #6 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.rotate.disable"}
!7 = distinct !{!7, !6}
