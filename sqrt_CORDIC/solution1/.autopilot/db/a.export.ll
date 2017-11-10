; ModuleID = '/home/linsun/XilinxLab/sqrt_CORDIC/sqrt_CORDIC/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@sqrt_CORDIC_str = internal unnamed_addr constant [12 x i8] c"sqrt_CORDIC\00"
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@p_str282 = private unnamed_addr constant [14 x i8] c"sqrt_int_loop\00", align 1
@p_str281 = private unnamed_addr constant [10 x i8] c"sqre_loop\00", align 1
@p_str280 = private unnamed_addr constant [9 x i8] c"rem_loop\00", align 1
@p_str279 = private unnamed_addr constant [15 x i8] c"precision_loop\00", align 1
@p_str278 = private unnamed_addr constant [19 x i8] c"data_int_frac_loop\00", align 1
@p_str267 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str266 = private unnamed_addr constant [8 x i8] c"ap_fifo\00", align 1

define void @sqrt_CORDIC(float* %returnValue) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap(float* %returnValue) nounwind, !map !269
  call void (...)* @_ssdm_op_SpecTopModule([12 x i8]* @sqrt_CORDIC_str) nounwind
  call void (...)* @_ssdm_op_SpecInterface(float* %returnValue, [8 x i8]* @p_str266, i32 0, i32 0, [1 x i8]* @p_str267, i32 0, i32 0, [1 x i8]* @p_str267, [1 x i8]* @p_str267, [1 x i8]* @p_str267, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str267, [1 x i8]* @p_str267)
  br label %1

; <label>:1                                       ; preds = %_ifconv, %0
  %i = phi i10 [ 0, %0 ], [ %i_1, %_ifconv ]
  %exitcond = icmp eq i10 %i, -24
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 1000, i64 1000, i64 1000) nounwind
  %i_1 = add i10 %i, 1
  br i1 %exitcond, label %2, label %_ifconv

_ifconv:                                          ; preds = %1
  %tmp = trunc i10 %i_1 to i1
  %input_in_V = call i48 @_ssdm_op_BitConcatenate.i48.i1.i47(i1 %tmp, i47 0)
  %output_out_V = call fastcc i25 @cordic_base(i48 %input_in_V) nounwind
  %tmp_3 = icmp eq i25 %output_out_V, 0
  %dp_s = zext i25 %output_out_V to i32
  %dp_1 = uitofp i32 %dp_s to float
  %res_V_1 = bitcast float %dp_1 to i32
  %exp_V = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %res_V_1, i32 23, i32 30)
  %exp_V_2 = add i8 -24, %exp_V
  %p_Result_s = call i32 @llvm.part.set.i32.i8(i32 %res_V_1, i8 %exp_V_2, i32 23, i32 30) nounwind
  %dp = bitcast i32 %p_Result_s to float
  %p_0_i = select i1 %tmp_3, float 0.000000e+00, float %dp
  call void @_ssdm_op_Write.ap_fifo.volatile.floatP(float* %returnValue, float %p_0_i) nounwind
  br label %1

; <label>:2                                       ; preds = %1
  ret void
}

declare i50 @llvm.part.set.i50.i2(i50, i2, i32, i32) nounwind readnone

declare i32 @llvm.part.set.i32.i8(i32, i8, i32, i32) nounwind readnone

declare i32 @llvm.part.select.i32(i32, i32, i32) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define internal fastcc i25 @cordic_base(i48 %inputData_in_V_read) readnone {
_ZrsILi48ELb1EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit339:
  %inputData_in_V_read_1 = call i48 @_ssdm_op_Read.ap_auto.i48(i48 %inputData_in_V_read)
  br label %0

; <label>:0                                       ; preds = %1, %_ZrsILi48ELb1EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit339
  %x_in_V = phi i48 [ undef, %_ZrsILi48ELb1EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit339 ], [ %p_Result_s, %1 ]
  %bvh_d_index = phi i6 [ 0, %_ZrsILi48ELb1EE11ap_int_baseIXT_EXT0_EXleT_Li64EEERKS1_i.exit339 ], [ %bit, %1 ]
  %index_assign_11_cast = zext i6 %bvh_d_index to i32
  %exitcond_i3 = icmp eq i6 %bvh_d_index, -16
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 48, i64 48, i64 48)
  %bit = add i6 %bvh_d_index, 1
  br i1 %exitcond_i3, label %"get_inputs<48, 6, 1>.exit.preheader", label %1

"get_inputs<48, 6, 1>.exit.preheader":            ; preds = %0
  br label %"get_inputs<48, 6, 1>.exit"

; <label>:1                                       ; preds = %0
  %tmp_2 = call i1 @_ssdm_op_BitSelect.i1.i48.i32(i48 %inputData_in_V_read_1, i32 %index_assign_11_cast)
  %p_Repl2_4 = zext i1 %tmp_2 to i64
  %p_Result_s = call i48 @_ssdm_op_BitSet.i48.i48.i32.i64(i48 %x_in_V, i32 %index_assign_11_cast, i64 %p_Repl2_4)
  br label %0

"get_inputs<48, 6, 1>.exit":                      ; preds = %"get_inputs<48, 6, 1>.exit.preheader", %_ifconv
  %p_Val2_s = phi i50 [ %p_050_6_i, %_ifconv ], [ undef, %"get_inputs<48, 6, 1>.exit.preheader" ]
  %i1_0_i = phi i6 [ %i, %_ifconv ], [ 0, %"get_inputs<48, 6, 1>.exit.preheader" ]
  %i1_0_i_cast = zext i6 %i1_0_i to i7
  %exitcond_i = icmp eq i6 %i1_0_i, -14
  %empty_12 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 50, i64 50, i64 50)
  %i = add i6 %i1_0_i, 1
  br i1 %exitcond_i, label %.preheader.i.preheader, label %_ifconv

.preheader.i.preheader:                           ; preds = %"get_inputs<48, 6, 1>.exit"
  %p_Val2_4 = alloca i50
  store i50 1, i50* %p_Val2_4
  br label %.preheader.i

_ifconv:                                          ; preds = %"get_inputs<48, 6, 1>.exit"
  call void (...)* @_ssdm_op_SpecLoopName([19 x i8]* @p_str278) nounwind
  %tmp = icmp eq i6 %i1_0_i, 0
  %p_Result_9 = call i50 @_ssdm_op_BitSet.i50.i50.i32.i1(i50 %p_Val2_s, i32 49, i1 false)
  %tmp_1 = icmp ult i6 %i1_0_i, -15
  %bvh_d_index_1 = sub i6 -15, %i1_0_i
  %index_assign_cast = zext i6 %bvh_d_index_1 to i32
  %bvh_d_index_2 = sub i7 48, %i1_0_i_cast
  %index_assign_12_cast = sext i7 %bvh_d_index_2 to i32
  %tmp_7 = call i1 @_ssdm_op_BitSelect.i1.i48.i32(i48 %x_in_V, i32 %index_assign_12_cast)
  %p_Repl2_s = zext i1 %tmp_7 to i64
  %p_Result_10 = call i50 @_ssdm_op_BitSet.i50.i50.i32.i64(i50 %p_Val2_s, i32 %index_assign_cast, i64 %p_Repl2_s)
  %p_Result_11 = call i50 @_ssdm_op_BitSet.i50.i50.i32.i64(i50 %p_Val2_s, i32 %index_assign_cast, i64 0)
  %sel_tmp = select i1 %tmp, i50 %p_Result_9, i50 %p_Result_11
  %sel_tmp1 = xor i1 %tmp, true
  %sel_tmp2 = and i1 %tmp_1, %sel_tmp1
  %p_050_6_i = select i1 %sel_tmp2, i50 %p_Result_10, i50 %sel_tmp
  br label %"get_inputs<48, 6, 1>.exit"

.preheader.i:                                     ; preds = %.preheader.i.preheader, %_ifconv4
  %data_x_outp_V = phi i25 [ %sqrt_int_V, %_ifconv4 ], [ 0, %.preheader.i.preheader ]
  %p_0289_0_i = phi i50 [ %p_0289_2_i, %_ifconv4 ], [ 0, %.preheader.i.preheader ]
  %i2_0_i = phi i6 [ %i_2, %_ifconv4 ], [ 24, %.preheader.i.preheader ]
  %tmp_10 = call i1 @_ssdm_op_BitSelect.i1.i6.i32(i6 %i2_0_i, i32 5)
  %empty_13 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 25, i64 25, i64 25)
  br i1 %tmp_10, label %"sqrt_slv<48, 1, 25>.exit.preheader", label %2

"sqrt_slv<48, 1, 25>.exit.preheader":             ; preds = %.preheader.i
  br label %"sqrt_slv<48, 1, 25>.exit"

; <label>:2                                       ; preds = %.preheader.i
  call void (...)* @_ssdm_op_SpecLoopName([15 x i8]* @p_str279) nounwind
  %tmp_5 = call i32 (...)* @_ssdm_op_SpecRegionBegin([15 x i8]* @p_str279)
  br label %3

; <label>:3                                       ; preds = %4, %2
  %p_Val2_3 = phi i50 [ %p_0289_0_i, %2 ], [ %p_Result_12, %4 ]
  %bvh_d_index_4 = phi i6 [ 23, %2 ], [ %j, %4 ]
  %index_assign_14_cast = sext i6 %bvh_d_index_4 to i32
  %tmp_11 = call i1 @_ssdm_op_BitSelect.i1.i6.i32(i6 %bvh_d_index_4, i32 5)
  %empty_14 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 24, i64 24, i64 24)
  br i1 %tmp_11, label %5, label %4

; <label>:4                                       ; preds = %3
  call void (...)* @_ssdm_op_SpecLoopName([9 x i8]* @p_str280) nounwind
  %bvh_d_index_3 = add i6 %bvh_d_index_4, 2
  %index_assign_13_cast = zext i6 %bvh_d_index_3 to i32
  %tmp_17 = call i1 @_ssdm_op_BitSelect.i1.i50.i32(i50 %p_Val2_3, i32 %index_assign_14_cast)
  %p_Repl2_1 = zext i1 %tmp_17 to i64
  %p_Result_12 = call i50 @_ssdm_op_BitSet.i50.i50.i32.i64(i50 %p_Val2_3, i32 %index_assign_13_cast, i64 %p_Repl2_1)
  %j = add i6 %bvh_d_index_4, -1
  br label %3

; <label>:5                                       ; preds = %3
  %bvh_d_index_7 = shl i6 %i2_0_i, 1
  %index_assign_16_cast = zext i6 %bvh_d_index_7 to i32
  %bvh_d_index_5 = or i6 %bvh_d_index_7, 1
  %index_assign_15_cast = zext i6 %bvh_d_index_5 to i32
  %tmp_15 = call i1 @_ssdm_op_BitSelect.i1.i50.i32(i50 %p_Val2_s, i32 %index_assign_15_cast)
  %tmp_16 = call i1 @_ssdm_op_BitSelect.i1.i50.i32(i50 %p_Val2_s, i32 %index_assign_16_cast)
  %tmp_6 = call i2 @_ssdm_op_BitConcatenate.i2.i1.i1(i1 %tmp_15, i1 %tmp_16)
  %p_Result_13 = call i50 @_ssdm_op_PartSet.i50.i50.i2.i32.i32(i50 %p_Val2_3, i2 %tmp_6, i32 0, i32 1)
  br label %6

; <label>:6                                       ; preds = %7, %5
  %bvh_d_index_9 = phi i6 [ 22, %5 ], [ %j_1, %7 ]
  %index_assign_18_cast = sext i6 %bvh_d_index_9 to i32
  %tmp_19 = call i1 @_ssdm_op_BitSelect.i1.i6.i32(i6 %bvh_d_index_9, i32 5)
  %empty_15 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 23, i64 23, i64 23)
  br i1 %tmp_19, label %8, label %7

; <label>:7                                       ; preds = %6
  %p_Val2_4_load_1 = load i50* %p_Val2_4
  call void (...)* @_ssdm_op_SpecLoopName([10 x i8]* @p_str281) nounwind
  %bvh_d_index_8 = add i6 %bvh_d_index_9, 2
  %index_assign_17_cast = zext i6 %bvh_d_index_8 to i32
  %tmp_20 = call i1 @_ssdm_op_BitSelect.i1.i25.i32(i25 %data_x_outp_V, i32 %index_assign_18_cast)
  %p_Repl2_2 = zext i1 %tmp_20 to i64
  %p_Result_14 = call i50 @_ssdm_op_BitSet.i50.i50.i32.i64(i50 %p_Val2_4_load_1, i32 %index_assign_17_cast, i64 %p_Repl2_2)
  %j_1 = add i6 %bvh_d_index_9, -1
  store i50 %p_Result_14, i50* %p_Val2_4
  br label %6

; <label>:8                                       ; preds = %6
  %p_Val2_4_load = load i50* %p_Val2_4
  %rem_next_V = sub i50 %p_Result_13, %p_Val2_4_load
  br label %9

; <label>:9                                       ; preds = %10, %8
  %p_Val2_6 = phi i25 [ %data_x_outp_V, %8 ], [ %p_Result_15, %10 ]
  %bvh_d_index_11 = phi i6 [ 23, %8 ], [ %j_2, %10 ]
  %index_assign_20_cast = sext i6 %bvh_d_index_11 to i32
  %tmp_22 = call i1 @_ssdm_op_BitSelect.i1.i6.i32(i6 %bvh_d_index_11, i32 5)
  %empty_16 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 24, i64 24, i64 24)
  br i1 %tmp_22, label %_ifconv4, label %10

; <label>:10                                      ; preds = %9
  call void (...)* @_ssdm_op_SpecLoopName([14 x i8]* @p_str282) nounwind
  %bvh_d_index_10 = add i6 %bvh_d_index_11, 1
  %index_assign_19_cast = zext i6 %bvh_d_index_10 to i32
  %tmp_25 = call i1 @_ssdm_op_BitSelect.i1.i25.i32(i25 %p_Val2_6, i32 %index_assign_20_cast)
  %p_Repl2_3 = zext i1 %tmp_25 to i64
  %p_Result_15 = call i25 @_ssdm_op_BitSet.i25.i25.i32.i64(i25 %p_Val2_6, i32 %index_assign_19_cast, i64 %p_Repl2_3)
  %j_2 = add i6 %bvh_d_index_11, -1
  br label %9

_ifconv4:                                         ; preds = %9
  %tmp_23 = call i1 @_ssdm_op_BitSelect.i1.i50.i32(i50 %rem_next_V, i32 25)
  %not_Result_s = xor i1 %tmp_23, true
  %sqrt_int_V = call i25 @_ssdm_op_BitSet.i25.i25.i32.i1(i25 %p_Val2_6, i32 0, i1 %not_Result_s)
  %p_0289_2_i = select i1 %tmp_23, i50 %p_Result_13, i50 %rem_next_V
  %empty_17 = call i32 (...)* @_ssdm_op_SpecRegionEnd([15 x i8]* @p_str279, i32 %tmp_5)
  %i_2 = add i6 %i2_0_i, -1
  br label %.preheader.i

"sqrt_slv<48, 1, 25>.exit":                       ; preds = %"sqrt_slv<48, 1, 25>.exit.preheader", %11
  %p_Val2_7 = phi i25 [ %p_Result_4, %11 ], [ undef, %"sqrt_slv<48, 1, 25>.exit.preheader" ]
  %bvh_d_index_6 = phi i5 [ %bit_1, %11 ], [ 0, %"sqrt_slv<48, 1, 25>.exit.preheader" ]
  %index_assign_21_cast = zext i5 %bvh_d_index_6 to i32
  %exitcond_i6 = icmp eq i5 %bvh_d_index_6, -7
  %empty_18 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 25, i64 25, i64 25)
  %bit_1 = add i5 %bvh_d_index_6, 1
  br i1 %exitcond_i6, label %"set_outputs<25, 6, 1>.exit", label %11

; <label>:11                                      ; preds = %"sqrt_slv<48, 1, 25>.exit"
  %tmp_12 = call i1 @_ssdm_op_BitSelect.i1.i25.i32(i25 %data_x_outp_V, i32 %index_assign_21_cast)
  %p_Repl2_5 = zext i1 %tmp_12 to i64
  %p_Result_4 = call i25 @_ssdm_op_BitSet.i25.i25.i32.i64(i25 %p_Val2_7, i32 %index_assign_21_cast, i64 %p_Repl2_5)
  br label %"sqrt_slv<48, 1, 25>.exit"

"set_outputs<25, 6, 1>.exit":                     ; preds = %"sqrt_slv<48, 1, 25>.exit"
  ret i25 %p_Val2_7
}

define weak void @_ssdm_op_Write.ap_fifo.volatile.floatP(float*, float) {
entry:
  %empty = call float @_autotb_FifoWrite_float(float* %0, float %1)
  ret void
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecRegionEnd(...) {
entry:
  ret i32 0
}

define weak i32 @_ssdm_op_SpecRegionBegin(...) {
entry:
  ret i32 0
}

define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecLoopName(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i48 @_ssdm_op_Read.ap_auto.i48(i48) {
entry:
  ret i48 %0
}

define weak i50 @_ssdm_op_PartSet.i50.i50.i2.i32.i32(i50, i2, i32, i32) nounwind readnone {
entry:
  %empty = call i50 @llvm.part.set.i50.i2(i50 %0, i2 %1, i32 %2, i32 %3)
  ret i50 %empty
}

define weak i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_19 = trunc i32 %empty to i8
  ret i8 %empty_19
}

declare i5 @_ssdm_op_PartSelect.i5.i6.i32.i32(i6, i32, i32) nounwind readnone

declare i1 @_ssdm_op_PartSelect.i1.i10.i32.i32(i10, i32, i32) nounwind readnone

define weak i50 @_ssdm_op_BitSet.i50.i50.i32.i64(i50, i32, i64) nounwind readnone {
entry:
  %empty = icmp ne i64 %2, 0
  %empty_20 = zext i1 %empty to i50
  %empty_21 = zext i32 %1 to i50
  %empty_22 = shl i50 %empty_20, %empty_21
  %empty_23 = shl i50 1, %empty_21
  %empty_24 = xor i50 %empty_23, -1
  %empty_25 = and i50 %empty_24, %0
  %empty_26 = or i50 %empty_22, %empty_25
  ret i50 %empty_26
}

define weak i50 @_ssdm_op_BitSet.i50.i50.i32.i1(i50, i32, i1) nounwind readnone {
entry:
  %empty = icmp ne i1 %2, false
  %empty_27 = zext i1 %empty to i50
  %empty_28 = zext i32 %1 to i50
  %empty_29 = shl i50 %empty_27, %empty_28
  %empty_30 = shl i50 1, %empty_28
  %empty_31 = xor i50 %empty_30, -1
  %empty_32 = and i50 %empty_31, %0
  %empty_33 = or i50 %empty_29, %empty_32
  ret i50 %empty_33
}

define weak i48 @_ssdm_op_BitSet.i48.i48.i32.i64(i48, i32, i64) nounwind readnone {
entry:
  %empty = icmp ne i64 %2, 0
  %empty_34 = zext i1 %empty to i48
  %empty_35 = zext i32 %1 to i48
  %empty_36 = shl i48 %empty_34, %empty_35
  %empty_37 = shl i48 1, %empty_35
  %empty_38 = xor i48 %empty_37, -1
  %empty_39 = and i48 %empty_38, %0
  %empty_40 = or i48 %empty_36, %empty_39
  ret i48 %empty_40
}

define weak i25 @_ssdm_op_BitSet.i25.i25.i32.i64(i25, i32, i64) nounwind readnone {
entry:
  %empty = icmp ne i64 %2, 0
  %empty_41 = zext i1 %empty to i25
  %empty_42 = trunc i32 %1 to i25
  %empty_43 = shl i25 %empty_41, %empty_42
  %empty_44 = shl i25 1, %empty_42
  %empty_45 = xor i25 %empty_44, -1
  %empty_46 = and i25 %empty_45, %0
  %empty_47 = or i25 %empty_43, %empty_46
  ret i25 %empty_47
}

define weak i25 @_ssdm_op_BitSet.i25.i25.i32.i1(i25, i32, i1) nounwind readnone {
entry:
  %empty = icmp ne i1 %2, false
  %empty_48 = zext i1 %empty to i25
  %empty_49 = trunc i32 %1 to i25
  %empty_50 = shl i25 %empty_48, %empty_49
  %empty_51 = shl i25 1, %empty_49
  %empty_52 = xor i25 %empty_51, -1
  %empty_53 = and i25 %empty_52, %0
  %empty_54 = or i25 %empty_50, %empty_53
  ret i25 %empty_54
}

define weak i1 @_ssdm_op_BitSelect.i1.i6.i32(i6, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i6
  %empty_55 = shl i6 1, %empty
  %empty_56 = and i6 %0, %empty_55
  %empty_57 = icmp ne i6 %empty_56, 0
  ret i1 %empty_57
}

define weak i1 @_ssdm_op_BitSelect.i1.i50.i32(i50, i32) nounwind readnone {
entry:
  %empty = zext i32 %1 to i50
  %empty_58 = shl i50 1, %empty
  %empty_59 = and i50 %0, %empty_58
  %empty_60 = icmp ne i50 %empty_59, 0
  ret i1 %empty_60
}

define weak i1 @_ssdm_op_BitSelect.i1.i48.i32(i48, i32) nounwind readnone {
entry:
  %empty = zext i32 %1 to i48
  %empty_61 = shl i48 1, %empty
  %empty_62 = and i48 %0, %empty_61
  %empty_63 = icmp ne i48 %empty_62, 0
  ret i1 %empty_63
}

define weak i1 @_ssdm_op_BitSelect.i1.i25.i32(i25, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i25
  %empty_64 = shl i25 1, %empty
  %empty_65 = and i25 %0, %empty_64
  %empty_66 = icmp ne i25 %empty_65, 0
  ret i1 %empty_66
}

declare i6 @_ssdm_op_BitConcatenate.i6.i5.i1(i5, i1) nounwind readnone

define weak i48 @_ssdm_op_BitConcatenate.i48.i1.i47(i1, i47) nounwind readnone {
entry:
  %empty = zext i1 %0 to i48
  %empty_67 = zext i47 %1 to i48
  %empty_68 = shl i48 %empty, 47
  %empty_69 = or i48 %empty_68, %empty_67
  ret i48 %empty_69
}

define weak i2 @_ssdm_op_BitConcatenate.i2.i1.i1(i1, i1) nounwind readnone {
entry:
  %empty = zext i1 %0 to i2
  %empty_70 = zext i1 %1 to i2
  %empty_71 = shl i2 %empty, 1
  %empty_72 = or i2 %empty_71, %empty_70
  ret i2 %empty_72
}

declare float @_autotb_FifoWrite_float(float*, float)

declare void @_GLOBAL__I_a() nounwind section ".text.startup"

!opencl.kernels = !{!0, !7, !7, !7, !13, !17, !23, !23, !7, !26, !7, !7, !7, !29, !7, !7, !32, !35, !38, !41, !43, !49, !7, !52, !54, !56, !56, !60, !63, !7, !52, !49, !65, !7, !7, !7, !67, !67, !69, !69, !7, !7, !71, !49, !73, !75, !76, !76, !78, !7, !52, !75, !80, !80, !82, !82, !83, !86, !88, !7, !7, !7, !90, !90, !92, !92, !94, !94, !7, !7, !96, !99, !7, !7, !7, !101, !101, !90, !90, !102, !102, !7, !7, !104, !7, !90, !90, !82, !82, !105, !107, !110, !110, !116, !116, !116, !7, !7, !7, !7, !7, !7, !7, !7, !119, !26, !121, !7, !7, !7, !123, !123, !7, !7, !7, !75, !125, !125, !127, !129, !129, !132, !132, !132, !7, !92, !92, !7, !7, !23, !23, !7, !134, !7, !92, !92, !7, !136, !134, !26, !121, !26, !138, !7, !140, !7, !52, !82, !82, !142, !7, !49, !52, !75, !144, !144, !146, !7, !7, !92, !92, !146, !148, !148, !134, !26, !150, !150, !150, !7, !152, !7, !7, !7, !148, !148, !154, !7, !7, !52, !75, !156, !156, !49, !107, !158, !158, !160, !26, !162, !162, !7, !7, !7, !7, !164, !52, !165, !165, !107, !167, !167, !7, !52, !75, !169, !169, !75, !171, !171, !173, !7, !75, !175, !175, !177, !92, !92, !177, !179, !179, !181, !181, !183, !82, !82, !185, !7, !7, !7, !187, !187, !189, !190, !82, !82, !193, !54, !195, !195, !197, !7, !52, !199, !201, !204, !75, !206, !206, !208, !7, !210, !26, !212, !7, !7, !7, !214, !214, !216, !216, !218, !218, !7, !7, !220, !222, !101, !101, !218, !218, !7, !7, !210, !26, !224, !7, !214, !214, !82, !82, !225, !107, !227, !227, !229, !229, !229, !7, !7, !7, !7, !7, !7, !231, !231, !82, !82, !233, !7, !7, !234, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !236, !236, !238, !82, !82, !7, !7, !238, !107, !107, !240, !240, !242, !242, !242, !7, !244, !244, !246, !7, !248, !250, !250, !252, !254, !254, !256, !256, !246, !231, !231, !258, !258, !258, !258, !258, !258, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7, !7}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!262}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 1}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"float*"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"returnValue"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{null, metadata !8, metadata !9, metadata !10, metadata !11, metadata !12, metadata !6}
!8 = metadata !{metadata !"kernel_arg_addr_space"}
!9 = metadata !{metadata !"kernel_arg_access_qual"}
!10 = metadata !{metadata !"kernel_arg_type"}
!11 = metadata !{metadata !"kernel_arg_type_qual"}
!12 = metadata !{metadata !"kernel_arg_name"}
!13 = metadata !{null, metadata !14, metadata !2, metadata !15, metadata !4, metadata !16, metadata !6}
!14 = metadata !{metadata !"kernel_arg_addr_space", i32 0}
!15 = metadata !{metadata !"kernel_arg_type", metadata !"uint"}
!16 = metadata !{metadata !"kernel_arg_name", metadata !"pi"}
!17 = metadata !{null, metadata !18, metadata !19, metadata !20, metadata !21, metadata !22, metadata !6}
!18 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0}
!19 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none"}
!20 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<8, true> &", metadata !"int"}
!21 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !""}
!22 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"op2"}
!23 = metadata !{null, metadata !14, metadata !2, metadata !24, metadata !4, metadata !25, metadata !6}
!24 = metadata !{metadata !"kernel_arg_type", metadata !"int"}
!25 = metadata !{metadata !"kernel_arg_name", metadata !"op"}
!26 = metadata !{null, metadata !14, metadata !2, metadata !27, metadata !4, metadata !28, metadata !6}
!27 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<32, true> &"}
!28 = metadata !{metadata !"kernel_arg_name", metadata !"op2"}
!29 = metadata !{null, metadata !14, metadata !2, metadata !30, metadata !4, metadata !31, metadata !6}
!30 = metadata !{metadata !"kernel_arg_type", metadata !"float"}
!31 = metadata !{metadata !"kernel_arg_name", metadata !"pf"}
!32 = metadata !{null, metadata !18, metadata !19, metadata !33, metadata !21, metadata !34, metadata !6}
!33 = metadata !{metadata !"kernel_arg_type", metadata !"const typename sqrt_input<48, 1>::in &", metadata !"typename sqrt_output<25, 1>::out &"}
!34 = metadata !{metadata !"kernel_arg_name", metadata !"x", metadata !"sqrtX"}
!35 = metadata !{null, metadata !18, metadata !19, metadata !36, metadata !21, metadata !37, metadata !6}
!36 = metadata !{metadata !"kernel_arg_type", metadata !"const cordic_inputs<48, 6, 1> &", metadata !"cordic_outputs<25, 6, 1> &"}
!37 = metadata !{metadata !"kernel_arg_name", metadata !"inputData", metadata !"outputData"}
!38 = metadata !{null, metadata !14, metadata !2, metadata !39, metadata !4, metadata !40, metadata !6}
!39 = metadata !{metadata !"kernel_arg_type", metadata !"const struct hls::cordic_outputs<25, 6, 1> &"}
!40 = metadata !{metadata !"kernel_arg_name", metadata !""}
!41 = metadata !{null, metadata !14, metadata !2, metadata !42, metadata !4, metadata !25, metadata !6}
!42 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<25, 1, (enum ap_q_mode)6, (enum ap_o_mode)3, 0> &"}
!43 = metadata !{null, metadata !44, metadata !45, metadata !46, metadata !47, metadata !48, metadata !6}
!44 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0}
!45 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!46 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int<25>", metadata !"ap_int<25>", metadata !"ap_int<25>", metadata !"cordic_outputs<25, CORDIC_F_SQRT, 1> &"}
!47 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !""}
!48 = metadata !{metadata !"kernel_arg_name", metadata !"data_x_outp", metadata !"data_y_outp", metadata !"phase_outp", metadata !"dout"}
!49 = metadata !{null, metadata !14, metadata !2, metadata !50, metadata !4, metadata !51, metadata !6}
!50 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_bit_ref<25, true> &"}
!51 = metadata !{metadata !"kernel_arg_name", metadata !"val"}
!52 = metadata !{null, metadata !14, metadata !2, metadata !53, metadata !4, metadata !51, metadata !6}
!53 = metadata !{metadata !"kernel_arg_type", metadata !"ulong long"}
!54 = metadata !{null, metadata !14, metadata !2, metadata !15, metadata !4, metadata !55, metadata !6}
!55 = metadata !{metadata !"kernel_arg_name", metadata !"index"}
!56 = metadata !{null, metadata !57, metadata !19, metadata !58, metadata !21, metadata !59, metadata !6}
!57 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0}
!58 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed_base<25, 1, false, (enum ap_q_mode)6, (enum ap_o_mode)3, 0>*", metadata !"int"}
!59 = metadata !{metadata !"kernel_arg_name", metadata !"bv", metadata !"index"}
!60 = metadata !{null, metadata !14, metadata !2, metadata !61, metadata !4, metadata !62, metadata !6}
!61 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int<48>"}
!62 = metadata !{metadata !"kernel_arg_name", metadata !"data_in"}
!63 = metadata !{null, metadata !18, metadata !19, metadata !64, metadata !21, metadata !22, metadata !6}
!64 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_bit_ref<50, true> &", metadata !"int"}
!65 = metadata !{null, metadata !18, metadata !19, metadata !66, metadata !21, metadata !22, metadata !6}
!66 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<50, true> &", metadata !"const ap_int_base<50, true> &"}
!67 = metadata !{null, metadata !14, metadata !2, metadata !68, metadata !4, metadata !25, metadata !6}
!68 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<50, true> &"}
!69 = metadata !{null, metadata !14, metadata !2, metadata !70, metadata !4, metadata !25, metadata !6}
!70 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<51, true> &"}
!71 = metadata !{null, metadata !14, metadata !2, metadata !72, metadata !4, metadata !28, metadata !6}
!72 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int<50> &"}
!73 = metadata !{null, metadata !14, metadata !2, metadata !74, metadata !4, metadata !51, metadata !6}
!74 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_bit_ref<50, true> &"}
!75 = metadata !{null, metadata !14, metadata !2, metadata !24, metadata !4, metadata !55, metadata !6}
!76 = metadata !{null, metadata !57, metadata !19, metadata !77, metadata !21, metadata !59, metadata !6}
!77 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<48, true>*", metadata !"int"}
!78 = metadata !{null, metadata !14, metadata !2, metadata !79, metadata !4, metadata !51, metadata !6}
!79 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_bit_ref<48, true> &"}
!80 = metadata !{null, metadata !57, metadata !19, metadata !81, metadata !21, metadata !59, metadata !6}
!81 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<50, true>*", metadata !"int"}
!82 = metadata !{null, metadata !14, metadata !2, metadata !24, metadata !4, metadata !51, metadata !6}
!83 = metadata !{null, metadata !44, metadata !45, metadata !84, metadata !47, metadata !85, metadata !6}
!84 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int<25>", metadata !"int", metadata !"int", metadata !"int"}
!85 = metadata !{metadata !"kernel_arg_name", metadata !"a", metadata !"len", metadata !"mode", metadata !"precision"}
!86 = metadata !{null, metadata !18, metadata !19, metadata !87, metadata !21, metadata !22, metadata !6}
!87 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_bit_ref<25, true> &", metadata !"int"}
!88 = metadata !{null, metadata !18, metadata !19, metadata !89, metadata !21, metadata !22, metadata !6}
!89 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<25, true> &", metadata !"const ap_int_base<26, false> &"}
!90 = metadata !{null, metadata !14, metadata !2, metadata !91, metadata !4, metadata !25, metadata !6}
!91 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<26, false> &"}
!92 = metadata !{null, metadata !14, metadata !2, metadata !93, metadata !4, metadata !25, metadata !6}
!93 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<25, true> &"}
!94 = metadata !{null, metadata !14, metadata !2, metadata !95, metadata !4, metadata !25, metadata !6}
!95 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<28, true> &"}
!96 = metadata !{null, metadata !18, metadata !19, metadata !97, metadata !21, metadata !98, metadata !6}
!97 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<26, false> &", metadata !"int"}
!98 = metadata !{metadata !"kernel_arg_name", metadata !"op", metadata !"i_op"}
!99 = metadata !{null, metadata !18, metadata !19, metadata !100, metadata !21, metadata !22, metadata !6}
!100 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<26, false> &", metadata !"const ap_int_base<32, true> &"}
!101 = metadata !{null, metadata !14, metadata !2, metadata !27, metadata !4, metadata !25, metadata !6}
!102 = metadata !{null, metadata !14, metadata !2, metadata !103, metadata !4, metadata !25, metadata !6}
!103 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<33, true> &"}
!104 = metadata !{null, metadata !18, metadata !19, metadata !97, metadata !21, metadata !22, metadata !6}
!105 = metadata !{null, metadata !14, metadata !2, metadata !106, metadata !4, metadata !28, metadata !6}
!106 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<26> &"}
!107 = metadata !{null, metadata !18, metadata !19, metadata !108, metadata !21, metadata !109, metadata !6}
!108 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"int"}
!109 = metadata !{metadata !"kernel_arg_name", metadata !"Hi", metadata !"Lo"}
!110 = metadata !{null, metadata !111, metadata !112, metadata !113, metadata !114, metadata !115, metadata !6}
!111 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 0, i32 0}
!112 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!113 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<25, true>*", metadata !"int", metadata !"int"}
!114 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !""}
!115 = metadata !{metadata !"kernel_arg_name", metadata !"bv", metadata !"h", metadata !"l"}
!116 = metadata !{null, metadata !14, metadata !2, metadata !117, metadata !4, metadata !118, metadata !6}
!117 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<25, true> &"}
!118 = metadata !{metadata !"kernel_arg_name", metadata !"ref"}
!119 = metadata !{null, metadata !18, metadata !19, metadata !120, metadata !21, metadata !22, metadata !6}
!120 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<2, false> &", metadata !"int"}
!121 = metadata !{null, metadata !18, metadata !19, metadata !122, metadata !21, metadata !22, metadata !6}
!122 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<1, false> &", metadata !"int"}
!123 = metadata !{null, metadata !14, metadata !2, metadata !124, metadata !4, metadata !25, metadata !6}
!124 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<1, false> &"}
!125 = metadata !{null, metadata !57, metadata !19, metadata !126, metadata !21, metadata !59, metadata !6}
!126 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<1, false>*", metadata !"int"}
!127 = metadata !{null, metadata !14, metadata !2, metadata !124, metadata !4, metadata !128, metadata !6}
!128 = metadata !{metadata !"kernel_arg_name", metadata !"a2"}
!129 = metadata !{null, metadata !18, metadata !19, metadata !130, metadata !21, metadata !131, metadata !6}
!130 = metadata !{metadata !"kernel_arg_type", metadata !"struct ap_int_base<25, true, true> &", metadata !"struct ap_int_base<1, false, true> &"}
!131 = metadata !{metadata !"kernel_arg_name", metadata !"bv1", metadata !"bv2"}
!132 = metadata !{null, metadata !14, metadata !2, metadata !133, metadata !4, metadata !118, metadata !6}
!133 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_concat_ref<25, struct ap_int_base<25, true, true>, 1, struct ap_int_base<1, false, true> > &"}
!134 = metadata !{null, metadata !18, metadata !19, metadata !135, metadata !21, metadata !22, metadata !6}
!135 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<25, true> &", metadata !"int"}
!136 = metadata !{null, metadata !18, metadata !19, metadata !108, metadata !21, metadata !137, metadata !6}
!137 = metadata !{metadata !"kernel_arg_name", metadata !"i", metadata !"transform_type"}
!138 = metadata !{null, metadata !14, metadata !2, metadata !139, metadata !4, metadata !28, metadata !6}
!139 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<1> &"}
!140 = metadata !{null, metadata !14, metadata !2, metadata !141, metadata !4, metadata !51, metadata !6}
!141 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_bit_ref<2, false> &"}
!142 = metadata !{null, metadata !14, metadata !2, metadata !143, metadata !4, metadata !28, metadata !6}
!143 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<2> &"}
!144 = metadata !{null, metadata !57, metadata !19, metadata !145, metadata !21, metadata !59, metadata !6}
!145 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<3, false>*", metadata !"int"}
!146 = metadata !{null, metadata !18, metadata !19, metadata !147, metadata !21, metadata !22, metadata !6}
!147 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<25, true> &", metadata !"const ap_int_base<25, true> &"}
!148 = metadata !{null, metadata !14, metadata !2, metadata !149, metadata !4, metadata !25, metadata !6}
!149 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<26, true> &"}
!150 = metadata !{null, metadata !14, metadata !2, metadata !151, metadata !4, metadata !118, metadata !6}
!151 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<26, true> &"}
!152 = metadata !{null, metadata !18, metadata !19, metadata !153, metadata !21, metadata !22, metadata !6}
!153 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<26, true> &", metadata !"const ap_int_base<26, true> &"}
!154 = metadata !{null, metadata !14, metadata !2, metadata !155, metadata !4, metadata !51, metadata !6}
!155 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_bit_ref<4, false> &"}
!156 = metadata !{null, metadata !57, metadata !19, metadata !157, metadata !21, metadata !59, metadata !6}
!157 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<25, true>*", metadata !"int"}
!158 = metadata !{null, metadata !111, metadata !112, metadata !159, metadata !114, metadata !115, metadata !6}
!159 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<4, false>*", metadata !"int", metadata !"int"}
!160 = metadata !{null, metadata !18, metadata !19, metadata !161, metadata !21, metadata !22, metadata !6}
!161 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<4, false> &", metadata !"int"}
!162 = metadata !{null, metadata !14, metadata !2, metadata !163, metadata !4, metadata !118, metadata !6}
!163 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<4, false> &"}
!164 = metadata !{null, metadata !14, metadata !2, metadata !124, metadata !4, metadata !51, metadata !6}
!165 = metadata !{null, metadata !14, metadata !2, metadata !166, metadata !4, metadata !25, metadata !6}
!166 = metadata !{metadata !"kernel_arg_type", metadata !"ap_ulong"}
!167 = metadata !{null, metadata !111, metadata !112, metadata !168, metadata !114, metadata !115, metadata !6}
!168 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<26, true>*", metadata !"int", metadata !"int"}
!169 = metadata !{null, metadata !57, metadata !19, metadata !170, metadata !21, metadata !59, metadata !6}
!170 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<2, false>*", metadata !"int"}
!171 = metadata !{null, metadata !57, metadata !19, metadata !172, metadata !21, metadata !59, metadata !6}
!172 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<26, true>*", metadata !"int"}
!173 = metadata !{null, metadata !14, metadata !2, metadata !174, metadata !4, metadata !51, metadata !6}
!174 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_bit_ref<26, true> &"}
!175 = metadata !{null, metadata !57, metadata !19, metadata !176, metadata !21, metadata !59, metadata !6}
!176 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<4, false>*", metadata !"int"}
!177 = metadata !{null, metadata !18, metadata !19, metadata !178, metadata !21, metadata !22, metadata !6}
!178 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<26, true> &", metadata !"const ap_int_base<25, true> &"}
!179 = metadata !{null, metadata !14, metadata !2, metadata !180, metadata !4, metadata !25, metadata !6}
!180 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<27, true> &"}
!181 = metadata !{null, metadata !14, metadata !2, metadata !182, metadata !4, metadata !25, metadata !6}
!182 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int<25> &"}
!183 = metadata !{null, metadata !14, metadata !2, metadata !184, metadata !4, metadata !28, metadata !6}
!184 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int<26> &"}
!185 = metadata !{null, metadata !18, metadata !19, metadata !186, metadata !21, metadata !22, metadata !6}
!186 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<48, true> &", metadata !"int"}
!187 = metadata !{null, metadata !14, metadata !2, metadata !188, metadata !4, metadata !25, metadata !6}
!188 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<48, true> &"}
!189 = metadata !{null, metadata !14, metadata !2, metadata !182, metadata !4, metadata !28, metadata !6}
!190 = metadata !{null, metadata !44, metadata !45, metadata !191, metadata !47, metadata !192, metadata !6}
!191 = metadata !{metadata !"kernel_arg_type", metadata !"cordic_inputs<48, CORDIC_F_SQRT, 1>", metadata !"ap_int<48> &", metadata !"ap_int<48> &", metadata !"ap_int<48> &"}
!192 = metadata !{metadata !"kernel_arg_name", metadata !"din", metadata !"x_in", metadata !"y_in", metadata !"phase_in"}
!193 = metadata !{null, metadata !14, metadata !2, metadata !194, metadata !4, metadata !28, metadata !6}
!194 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int<48> &"}
!195 = metadata !{null, metadata !57, metadata !19, metadata !196, metadata !21, metadata !59, metadata !6}
!196 = metadata !{metadata !"kernel_arg_type", metadata !"ap_fixed_base<48, 1, false, (enum ap_q_mode)6, (enum ap_o_mode)3, 0>*", metadata !"int"}
!197 = metadata !{null, metadata !14, metadata !2, metadata !198, metadata !4, metadata !51, metadata !6}
!198 = metadata !{metadata !"kernel_arg_type", metadata !"const af_bit_ref<48, 1, false, (enum ap_q_mode)6, (enum ap_o_mode)3, 0> &"}
!199 = metadata !{null, metadata !14, metadata !2, metadata !200, metadata !4, metadata !40, metadata !6}
!200 = metadata !{metadata !"kernel_arg_type", metadata !"const struct hls::cordic_inputs<48, 6, 1> &"}
!201 = metadata !{null, metadata !1, metadata !2, metadata !202, metadata !4, metadata !203, metadata !6}
!202 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int<c_precision_int<6, false, 1, 48, 0, 25, 0, 0>::prec>*"}
!203 = metadata !{metadata !"kernel_arg_name", metadata !"eng_rom_vect"}
!204 = metadata !{null, metadata !44, metadata !45, metadata !205, metadata !47, metadata !85, metadata !6}
!205 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int<72>", metadata !"int", metadata !"int", metadata !"int"}
!206 = metadata !{null, metadata !57, metadata !19, metadata !207, metadata !21, metadata !59, metadata !6}
!207 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<72, true>*", metadata !"int"}
!208 = metadata !{null, metadata !18, metadata !19, metadata !209, metadata !21, metadata !22, metadata !6}
!209 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_bit_ref<72, true> &", metadata !"int"}
!210 = metadata !{null, metadata !18, metadata !19, metadata !211, metadata !21, metadata !22, metadata !6}
!211 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<72, true> &", metadata !"int"}
!212 = metadata !{null, metadata !18, metadata !19, metadata !213, metadata !21, metadata !22, metadata !6}
!213 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<72, true> &", metadata !"const ap_int_base<73, false> &"}
!214 = metadata !{null, metadata !14, metadata !2, metadata !215, metadata !4, metadata !25, metadata !6}
!215 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<73, false> &"}
!216 = metadata !{null, metadata !14, metadata !2, metadata !217, metadata !4, metadata !25, metadata !6}
!217 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<72, true> &"}
!218 = metadata !{null, metadata !14, metadata !2, metadata !219, metadata !4, metadata !25, metadata !6}
!219 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<75, true> &"}
!220 = metadata !{null, metadata !18, metadata !19, metadata !221, metadata !21, metadata !98, metadata !6}
!221 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<73, false> &", metadata !"int"}
!222 = metadata !{null, metadata !18, metadata !19, metadata !223, metadata !21, metadata !22, metadata !6}
!223 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int_base<73, false> &", metadata !"const ap_int_base<32, true> &"}
!224 = metadata !{null, metadata !18, metadata !19, metadata !221, metadata !21, metadata !22, metadata !6}
!225 = metadata !{null, metadata !14, metadata !2, metadata !226, metadata !4, metadata !28, metadata !6}
!226 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<73> &"}
!227 = metadata !{null, metadata !111, metadata !112, metadata !228, metadata !114, metadata !115, metadata !6}
!228 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<72, true>*", metadata !"int", metadata !"int"}
!229 = metadata !{null, metadata !14, metadata !2, metadata !230, metadata !4, metadata !118, metadata !6}
!230 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<72, true> &"}
!231 = metadata !{null, metadata !14, metadata !2, metadata !232, metadata !4, metadata !25, metadata !6}
!232 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_int<72> &"}
!233 = metadata !{null, metadata !14, metadata !2, metadata !232, metadata !4, metadata !28, metadata !6}
!234 = metadata !{null, metadata !18, metadata !19, metadata !108, metadata !21, metadata !235, metadata !6}
!235 = metadata !{metadata !"kernel_arg_name", metadata !"cordic_function", metadata !"phase_format"}
!236 = metadata !{null, metadata !14, metadata !2, metadata !237, metadata !4, metadata !25, metadata !6}
!237 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_uint<72> &"}
!238 = metadata !{null, metadata !14, metadata !2, metadata !24, metadata !4, metadata !239, metadata !6}
!239 = metadata !{metadata !"kernel_arg_name", metadata !"cordic_func"}
!240 = metadata !{null, metadata !111, metadata !112, metadata !241, metadata !114, metadata !115, metadata !6}
!241 = metadata !{metadata !"kernel_arg_type", metadata !"ap_int_base<72, false>*", metadata !"int", metadata !"int"}
!242 = metadata !{null, metadata !14, metadata !2, metadata !243, metadata !4, metadata !118, metadata !6}
!243 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_range_ref<72, false> &"}
!244 = metadata !{null, metadata !14, metadata !2, metadata !245, metadata !4, metadata !25, metadata !6}
!245 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed<48, 24, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!246 = metadata !{null, metadata !14, metadata !2, metadata !247, metadata !4, metadata !25, metadata !6}
!247 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<48, 24, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!248 = metadata !{null, metadata !14, metadata !2, metadata !249, metadata !4, metadata !25, metadata !6}
!249 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_ufixed<48, 1, (enum ap_q_mode)6, (enum ap_o_mode)3, 0> &"}
!250 = metadata !{null, metadata !14, metadata !2, metadata !24, metadata !4, metadata !251, metadata !6}
!251 = metadata !{metadata !"kernel_arg_name", metadata !"v"}
!252 = metadata !{null, metadata !14, metadata !2, metadata !24, metadata !4, metadata !253, metadata !6}
!253 = metadata !{metadata !"kernel_arg_name", metadata !"b"}
!254 = metadata !{null, metadata !14, metadata !2, metadata !24, metadata !4, metadata !255, metadata !6}
!255 = metadata !{metadata !"kernel_arg_name", metadata !"i_op"}
!256 = metadata !{null, metadata !14, metadata !2, metadata !257, metadata !4, metadata !25, metadata !6}
!257 = metadata !{metadata !"kernel_arg_type", metadata !"const ap_fixed_base<32, 32, true, (enum ap_q_mode)5, (enum ap_o_mode)3, 0> &"}
!258 = metadata !{null, metadata !57, metadata !19, metadata !259, metadata !260, metadata !261, metadata !6}
!259 = metadata !{metadata !"kernel_arg_type", metadata !"char*", metadata !"signed char"}
!260 = metadata !{metadata !"kernel_arg_type_qual", metadata !"const", metadata !""}
!261 = metadata !{metadata !"kernel_arg_name", metadata !"str", metadata !"radix"}
!262 = metadata !{metadata !263, [1 x i32]* @llvm_global_ctors_0}
!263 = metadata !{metadata !264}
!264 = metadata !{i32 0, i32 31, metadata !265}
!265 = metadata !{metadata !266}
!266 = metadata !{metadata !"llvm.global_ctors.0", metadata !267, metadata !"", i32 0, i32 31}
!267 = metadata !{metadata !268}
!268 = metadata !{i32 0, i32 0, i32 1}
!269 = metadata !{metadata !270}
!270 = metadata !{i32 0, i32 31, metadata !271}
!271 = metadata !{metadata !272}
!272 = metadata !{metadata !"returnValue", metadata !273, metadata !"float", i32 0, i32 31}
!273 = metadata !{metadata !274}
!274 = metadata !{i32 0, i32 999, i32 1}
