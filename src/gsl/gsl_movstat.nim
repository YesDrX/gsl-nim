{.deadCodeElim: on.}
when defined(windows):
  const
    libgsl* = "gsl.dll"
elif defined(macosx):
  const
    libgsl* = "libgsl.dylib"
else:
  const
    libgsl* = "libgsl.so"

const
  GSL_SUCCESS* = 0
  GSL_FAILURE* = -1
  GSL_CONTINUE* = -2
  GSL_EDOM* = 1
  GSL_ERANGE* = 2
  GSL_EFAULT* = 3
  GSL_EINVAL* = 4
  GSL_EFAILED* = 5
  GSL_EFACTOR* = 6
  GSL_ESANITY* = 7
  GSL_ENOMEM* = 8
  GSL_EBADFUNC* = 9
  GSL_ERUNAWAY* = 10
  GSL_EMAXITER* = 11
  GSL_EZERODIV* = 12
  GSL_EBADTOL* = 13
  GSL_ETOL* = 14
  GSL_EUNDRFLW* = 15
  GSL_EOVRFLW* = 16
  GSL_ELOSS* = 17
  GSL_EROUND* = 18
  GSL_EBADLEN* = 19
  GSL_ENOTSQR* = 20
  GSL_ESING* = 21
  GSL_EDIVERGE* = 22
  GSL_EUNSUP* = 23
  GSL_EUNIMPL* = 24
  GSL_ECACHE* = 25
  GSL_ETABLE* = 26
  GSL_ENOPROG* = 27
  GSL_ENOPROGJ* = 28
  GSL_ETOLF* = 29
  GSL_ETOLX* = 30
  GSL_ETOLG* = 31
  GSL_EOF* = 32

type
  gsl_prec_t* = cuint

  gsl_function_struct* {.bycopy.} = object
    function*: proc (x: cdouble; params: pointer): cdouble {.cdecl.}
    params*: pointer

  gsl_function* = gsl_function_struct
  gsl_function_fdf_struct* {.bycopy.} = object
    f*: proc (x: cdouble; params: pointer): cdouble {.cdecl.}
    df*: proc (x: cdouble; params: pointer): cdouble {.cdecl.}
    fdf*: proc (x: cdouble; params: pointer; f: ptr cdouble; df: ptr cdouble) {.cdecl.}
    params*: pointer

  gsl_function_fdf* = gsl_function_fdf_struct
  gsl_function_vec_struct* {.bycopy.} = object
    function*: proc (x: cdouble; y: ptr cdouble; params: pointer): cint {.cdecl.}
    params*: pointer

  gsl_function_vec* = gsl_function_vec_struct

  gsl_error_handler_t* = proc (reason: cstring; file: cstring; line: cint; gsl_errno: cint): void {.cdecl.}
  gsl_stream_handler_t* = proc (label: cstring; file: cstring; line: cint;  reason: cstring): void {.cdecl.}

  gsl_complex_packed* = ptr cdouble
  gsl_complex_packed_float* = ptr cfloat
  gsl_complex_packed_long_double* = ptr clongdouble
  gsl_const_complex_packed* = ptr cdouble
  gsl_const_complex_packed_float* = ptr cfloat
  gsl_const_complex_packed_long_double* = ptr clongdouble
  gsl_complex_packed_array* = ptr cdouble
  gsl_complex_packed_array_float* = ptr cfloat
  gsl_complex_packed_array_long_double* = ptr clongdouble
  gsl_const_complex_packed_array* = ptr cdouble
  gsl_const_complex_packed_array_float* = ptr cfloat
  gsl_const_complex_packed_array_long_double* = ptr clongdouble
  gsl_complex_packed_ptr* = ptr cdouble
  gsl_complex_packed_float_ptr* = ptr cfloat
  gsl_complex_packed_long_double_ptr* = ptr clongdouble
  gsl_const_complex_packed_ptr* = ptr cdouble
  gsl_const_complex_packed_float_ptr* = ptr cfloat
  gsl_const_complex_packed_long_double_ptr* = ptr clongdouble
  gsl_complex_long_double* {.bycopy.} = object
    dat*: array[2, clongdouble]

  gsl_complex* {.bycopy.} = object
    dat*: array[2, cdouble]

  gsl_complex_float* {.bycopy.} = object
    dat*: array[2, cfloat]

  gsl_block_long_double_struct* {.bycopy.} = object
    size*: csize_t
    data*: ptr clongdouble

  gsl_block_long_double* = gsl_block_long_double_struct

  gsl_vector_long_double* {.bycopy.} = object
    size*: csize_t
    stride*: csize_t
    data*: ptr clongdouble
    `block`*: ptr gsl_block_long_double
    owner*: cint

  gsl_vector_long_double_view* {.bycopy.} = object
    vector*: gsl_vector_long_double

  gsl_vector_long_double_const_view* {.bycopy.} = object
    vector*: gsl_vector_long_double

  gsl_block_complex_long_double_struct* {.bycopy.} = object
    size*: csize_t
    data*: ptr clongdouble

  gsl_block_complex_long_double* = gsl_block_complex_long_double_struct

  gsl_vector_complex_long_double* {.bycopy.} = object
    size*: csize_t
    stride*: csize_t
    data*: ptr clongdouble
    `block`*: ptr gsl_block_complex_long_double
    owner*: cint

  gsl_vector_complex_long_double_view* {.bycopy.} = object
    vector*: gsl_vector_complex_long_double

  gsl_vector_complex_long_double_const_view* {.bycopy.} = object
    vector*: gsl_vector_complex_long_double

  gsl_block_struct* {.bycopy.} = object
    size*: csize_t
    data*: ptr cdouble

  gsl_block* = gsl_block_struct

  gsl_vector* {.bycopy.} = object
    size*: csize_t
    stride*: csize_t
    data*: ptr cdouble
    `block`*: ptr gsl_block
    owner*: cint

  gsl_vector_view* {.bycopy.} = object
    vector*: gsl_vector

  gsl_vector_const_view* {.bycopy.} = object
    vector*: gsl_vector

  gsl_block_complex_struct* {.bycopy.} = object
    size*: csize_t
    data*: ptr cdouble

  gsl_block_complex* = gsl_block_complex_struct

  gsl_vector_complex* {.bycopy.} = object
    size*: csize_t
    stride*: csize_t
    data*: ptr cdouble
    `block`*: ptr gsl_block_complex
    owner*: cint

  gsl_vector_complex_view* {.bycopy.} = object
    vector*: gsl_vector_complex

  gsl_vector_complex_const_view* {.bycopy.} = object
    vector*: gsl_vector_complex

  gsl_block_float_struct* {.bycopy.} = object
    size*: csize_t
    data*: ptr cfloat

  gsl_block_float* = gsl_block_float_struct

  gsl_vector_float* {.bycopy.} = object
    size*: csize_t
    stride*: csize_t
    data*: ptr cfloat
    `block`*: ptr gsl_block_float
    owner*: cint

  gsl_vector_float_view* {.bycopy.} = object
    vector*: gsl_vector_float

  gsl_vector_float_const_view* {.bycopy.} = object
    vector*: gsl_vector_float

  gsl_block_complex_float_struct* {.bycopy.} = object
    size*: csize_t
    data*: ptr cfloat

  gsl_block_complex_float* = gsl_block_complex_float_struct

  gsl_vector_complex_float* {.bycopy.} = object
    size*: csize_t
    stride*: csize_t
    data*: ptr cfloat
    `block`*: ptr gsl_block_complex_float
    owner*: cint

  gsl_vector_complex_float_view* {.bycopy.} = object
    vector*: gsl_vector_complex_float

  gsl_vector_complex_float_const_view* {.bycopy.} = object
    vector*: gsl_vector_complex_float

  gsl_block_ulong_struct* {.bycopy.} = object
    size*: csize_t
    data*: ptr culong

  gsl_block_ulong* = gsl_block_ulong_struct

  gsl_vector_ulong* {.bycopy.} = object
    size*: csize_t
    stride*: csize_t
    data*: ptr culong
    `block`*: ptr gsl_block_ulong
    owner*: cint

  gsl_vector_ulong_view* {.bycopy.} = object
    vector*: gsl_vector_ulong

  gsl_vector_ulong_const_view* {.bycopy.} = object
    vector*: gsl_vector_ulong

  gsl_block_long_struct* {.bycopy.} = object
    size*: csize_t
    data*: ptr clong

  gsl_block_long* = gsl_block_long_struct

  gsl_vector_long* {.bycopy.} = object
    size*: csize_t
    stride*: csize_t
    data*: ptr clong
    `block`*: ptr gsl_block_long
    owner*: cint

  gsl_vector_long_view* {.bycopy.} = object
    vector*: gsl_vector_long

  gsl_vector_long_const_view* {.bycopy.} = object
    vector*: gsl_vector_long

  gsl_block_uint_struct* {.bycopy.} = object
    size*: csize_t
    data*: ptr cuint

  gsl_block_uint* = gsl_block_uint_struct

  gsl_vector_uint* {.bycopy.} = object
    size*: csize_t
    stride*: csize_t
    data*: ptr cuint
    `block`*: ptr gsl_block_uint
    owner*: cint

  gsl_vector_uint_view* {.bycopy.} = object
    vector*: gsl_vector_uint

  gsl_vector_uint_const_view* {.bycopy.} = object
    vector*: gsl_vector_uint

  gsl_block_int_struct* {.bycopy.} = object
    size*: csize_t
    data*: ptr cint

  gsl_block_int* = gsl_block_int_struct

  gsl_vector_int* {.bycopy.} = object
    size*: csize_t
    stride*: csize_t
    data*: ptr cint
    `block`*: ptr gsl_block_int
    owner*: cint

  gsl_vector_int_view* {.bycopy.} = object
    vector*: gsl_vector_int

  gsl_vector_int_const_view* {.bycopy.} = object
    vector*: gsl_vector_int

  gsl_block_ushort_struct* {.bycopy.} = object
    size*: csize_t
    data*: ptr cushort

  gsl_block_ushort* = gsl_block_ushort_struct

  gsl_vector_ushort* {.bycopy.} = object
    size*: csize_t
    stride*: csize_t
    data*: ptr cushort
    `block`*: ptr gsl_block_ushort
    owner*: cint

  gsl_vector_ushort_view* {.bycopy.} = object
    vector*: gsl_vector_ushort

  gsl_vector_ushort_const_view* {.bycopy.} = object
    vector*: gsl_vector_ushort

  gsl_block_short_struct* {.bycopy.} = object
    size*: csize_t
    data*: ptr cshort

  gsl_block_short* = gsl_block_short_struct

  gsl_vector_short* {.bycopy.} = object
    size*: csize_t
    stride*: csize_t
    data*: ptr cshort
    `block`*: ptr gsl_block_short
    owner*: cint

  gsl_vector_short_view* {.bycopy.} = object
    vector*: gsl_vector_short

  gsl_vector_short_const_view* {.bycopy.} = object
    vector*: gsl_vector_short

  gsl_block_uchar_struct* {.bycopy.} = object
    size*: csize_t
    data*: ptr cuchar

  gsl_block_uchar* = gsl_block_uchar_struct

  gsl_vector_uchar* {.bycopy.} = object
    size*: csize_t
    stride*: csize_t
    data*: ptr cuchar
    `block`*: ptr gsl_block_uchar
    owner*: cint

  gsl_vector_uchar_view* {.bycopy.} = object
    vector*: gsl_vector_uchar

  gsl_vector_uchar_const_view* {.bycopy.} = object
    vector*: gsl_vector_uchar

  gsl_block_char_struct* {.bycopy.} = object
    size*: csize_t
    data*: cstring

  gsl_block_char* = gsl_block_char_struct

  gsl_vector_char* {.bycopy.} = object
    size*: csize_t
    stride*: csize_t
    data*: cstring
    `block`*: ptr gsl_block_char
    owner*: cint

  gsl_vector_char_view* {.bycopy.} = object
    vector*: gsl_vector_char

  gsl_vector_char_const_view* {.bycopy.} = object
    vector*: gsl_vector_char

  gsl_movstat_end_t* {.size: sizeof(cint).} = enum
    GSL_MOVSTAT_END_PADZERO, GSL_MOVSTAT_END_PADVALUE, GSL_MOVSTAT_END_TRUNCATE
  gsl_movstat_accum* {.bycopy.} = object
    size*: proc (n: csize_t): csize_t {.cdecl.}
    init*: proc (n: csize_t; vstate: pointer): cint {.cdecl.}
    insert*: proc (x: cdouble; vstate: pointer): cint {.cdecl.}
    delete_oldest*: proc (vstate: pointer): cint {.cdecl.}
    get*: proc (params: pointer; result: ptr cdouble; vstate: pointer): cint {.cdecl.}

  gsl_movstat_function* {.bycopy.} = object
    function*: proc (n: csize_t; x: ptr cdouble; params: pointer): cdouble {.cdecl.}
    params*: pointer

  gsl_movstat_workspace* {.bycopy.} = object
    H*: csize_t
    J*: csize_t
    K*: csize_t
    work*: ptr cdouble
    state*: pointer
    state_size*: csize_t

proc gsl_log1p*(x: cdouble): cdouble {.cdecl, importc: "gsl_log1p", dynlib: libgsl.}
proc gsl_expm1*(x: cdouble): cdouble {.cdecl, importc: "gsl_expm1", dynlib: libgsl.}
proc gsl_hypot*(x: cdouble; y: cdouble): cdouble {.cdecl, importc: "gsl_hypot", dynlib: libgsl.}
proc gsl_hypot3*(x: cdouble; y: cdouble; z: cdouble): cdouble {.cdecl, importc: "gsl_hypot3", dynlib: libgsl.}
proc gsl_acosh*(x: cdouble): cdouble {.cdecl, importc: "gsl_acosh", dynlib: libgsl.}
proc gsl_asinh*(x: cdouble): cdouble {.cdecl, importc: "gsl_asinh", dynlib: libgsl.}
proc gsl_atanh*(x: cdouble): cdouble {.cdecl, importc: "gsl_atanh", dynlib: libgsl.}
proc gsl_isnan*(x: cdouble): cint {.cdecl, importc: "gsl_isnan", dynlib: libgsl.}
proc gsl_isinf*(x: cdouble): cint {.cdecl, importc: "gsl_isinf", dynlib: libgsl.}
proc gsl_finite*(x: cdouble): cint {.cdecl, importc: "gsl_finite", dynlib: libgsl.}
proc gsl_nan*(): cdouble {.cdecl, importc: "gsl_nan", dynlib: libgsl.}
proc gsl_posinf*(): cdouble {.cdecl, importc: "gsl_posinf", dynlib: libgsl.}
proc gsl_neginf*(): cdouble {.cdecl, importc: "gsl_neginf", dynlib: libgsl.}
proc gsl_fdiv*(x: cdouble; y: cdouble): cdouble {.cdecl, importc: "gsl_fdiv", dynlib: libgsl.}
proc gsl_coerce_double*(x: cdouble): cdouble {.cdecl, importc: "gsl_coerce_double", dynlib: libgsl.}
proc gsl_coerce_float*(x: cfloat): cfloat {.cdecl, importc: "gsl_coerce_float",  dynlib: libgsl.}
proc gsl_coerce_long_double*(x: clongdouble): clongdouble {.cdecl, importc: "gsl_coerce_long_double", dynlib: libgsl.}
proc gsl_ldexp*(x: cdouble; e: cint): cdouble {.cdecl, importc: "gsl_ldexp", dynlib: libgsl.}
proc gsl_frexp*(x: cdouble; e: ptr cint): cdouble {.cdecl, importc: "gsl_frexp", dynlib: libgsl.}
proc gsl_fcmp*(x1: cdouble; x2: cdouble; epsilon: cdouble): cint {.cdecl, importc: "gsl_fcmp", dynlib: libgsl.}
proc gsl_pow_2*(x: cdouble): cdouble {.cdecl, importc: "gsl_pow_2", dynlib: libgsl.}
proc gsl_pow_3*(x: cdouble): cdouble {.cdecl, importc: "gsl_pow_3", dynlib: libgsl.}
proc gsl_pow_4*(x: cdouble): cdouble {.cdecl, importc: "gsl_pow_4", dynlib: libgsl.}
proc gsl_pow_5*(x: cdouble): cdouble {.cdecl, importc: "gsl_pow_5", dynlib: libgsl.}
proc gsl_pow_6*(x: cdouble): cdouble {.cdecl, importc: "gsl_pow_6", dynlib: libgsl.}
proc gsl_pow_7*(x: cdouble): cdouble {.cdecl, importc: "gsl_pow_7", dynlib: libgsl.}
proc gsl_pow_8*(x: cdouble): cdouble {.cdecl, importc: "gsl_pow_8", dynlib: libgsl.}
proc gsl_pow_9*(x: cdouble): cdouble {.cdecl, importc: "gsl_pow_9", dynlib: libgsl.}
proc gsl_pow_int*(x: cdouble; n: cint): cdouble {.cdecl, importc: "gsl_pow_int", dynlib: libgsl.}
proc gsl_pow_uint*(x: cdouble; n: cuint): cdouble {.cdecl, importc: "gsl_pow_uint", dynlib: libgsl.}
proc gsl_max*(a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_max", dynlib: libgsl.}
proc gsl_min*(a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_min", dynlib: libgsl.}
proc gsl_error*(reason: cstring; file: cstring; line: cint; gsl_errno: cint) {.cdecl, importc: "gsl_error", dynlib: libgsl.}
proc gsl_stream_printf*(label: cstring; file: cstring; line: cint; reason: cstring) {. cdecl, importc: "gsl_stream_printf", dynlib: libgsl.}
proc gsl_strerror*(gsl_errno: cint): cstring {.cdecl, importc: "gsl_strerror", dynlib: libgsl.}
proc gsl_set_error_handler*(new_handler: ptr gsl_error_handler_t): ptr gsl_error_handler_t {. cdecl, importc: "gsl_set_error_handler", dynlib: libgsl.}
proc gsl_set_error_handler_off*(): ptr gsl_error_handler_t {.cdecl, importc: "gsl_set_error_handler_off", dynlib: libgsl.}
proc gsl_set_stream_handler*(new_handler: ptr gsl_stream_handler_t): ptr gsl_stream_handler_t {. cdecl, importc: "gsl_set_stream_handler", dynlib: libgsl.}
proc gsl_set_stream*(new_stream: ptr FILE): ptr FILE {.cdecl, importc: "gsl_set_stream", dynlib: libgsl.}
proc gsl_block_long_double_alloc*(n: csize_t): ptr gsl_block_long_double {.cdecl, importc: "gsl_block_long_double_alloc", dynlib: libgsl.}
proc gsl_block_long_double_calloc*(n: csize_t): ptr gsl_block_long_double {.cdecl, importc: "gsl_block_long_double_calloc", dynlib: libgsl.}
proc gsl_block_long_double_free*(b: ptr gsl_block_long_double) {.cdecl, importc: "gsl_block_long_double_free", dynlib: libgsl.}
proc gsl_block_long_double_fread*(stream: ptr FILE; b: ptr gsl_block_long_double): cint {. cdecl, importc: "gsl_block_long_double_fread", dynlib: libgsl.}
proc gsl_block_long_double_fwrite*(stream: ptr FILE; b: ptr gsl_block_long_double): cint {. cdecl, importc: "gsl_block_long_double_fwrite", dynlib: libgsl.}
proc gsl_block_long_double_fscanf*(stream: ptr FILE; b: ptr gsl_block_long_double): cint {. cdecl, importc: "gsl_block_long_double_fscanf", dynlib: libgsl.}
proc gsl_block_long_double_fprintf*(stream: ptr FILE; b: ptr gsl_block_long_double;  format: cstring): cint {.cdecl, importc: "gsl_block_long_double_fprintf", dynlib: libgsl.}
proc gsl_block_long_double_raw_fread*(stream: ptr FILE; b: ptr clongdouble; n: csize_t;  stride: csize_t): cint {.cdecl, importc: "gsl_block_long_double_raw_fread", dynlib: libgsl.}
proc gsl_block_long_double_raw_fwrite*(stream: ptr FILE; b: ptr clongdouble;   n: csize_t; stride: csize_t): cint {.cdecl, importc: "gsl_block_long_double_raw_fwrite", dynlib: libgsl.}
proc gsl_block_long_double_raw_fscanf*(stream: ptr FILE; b: ptr clongdouble;   n: csize_t; stride: csize_t): cint {.cdecl, importc: "gsl_block_long_double_raw_fscanf", dynlib: libgsl.}
proc gsl_block_long_double_raw_fprintf*(stream: ptr FILE; b: ptr clongdouble;    n: csize_t; stride: csize_t; format: cstring): cint {. cdecl, importc: "gsl_block_long_double_raw_fprintf", dynlib: libgsl.}
proc gsl_block_long_double_size*(b: ptr gsl_block_long_double): csize_t {.cdecl, importc: "gsl_block_long_double_size", dynlib: libgsl.}
proc gsl_block_long_double_data*(b: ptr gsl_block_long_double): ptr clongdouble {. cdecl, importc: "gsl_block_long_double_data", dynlib: libgsl.}
proc gsl_vector_long_double_alloc*(n: csize_t): ptr gsl_vector_long_double {.cdecl, importc: "gsl_vector_long_double_alloc", dynlib: libgsl.}
proc gsl_vector_long_double_calloc*(n: csize_t): ptr gsl_vector_long_double {.cdecl, importc: "gsl_vector_long_double_calloc", dynlib: libgsl.}
proc gsl_vector_long_double_alloc_from_block*(b: ptr gsl_block_long_double; offset: csize_t; n: csize_t; stride: csize_t): ptr gsl_vector_long_double {.cdecl, importc: "gsl_vector_long_double_alloc_from_block", dynlib: libgsl.}
proc gsl_vector_long_double_alloc_from_vector*(v: ptr gsl_vector_long_double; offset: csize_t; n: csize_t; stride: csize_t): ptr gsl_vector_long_double {.cdecl, importc: "gsl_vector_long_double_alloc_from_vector", dynlib: libgsl.}
proc gsl_vector_long_double_free*(v: ptr gsl_vector_long_double) {.cdecl, importc: "gsl_vector_long_double_free", dynlib: libgsl.}
proc gsl_vector_long_double_view_array*(v: ptr clongdouble; n: csize_t): gsl_vector_long_double_view {. cdecl, importc: "gsl_vector_long_double_view_array", dynlib: libgsl.}
proc gsl_vector_long_double_view_array_with_stride*(base: ptr clongdouble; stride: csize_t; n: csize_t): gsl_vector_long_double_view {.cdecl, importc: "gsl_vector_long_double_view_array_with_stride", dynlib: libgsl.}
proc gsl_vector_long_double_const_view_array*(v: ptr clongdouble; n: csize_t): gsl_vector_long_double_const_view {. cdecl, importc: "gsl_vector_long_double_const_view_array", dynlib: libgsl.}
proc gsl_vector_long_double_const_view_array_with_stride*(base: ptr clongdouble; stride: csize_t; n: csize_t): gsl_vector_long_double_const_view {.cdecl, importc: "gsl_vector_long_double_const_view_array_with_stride", dynlib: libgsl.}
proc gsl_vector_long_double_subvector*(v: ptr gsl_vector_long_double; i: csize_t;   n: csize_t): gsl_vector_long_double_view {. cdecl, importc: "gsl_vector_long_double_subvector", dynlib: libgsl.}
proc gsl_vector_long_double_subvector_with_stride*(v: ptr gsl_vector_long_double; i: csize_t; stride: csize_t; n: csize_t): gsl_vector_long_double_view {.cdecl, importc: "gsl_vector_long_double_subvector_with_stride", dynlib: libgsl.}
proc gsl_vector_long_double_const_subvector*(v: ptr gsl_vector_long_double; i: csize_t; n: csize_t): gsl_vector_long_double_const_view {.cdecl, importc: "gsl_vector_long_double_const_subvector", dynlib: libgsl.}
proc gsl_vector_long_double_const_subvector_with_stride*(v: ptr gsl_vector_long_double; i: csize_t; stride: csize_t; n: csize_t): gsl_vector_long_double_const_view {. cdecl, importc: "gsl_vector_long_double_const_subvector_with_stride", dynlib: libgsl.}
proc gsl_vector_long_double_set_zero*(v: ptr gsl_vector_long_double) {.cdecl, importc: "gsl_vector_long_double_set_zero", dynlib: libgsl.}
proc gsl_vector_long_double_set_all*(v: ptr gsl_vector_long_double; x: clongdouble) {. cdecl, importc: "gsl_vector_long_double_set_all", dynlib: libgsl.}
proc gsl_vector_long_double_set_basis*(v: ptr gsl_vector_long_double; i: csize_t): cint {. cdecl, importc: "gsl_vector_long_double_set_basis", dynlib: libgsl.}
proc gsl_vector_long_double_fread*(stream: ptr FILE; v: ptr gsl_vector_long_double): cint {. cdecl, importc: "gsl_vector_long_double_fread", dynlib: libgsl.}
proc gsl_vector_long_double_fwrite*(stream: ptr FILE; v: ptr gsl_vector_long_double): cint {. cdecl, importc: "gsl_vector_long_double_fwrite", dynlib: libgsl.}
proc gsl_vector_long_double_fscanf*(stream: ptr FILE; v: ptr gsl_vector_long_double): cint {. cdecl, importc: "gsl_vector_long_double_fscanf", dynlib: libgsl.}
proc gsl_vector_long_double_fprintf*(stream: ptr FILE; v: ptr gsl_vector_long_double; format: cstring): cint {. cdecl, importc: "gsl_vector_long_double_fprintf", dynlib: libgsl.}
proc gsl_vector_long_double_memcpy*(dest: ptr gsl_vector_long_double;  src: ptr gsl_vector_long_double): cint {.cdecl, importc: "gsl_vector_long_double_memcpy", dynlib: libgsl.}
proc gsl_vector_long_double_reverse*(v: ptr gsl_vector_long_double): cint {.cdecl, importc: "gsl_vector_long_double_reverse", dynlib: libgsl.}
proc gsl_vector_long_double_swap*(v: ptr gsl_vector_long_double; w: ptr gsl_vector_long_double): cint {.cdecl, importc: "gsl_vector_long_double_swap", dynlib: libgsl.}
proc gsl_vector_long_double_swap_elements*(v: ptr gsl_vector_long_double; i: csize_t; j: csize_t): cint {.cdecl, importc: "gsl_vector_long_double_swap_elements", dynlib: libgsl.}
proc gsl_vector_long_double_max*(v: ptr gsl_vector_long_double): clongdouble {.cdecl, importc: "gsl_vector_long_double_max", dynlib: libgsl.}
proc gsl_vector_long_double_min*(v: ptr gsl_vector_long_double): clongdouble {.cdecl, importc: "gsl_vector_long_double_min", dynlib: libgsl.}
proc gsl_vector_long_double_minmax*(v: ptr gsl_vector_long_double;  min_out: ptr clongdouble;  max_out: ptr clongdouble) {.cdecl, importc: "gsl_vector_long_double_minmax", dynlib: libgsl.}
proc gsl_vector_long_double_max_index*(v: ptr gsl_vector_long_double): csize_t {. cdecl, importc: "gsl_vector_long_double_max_index", dynlib: libgsl.}
proc gsl_vector_long_double_min_index*(v: ptr gsl_vector_long_double): csize_t {. cdecl, importc: "gsl_vector_long_double_min_index", dynlib: libgsl.}
proc gsl_vector_long_double_minmax_index*(v: ptr gsl_vector_long_double; imin: ptr csize_t; imax: ptr csize_t) {.cdecl, importc: "gsl_vector_long_double_minmax_index",   dynlib: libgsl.}
proc gsl_vector_long_double_add*(a: ptr gsl_vector_long_double; b: ptr gsl_vector_long_double): cint {.cdecl, importc: "gsl_vector_long_double_add", dynlib: libgsl.}
proc gsl_vector_long_double_sub*(a: ptr gsl_vector_long_double; b: ptr gsl_vector_long_double): cint {.cdecl, importc: "gsl_vector_long_double_sub", dynlib: libgsl.}
proc gsl_vector_long_double_mul*(a: ptr gsl_vector_long_double; b: ptr gsl_vector_long_double): cint {.cdecl, importc: "gsl_vector_long_double_mul", dynlib: libgsl.}
proc gsl_vector_long_double_div*(a: ptr gsl_vector_long_double; b: ptr gsl_vector_long_double): cint {.cdecl, importc: "gsl_vector_long_double_div", dynlib: libgsl.}
proc gsl_vector_long_double_scale*(a: ptr gsl_vector_long_double; x: cdouble): cint {. cdecl, importc: "gsl_vector_long_double_scale", dynlib: libgsl.}
proc gsl_vector_long_double_add_constant*(a: ptr gsl_vector_long_double; x: cdouble): cint {. cdecl, importc: "gsl_vector_long_double_add_constant", dynlib: libgsl.}
proc gsl_vector_long_double_equal*(u: ptr gsl_vector_long_double; v: ptr gsl_vector_long_double): cint {.cdecl, importc: "gsl_vector_long_double_equal", dynlib: libgsl.}
proc gsl_vector_long_double_isnull*(v: ptr gsl_vector_long_double): cint {.cdecl, importc: "gsl_vector_long_double_isnull", dynlib: libgsl.}
proc gsl_vector_long_double_ispos*(v: ptr gsl_vector_long_double): cint {.cdecl, importc: "gsl_vector_long_double_ispos", dynlib: libgsl.}
proc gsl_vector_long_double_isneg*(v: ptr gsl_vector_long_double): cint {.cdecl, importc: "gsl_vector_long_double_isneg", dynlib: libgsl.}
proc gsl_vector_long_double_isnonneg*(v: ptr gsl_vector_long_double): cint {.cdecl, importc: "gsl_vector_long_double_isnonneg", dynlib: libgsl.}
proc gsl_vector_long_double_get*(v: ptr gsl_vector_long_double; i: csize_t): clongdouble {. cdecl, importc: "gsl_vector_long_double_get", dynlib: libgsl.}
proc gsl_vector_long_double_set*(v: ptr gsl_vector_long_double; i: csize_t; x: clongdouble) {.cdecl, importc: "gsl_vector_long_double_set", dynlib: libgsl.}
proc gsl_vector_long_double_ptr*(v: ptr gsl_vector_long_double; i: csize_t): ptr clongdouble {. cdecl, importc: "gsl_vector_long_double_ptr", dynlib: libgsl.}
proc gsl_vector_long_double_const_ptr*(v: ptr gsl_vector_long_double; i: csize_t): ptr clongdouble {. cdecl, importc: "gsl_vector_long_double_const_ptr", dynlib: libgsl.}
proc gsl_block_complex_long_double_alloc*(n: csize_t): ptr gsl_block_complex_long_double {. cdecl, importc: "gsl_block_complex_long_double_alloc", dynlib: libgsl.}
proc gsl_block_complex_long_double_calloc*(n: csize_t): ptr gsl_block_complex_long_double {. cdecl, importc: "gsl_block_complex_long_double_calloc", dynlib: libgsl.}
proc gsl_block_complex_long_double_free*(b: ptr gsl_block_complex_long_double) {. cdecl, importc: "gsl_block_complex_long_double_free", dynlib: libgsl.}
proc gsl_block_complex_long_double_fread*(stream: ptr FILE; b: ptr gsl_block_complex_long_double): cint {.cdecl, importc: "gsl_block_complex_long_double_fread", dynlib: libgsl.}
proc gsl_block_complex_long_double_fwrite*(stream: ptr FILE; b: ptr gsl_block_complex_long_double): cint {.cdecl, importc: "gsl_block_complex_long_double_fwrite", dynlib: libgsl.}
proc gsl_block_complex_long_double_fscanf*(stream: ptr FILE; b: ptr gsl_block_complex_long_double): cint {.cdecl, importc: "gsl_block_complex_long_double_fscanf", dynlib: libgsl.}
proc gsl_block_complex_long_double_fprintf*(stream: ptr FILE; b: ptr gsl_block_complex_long_double; format: cstring): cint {.cdecl, importc: "gsl_block_complex_long_double_fprintf", dynlib: libgsl.}
proc gsl_block_complex_long_double_raw_fread*(stream: ptr FILE; b: ptr clongdouble; n: csize_t; stride: csize_t): cint {.cdecl, importc: "gsl_block_complex_long_double_raw_fread", dynlib: libgsl.}
proc gsl_block_complex_long_double_raw_fwrite*(stream: ptr FILE; b: ptr clongdouble; n: csize_t; stride: csize_t): cint {.cdecl, importc: "gsl_block_complex_long_double_raw_fwrite", dynlib: libgsl.}
proc gsl_block_complex_long_double_raw_fscanf*(stream: ptr FILE; b: ptr clongdouble; n: csize_t; stride: csize_t): cint {.cdecl, importc: "gsl_block_complex_long_double_raw_fscanf", dynlib: libgsl.}
proc gsl_block_complex_long_double_raw_fprintf*(stream: ptr FILE; b: ptr clongdouble; n: csize_t; stride: csize_t; format: cstring): cint {.cdecl, importc: "gsl_block_complex_long_double_raw_fprintf", dynlib: libgsl.}
proc gsl_block_complex_long_double_size*(b: ptr gsl_block_complex_long_double): csize_t {. cdecl, importc: "gsl_block_complex_long_double_size", dynlib: libgsl.}
proc gsl_block_complex_long_double_data*(b: ptr gsl_block_complex_long_double): ptr clongdouble {. cdecl, importc: "gsl_block_complex_long_double_data", dynlib: libgsl.}
proc gsl_vector_complex_long_double_alloc*(n: csize_t): ptr gsl_vector_complex_long_double {. cdecl, importc: "gsl_vector_complex_long_double_alloc", dynlib: libgsl.}
proc gsl_vector_complex_long_double_calloc*(n: csize_t): ptr gsl_vector_complex_long_double {. cdecl, importc: "gsl_vector_complex_long_double_calloc", dynlib: libgsl.}
proc gsl_vector_complex_long_double_alloc_from_block*(b: ptr gsl_block_complex_long_double; offset: csize_t; n: csize_t; stride: csize_t): ptr gsl_vector_complex_long_double {. cdecl, importc: "gsl_vector_complex_long_double_alloc_from_block", dynlib: libgsl.}
proc gsl_vector_complex_long_double_alloc_from_vector*(v: ptr gsl_vector_complex_long_double; offset: csize_t; n: csize_t; stride: csize_t): ptr gsl_vector_complex_long_double {. cdecl, importc: "gsl_vector_complex_long_double_alloc_from_vector", dynlib: libgsl.}
proc gsl_vector_complex_long_double_free*(v: ptr gsl_vector_complex_long_double) {. cdecl, importc: "gsl_vector_complex_long_double_free", dynlib: libgsl.}
proc gsl_vector_complex_long_double_view_array*(base: ptr clongdouble; n: csize_t): gsl_vector_complex_long_double_view {. cdecl, importc: "gsl_vector_complex_long_double_view_array", dynlib: libgsl.}
proc gsl_vector_complex_long_double_view_array_with_stride*(base: ptr clongdouble; stride: csize_t; n: csize_t): gsl_vector_complex_long_double_view {. cdecl, importc: "gsl_vector_complex_long_double_view_array_with_stride", dynlib: libgsl.}
proc gsl_vector_complex_long_double_const_view_array*(base: ptr clongdouble; n: csize_t): gsl_vector_complex_long_double_const_view {.cdecl, importc: "gsl_vector_complex_long_double_const_view_array", dynlib: libgsl.}
proc gsl_vector_complex_long_double_const_view_array_with_stride*(base: ptr clongdouble; stride: csize_t; n: csize_t): gsl_vector_complex_long_double_const_view {. cdecl, importc: "gsl_vector_complex_long_double_const_view_array_with_stride", dynlib: libgsl.}
proc gsl_vector_complex_long_double_subvector*(base: ptr gsl_vector_complex_long_double; i: csize_t; n: csize_t): gsl_vector_complex_long_double_view {. cdecl, importc: "gsl_vector_complex_long_double_subvector", dynlib: libgsl.}
proc gsl_vector_complex_long_double_subvector_with_stride*(v: ptr gsl_vector_complex_long_double; i: csize_t; stride: csize_t; n: csize_t): gsl_vector_complex_long_double_view {. cdecl, importc: "gsl_vector_complex_long_double_subvector_with_stride", dynlib: libgsl.}
proc gsl_vector_complex_long_double_const_subvector*(base: ptr gsl_vector_complex_long_double; i: csize_t; n: csize_t): gsl_vector_complex_long_double_const_view {. cdecl, importc: "gsl_vector_complex_long_double_const_subvector", dynlib: libgsl.}
proc gsl_vector_complex_long_double_const_subvector_with_stride*(v: ptr gsl_vector_complex_long_double; i: csize_t; stride: csize_t; n: csize_t): gsl_vector_complex_long_double_const_view {. cdecl, importc: "gsl_vector_complex_long_double_const_subvector_with_stride", dynlib: libgsl.}
proc gsl_vector_complex_long_double_real*(v: ptr gsl_vector_complex_long_double): gsl_vector_long_double_view {. cdecl, importc: "gsl_vector_complex_long_double_real", dynlib: libgsl.}
proc gsl_vector_complex_long_double_imag*(v: ptr gsl_vector_complex_long_double): gsl_vector_long_double_view {. cdecl, importc: "gsl_vector_complex_long_double_imag", dynlib: libgsl.}
proc gsl_vector_complex_long_double_const_real*(v: ptr gsl_vector_complex_long_double): gsl_vector_long_double_const_view {. cdecl, importc: "gsl_vector_complex_long_double_const_real", dynlib: libgsl.}
proc gsl_vector_complex_long_double_const_imag*(v: ptr gsl_vector_complex_long_double): gsl_vector_long_double_const_view {. cdecl, importc: "gsl_vector_complex_long_double_const_imag", dynlib: libgsl.}
proc gsl_vector_complex_long_double_set_zero*(v: ptr gsl_vector_complex_long_double) {.cdecl, importc: "gsl_vector_complex_long_double_set_zero", dynlib: libgsl.}
proc gsl_vector_complex_long_double_set_all*(v: ptr gsl_vector_complex_long_double; z: gsl_complex_long_double) {.cdecl, importc: "gsl_vector_complex_long_double_set_all", dynlib: libgsl.}
proc gsl_vector_complex_long_double_set_basis*(v: ptr gsl_vector_complex_long_double; i: csize_t): cint {.cdecl, importc: "gsl_vector_complex_long_double_set_basis", dynlib: libgsl.}
proc gsl_vector_complex_long_double_fread*(stream: ptr FILE; v: ptr gsl_vector_complex_long_double): cint {.cdecl, importc: "gsl_vector_complex_long_double_fread", dynlib: libgsl.}
proc gsl_vector_complex_long_double_fwrite*(stream: ptr FILE; v: ptr gsl_vector_complex_long_double): cint {.cdecl, importc: "gsl_vector_complex_long_double_fwrite", dynlib: libgsl.}
proc gsl_vector_complex_long_double_fscanf*(stream: ptr FILE; v: ptr gsl_vector_complex_long_double): cint {.cdecl, importc: "gsl_vector_complex_long_double_fscanf", dynlib: libgsl.}
proc gsl_vector_complex_long_double_fprintf*(stream: ptr FILE; v: ptr gsl_vector_complex_long_double; format: cstring): cint {.cdecl, importc: "gsl_vector_complex_long_double_fprintf", dynlib: libgsl.}
proc gsl_vector_complex_long_double_memcpy*(dest: ptr gsl_vector_complex_long_double; src: ptr gsl_vector_complex_long_double): cint {.cdecl, importc: "gsl_vector_complex_long_double_memcpy", dynlib: libgsl.}
proc gsl_vector_complex_long_double_reverse*(v: ptr gsl_vector_complex_long_double): cint {.cdecl, importc: "gsl_vector_complex_long_double_reverse", dynlib: libgsl.}
proc gsl_vector_complex_long_double_swap*(v: ptr gsl_vector_complex_long_double; w: ptr gsl_vector_complex_long_double): cint {.cdecl, importc: "gsl_vector_complex_long_double_swap", dynlib: libgsl.}
proc gsl_vector_complex_long_double_swap_elements*(v: ptr gsl_vector_complex_long_double; i: csize_t; j: csize_t): cint {.cdecl, importc: "gsl_vector_complex_long_double_swap_elements", dynlib: libgsl.}
proc gsl_vector_complex_long_double_equal*(u: ptr gsl_vector_complex_long_double; v: ptr gsl_vector_complex_long_double): cint {.cdecl, importc: "gsl_vector_complex_long_double_equal", dynlib: libgsl.}
proc gsl_vector_complex_long_double_isnull*(v: ptr gsl_vector_complex_long_double): cint {. cdecl, importc: "gsl_vector_complex_long_double_isnull", dynlib: libgsl.}
proc gsl_vector_complex_long_double_ispos*(v: ptr gsl_vector_complex_long_double): cint {. cdecl, importc: "gsl_vector_complex_long_double_ispos", dynlib: libgsl.}
proc gsl_vector_complex_long_double_isneg*(v: ptr gsl_vector_complex_long_double): cint {. cdecl, importc: "gsl_vector_complex_long_double_isneg", dynlib: libgsl.}
proc gsl_vector_complex_long_double_isnonneg*(v: ptr gsl_vector_complex_long_double): cint {.cdecl, importc: "gsl_vector_complex_long_double_isnonneg", dynlib: libgsl.}
proc gsl_vector_complex_long_double_add*(a: ptr gsl_vector_complex_long_double; b: ptr gsl_vector_complex_long_double): cint {. cdecl, importc: "gsl_vector_complex_long_double_add", dynlib: libgsl.}
proc gsl_vector_complex_long_double_sub*(a: ptr gsl_vector_complex_long_double; b: ptr gsl_vector_complex_long_double): cint {. cdecl, importc: "gsl_vector_complex_long_double_sub", dynlib: libgsl.}
proc gsl_vector_complex_long_double_mul*(a: ptr gsl_vector_complex_long_double; b: ptr gsl_vector_complex_long_double): cint {. cdecl, importc: "gsl_vector_complex_long_double_mul", dynlib: libgsl.}
proc gsl_vector_complex_long_double_div*(a: ptr gsl_vector_complex_long_double; b: ptr gsl_vector_complex_long_double): cint {. cdecl, importc: "gsl_vector_complex_long_double_div", dynlib: libgsl.}
proc gsl_vector_complex_long_double_scale*(a: ptr gsl_vector_complex_long_double; x: gsl_complex_long_double): cint {.cdecl, importc: "gsl_vector_complex_long_double_scale",  dynlib: libgsl.}
proc gsl_vector_complex_long_double_add_constant*(a: ptr gsl_vector_complex_long_double; x: gsl_complex_long_double): cint {.cdecl, importc: "gsl_vector_complex_long_double_add_constant", dynlib: libgsl.}
proc gsl_vector_complex_long_double_get*(v: ptr gsl_vector_complex_long_double; i: csize_t): gsl_complex_long_double {. cdecl, importc: "gsl_vector_complex_long_double_get", dynlib: libgsl.}
proc gsl_vector_complex_long_double_set*(v: ptr gsl_vector_complex_long_double; i: csize_t; z: gsl_complex_long_double) {. cdecl, importc: "gsl_vector_complex_long_double_set", dynlib: libgsl.}
proc gsl_vector_complex_long_double_ptr*(v: ptr gsl_vector_complex_long_double; i: csize_t): ptr gsl_complex_long_double {. cdecl, importc: "gsl_vector_complex_long_double_ptr", dynlib: libgsl.}
proc gsl_vector_complex_long_double_const_ptr*(v: ptr gsl_vector_complex_long_double; i: csize_t): ptr gsl_complex_long_double {. cdecl, importc: "gsl_vector_complex_long_double_const_ptr", dynlib: libgsl.}
proc gsl_block_alloc*(n: csize_t): ptr gsl_block {.cdecl, importc: "gsl_block_alloc", dynlib: libgsl.}
proc gsl_block_calloc*(n: csize_t): ptr gsl_block {.cdecl, importc: "gsl_block_calloc", dynlib: libgsl.}
proc gsl_block_free*(b: ptr gsl_block) {.cdecl, importc: "gsl_block_free",  dynlib: libgsl.}
proc gsl_block_fread*(stream: ptr FILE; b: ptr gsl_block): cint {.cdecl, importc: "gsl_block_fread", dynlib: libgsl.}
proc gsl_block_fwrite*(stream: ptr FILE; b: ptr gsl_block): cint {.cdecl, importc: "gsl_block_fwrite", dynlib: libgsl.}
proc gsl_block_fscanf*(stream: ptr FILE; b: ptr gsl_block): cint {.cdecl, importc: "gsl_block_fscanf", dynlib: libgsl.}
proc gsl_block_fprintf*(stream: ptr FILE; b: ptr gsl_block; format: cstring): cint {. cdecl, importc: "gsl_block_fprintf", dynlib: libgsl.}
proc gsl_block_raw_fread*(stream: ptr FILE; b: ptr cdouble; n: csize_t; stride: csize_t): cint {. cdecl, importc: "gsl_block_raw_fread", dynlib: libgsl.}
proc gsl_block_raw_fwrite*(stream: ptr FILE; b: ptr cdouble; n: csize_t; stride: csize_t): cint {. cdecl, importc: "gsl_block_raw_fwrite", dynlib: libgsl.}
proc gsl_block_raw_fscanf*(stream: ptr FILE; b: ptr cdouble; n: csize_t; stride: csize_t): cint {. cdecl, importc: "gsl_block_raw_fscanf", dynlib: libgsl.}
proc gsl_block_raw_fprintf*(stream: ptr FILE; b: ptr cdouble; n: csize_t;   stride: csize_t; format: cstring): cint {.cdecl, importc: "gsl_block_raw_fprintf", dynlib: libgsl.}
proc gsl_block_size*(b: ptr gsl_block): csize_t {.cdecl, importc: "gsl_block_size", dynlib: libgsl.}
proc gsl_block_data*(b: ptr gsl_block): ptr cdouble {.cdecl, importc: "gsl_block_data", dynlib: libgsl.}
proc gsl_vector_alloc*(n: csize_t): ptr gsl_vector {.cdecl, importc: "gsl_vector_alloc", dynlib: libgsl.}
proc gsl_vector_calloc*(n: csize_t): ptr gsl_vector {.cdecl, importc: "gsl_vector_calloc", dynlib: libgsl.}
proc gsl_vector_alloc_from_block*(b: ptr gsl_block; offset: csize_t; n: csize_t; stride: csize_t): ptr gsl_vector {.cdecl, importc: "gsl_vector_alloc_from_block", dynlib: libgsl.}
proc gsl_vector_alloc_from_vector*(v: ptr gsl_vector; offset: csize_t; n: csize_t; stride: csize_t): ptr gsl_vector {.cdecl, importc: "gsl_vector_alloc_from_vector", dynlib: libgsl.}
proc gsl_vector_free*(v: ptr gsl_vector) {.cdecl, importc: "gsl_vector_free", dynlib: libgsl.}
proc gsl_vector_view_array*(v: ptr cdouble; n: csize_t): gsl_vector_view {.cdecl, importc: "gsl_vector_view_array", dynlib: libgsl.}
proc gsl_vector_view_array_with_stride*(base: ptr cdouble; stride: csize_t; n: csize_t): gsl_vector_view {. cdecl, importc: "gsl_vector_view_array_with_stride", dynlib: libgsl.}
proc gsl_vector_const_view_array*(v: ptr cdouble; n: csize_t): gsl_vector_const_view {. cdecl, importc: "gsl_vector_const_view_array", dynlib: libgsl.}
proc gsl_vector_const_view_array_with_stride*(base: ptr cdouble; stride: csize_t; n: csize_t): gsl_vector_const_view {.cdecl, importc: "gsl_vector_const_view_array_with_stride",   dynlib: libgsl.}
proc gsl_vector_subvector*(v: ptr gsl_vector; i: csize_t; n: csize_t): gsl_vector_view {. cdecl, importc: "gsl_vector_subvector", dynlib: libgsl.}
proc gsl_vector_subvector_with_stride*(v: ptr gsl_vector; i: csize_t; stride: csize_t;   n: csize_t): gsl_vector_view {.cdecl, importc: "gsl_vector_subvector_with_stride", dynlib: libgsl.}
proc gsl_vector_const_subvector*(v: ptr gsl_vector; i: csize_t; n: csize_t): gsl_vector_const_view {. cdecl, importc: "gsl_vector_const_subvector", dynlib: libgsl.}
proc gsl_vector_const_subvector_with_stride*(v: ptr gsl_vector; i: csize_t; stride: csize_t; n: csize_t): gsl_vector_const_view {.cdecl, importc: "gsl_vector_const_subvector_with_stride", dynlib: libgsl.}
proc gsl_vector_set_zero*(v: ptr gsl_vector) {.cdecl, importc: "gsl_vector_set_zero", dynlib: libgsl.}
proc gsl_vector_set_all*(v: ptr gsl_vector; x: cdouble) {.cdecl, importc: "gsl_vector_set_all", dynlib: libgsl.}
proc gsl_vector_set_basis*(v: ptr gsl_vector; i: csize_t): cint {.cdecl, importc: "gsl_vector_set_basis", dynlib: libgsl.}
proc gsl_vector_fread*(stream: ptr FILE; v: ptr gsl_vector): cint {.cdecl, importc: "gsl_vector_fread", dynlib: libgsl.}
proc gsl_vector_fwrite*(stream: ptr FILE; v: ptr gsl_vector): cint {.cdecl, importc: "gsl_vector_fwrite", dynlib: libgsl.}
proc gsl_vector_fscanf*(stream: ptr FILE; v: ptr gsl_vector): cint {.cdecl, importc: "gsl_vector_fscanf", dynlib: libgsl.}
proc gsl_vector_fprintf*(stream: ptr FILE; v: ptr gsl_vector; format: cstring): cint {. cdecl, importc: "gsl_vector_fprintf", dynlib: libgsl.}
proc gsl_vector_memcpy*(dest: ptr gsl_vector; src: ptr gsl_vector): cint {.cdecl, importc: "gsl_vector_memcpy", dynlib: libgsl.}
proc gsl_vector_reverse*(v: ptr gsl_vector): cint {.cdecl, importc: "gsl_vector_reverse", dynlib: libgsl.}
proc gsl_vector_swap*(v: ptr gsl_vector; w: ptr gsl_vector): cint {.cdecl, importc: "gsl_vector_swap", dynlib: libgsl.}
proc gsl_vector_swap_elements*(v: ptr gsl_vector; i: csize_t; j: csize_t): cint {.cdecl, importc: "gsl_vector_swap_elements", dynlib: libgsl.}
proc gsl_vector_max*(v: ptr gsl_vector): cdouble {.cdecl, importc: "gsl_vector_max", dynlib: libgsl.}
proc gsl_vector_min*(v: ptr gsl_vector): cdouble {.cdecl, importc: "gsl_vector_min", dynlib: libgsl.}
proc gsl_vector_minmax*(v: ptr gsl_vector; min_out: ptr cdouble; max_out: ptr cdouble) {. cdecl, importc: "gsl_vector_minmax", dynlib: libgsl.}
proc gsl_vector_max_index*(v: ptr gsl_vector): csize_t {.cdecl, importc: "gsl_vector_max_index", dynlib: libgsl.}
proc gsl_vector_min_index*(v: ptr gsl_vector): csize_t {.cdecl, importc: "gsl_vector_min_index", dynlib: libgsl.}
proc gsl_vector_minmax_index*(v: ptr gsl_vector; imin: ptr csize_t; imax: ptr csize_t) {. cdecl, importc: "gsl_vector_minmax_index", dynlib: libgsl.}
proc gsl_vector_add*(a: ptr gsl_vector; b: ptr gsl_vector): cint {.cdecl, importc: "gsl_vector_add", dynlib: libgsl.}
proc gsl_vector_sub*(a: ptr gsl_vector; b: ptr gsl_vector): cint {.cdecl, importc: "gsl_vector_sub", dynlib: libgsl.}
proc gsl_vector_mul*(a: ptr gsl_vector; b: ptr gsl_vector): cint {.cdecl, importc: "gsl_vector_mul", dynlib: libgsl.}
proc gsl_vector_div*(a: ptr gsl_vector; b: ptr gsl_vector): cint {.cdecl, importc: "gsl_vector_div", dynlib: libgsl.}
proc gsl_vector_scale*(a: ptr gsl_vector; x: cdouble): cint {.cdecl, importc: "gsl_vector_scale", dynlib: libgsl.}
proc gsl_vector_add_constant*(a: ptr gsl_vector; x: cdouble): cint {.cdecl, importc: "gsl_vector_add_constant", dynlib: libgsl.}
proc gsl_vector_equal*(u: ptr gsl_vector; v: ptr gsl_vector): cint {.cdecl, importc: "gsl_vector_equal", dynlib: libgsl.}
proc gsl_vector_isnull*(v: ptr gsl_vector): cint {.cdecl, importc: "gsl_vector_isnull", dynlib: libgsl.}
proc gsl_vector_ispos*(v: ptr gsl_vector): cint {.cdecl, importc: "gsl_vector_ispos", dynlib: libgsl.}
proc gsl_vector_isneg*(v: ptr gsl_vector): cint {.cdecl, importc: "gsl_vector_isneg", dynlib: libgsl.}
proc gsl_vector_isnonneg*(v: ptr gsl_vector): cint {.cdecl, importc: "gsl_vector_isnonneg", dynlib: libgsl.}
proc gsl_vector_get*(v: ptr gsl_vector; i: csize_t): cdouble {.cdecl, importc: "gsl_vector_get", dynlib: libgsl.}
proc gsl_vector_set*(v: ptr gsl_vector; i: csize_t; x: cdouble) {.cdecl, importc: "gsl_vector_set", dynlib: libgsl.}
proc gsl_vector_ptr*(v: ptr gsl_vector; i: csize_t): ptr cdouble {.cdecl, importc: "gsl_vector_ptr", dynlib: libgsl.}
proc gsl_vector_const_ptr*(v: ptr gsl_vector; i: csize_t): ptr cdouble {.cdecl, importc: "gsl_vector_const_ptr", dynlib: libgsl.}
proc gsl_block_complex_alloc*(n: csize_t): ptr gsl_block_complex {.cdecl, importc: "gsl_block_complex_alloc", dynlib: libgsl.}
proc gsl_block_complex_calloc*(n: csize_t): ptr gsl_block_complex {.cdecl, importc: "gsl_block_complex_calloc", dynlib: libgsl.}
proc gsl_block_complex_free*(b: ptr gsl_block_complex) {.cdecl, importc: "gsl_block_complex_free", dynlib: libgsl.}
proc gsl_block_complex_fread*(stream: ptr FILE; b: ptr gsl_block_complex): cint {.cdecl, importc: "gsl_block_complex_fread", dynlib: libgsl.}
proc gsl_block_complex_fwrite*(stream: ptr FILE; b: ptr gsl_block_complex): cint {. cdecl, importc: "gsl_block_complex_fwrite", dynlib: libgsl.}
proc gsl_block_complex_fscanf*(stream: ptr FILE; b: ptr gsl_block_complex): cint {. cdecl, importc: "gsl_block_complex_fscanf", dynlib: libgsl.}
proc gsl_block_complex_fprintf*(stream: ptr FILE; b: ptr gsl_block_complex; format: cstring): cint {.cdecl, importc: "gsl_block_complex_fprintf", dynlib: libgsl.}
proc gsl_block_complex_raw_fread*(stream: ptr FILE; b: ptr cdouble; n: csize_t; stride: csize_t): cint {.cdecl, importc: "gsl_block_complex_raw_fread", dynlib: libgsl.}
proc gsl_block_complex_raw_fwrite*(stream: ptr FILE; b: ptr cdouble; n: csize_t; stride: csize_t): cint {.cdecl, importc: "gsl_block_complex_raw_fwrite", dynlib: libgsl.}
proc gsl_block_complex_raw_fscanf*(stream: ptr FILE; b: ptr cdouble; n: csize_t; stride: csize_t): cint {.cdecl, importc: "gsl_block_complex_raw_fscanf", dynlib: libgsl.}
proc gsl_block_complex_raw_fprintf*(stream: ptr FILE; b: ptr cdouble; n: csize_t;  stride: csize_t; format: cstring): cint {.cdecl, importc: "gsl_block_complex_raw_fprintf", dynlib: libgsl.}
proc gsl_block_complex_size*(b: ptr gsl_block_complex): csize_t {.cdecl, importc: "gsl_block_complex_size", dynlib: libgsl.}
proc gsl_block_complex_data*(b: ptr gsl_block_complex): ptr cdouble {.cdecl, importc: "gsl_block_complex_data", dynlib: libgsl.}
proc gsl_vector_complex_alloc*(n: csize_t): ptr gsl_vector_complex {.cdecl, importc: "gsl_vector_complex_alloc", dynlib: libgsl.}
proc gsl_vector_complex_calloc*(n: csize_t): ptr gsl_vector_complex {.cdecl, importc: "gsl_vector_complex_calloc", dynlib: libgsl.}
proc gsl_vector_complex_alloc_from_block*(b: ptr gsl_block_complex; offset: csize_t; n: csize_t; stride: csize_t): ptr gsl_vector_complex {.cdecl, importc: "gsl_vector_complex_alloc_from_block", dynlib: libgsl.}
proc gsl_vector_complex_alloc_from_vector*(v: ptr gsl_vector_complex; offset: csize_t; n: csize_t; stride: csize_t): ptr gsl_vector_complex {.cdecl, importc: "gsl_vector_complex_alloc_from_vector", dynlib: libgsl.}
proc gsl_vector_complex_free*(v: ptr gsl_vector_complex) {.cdecl, importc: "gsl_vector_complex_free", dynlib: libgsl.}
proc gsl_vector_complex_view_array*(base: ptr cdouble; n: csize_t): gsl_vector_complex_view {. cdecl, importc: "gsl_vector_complex_view_array", dynlib: libgsl.}
proc gsl_vector_complex_view_array_with_stride*(base: ptr cdouble; stride: csize_t; n: csize_t): gsl_vector_complex_view {.cdecl, importc: "gsl_vector_complex_view_array_with_stride",  dynlib: libgsl.}
proc gsl_vector_complex_const_view_array*(base: ptr cdouble; n: csize_t): gsl_vector_complex_const_view {. cdecl, importc: "gsl_vector_complex_const_view_array", dynlib: libgsl.}
proc gsl_vector_complex_const_view_array_with_stride*(base: ptr cdouble; stride: csize_t; n: csize_t): gsl_vector_complex_const_view {.cdecl, importc: "gsl_vector_complex_const_view_array_with_stride", dynlib: libgsl.}
proc gsl_vector_complex_subvector*(base: ptr gsl_vector_complex; i: csize_t; n: csize_t): gsl_vector_complex_view {.cdecl, importc: "gsl_vector_complex_subvector", dynlib: libgsl.}
proc gsl_vector_complex_subvector_with_stride*(v: ptr gsl_vector_complex; i: csize_t; stride: csize_t; n: csize_t): gsl_vector_complex_view {.cdecl, importc: "gsl_vector_complex_subvector_with_stride", dynlib: libgsl.}
proc gsl_vector_complex_const_subvector*(base: ptr gsl_vector_complex; i: csize_t; n: csize_t): gsl_vector_complex_const_view {. cdecl, importc: "gsl_vector_complex_const_subvector", dynlib: libgsl.}
proc gsl_vector_complex_const_subvector_with_stride*(v: ptr gsl_vector_complex; i: csize_t; stride: csize_t; n: csize_t): gsl_vector_complex_const_view {.cdecl, importc: "gsl_vector_complex_const_subvector_with_stride", dynlib: libgsl.}
proc gsl_vector_complex_real*(v: ptr gsl_vector_complex): gsl_vector_view {.cdecl, importc: "gsl_vector_complex_real", dynlib: libgsl.}
proc gsl_vector_complex_imag*(v: ptr gsl_vector_complex): gsl_vector_view {.cdecl, importc: "gsl_vector_complex_imag", dynlib: libgsl.}
proc gsl_vector_complex_const_real*(v: ptr gsl_vector_complex): gsl_vector_const_view {. cdecl, importc: "gsl_vector_complex_const_real", dynlib: libgsl.}
proc gsl_vector_complex_const_imag*(v: ptr gsl_vector_complex): gsl_vector_const_view {. cdecl, importc: "gsl_vector_complex_const_imag", dynlib: libgsl.}
proc gsl_vector_complex_set_zero*(v: ptr gsl_vector_complex) {.cdecl, importc: "gsl_vector_complex_set_zero", dynlib: libgsl.}
proc gsl_vector_complex_set_all*(v: ptr gsl_vector_complex; z: gsl_complex) {.cdecl, importc: "gsl_vector_complex_set_all", dynlib: libgsl.}
proc gsl_vector_complex_set_basis*(v: ptr gsl_vector_complex; i: csize_t): cint {. cdecl, importc: "gsl_vector_complex_set_basis", dynlib: libgsl.}
proc gsl_vector_complex_fread*(stream: ptr FILE; v: ptr gsl_vector_complex): cint {. cdecl, importc: "gsl_vector_complex_fread", dynlib: libgsl.}
proc gsl_vector_complex_fwrite*(stream: ptr FILE; v: ptr gsl_vector_complex): cint {. cdecl, importc: "gsl_vector_complex_fwrite", dynlib: libgsl.}
proc gsl_vector_complex_fscanf*(stream: ptr FILE; v: ptr gsl_vector_complex): cint {. cdecl, importc: "gsl_vector_complex_fscanf", dynlib: libgsl.}
proc gsl_vector_complex_fprintf*(stream: ptr FILE; v: ptr gsl_vector_complex; format: cstring): cint {.cdecl, importc: "gsl_vector_complex_fprintf", dynlib: libgsl.}
proc gsl_vector_complex_memcpy*(dest: ptr gsl_vector_complex; src: ptr gsl_vector_complex): cint {.cdecl, importc: "gsl_vector_complex_memcpy", dynlib: libgsl.}
proc gsl_vector_complex_reverse*(v: ptr gsl_vector_complex): cint {.cdecl, importc: "gsl_vector_complex_reverse", dynlib: libgsl.}
proc gsl_vector_complex_swap*(v: ptr gsl_vector_complex; w: ptr gsl_vector_complex): cint {. cdecl, importc: "gsl_vector_complex_swap", dynlib: libgsl.}
proc gsl_vector_complex_swap_elements*(v: ptr gsl_vector_complex; i: csize_t;   j: csize_t): cint {.cdecl, importc: "gsl_vector_complex_swap_elements", dynlib: libgsl.}
proc gsl_vector_complex_equal*(u: ptr gsl_vector_complex; v: ptr gsl_vector_complex): cint {. cdecl, importc: "gsl_vector_complex_equal", dynlib: libgsl.}
proc gsl_vector_complex_isnull*(v: ptr gsl_vector_complex): cint {.cdecl, importc: "gsl_vector_complex_isnull", dynlib: libgsl.}
proc gsl_vector_complex_ispos*(v: ptr gsl_vector_complex): cint {.cdecl, importc: "gsl_vector_complex_ispos", dynlib: libgsl.}
proc gsl_vector_complex_isneg*(v: ptr gsl_vector_complex): cint {.cdecl, importc: "gsl_vector_complex_isneg", dynlib: libgsl.}
proc gsl_vector_complex_isnonneg*(v: ptr gsl_vector_complex): cint {.cdecl, importc: "gsl_vector_complex_isnonneg", dynlib: libgsl.}
proc gsl_vector_complex_add*(a: ptr gsl_vector_complex; b: ptr gsl_vector_complex): cint {. cdecl, importc: "gsl_vector_complex_add", dynlib: libgsl.}
proc gsl_vector_complex_sub*(a: ptr gsl_vector_complex; b: ptr gsl_vector_complex): cint {. cdecl, importc: "gsl_vector_complex_sub", dynlib: libgsl.}
proc gsl_vector_complex_mul*(a: ptr gsl_vector_complex; b: ptr gsl_vector_complex): cint {. cdecl, importc: "gsl_vector_complex_mul", dynlib: libgsl.}
proc gsl_vector_complex_div*(a: ptr gsl_vector_complex; b: ptr gsl_vector_complex): cint {. cdecl, importc: "gsl_vector_complex_div", dynlib: libgsl.}
proc gsl_vector_complex_scale*(a: ptr gsl_vector_complex; x: gsl_complex): cint {. cdecl, importc: "gsl_vector_complex_scale", dynlib: libgsl.}
proc gsl_vector_complex_add_constant*(a: ptr gsl_vector_complex; x: gsl_complex): cint {. cdecl, importc: "gsl_vector_complex_add_constant", dynlib: libgsl.}
proc gsl_vector_complex_get*(v: ptr gsl_vector_complex; i: csize_t): gsl_complex {. cdecl, importc: "gsl_vector_complex_get", dynlib: libgsl.}
proc gsl_vector_complex_set*(v: ptr gsl_vector_complex; i: csize_t; z: gsl_complex) {. cdecl, importc: "gsl_vector_complex_set", dynlib: libgsl.}
proc gsl_vector_complex_ptr*(v: ptr gsl_vector_complex; i: csize_t): ptr gsl_complex {. cdecl, importc: "gsl_vector_complex_ptr", dynlib: libgsl.}
proc gsl_vector_complex_const_ptr*(v: ptr gsl_vector_complex; i: csize_t): ptr gsl_complex {. cdecl, importc: "gsl_vector_complex_const_ptr", dynlib: libgsl.}
proc gsl_block_float_alloc*(n: csize_t): ptr gsl_block_float {.cdecl, importc: "gsl_block_float_alloc", dynlib: libgsl.}
proc gsl_block_float_calloc*(n: csize_t): ptr gsl_block_float {.cdecl, importc: "gsl_block_float_calloc", dynlib: libgsl.}
proc gsl_block_float_free*(b: ptr gsl_block_float) {.cdecl, importc: "gsl_block_float_free", dynlib: libgsl.}
proc gsl_block_float_fread*(stream: ptr FILE; b: ptr gsl_block_float): cint {.cdecl, importc: "gsl_block_float_fread", dynlib: libgsl.}
proc gsl_block_float_fwrite*(stream: ptr FILE; b: ptr gsl_block_float): cint {.cdecl, importc: "gsl_block_float_fwrite", dynlib: libgsl.}
proc gsl_block_float_fscanf*(stream: ptr FILE; b: ptr gsl_block_float): cint {.cdecl, importc: "gsl_block_float_fscanf", dynlib: libgsl.}
proc gsl_block_float_fprintf*(stream: ptr FILE; b: ptr gsl_block_float; format: cstring): cint {. cdecl, importc: "gsl_block_float_fprintf", dynlib: libgsl.}
proc gsl_block_float_raw_fread*(stream: ptr FILE; b: ptr cfloat; n: csize_t; stride: csize_t): cint {.cdecl, importc: "gsl_block_float_raw_fread", dynlib: libgsl.}
proc gsl_block_float_raw_fwrite*(stream: ptr FILE; b: ptr cfloat; n: csize_t; stride: csize_t): cint {.cdecl, importc: "gsl_block_float_raw_fwrite", dynlib: libgsl.}
proc gsl_block_float_raw_fscanf*(stream: ptr FILE; b: ptr cfloat; n: csize_t; stride: csize_t): cint {.cdecl, importc: "gsl_block_float_raw_fscanf", dynlib: libgsl.}
proc gsl_block_float_raw_fprintf*(stream: ptr FILE; b: ptr cfloat; n: csize_t; stride: csize_t; format: cstring): cint {.cdecl, importc: "gsl_block_float_raw_fprintf", dynlib: libgsl.}
proc gsl_block_float_size*(b: ptr gsl_block_float): csize_t {.cdecl, importc: "gsl_block_float_size", dynlib: libgsl.}
proc gsl_block_float_data*(b: ptr gsl_block_float): ptr cfloat {.cdecl, importc: "gsl_block_float_data", dynlib: libgsl.}
proc gsl_vector_float_alloc*(n: csize_t): ptr gsl_vector_float {.cdecl, importc: "gsl_vector_float_alloc", dynlib: libgsl.}
proc gsl_vector_float_calloc*(n: csize_t): ptr gsl_vector_float {.cdecl, importc: "gsl_vector_float_calloc", dynlib: libgsl.}
proc gsl_vector_float_alloc_from_block*(b: ptr gsl_block_float; offset: csize_t;    n: csize_t; stride: csize_t): ptr gsl_vector_float {. cdecl, importc: "gsl_vector_float_alloc_from_block", dynlib: libgsl.}
proc gsl_vector_float_alloc_from_vector*(v: ptr gsl_vector_float; offset: csize_t; n: csize_t; stride: csize_t): ptr gsl_vector_float {. cdecl, importc: "gsl_vector_float_alloc_from_vector", dynlib: libgsl.}
proc gsl_vector_float_free*(v: ptr gsl_vector_float) {.cdecl, importc: "gsl_vector_float_free", dynlib: libgsl.}
proc gsl_vector_float_view_array*(v: ptr cfloat; n: csize_t): gsl_vector_float_view {. cdecl, importc: "gsl_vector_float_view_array", dynlib: libgsl.}
proc gsl_vector_float_view_array_with_stride*(base: ptr cfloat; stride: csize_t; n: csize_t): gsl_vector_float_view {.cdecl, importc: "gsl_vector_float_view_array_with_stride",   dynlib: libgsl.}
proc gsl_vector_float_const_view_array*(v: ptr cfloat; n: csize_t): gsl_vector_float_const_view {. cdecl, importc: "gsl_vector_float_const_view_array", dynlib: libgsl.}
proc gsl_vector_float_const_view_array_with_stride*(base: ptr cfloat; stride: csize_t; n: csize_t): gsl_vector_float_const_view {.cdecl, importc: "gsl_vector_float_const_view_array_with_stride", dynlib: libgsl.}
proc gsl_vector_float_subvector*(v: ptr gsl_vector_float; i: csize_t; n: csize_t): gsl_vector_float_view {. cdecl, importc: "gsl_vector_float_subvector", dynlib: libgsl.}
proc gsl_vector_float_subvector_with_stride*(v: ptr gsl_vector_float; i: csize_t; stride: csize_t; n: csize_t): gsl_vector_float_view {.cdecl, importc: "gsl_vector_float_subvector_with_stride", dynlib: libgsl.}
proc gsl_vector_float_const_subvector*(v: ptr gsl_vector_float; i: csize_t; n: csize_t): gsl_vector_float_const_view {. cdecl, importc: "gsl_vector_float_const_subvector", dynlib: libgsl.}
proc gsl_vector_float_const_subvector_with_stride*(v: ptr gsl_vector_float; i: csize_t; stride: csize_t; n: csize_t): gsl_vector_float_const_view {.cdecl, importc: "gsl_vector_float_const_subvector_with_stride", dynlib: libgsl.}
proc gsl_vector_float_set_zero*(v: ptr gsl_vector_float) {.cdecl, importc: "gsl_vector_float_set_zero", dynlib: libgsl.}
proc gsl_vector_float_set_all*(v: ptr gsl_vector_float; x: cfloat) {.cdecl, importc: "gsl_vector_float_set_all", dynlib: libgsl.}
proc gsl_vector_float_set_basis*(v: ptr gsl_vector_float; i: csize_t): cint {.cdecl, importc: "gsl_vector_float_set_basis", dynlib: libgsl.}
proc gsl_vector_float_fread*(stream: ptr FILE; v: ptr gsl_vector_float): cint {.cdecl, importc: "gsl_vector_float_fread", dynlib: libgsl.}
proc gsl_vector_float_fwrite*(stream: ptr FILE; v: ptr gsl_vector_float): cint {.cdecl, importc: "gsl_vector_float_fwrite", dynlib: libgsl.}
proc gsl_vector_float_fscanf*(stream: ptr FILE; v: ptr gsl_vector_float): cint {.cdecl, importc: "gsl_vector_float_fscanf", dynlib: libgsl.}
proc gsl_vector_float_fprintf*(stream: ptr FILE; v: ptr gsl_vector_float;   format: cstring): cint {.cdecl, importc: "gsl_vector_float_fprintf", dynlib: libgsl.}
proc gsl_vector_float_memcpy*(dest: ptr gsl_vector_float; src: ptr gsl_vector_float): cint {. cdecl, importc: "gsl_vector_float_memcpy", dynlib: libgsl.}
proc gsl_vector_float_reverse*(v: ptr gsl_vector_float): cint {.cdecl, importc: "gsl_vector_float_reverse", dynlib: libgsl.}
proc gsl_vector_float_swap*(v: ptr gsl_vector_float; w: ptr gsl_vector_float): cint {. cdecl, importc: "gsl_vector_float_swap", dynlib: libgsl.}
proc gsl_vector_float_swap_elements*(v: ptr gsl_vector_float; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_vector_float_swap_elements", dynlib: libgsl.}
proc gsl_vector_float_max*(v: ptr gsl_vector_float): cfloat {.cdecl, importc: "gsl_vector_float_max", dynlib: libgsl.}
proc gsl_vector_float_min*(v: ptr gsl_vector_float): cfloat {.cdecl, importc: "gsl_vector_float_min", dynlib: libgsl.}
proc gsl_vector_float_minmax*(v: ptr gsl_vector_float; min_out: ptr cfloat;  max_out: ptr cfloat) {.cdecl, importc: "gsl_vector_float_minmax", dynlib: libgsl.}
proc gsl_vector_float_max_index*(v: ptr gsl_vector_float): csize_t {.cdecl, importc: "gsl_vector_float_max_index", dynlib: libgsl.}
proc gsl_vector_float_min_index*(v: ptr gsl_vector_float): csize_t {.cdecl, importc: "gsl_vector_float_min_index", dynlib: libgsl.}
proc gsl_vector_float_minmax_index*(v: ptr gsl_vector_float; imin: ptr csize_t;  imax: ptr csize_t) {.cdecl, importc: "gsl_vector_float_minmax_index", dynlib: libgsl.}
proc gsl_vector_float_add*(a: ptr gsl_vector_float; b: ptr gsl_vector_float): cint {. cdecl, importc: "gsl_vector_float_add", dynlib: libgsl.}
proc gsl_vector_float_sub*(a: ptr gsl_vector_float; b: ptr gsl_vector_float): cint {. cdecl, importc: "gsl_vector_float_sub", dynlib: libgsl.}
proc gsl_vector_float_mul*(a: ptr gsl_vector_float; b: ptr gsl_vector_float): cint {. cdecl, importc: "gsl_vector_float_mul", dynlib: libgsl.}
proc gsl_vector_float_div*(a: ptr gsl_vector_float; b: ptr gsl_vector_float): cint {. cdecl, importc: "gsl_vector_float_div", dynlib: libgsl.}
proc gsl_vector_float_scale*(a: ptr gsl_vector_float; x: cdouble): cint {.cdecl, importc: "gsl_vector_float_scale", dynlib: libgsl.}
proc gsl_vector_float_add_constant*(a: ptr gsl_vector_float; x: cdouble): cint {.cdecl, importc: "gsl_vector_float_add_constant", dynlib: libgsl.}
proc gsl_vector_float_equal*(u: ptr gsl_vector_float; v: ptr gsl_vector_float): cint {. cdecl, importc: "gsl_vector_float_equal", dynlib: libgsl.}
proc gsl_vector_float_isnull*(v: ptr gsl_vector_float): cint {.cdecl, importc: "gsl_vector_float_isnull", dynlib: libgsl.}
proc gsl_vector_float_ispos*(v: ptr gsl_vector_float): cint {.cdecl, importc: "gsl_vector_float_ispos", dynlib: libgsl.}
proc gsl_vector_float_isneg*(v: ptr gsl_vector_float): cint {.cdecl, importc: "gsl_vector_float_isneg", dynlib: libgsl.}
proc gsl_vector_float_isnonneg*(v: ptr gsl_vector_float): cint {.cdecl, importc: "gsl_vector_float_isnonneg", dynlib: libgsl.}
proc gsl_vector_float_get*(v: ptr gsl_vector_float; i: csize_t): cfloat {.cdecl, importc: "gsl_vector_float_get", dynlib: libgsl.}
proc gsl_vector_float_set*(v: ptr gsl_vector_float; i: csize_t; x: cfloat) {.cdecl, importc: "gsl_vector_float_set", dynlib: libgsl.}
proc gsl_vector_float_ptr*(v: ptr gsl_vector_float; i: csize_t): ptr cfloat {.cdecl, importc: "gsl_vector_float_ptr", dynlib: libgsl.}
proc gsl_vector_float_const_ptr*(v: ptr gsl_vector_float; i: csize_t): ptr cfloat {. cdecl, importc: "gsl_vector_float_const_ptr", dynlib: libgsl.}
proc gsl_block_complex_float_alloc*(n: csize_t): ptr gsl_block_complex_float {.cdecl, importc: "gsl_block_complex_float_alloc", dynlib: libgsl.}
proc gsl_block_complex_float_calloc*(n: csize_t): ptr gsl_block_complex_float {. cdecl, importc: "gsl_block_complex_float_calloc", dynlib: libgsl.}
proc gsl_block_complex_float_free*(b: ptr gsl_block_complex_float) {.cdecl, importc: "gsl_block_complex_float_free", dynlib: libgsl.}
proc gsl_block_complex_float_fread*(stream: ptr FILE; b: ptr gsl_block_complex_float): cint {. cdecl, importc: "gsl_block_complex_float_fread", dynlib: libgsl.}
proc gsl_block_complex_float_fwrite*(stream: ptr FILE; b: ptr gsl_block_complex_float): cint {.cdecl, importc: "gsl_block_complex_float_fwrite", dynlib: libgsl.}
proc gsl_block_complex_float_fscanf*(stream: ptr FILE; b: ptr gsl_block_complex_float): cint {.cdecl, importc: "gsl_block_complex_float_fscanf", dynlib: libgsl.}
proc gsl_block_complex_float_fprintf*(stream: ptr FILE;  b: ptr gsl_block_complex_float;  format: cstring): cint {.cdecl, importc: "gsl_block_complex_float_fprintf", dynlib: libgsl.}
proc gsl_block_complex_float_raw_fread*(stream: ptr FILE; b: ptr cfloat; n: csize_t;    stride: csize_t): cint {.cdecl, importc: "gsl_block_complex_float_raw_fread", dynlib: libgsl.}
proc gsl_block_complex_float_raw_fwrite*(stream: ptr FILE; b: ptr cfloat; n: csize_t; stride: csize_t): cint {.cdecl, importc: "gsl_block_complex_float_raw_fwrite", dynlib: libgsl.}
proc gsl_block_complex_float_raw_fscanf*(stream: ptr FILE; b: ptr cfloat; n: csize_t; stride: csize_t): cint {.cdecl, importc: "gsl_block_complex_float_raw_fscanf", dynlib: libgsl.}
proc gsl_block_complex_float_raw_fprintf*(stream: ptr FILE; b: ptr cfloat; n: csize_t; stride: csize_t; format: cstring): cint {.cdecl, importc: "gsl_block_complex_float_raw_fprintf", dynlib: libgsl.}
proc gsl_block_complex_float_size*(b: ptr gsl_block_complex_float): csize_t {.cdecl, importc: "gsl_block_complex_float_size", dynlib: libgsl.}
proc gsl_block_complex_float_data*(b: ptr gsl_block_complex_float): ptr cfloat {. cdecl, importc: "gsl_block_complex_float_data", dynlib: libgsl.}
proc gsl_vector_complex_float_alloc*(n: csize_t): ptr gsl_vector_complex_float {. cdecl, importc: "gsl_vector_complex_float_alloc", dynlib: libgsl.}
proc gsl_vector_complex_float_calloc*(n: csize_t): ptr gsl_vector_complex_float {. cdecl, importc: "gsl_vector_complex_float_calloc", dynlib: libgsl.}
proc gsl_vector_complex_float_alloc_from_block*(b: ptr gsl_block_complex_float; offset: csize_t; n: csize_t; stride: csize_t): ptr gsl_vector_complex_float {.cdecl, importc: "gsl_vector_complex_float_alloc_from_block", dynlib: libgsl.}
proc gsl_vector_complex_float_alloc_from_vector*(v: ptr gsl_vector_complex_float; offset: csize_t; n: csize_t; stride: csize_t): ptr gsl_vector_complex_float {.cdecl, importc: "gsl_vector_complex_float_alloc_from_vector", dynlib: libgsl.}
proc gsl_vector_complex_float_free*(v: ptr gsl_vector_complex_float) {.cdecl, importc: "gsl_vector_complex_float_free", dynlib: libgsl.}
proc gsl_vector_complex_float_view_array*(base: ptr cfloat; n: csize_t): gsl_vector_complex_float_view {. cdecl, importc: "gsl_vector_complex_float_view_array", dynlib: libgsl.}
proc gsl_vector_complex_float_view_array_with_stride*(base: ptr cfloat; stride: csize_t; n: csize_t): gsl_vector_complex_float_view {.cdecl, importc: "gsl_vector_complex_float_view_array_with_stride", dynlib: libgsl.}
proc gsl_vector_complex_float_const_view_array*(base: ptr cfloat; n: csize_t): gsl_vector_complex_float_const_view {. cdecl, importc: "gsl_vector_complex_float_const_view_array", dynlib: libgsl.}
proc gsl_vector_complex_float_const_view_array_with_stride*(base: ptr cfloat; stride: csize_t; n: csize_t): gsl_vector_complex_float_const_view {.cdecl, importc: "gsl_vector_complex_float_const_view_array_with_stride", dynlib: libgsl.}
proc gsl_vector_complex_float_subvector*(base: ptr gsl_vector_complex_float; i: csize_t; n: csize_t): gsl_vector_complex_float_view {. cdecl, importc: "gsl_vector_complex_float_subvector", dynlib: libgsl.}
proc gsl_vector_complex_float_subvector_with_stride*(v: ptr gsl_vector_complex_float; i: csize_t; stride: csize_t; n: csize_t): gsl_vector_complex_float_view {. cdecl, importc: "gsl_vector_complex_float_subvector_with_stride", dynlib: libgsl.}
proc gsl_vector_complex_float_const_subvector*(base: ptr gsl_vector_complex_float; i: csize_t; n: csize_t): gsl_vector_complex_float_const_view {. cdecl, importc: "gsl_vector_complex_float_const_subvector", dynlib: libgsl.}
proc gsl_vector_complex_float_const_subvector_with_stride*(v: ptr gsl_vector_complex_float; i: csize_t; stride: csize_t; n: csize_t): gsl_vector_complex_float_const_view {. cdecl, importc: "gsl_vector_complex_float_const_subvector_with_stride", dynlib: libgsl.}
proc gsl_vector_complex_float_real*(v: ptr gsl_vector_complex_float): gsl_vector_float_view {. cdecl, importc: "gsl_vector_complex_float_real", dynlib: libgsl.}
proc gsl_vector_complex_float_imag*(v: ptr gsl_vector_complex_float): gsl_vector_float_view {. cdecl, importc: "gsl_vector_complex_float_imag", dynlib: libgsl.}
proc gsl_vector_complex_float_const_real*(v: ptr gsl_vector_complex_float): gsl_vector_float_const_view {. cdecl, importc: "gsl_vector_complex_float_const_real", dynlib: libgsl.}
proc gsl_vector_complex_float_const_imag*(v: ptr gsl_vector_complex_float): gsl_vector_float_const_view {. cdecl, importc: "gsl_vector_complex_float_const_imag", dynlib: libgsl.}
proc gsl_vector_complex_float_set_zero*(v: ptr gsl_vector_complex_float) {.cdecl, importc: "gsl_vector_complex_float_set_zero", dynlib: libgsl.}
proc gsl_vector_complex_float_set_all*(v: ptr gsl_vector_complex_float;   z: gsl_complex_float) {.cdecl, importc: "gsl_vector_complex_float_set_all", dynlib: libgsl.}
proc gsl_vector_complex_float_set_basis*(v: ptr gsl_vector_complex_float; i: csize_t): cint {. cdecl, importc: "gsl_vector_complex_float_set_basis", dynlib: libgsl.}
proc gsl_vector_complex_float_fread*(stream: ptr FILE; v: ptr gsl_vector_complex_float): cint {.cdecl, importc: "gsl_vector_complex_float_fread", dynlib: libgsl.}
proc gsl_vector_complex_float_fwrite*(stream: ptr FILE;  v: ptr gsl_vector_complex_float): cint {.cdecl, importc: "gsl_vector_complex_float_fwrite", dynlib: libgsl.}
proc gsl_vector_complex_float_fscanf*(stream: ptr FILE;  v: ptr gsl_vector_complex_float): cint {.cdecl, importc: "gsl_vector_complex_float_fscanf", dynlib: libgsl.}
proc gsl_vector_complex_float_fprintf*(stream: ptr FILE;   v: ptr gsl_vector_complex_float;   format: cstring): cint {.cdecl, importc: "gsl_vector_complex_float_fprintf", dynlib: libgsl.}
proc gsl_vector_complex_float_memcpy*(dest: ptr gsl_vector_complex_float;  src: ptr gsl_vector_complex_float): cint {. cdecl, importc: "gsl_vector_complex_float_memcpy", dynlib: libgsl.}
proc gsl_vector_complex_float_reverse*(v: ptr gsl_vector_complex_float): cint {. cdecl, importc: "gsl_vector_complex_float_reverse", dynlib: libgsl.}
proc gsl_vector_complex_float_swap*(v: ptr gsl_vector_complex_float;  w: ptr gsl_vector_complex_float): cint {.cdecl, importc: "gsl_vector_complex_float_swap", dynlib: libgsl.}
proc gsl_vector_complex_float_swap_elements*(v: ptr gsl_vector_complex_float; i: csize_t; j: csize_t): cint {.cdecl, importc: "gsl_vector_complex_float_swap_elements", dynlib: libgsl.}
proc gsl_vector_complex_float_equal*(u: ptr gsl_vector_complex_float; v: ptr gsl_vector_complex_float): cint {.cdecl, importc: "gsl_vector_complex_float_equal", dynlib: libgsl.}
proc gsl_vector_complex_float_isnull*(v: ptr gsl_vector_complex_float): cint {.cdecl, importc: "gsl_vector_complex_float_isnull", dynlib: libgsl.}
proc gsl_vector_complex_float_ispos*(v: ptr gsl_vector_complex_float): cint {.cdecl, importc: "gsl_vector_complex_float_ispos", dynlib: libgsl.}
proc gsl_vector_complex_float_isneg*(v: ptr gsl_vector_complex_float): cint {.cdecl, importc: "gsl_vector_complex_float_isneg", dynlib: libgsl.}
proc gsl_vector_complex_float_isnonneg*(v: ptr gsl_vector_complex_float): cint {. cdecl, importc: "gsl_vector_complex_float_isnonneg", dynlib: libgsl.}
proc gsl_vector_complex_float_add*(a: ptr gsl_vector_complex_float; b: ptr gsl_vector_complex_float): cint {.cdecl, importc: "gsl_vector_complex_float_add", dynlib: libgsl.}
proc gsl_vector_complex_float_sub*(a: ptr gsl_vector_complex_float; b: ptr gsl_vector_complex_float): cint {.cdecl, importc: "gsl_vector_complex_float_sub", dynlib: libgsl.}
proc gsl_vector_complex_float_mul*(a: ptr gsl_vector_complex_float; b: ptr gsl_vector_complex_float): cint {.cdecl, importc: "gsl_vector_complex_float_mul", dynlib: libgsl.}
proc gsl_vector_complex_float_div*(a: ptr gsl_vector_complex_float; b: ptr gsl_vector_complex_float): cint {.cdecl, importc: "gsl_vector_complex_float_div", dynlib: libgsl.}
proc gsl_vector_complex_float_scale*(a: ptr gsl_vector_complex_float; x: gsl_complex_float): cint {.cdecl, importc: "gsl_vector_complex_float_scale", dynlib: libgsl.}
proc gsl_vector_complex_float_add_constant*(a: ptr gsl_vector_complex_float; x: gsl_complex_float): cint {.cdecl, importc: "gsl_vector_complex_float_add_constant", dynlib: libgsl.}
proc gsl_vector_complex_float_get*(v: ptr gsl_vector_complex_float; i: csize_t): gsl_complex_float {. cdecl, importc: "gsl_vector_complex_float_get", dynlib: libgsl.}
proc gsl_vector_complex_float_set*(v: ptr gsl_vector_complex_float; i: csize_t; z: gsl_complex_float) {.cdecl, importc: "gsl_vector_complex_float_set", dynlib: libgsl.}
proc gsl_vector_complex_float_ptr*(v: ptr gsl_vector_complex_float; i: csize_t): ptr gsl_complex_float {. cdecl, importc: "gsl_vector_complex_float_ptr", dynlib: libgsl.}
proc gsl_vector_complex_float_const_ptr*(v: ptr gsl_vector_complex_float; i: csize_t): ptr gsl_complex_float {. cdecl, importc: "gsl_vector_complex_float_const_ptr", dynlib: libgsl.}
proc gsl_block_ulong_alloc*(n: csize_t): ptr gsl_block_ulong {.cdecl, importc: "gsl_block_ulong_alloc", dynlib: libgsl.}
proc gsl_block_ulong_calloc*(n: csize_t): ptr gsl_block_ulong {.cdecl, importc: "gsl_block_ulong_calloc", dynlib: libgsl.}
proc gsl_block_ulong_free*(b: ptr gsl_block_ulong) {.cdecl, importc: "gsl_block_ulong_free", dynlib: libgsl.}
proc gsl_block_ulong_fread*(stream: ptr FILE; b: ptr gsl_block_ulong): cint {.cdecl, importc: "gsl_block_ulong_fread", dynlib: libgsl.}
proc gsl_block_ulong_fwrite*(stream: ptr FILE; b: ptr gsl_block_ulong): cint {.cdecl, importc: "gsl_block_ulong_fwrite", dynlib: libgsl.}
proc gsl_block_ulong_fscanf*(stream: ptr FILE; b: ptr gsl_block_ulong): cint {.cdecl, importc: "gsl_block_ulong_fscanf", dynlib: libgsl.}
proc gsl_block_ulong_fprintf*(stream: ptr FILE; b: ptr gsl_block_ulong; format: cstring): cint {. cdecl, importc: "gsl_block_ulong_fprintf", dynlib: libgsl.}
proc gsl_block_ulong_raw_fread*(stream: ptr FILE; b: ptr culong; n: csize_t; stride: csize_t): cint {.cdecl, importc: "gsl_block_ulong_raw_fread", dynlib: libgsl.}
proc gsl_block_ulong_raw_fwrite*(stream: ptr FILE; b: ptr culong; n: csize_t; stride: csize_t): cint {.cdecl, importc: "gsl_block_ulong_raw_fwrite", dynlib: libgsl.}
proc gsl_block_ulong_raw_fscanf*(stream: ptr FILE; b: ptr culong; n: csize_t; stride: csize_t): cint {.cdecl, importc: "gsl_block_ulong_raw_fscanf", dynlib: libgsl.}
proc gsl_block_ulong_raw_fprintf*(stream: ptr FILE; b: ptr culong; n: csize_t; stride: csize_t; format: cstring): cint {.cdecl, importc: "gsl_block_ulong_raw_fprintf", dynlib: libgsl.}
proc gsl_block_ulong_size*(b: ptr gsl_block_ulong): csize_t {.cdecl, importc: "gsl_block_ulong_size", dynlib: libgsl.}
proc gsl_block_ulong_data*(b: ptr gsl_block_ulong): ptr culong {.cdecl, importc: "gsl_block_ulong_data", dynlib: libgsl.}
proc gsl_vector_ulong_alloc*(n: csize_t): ptr gsl_vector_ulong {.cdecl, importc: "gsl_vector_ulong_alloc", dynlib: libgsl.}
proc gsl_vector_ulong_calloc*(n: csize_t): ptr gsl_vector_ulong {.cdecl, importc: "gsl_vector_ulong_calloc", dynlib: libgsl.}
proc gsl_vector_ulong_alloc_from_block*(b: ptr gsl_block_ulong; offset: csize_t;    n: csize_t; stride: csize_t): ptr gsl_vector_ulong {. cdecl, importc: "gsl_vector_ulong_alloc_from_block", dynlib: libgsl.}
proc gsl_vector_ulong_alloc_from_vector*(v: ptr gsl_vector_ulong; offset: csize_t; n: csize_t; stride: csize_t): ptr gsl_vector_ulong {. cdecl, importc: "gsl_vector_ulong_alloc_from_vector", dynlib: libgsl.}
proc gsl_vector_ulong_free*(v: ptr gsl_vector_ulong) {.cdecl, importc: "gsl_vector_ulong_free", dynlib: libgsl.}
proc gsl_vector_ulong_view_array*(v: ptr culong; n: csize_t): gsl_vector_ulong_view {. cdecl, importc: "gsl_vector_ulong_view_array", dynlib: libgsl.}
proc gsl_vector_ulong_view_array_with_stride*(base: ptr culong; stride: csize_t; n: csize_t): gsl_vector_ulong_view {.cdecl, importc: "gsl_vector_ulong_view_array_with_stride",   dynlib: libgsl.}
proc gsl_vector_ulong_const_view_array*(v: ptr culong; n: csize_t): gsl_vector_ulong_const_view {. cdecl, importc: "gsl_vector_ulong_const_view_array", dynlib: libgsl.}
proc gsl_vector_ulong_const_view_array_with_stride*(base: ptr culong; stride: csize_t; n: csize_t): gsl_vector_ulong_const_view {.cdecl, importc: "gsl_vector_ulong_const_view_array_with_stride", dynlib: libgsl.}
proc gsl_vector_ulong_subvector*(v: ptr gsl_vector_ulong; i: csize_t; n: csize_t): gsl_vector_ulong_view {. cdecl, importc: "gsl_vector_ulong_subvector", dynlib: libgsl.}
proc gsl_vector_ulong_subvector_with_stride*(v: ptr gsl_vector_ulong; i: csize_t; stride: csize_t; n: csize_t): gsl_vector_ulong_view {.cdecl, importc: "gsl_vector_ulong_subvector_with_stride", dynlib: libgsl.}
proc gsl_vector_ulong_const_subvector*(v: ptr gsl_vector_ulong; i: csize_t; n: csize_t): gsl_vector_ulong_const_view {. cdecl, importc: "gsl_vector_ulong_const_subvector", dynlib: libgsl.}
proc gsl_vector_ulong_const_subvector_with_stride*(v: ptr gsl_vector_ulong; i: csize_t; stride: csize_t; n: csize_t): gsl_vector_ulong_const_view {.cdecl, importc: "gsl_vector_ulong_const_subvector_with_stride", dynlib: libgsl.}
proc gsl_vector_ulong_set_zero*(v: ptr gsl_vector_ulong) {.cdecl, importc: "gsl_vector_ulong_set_zero", dynlib: libgsl.}
proc gsl_vector_ulong_set_all*(v: ptr gsl_vector_ulong; x: culong) {.cdecl, importc: "gsl_vector_ulong_set_all", dynlib: libgsl.}
proc gsl_vector_ulong_set_basis*(v: ptr gsl_vector_ulong; i: csize_t): cint {.cdecl, importc: "gsl_vector_ulong_set_basis", dynlib: libgsl.}
proc gsl_vector_ulong_fread*(stream: ptr FILE; v: ptr gsl_vector_ulong): cint {.cdecl, importc: "gsl_vector_ulong_fread", dynlib: libgsl.}
proc gsl_vector_ulong_fwrite*(stream: ptr FILE; v: ptr gsl_vector_ulong): cint {.cdecl, importc: "gsl_vector_ulong_fwrite", dynlib: libgsl.}
proc gsl_vector_ulong_fscanf*(stream: ptr FILE; v: ptr gsl_vector_ulong): cint {.cdecl, importc: "gsl_vector_ulong_fscanf", dynlib: libgsl.}
proc gsl_vector_ulong_fprintf*(stream: ptr FILE; v: ptr gsl_vector_ulong;   format: cstring): cint {.cdecl, importc: "gsl_vector_ulong_fprintf", dynlib: libgsl.}
proc gsl_vector_ulong_memcpy*(dest: ptr gsl_vector_ulong; src: ptr gsl_vector_ulong): cint {. cdecl, importc: "gsl_vector_ulong_memcpy", dynlib: libgsl.}
proc gsl_vector_ulong_reverse*(v: ptr gsl_vector_ulong): cint {.cdecl, importc: "gsl_vector_ulong_reverse", dynlib: libgsl.}
proc gsl_vector_ulong_swap*(v: ptr gsl_vector_ulong; w: ptr gsl_vector_ulong): cint {. cdecl, importc: "gsl_vector_ulong_swap", dynlib: libgsl.}
proc gsl_vector_ulong_swap_elements*(v: ptr gsl_vector_ulong; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_vector_ulong_swap_elements", dynlib: libgsl.}
proc gsl_vector_ulong_max*(v: ptr gsl_vector_ulong): culong {.cdecl, importc: "gsl_vector_ulong_max", dynlib: libgsl.}
proc gsl_vector_ulong_min*(v: ptr gsl_vector_ulong): culong {.cdecl, importc: "gsl_vector_ulong_min", dynlib: libgsl.}
proc gsl_vector_ulong_minmax*(v: ptr gsl_vector_ulong; min_out: ptr culong;  max_out: ptr culong) {.cdecl, importc: "gsl_vector_ulong_minmax", dynlib: libgsl.}
proc gsl_vector_ulong_max_index*(v: ptr gsl_vector_ulong): csize_t {.cdecl, importc: "gsl_vector_ulong_max_index", dynlib: libgsl.}
proc gsl_vector_ulong_min_index*(v: ptr gsl_vector_ulong): csize_t {.cdecl, importc: "gsl_vector_ulong_min_index", dynlib: libgsl.}
proc gsl_vector_ulong_minmax_index*(v: ptr gsl_vector_ulong; imin: ptr csize_t;  imax: ptr csize_t) {.cdecl, importc: "gsl_vector_ulong_minmax_index", dynlib: libgsl.}
proc gsl_vector_ulong_add*(a: ptr gsl_vector_ulong; b: ptr gsl_vector_ulong): cint {. cdecl, importc: "gsl_vector_ulong_add", dynlib: libgsl.}
proc gsl_vector_ulong_sub*(a: ptr gsl_vector_ulong; b: ptr gsl_vector_ulong): cint {. cdecl, importc: "gsl_vector_ulong_sub", dynlib: libgsl.}
proc gsl_vector_ulong_mul*(a: ptr gsl_vector_ulong; b: ptr gsl_vector_ulong): cint {. cdecl, importc: "gsl_vector_ulong_mul", dynlib: libgsl.}
proc gsl_vector_ulong_div*(a: ptr gsl_vector_ulong; b: ptr gsl_vector_ulong): cint {. cdecl, importc: "gsl_vector_ulong_div", dynlib: libgsl.}
proc gsl_vector_ulong_scale*(a: ptr gsl_vector_ulong; x: cdouble): cint {.cdecl, importc: "gsl_vector_ulong_scale", dynlib: libgsl.}
proc gsl_vector_ulong_add_constant*(a: ptr gsl_vector_ulong; x: cdouble): cint {.cdecl, importc: "gsl_vector_ulong_add_constant", dynlib: libgsl.}
proc gsl_vector_ulong_equal*(u: ptr gsl_vector_ulong; v: ptr gsl_vector_ulong): cint {. cdecl, importc: "gsl_vector_ulong_equal", dynlib: libgsl.}
proc gsl_vector_ulong_isnull*(v: ptr gsl_vector_ulong): cint {.cdecl, importc: "gsl_vector_ulong_isnull", dynlib: libgsl.}
proc gsl_vector_ulong_ispos*(v: ptr gsl_vector_ulong): cint {.cdecl, importc: "gsl_vector_ulong_ispos", dynlib: libgsl.}
proc gsl_vector_ulong_isneg*(v: ptr gsl_vector_ulong): cint {.cdecl, importc: "gsl_vector_ulong_isneg", dynlib: libgsl.}
proc gsl_vector_ulong_isnonneg*(v: ptr gsl_vector_ulong): cint {.cdecl, importc: "gsl_vector_ulong_isnonneg", dynlib: libgsl.}
proc gsl_vector_ulong_get*(v: ptr gsl_vector_ulong; i: csize_t): culong {.cdecl, importc: "gsl_vector_ulong_get", dynlib: libgsl.}
proc gsl_vector_ulong_set*(v: ptr gsl_vector_ulong; i: csize_t; x: culong) {.cdecl, importc: "gsl_vector_ulong_set", dynlib: libgsl.}
proc gsl_vector_ulong_ptr*(v: ptr gsl_vector_ulong; i: csize_t): ptr culong {.cdecl, importc: "gsl_vector_ulong_ptr", dynlib: libgsl.}
proc gsl_vector_ulong_const_ptr*(v: ptr gsl_vector_ulong; i: csize_t): ptr culong {. cdecl, importc: "gsl_vector_ulong_const_ptr", dynlib: libgsl.}
proc gsl_block_long_alloc*(n: csize_t): ptr gsl_block_long {.cdecl, importc: "gsl_block_long_alloc", dynlib: libgsl.}
proc gsl_block_long_calloc*(n: csize_t): ptr gsl_block_long {.cdecl, importc: "gsl_block_long_calloc", dynlib: libgsl.}
proc gsl_block_long_free*(b: ptr gsl_block_long) {.cdecl, importc: "gsl_block_long_free", dynlib: libgsl.}
proc gsl_block_long_fread*(stream: ptr FILE; b: ptr gsl_block_long): cint {.cdecl, importc: "gsl_block_long_fread", dynlib: libgsl.}
proc gsl_block_long_fwrite*(stream: ptr FILE; b: ptr gsl_block_long): cint {.cdecl, importc: "gsl_block_long_fwrite", dynlib: libgsl.}
proc gsl_block_long_fscanf*(stream: ptr FILE; b: ptr gsl_block_long): cint {.cdecl, importc: "gsl_block_long_fscanf", dynlib: libgsl.}
proc gsl_block_long_fprintf*(stream: ptr FILE; b: ptr gsl_block_long; format: cstring): cint {. cdecl, importc: "gsl_block_long_fprintf", dynlib: libgsl.}
proc gsl_block_long_raw_fread*(stream: ptr FILE; b: ptr clong; n: csize_t;   stride: csize_t): cint {.cdecl, importc: "gsl_block_long_raw_fread", dynlib: libgsl.}
proc gsl_block_long_raw_fwrite*(stream: ptr FILE; b: ptr clong; n: csize_t; stride: csize_t): cint {.cdecl, importc: "gsl_block_long_raw_fwrite", dynlib: libgsl.}
proc gsl_block_long_raw_fscanf*(stream: ptr FILE; b: ptr clong; n: csize_t; stride: csize_t): cint {.cdecl, importc: "gsl_block_long_raw_fscanf", dynlib: libgsl.}
proc gsl_block_long_raw_fprintf*(stream: ptr FILE; b: ptr clong; n: csize_t; stride: csize_t; format: cstring): cint {.cdecl, importc: "gsl_block_long_raw_fprintf", dynlib: libgsl.}
proc gsl_block_long_size*(b: ptr gsl_block_long): csize_t {.cdecl, importc: "gsl_block_long_size", dynlib: libgsl.}
proc gsl_block_long_data*(b: ptr gsl_block_long): ptr clong {.cdecl, importc: "gsl_block_long_data", dynlib: libgsl.}
proc gsl_vector_long_alloc*(n: csize_t): ptr gsl_vector_long {.cdecl, importc: "gsl_vector_long_alloc", dynlib: libgsl.}
proc gsl_vector_long_calloc*(n: csize_t): ptr gsl_vector_long {.cdecl, importc: "gsl_vector_long_calloc", dynlib: libgsl.}
proc gsl_vector_long_alloc_from_block*(b: ptr gsl_block_long; offset: csize_t;   n: csize_t; stride: csize_t): ptr gsl_vector_long {. cdecl, importc: "gsl_vector_long_alloc_from_block", dynlib: libgsl.}
proc gsl_vector_long_alloc_from_vector*(v: ptr gsl_vector_long; offset: csize_t;    n: csize_t; stride: csize_t): ptr gsl_vector_long {. cdecl, importc: "gsl_vector_long_alloc_from_vector", dynlib: libgsl.}
proc gsl_vector_long_free*(v: ptr gsl_vector_long) {.cdecl, importc: "gsl_vector_long_free", dynlib: libgsl.}
proc gsl_vector_long_view_array*(v: ptr clong; n: csize_t): gsl_vector_long_view {. cdecl, importc: "gsl_vector_long_view_array", dynlib: libgsl.}
proc gsl_vector_long_view_array_with_stride*(base: ptr clong; stride: csize_t; n: csize_t): gsl_vector_long_view {.cdecl, importc: "gsl_vector_long_view_array_with_stride",  dynlib: libgsl.}
proc gsl_vector_long_const_view_array*(v: ptr clong; n: csize_t): gsl_vector_long_const_view {. cdecl, importc: "gsl_vector_long_const_view_array", dynlib: libgsl.}
proc gsl_vector_long_const_view_array_with_stride*(base: ptr clong; stride: csize_t; n: csize_t): gsl_vector_long_const_view {.cdecl, importc: "gsl_vector_long_const_view_array_with_stride", dynlib: libgsl.}
proc gsl_vector_long_subvector*(v: ptr gsl_vector_long; i: csize_t; n: csize_t): gsl_vector_long_view {. cdecl, importc: "gsl_vector_long_subvector", dynlib: libgsl.}
proc gsl_vector_long_subvector_with_stride*(v: ptr gsl_vector_long; i: csize_t; stride: csize_t; n: csize_t): gsl_vector_long_view {.cdecl, importc: "gsl_vector_long_subvector_with_stride", dynlib: libgsl.}
proc gsl_vector_long_const_subvector*(v: ptr gsl_vector_long; i: csize_t; n: csize_t): gsl_vector_long_const_view {. cdecl, importc: "gsl_vector_long_const_subvector", dynlib: libgsl.}
proc gsl_vector_long_const_subvector_with_stride*(v: ptr gsl_vector_long; i: csize_t; stride: csize_t; n: csize_t): gsl_vector_long_const_view {.cdecl, importc: "gsl_vector_long_const_subvector_with_stride", dynlib: libgsl.}
proc gsl_vector_long_set_zero*(v: ptr gsl_vector_long) {.cdecl, importc: "gsl_vector_long_set_zero", dynlib: libgsl.}
proc gsl_vector_long_set_all*(v: ptr gsl_vector_long; x: clong) {.cdecl, importc: "gsl_vector_long_set_all", dynlib: libgsl.}
proc gsl_vector_long_set_basis*(v: ptr gsl_vector_long; i: csize_t): cint {.cdecl, importc: "gsl_vector_long_set_basis", dynlib: libgsl.}
proc gsl_vector_long_fread*(stream: ptr FILE; v: ptr gsl_vector_long): cint {.cdecl, importc: "gsl_vector_long_fread", dynlib: libgsl.}
proc gsl_vector_long_fwrite*(stream: ptr FILE; v: ptr gsl_vector_long): cint {.cdecl, importc: "gsl_vector_long_fwrite", dynlib: libgsl.}
proc gsl_vector_long_fscanf*(stream: ptr FILE; v: ptr gsl_vector_long): cint {.cdecl, importc: "gsl_vector_long_fscanf", dynlib: libgsl.}
proc gsl_vector_long_fprintf*(stream: ptr FILE; v: ptr gsl_vector_long; format: cstring): cint {. cdecl, importc: "gsl_vector_long_fprintf", dynlib: libgsl.}
proc gsl_vector_long_memcpy*(dest: ptr gsl_vector_long; src: ptr gsl_vector_long): cint {. cdecl, importc: "gsl_vector_long_memcpy", dynlib: libgsl.}
proc gsl_vector_long_reverse*(v: ptr gsl_vector_long): cint {.cdecl, importc: "gsl_vector_long_reverse", dynlib: libgsl.}
proc gsl_vector_long_swap*(v: ptr gsl_vector_long; w: ptr gsl_vector_long): cint {. cdecl, importc: "gsl_vector_long_swap", dynlib: libgsl.}
proc gsl_vector_long_swap_elements*(v: ptr gsl_vector_long; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_vector_long_swap_elements", dynlib: libgsl.}
proc gsl_vector_long_max*(v: ptr gsl_vector_long): clong {.cdecl, importc: "gsl_vector_long_max", dynlib: libgsl.}
proc gsl_vector_long_min*(v: ptr gsl_vector_long): clong {.cdecl, importc: "gsl_vector_long_min", dynlib: libgsl.}
proc gsl_vector_long_minmax*(v: ptr gsl_vector_long; min_out: ptr clong; max_out: ptr clong) {.cdecl, importc: "gsl_vector_long_minmax", dynlib: libgsl.}
proc gsl_vector_long_max_index*(v: ptr gsl_vector_long): csize_t {.cdecl, importc: "gsl_vector_long_max_index", dynlib: libgsl.}
proc gsl_vector_long_min_index*(v: ptr gsl_vector_long): csize_t {.cdecl, importc: "gsl_vector_long_min_index", dynlib: libgsl.}
proc gsl_vector_long_minmax_index*(v: ptr gsl_vector_long; imin: ptr csize_t; imax: ptr csize_t) {.cdecl, importc: "gsl_vector_long_minmax_index", dynlib: libgsl.}
proc gsl_vector_long_add*(a: ptr gsl_vector_long; b: ptr gsl_vector_long): cint {.cdecl, importc: "gsl_vector_long_add", dynlib: libgsl.}
proc gsl_vector_long_sub*(a: ptr gsl_vector_long; b: ptr gsl_vector_long): cint {.cdecl, importc: "gsl_vector_long_sub", dynlib: libgsl.}
proc gsl_vector_long_mul*(a: ptr gsl_vector_long; b: ptr gsl_vector_long): cint {.cdecl, importc: "gsl_vector_long_mul", dynlib: libgsl.}
proc gsl_vector_long_div*(a: ptr gsl_vector_long; b: ptr gsl_vector_long): cint {.cdecl, importc: "gsl_vector_long_div", dynlib: libgsl.}
proc gsl_vector_long_scale*(a: ptr gsl_vector_long; x: cdouble): cint {.cdecl, importc: "gsl_vector_long_scale", dynlib: libgsl.}
proc gsl_vector_long_add_constant*(a: ptr gsl_vector_long; x: cdouble): cint {.cdecl, importc: "gsl_vector_long_add_constant", dynlib: libgsl.}
proc gsl_vector_long_equal*(u: ptr gsl_vector_long; v: ptr gsl_vector_long): cint {. cdecl, importc: "gsl_vector_long_equal", dynlib: libgsl.}
proc gsl_vector_long_isnull*(v: ptr gsl_vector_long): cint {.cdecl, importc: "gsl_vector_long_isnull", dynlib: libgsl.}
proc gsl_vector_long_ispos*(v: ptr gsl_vector_long): cint {.cdecl, importc: "gsl_vector_long_ispos", dynlib: libgsl.}
proc gsl_vector_long_isneg*(v: ptr gsl_vector_long): cint {.cdecl, importc: "gsl_vector_long_isneg", dynlib: libgsl.}
proc gsl_vector_long_isnonneg*(v: ptr gsl_vector_long): cint {.cdecl, importc: "gsl_vector_long_isnonneg", dynlib: libgsl.}
proc gsl_vector_long_get*(v: ptr gsl_vector_long; i: csize_t): clong {.cdecl, importc: "gsl_vector_long_get", dynlib: libgsl.}
proc gsl_vector_long_set*(v: ptr gsl_vector_long; i: csize_t; x: clong) {.cdecl, importc: "gsl_vector_long_set", dynlib: libgsl.}
proc gsl_vector_long_ptr*(v: ptr gsl_vector_long; i: csize_t): ptr clong {.cdecl, importc: "gsl_vector_long_ptr", dynlib: libgsl.}
proc gsl_vector_long_const_ptr*(v: ptr gsl_vector_long; i: csize_t): ptr clong {.cdecl, importc: "gsl_vector_long_const_ptr", dynlib: libgsl.}
proc gsl_block_uint_alloc*(n: csize_t): ptr gsl_block_uint {.cdecl, importc: "gsl_block_uint_alloc", dynlib: libgsl.}
proc gsl_block_uint_calloc*(n: csize_t): ptr gsl_block_uint {.cdecl, importc: "gsl_block_uint_calloc", dynlib: libgsl.}
proc gsl_block_uint_free*(b: ptr gsl_block_uint) {.cdecl, importc: "gsl_block_uint_free", dynlib: libgsl.}
proc gsl_block_uint_fread*(stream: ptr FILE; b: ptr gsl_block_uint): cint {.cdecl, importc: "gsl_block_uint_fread", dynlib: libgsl.}
proc gsl_block_uint_fwrite*(stream: ptr FILE; b: ptr gsl_block_uint): cint {.cdecl, importc: "gsl_block_uint_fwrite", dynlib: libgsl.}
proc gsl_block_uint_fscanf*(stream: ptr FILE; b: ptr gsl_block_uint): cint {.cdecl, importc: "gsl_block_uint_fscanf", dynlib: libgsl.}
proc gsl_block_uint_fprintf*(stream: ptr FILE; b: ptr gsl_block_uint; format: cstring): cint {. cdecl, importc: "gsl_block_uint_fprintf", dynlib: libgsl.}
proc gsl_block_uint_raw_fread*(stream: ptr FILE; b: ptr cuint; n: csize_t;   stride: csize_t): cint {.cdecl, importc: "gsl_block_uint_raw_fread", dynlib: libgsl.}
proc gsl_block_uint_raw_fwrite*(stream: ptr FILE; b: ptr cuint; n: csize_t; stride: csize_t): cint {.cdecl, importc: "gsl_block_uint_raw_fwrite", dynlib: libgsl.}
proc gsl_block_uint_raw_fscanf*(stream: ptr FILE; b: ptr cuint; n: csize_t; stride: csize_t): cint {.cdecl, importc: "gsl_block_uint_raw_fscanf", dynlib: libgsl.}
proc gsl_block_uint_raw_fprintf*(stream: ptr FILE; b: ptr cuint; n: csize_t; stride: csize_t; format: cstring): cint {.cdecl, importc: "gsl_block_uint_raw_fprintf", dynlib: libgsl.}
proc gsl_block_uint_size*(b: ptr gsl_block_uint): csize_t {.cdecl, importc: "gsl_block_uint_size", dynlib: libgsl.}
proc gsl_block_uint_data*(b: ptr gsl_block_uint): ptr cuint {.cdecl, importc: "gsl_block_uint_data", dynlib: libgsl.}
proc gsl_vector_uint_alloc*(n: csize_t): ptr gsl_vector_uint {.cdecl, importc: "gsl_vector_uint_alloc", dynlib: libgsl.}
proc gsl_vector_uint_calloc*(n: csize_t): ptr gsl_vector_uint {.cdecl, importc: "gsl_vector_uint_calloc", dynlib: libgsl.}
proc gsl_vector_uint_alloc_from_block*(b: ptr gsl_block_uint; offset: csize_t;   n: csize_t; stride: csize_t): ptr gsl_vector_uint {. cdecl, importc: "gsl_vector_uint_alloc_from_block", dynlib: libgsl.}
proc gsl_vector_uint_alloc_from_vector*(v: ptr gsl_vector_uint; offset: csize_t;    n: csize_t; stride: csize_t): ptr gsl_vector_uint {. cdecl, importc: "gsl_vector_uint_alloc_from_vector", dynlib: libgsl.}
proc gsl_vector_uint_free*(v: ptr gsl_vector_uint) {.cdecl, importc: "gsl_vector_uint_free", dynlib: libgsl.}
proc gsl_vector_uint_view_array*(v: ptr cuint; n: csize_t): gsl_vector_uint_view {. cdecl, importc: "gsl_vector_uint_view_array", dynlib: libgsl.}
proc gsl_vector_uint_view_array_with_stride*(base: ptr cuint; stride: csize_t; n: csize_t): gsl_vector_uint_view {.cdecl, importc: "gsl_vector_uint_view_array_with_stride",  dynlib: libgsl.}
proc gsl_vector_uint_const_view_array*(v: ptr cuint; n: csize_t): gsl_vector_uint_const_view {. cdecl, importc: "gsl_vector_uint_const_view_array", dynlib: libgsl.}
proc gsl_vector_uint_const_view_array_with_stride*(base: ptr cuint; stride: csize_t; n: csize_t): gsl_vector_uint_const_view {.cdecl, importc: "gsl_vector_uint_const_view_array_with_stride", dynlib: libgsl.}
proc gsl_vector_uint_subvector*(v: ptr gsl_vector_uint; i: csize_t; n: csize_t): gsl_vector_uint_view {. cdecl, importc: "gsl_vector_uint_subvector", dynlib: libgsl.}
proc gsl_vector_uint_subvector_with_stride*(v: ptr gsl_vector_uint; i: csize_t; stride: csize_t; n: csize_t): gsl_vector_uint_view {.cdecl, importc: "gsl_vector_uint_subvector_with_stride", dynlib: libgsl.}
proc gsl_vector_uint_const_subvector*(v: ptr gsl_vector_uint; i: csize_t; n: csize_t): gsl_vector_uint_const_view {. cdecl, importc: "gsl_vector_uint_const_subvector", dynlib: libgsl.}
proc gsl_vector_uint_const_subvector_with_stride*(v: ptr gsl_vector_uint; i: csize_t; stride: csize_t; n: csize_t): gsl_vector_uint_const_view {.cdecl, importc: "gsl_vector_uint_const_subvector_with_stride", dynlib: libgsl.}
proc gsl_vector_uint_set_zero*(v: ptr gsl_vector_uint) {.cdecl, importc: "gsl_vector_uint_set_zero", dynlib: libgsl.}
proc gsl_vector_uint_set_all*(v: ptr gsl_vector_uint; x: cuint) {.cdecl, importc: "gsl_vector_uint_set_all", dynlib: libgsl.}
proc gsl_vector_uint_set_basis*(v: ptr gsl_vector_uint; i: csize_t): cint {.cdecl, importc: "gsl_vector_uint_set_basis", dynlib: libgsl.}
proc gsl_vector_uint_fread*(stream: ptr FILE; v: ptr gsl_vector_uint): cint {.cdecl, importc: "gsl_vector_uint_fread", dynlib: libgsl.}
proc gsl_vector_uint_fwrite*(stream: ptr FILE; v: ptr gsl_vector_uint): cint {.cdecl, importc: "gsl_vector_uint_fwrite", dynlib: libgsl.}
proc gsl_vector_uint_fscanf*(stream: ptr FILE; v: ptr gsl_vector_uint): cint {.cdecl, importc: "gsl_vector_uint_fscanf", dynlib: libgsl.}
proc gsl_vector_uint_fprintf*(stream: ptr FILE; v: ptr gsl_vector_uint; format: cstring): cint {. cdecl, importc: "gsl_vector_uint_fprintf", dynlib: libgsl.}
proc gsl_vector_uint_memcpy*(dest: ptr gsl_vector_uint; src: ptr gsl_vector_uint): cint {. cdecl, importc: "gsl_vector_uint_memcpy", dynlib: libgsl.}
proc gsl_vector_uint_reverse*(v: ptr gsl_vector_uint): cint {.cdecl, importc: "gsl_vector_uint_reverse", dynlib: libgsl.}
proc gsl_vector_uint_swap*(v: ptr gsl_vector_uint; w: ptr gsl_vector_uint): cint {. cdecl, importc: "gsl_vector_uint_swap", dynlib: libgsl.}
proc gsl_vector_uint_swap_elements*(v: ptr gsl_vector_uint; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_vector_uint_swap_elements", dynlib: libgsl.}
proc gsl_vector_uint_max*(v: ptr gsl_vector_uint): cuint {.cdecl, importc: "gsl_vector_uint_max", dynlib: libgsl.}
proc gsl_vector_uint_min*(v: ptr gsl_vector_uint): cuint {.cdecl, importc: "gsl_vector_uint_min", dynlib: libgsl.}
proc gsl_vector_uint_minmax*(v: ptr gsl_vector_uint; min_out: ptr cuint; max_out: ptr cuint) {.cdecl, importc: "gsl_vector_uint_minmax", dynlib: libgsl.}
proc gsl_vector_uint_max_index*(v: ptr gsl_vector_uint): csize_t {.cdecl, importc: "gsl_vector_uint_max_index", dynlib: libgsl.}
proc gsl_vector_uint_min_index*(v: ptr gsl_vector_uint): csize_t {.cdecl, importc: "gsl_vector_uint_min_index", dynlib: libgsl.}
proc gsl_vector_uint_minmax_index*(v: ptr gsl_vector_uint; imin: ptr csize_t; imax: ptr csize_t) {.cdecl, importc: "gsl_vector_uint_minmax_index", dynlib: libgsl.}
proc gsl_vector_uint_add*(a: ptr gsl_vector_uint; b: ptr gsl_vector_uint): cint {.cdecl, importc: "gsl_vector_uint_add", dynlib: libgsl.}
proc gsl_vector_uint_sub*(a: ptr gsl_vector_uint; b: ptr gsl_vector_uint): cint {.cdecl, importc: "gsl_vector_uint_sub", dynlib: libgsl.}
proc gsl_vector_uint_mul*(a: ptr gsl_vector_uint; b: ptr gsl_vector_uint): cint {.cdecl, importc: "gsl_vector_uint_mul", dynlib: libgsl.}
proc gsl_vector_uint_div*(a: ptr gsl_vector_uint; b: ptr gsl_vector_uint): cint {.cdecl, importc: "gsl_vector_uint_div", dynlib: libgsl.}
proc gsl_vector_uint_scale*(a: ptr gsl_vector_uint; x: cdouble): cint {.cdecl, importc: "gsl_vector_uint_scale", dynlib: libgsl.}
proc gsl_vector_uint_add_constant*(a: ptr gsl_vector_uint; x: cdouble): cint {.cdecl, importc: "gsl_vector_uint_add_constant", dynlib: libgsl.}
proc gsl_vector_uint_equal*(u: ptr gsl_vector_uint; v: ptr gsl_vector_uint): cint {. cdecl, importc: "gsl_vector_uint_equal", dynlib: libgsl.}
proc gsl_vector_uint_isnull*(v: ptr gsl_vector_uint): cint {.cdecl, importc: "gsl_vector_uint_isnull", dynlib: libgsl.}
proc gsl_vector_uint_ispos*(v: ptr gsl_vector_uint): cint {.cdecl, importc: "gsl_vector_uint_ispos", dynlib: libgsl.}
proc gsl_vector_uint_isneg*(v: ptr gsl_vector_uint): cint {.cdecl, importc: "gsl_vector_uint_isneg", dynlib: libgsl.}
proc gsl_vector_uint_isnonneg*(v: ptr gsl_vector_uint): cint {.cdecl, importc: "gsl_vector_uint_isnonneg", dynlib: libgsl.}
proc gsl_vector_uint_get*(v: ptr gsl_vector_uint; i: csize_t): cuint {.cdecl, importc: "gsl_vector_uint_get", dynlib: libgsl.}
proc gsl_vector_uint_set*(v: ptr gsl_vector_uint; i: csize_t; x: cuint) {.cdecl, importc: "gsl_vector_uint_set", dynlib: libgsl.}
proc gsl_vector_uint_ptr*(v: ptr gsl_vector_uint; i: csize_t): ptr cuint {.cdecl, importc: "gsl_vector_uint_ptr", dynlib: libgsl.}
proc gsl_vector_uint_const_ptr*(v: ptr gsl_vector_uint; i: csize_t): ptr cuint {.cdecl, importc: "gsl_vector_uint_const_ptr", dynlib: libgsl.}
proc gsl_block_int_alloc*(n: csize_t): ptr gsl_block_int {.cdecl, importc: "gsl_block_int_alloc", dynlib: libgsl.}
proc gsl_block_int_calloc*(n: csize_t): ptr gsl_block_int {.cdecl, importc: "gsl_block_int_calloc", dynlib: libgsl.}
proc gsl_block_int_free*(b: ptr gsl_block_int) {.cdecl, importc: "gsl_block_int_free", dynlib: libgsl.}
proc gsl_block_int_fread*(stream: ptr FILE; b: ptr gsl_block_int): cint {.cdecl, importc: "gsl_block_int_fread", dynlib: libgsl.}
proc gsl_block_int_fwrite*(stream: ptr FILE; b: ptr gsl_block_int): cint {.cdecl, importc: "gsl_block_int_fwrite", dynlib: libgsl.}
proc gsl_block_int_fscanf*(stream: ptr FILE; b: ptr gsl_block_int): cint {.cdecl, importc: "gsl_block_int_fscanf", dynlib: libgsl.}
proc gsl_block_int_fprintf*(stream: ptr FILE; b: ptr gsl_block_int; format: cstring): cint {. cdecl, importc: "gsl_block_int_fprintf", dynlib: libgsl.}
proc gsl_block_int_raw_fread*(stream: ptr FILE; b: ptr cint; n: csize_t; stride: csize_t): cint {. cdecl, importc: "gsl_block_int_raw_fread", dynlib: libgsl.}
proc gsl_block_int_raw_fwrite*(stream: ptr FILE; b: ptr cint; n: csize_t; stride: csize_t): cint {. cdecl, importc: "gsl_block_int_raw_fwrite", dynlib: libgsl.}
proc gsl_block_int_raw_fscanf*(stream: ptr FILE; b: ptr cint; n: csize_t; stride: csize_t): cint {. cdecl, importc: "gsl_block_int_raw_fscanf", dynlib: libgsl.}
proc gsl_block_int_raw_fprintf*(stream: ptr FILE; b: ptr cint; n: csize_t; stride: csize_t; format: cstring): cint {.cdecl, importc: "gsl_block_int_raw_fprintf", dynlib: libgsl.}
proc gsl_block_int_size*(b: ptr gsl_block_int): csize_t {.cdecl, importc: "gsl_block_int_size", dynlib: libgsl.}
proc gsl_block_int_data*(b: ptr gsl_block_int): ptr cint {.cdecl, importc: "gsl_block_int_data", dynlib: libgsl.}
proc gsl_vector_int_alloc*(n: csize_t): ptr gsl_vector_int {.cdecl, importc: "gsl_vector_int_alloc", dynlib: libgsl.}
proc gsl_vector_int_calloc*(n: csize_t): ptr gsl_vector_int {.cdecl, importc: "gsl_vector_int_calloc", dynlib: libgsl.}
proc gsl_vector_int_alloc_from_block*(b: ptr gsl_block_int; offset: csize_t;  n: csize_t; stride: csize_t): ptr gsl_vector_int {. cdecl, importc: "gsl_vector_int_alloc_from_block", dynlib: libgsl.}
proc gsl_vector_int_alloc_from_vector*(v: ptr gsl_vector_int; offset: csize_t;   n: csize_t; stride: csize_t): ptr gsl_vector_int {. cdecl, importc: "gsl_vector_int_alloc_from_vector", dynlib: libgsl.}
proc gsl_vector_int_free*(v: ptr gsl_vector_int) {.cdecl, importc: "gsl_vector_int_free", dynlib: libgsl.}
proc gsl_vector_int_view_array*(v: ptr cint; n: csize_t): gsl_vector_int_view {.cdecl, importc: "gsl_vector_int_view_array", dynlib: libgsl.}
proc gsl_vector_int_view_array_with_stride*(base: ptr cint; stride: csize_t; n: csize_t): gsl_vector_int_view {.cdecl, importc: "gsl_vector_int_view_array_with_stride", dynlib: libgsl.}
proc gsl_vector_int_const_view_array*(v: ptr cint; n: csize_t): gsl_vector_int_const_view {. cdecl, importc: "gsl_vector_int_const_view_array", dynlib: libgsl.}
proc gsl_vector_int_const_view_array_with_stride*(base: ptr cint; stride: csize_t; n: csize_t): gsl_vector_int_const_view {.cdecl, importc: "gsl_vector_int_const_view_array_with_stride", dynlib: libgsl.}
proc gsl_vector_int_subvector*(v: ptr gsl_vector_int; i: csize_t; n: csize_t): gsl_vector_int_view {. cdecl, importc: "gsl_vector_int_subvector", dynlib: libgsl.}
proc gsl_vector_int_subvector_with_stride*(v: ptr gsl_vector_int; i: csize_t; stride: csize_t; n: csize_t): gsl_vector_int_view {.cdecl, importc: "gsl_vector_int_subvector_with_stride", dynlib: libgsl.}
proc gsl_vector_int_const_subvector*(v: ptr gsl_vector_int; i: csize_t; n: csize_t): gsl_vector_int_const_view {. cdecl, importc: "gsl_vector_int_const_subvector", dynlib: libgsl.}
proc gsl_vector_int_const_subvector_with_stride*(v: ptr gsl_vector_int; i: csize_t; stride: csize_t; n: csize_t): gsl_vector_int_const_view {.cdecl, importc: "gsl_vector_int_const_subvector_with_stride", dynlib: libgsl.}
proc gsl_vector_int_set_zero*(v: ptr gsl_vector_int) {.cdecl, importc: "gsl_vector_int_set_zero", dynlib: libgsl.}
proc gsl_vector_int_set_all*(v: ptr gsl_vector_int; x: cint) {.cdecl, importc: "gsl_vector_int_set_all", dynlib: libgsl.}
proc gsl_vector_int_set_basis*(v: ptr gsl_vector_int; i: csize_t): cint {.cdecl, importc: "gsl_vector_int_set_basis", dynlib: libgsl.}
proc gsl_vector_int_fread*(stream: ptr FILE; v: ptr gsl_vector_int): cint {.cdecl, importc: "gsl_vector_int_fread", dynlib: libgsl.}
proc gsl_vector_int_fwrite*(stream: ptr FILE; v: ptr gsl_vector_int): cint {.cdecl, importc: "gsl_vector_int_fwrite", dynlib: libgsl.}
proc gsl_vector_int_fscanf*(stream: ptr FILE; v: ptr gsl_vector_int): cint {.cdecl, importc: "gsl_vector_int_fscanf", dynlib: libgsl.}
proc gsl_vector_int_fprintf*(stream: ptr FILE; v: ptr gsl_vector_int; format: cstring): cint {. cdecl, importc: "gsl_vector_int_fprintf", dynlib: libgsl.}
proc gsl_vector_int_memcpy*(dest: ptr gsl_vector_int; src: ptr gsl_vector_int): cint {. cdecl, importc: "gsl_vector_int_memcpy", dynlib: libgsl.}
proc gsl_vector_int_reverse*(v: ptr gsl_vector_int): cint {.cdecl, importc: "gsl_vector_int_reverse", dynlib: libgsl.}
proc gsl_vector_int_swap*(v: ptr gsl_vector_int; w: ptr gsl_vector_int): cint {.cdecl, importc: "gsl_vector_int_swap", dynlib: libgsl.}
proc gsl_vector_int_swap_elements*(v: ptr gsl_vector_int; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_vector_int_swap_elements", dynlib: libgsl.}
proc gsl_vector_int_max*(v: ptr gsl_vector_int): cint {.cdecl, importc: "gsl_vector_int_max", dynlib: libgsl.}
proc gsl_vector_int_min*(v: ptr gsl_vector_int): cint {.cdecl, importc: "gsl_vector_int_min", dynlib: libgsl.}
proc gsl_vector_int_minmax*(v: ptr gsl_vector_int; min_out: ptr cint; max_out: ptr cint) {. cdecl, importc: "gsl_vector_int_minmax", dynlib: libgsl.}
proc gsl_vector_int_max_index*(v: ptr gsl_vector_int): csize_t {.cdecl, importc: "gsl_vector_int_max_index", dynlib: libgsl.}
proc gsl_vector_int_min_index*(v: ptr gsl_vector_int): csize_t {.cdecl, importc: "gsl_vector_int_min_index", dynlib: libgsl.}
proc gsl_vector_int_minmax_index*(v: ptr gsl_vector_int; imin: ptr csize_t; imax: ptr csize_t) {.cdecl, importc: "gsl_vector_int_minmax_index", dynlib: libgsl.}
proc gsl_vector_int_add*(a: ptr gsl_vector_int; b: ptr gsl_vector_int): cint {.cdecl, importc: "gsl_vector_int_add", dynlib: libgsl.}
proc gsl_vector_int_sub*(a: ptr gsl_vector_int; b: ptr gsl_vector_int): cint {.cdecl, importc: "gsl_vector_int_sub", dynlib: libgsl.}
proc gsl_vector_int_mul*(a: ptr gsl_vector_int; b: ptr gsl_vector_int): cint {.cdecl, importc: "gsl_vector_int_mul", dynlib: libgsl.}
proc gsl_vector_int_div*(a: ptr gsl_vector_int; b: ptr gsl_vector_int): cint {.cdecl, importc: "gsl_vector_int_div", dynlib: libgsl.}
proc gsl_vector_int_scale*(a: ptr gsl_vector_int; x: cdouble): cint {.cdecl, importc: "gsl_vector_int_scale", dynlib: libgsl.}
proc gsl_vector_int_add_constant*(a: ptr gsl_vector_int; x: cdouble): cint {.cdecl, importc: "gsl_vector_int_add_constant", dynlib: libgsl.}
proc gsl_vector_int_equal*(u: ptr gsl_vector_int; v: ptr gsl_vector_int): cint {.cdecl, importc: "gsl_vector_int_equal", dynlib: libgsl.}
proc gsl_vector_int_isnull*(v: ptr gsl_vector_int): cint {.cdecl, importc: "gsl_vector_int_isnull", dynlib: libgsl.}
proc gsl_vector_int_ispos*(v: ptr gsl_vector_int): cint {.cdecl, importc: "gsl_vector_int_ispos", dynlib: libgsl.}
proc gsl_vector_int_isneg*(v: ptr gsl_vector_int): cint {.cdecl, importc: "gsl_vector_int_isneg", dynlib: libgsl.}
proc gsl_vector_int_isnonneg*(v: ptr gsl_vector_int): cint {.cdecl, importc: "gsl_vector_int_isnonneg", dynlib: libgsl.}
proc gsl_vector_int_get*(v: ptr gsl_vector_int; i: csize_t): cint {.cdecl, importc: "gsl_vector_int_get", dynlib: libgsl.}
proc gsl_vector_int_set*(v: ptr gsl_vector_int; i: csize_t; x: cint) {.cdecl, importc: "gsl_vector_int_set", dynlib: libgsl.}
proc gsl_vector_int_ptr*(v: ptr gsl_vector_int; i: csize_t): ptr cint {.cdecl, importc: "gsl_vector_int_ptr", dynlib: libgsl.}
proc gsl_vector_int_const_ptr*(v: ptr gsl_vector_int; i: csize_t): ptr cint {.cdecl, importc: "gsl_vector_int_const_ptr", dynlib: libgsl.}
proc gsl_block_ushort_alloc*(n: csize_t): ptr gsl_block_ushort {.cdecl, importc: "gsl_block_ushort_alloc", dynlib: libgsl.}
proc gsl_block_ushort_calloc*(n: csize_t): ptr gsl_block_ushort {.cdecl, importc: "gsl_block_ushort_calloc", dynlib: libgsl.}
proc gsl_block_ushort_free*(b: ptr gsl_block_ushort) {.cdecl, importc: "gsl_block_ushort_free", dynlib: libgsl.}
proc gsl_block_ushort_fread*(stream: ptr FILE; b: ptr gsl_block_ushort): cint {.cdecl, importc: "gsl_block_ushort_fread", dynlib: libgsl.}
proc gsl_block_ushort_fwrite*(stream: ptr FILE; b: ptr gsl_block_ushort): cint {.cdecl, importc: "gsl_block_ushort_fwrite", dynlib: libgsl.}
proc gsl_block_ushort_fscanf*(stream: ptr FILE; b: ptr gsl_block_ushort): cint {.cdecl, importc: "gsl_block_ushort_fscanf", dynlib: libgsl.}
proc gsl_block_ushort_fprintf*(stream: ptr FILE; b: ptr gsl_block_ushort;   format: cstring): cint {.cdecl, importc: "gsl_block_ushort_fprintf", dynlib: libgsl.}
proc gsl_block_ushort_raw_fread*(stream: ptr FILE; b: ptr cushort; n: csize_t; stride: csize_t): cint {.cdecl, importc: "gsl_block_ushort_raw_fread", dynlib: libgsl.}
proc gsl_block_ushort_raw_fwrite*(stream: ptr FILE; b: ptr cushort; n: csize_t; stride: csize_t): cint {.cdecl, importc: "gsl_block_ushort_raw_fwrite", dynlib: libgsl.}
proc gsl_block_ushort_raw_fscanf*(stream: ptr FILE; b: ptr cushort; n: csize_t; stride: csize_t): cint {.cdecl, importc: "gsl_block_ushort_raw_fscanf", dynlib: libgsl.}
proc gsl_block_ushort_raw_fprintf*(stream: ptr FILE; b: ptr cushort; n: csize_t; stride: csize_t; format: cstring): cint {.cdecl, importc: "gsl_block_ushort_raw_fprintf", dynlib: libgsl.}
proc gsl_block_ushort_size*(b: ptr gsl_block_ushort): csize_t {.cdecl, importc: "gsl_block_ushort_size", dynlib: libgsl.}
proc gsl_block_ushort_data*(b: ptr gsl_block_ushort): ptr cushort {.cdecl, importc: "gsl_block_ushort_data", dynlib: libgsl.}
proc gsl_vector_ushort_alloc*(n: csize_t): ptr gsl_vector_ushort {.cdecl, importc: "gsl_vector_ushort_alloc", dynlib: libgsl.}
proc gsl_vector_ushort_calloc*(n: csize_t): ptr gsl_vector_ushort {.cdecl, importc: "gsl_vector_ushort_calloc", dynlib: libgsl.}
proc gsl_vector_ushort_alloc_from_block*(b: ptr gsl_block_ushort; offset: csize_t; n: csize_t; stride: csize_t): ptr gsl_vector_ushort {. cdecl, importc: "gsl_vector_ushort_alloc_from_block", dynlib: libgsl.}
proc gsl_vector_ushort_alloc_from_vector*(v: ptr gsl_vector_ushort; offset: csize_t; n: csize_t; stride: csize_t): ptr gsl_vector_ushort {.cdecl, importc: "gsl_vector_ushort_alloc_from_vector", dynlib: libgsl.}
proc gsl_vector_ushort_free*(v: ptr gsl_vector_ushort) {.cdecl, importc: "gsl_vector_ushort_free", dynlib: libgsl.}
proc gsl_vector_ushort_view_array*(v: ptr cushort; n: csize_t): gsl_vector_ushort_view {. cdecl, importc: "gsl_vector_ushort_view_array", dynlib: libgsl.}
proc gsl_vector_ushort_view_array_with_stride*(base: ptr cushort; stride: csize_t; n: csize_t): gsl_vector_ushort_view {.cdecl, importc: "gsl_vector_ushort_view_array_with_stride", dynlib: libgsl.}
proc gsl_vector_ushort_const_view_array*(v: ptr cushort; n: csize_t): gsl_vector_ushort_const_view {. cdecl, importc: "gsl_vector_ushort_const_view_array", dynlib: libgsl.}
proc gsl_vector_ushort_const_view_array_with_stride*(base: ptr cushort; stride: csize_t; n: csize_t): gsl_vector_ushort_const_view {.cdecl, importc: "gsl_vector_ushort_const_view_array_with_stride", dynlib: libgsl.}
proc gsl_vector_ushort_subvector*(v: ptr gsl_vector_ushort; i: csize_t; n: csize_t): gsl_vector_ushort_view {. cdecl, importc: "gsl_vector_ushort_subvector", dynlib: libgsl.}
proc gsl_vector_ushort_subvector_with_stride*(v: ptr gsl_vector_ushort; i: csize_t; stride: csize_t; n: csize_t): gsl_vector_ushort_view {.cdecl, importc: "gsl_vector_ushort_subvector_with_stride", dynlib: libgsl.}
proc gsl_vector_ushort_const_subvector*(v: ptr gsl_vector_ushort; i: csize_t;    n: csize_t): gsl_vector_ushort_const_view {. cdecl, importc: "gsl_vector_ushort_const_subvector", dynlib: libgsl.}
proc gsl_vector_ushort_const_subvector_with_stride*(v: ptr gsl_vector_ushort; i: csize_t; stride: csize_t; n: csize_t): gsl_vector_ushort_const_view {.cdecl, importc: "gsl_vector_ushort_const_subvector_with_stride", dynlib: libgsl.}
proc gsl_vector_ushort_set_zero*(v: ptr gsl_vector_ushort) {.cdecl, importc: "gsl_vector_ushort_set_zero", dynlib: libgsl.}
proc gsl_vector_ushort_set_all*(v: ptr gsl_vector_ushort; x: cushort) {.cdecl, importc: "gsl_vector_ushort_set_all", dynlib: libgsl.}
proc gsl_vector_ushort_set_basis*(v: ptr gsl_vector_ushort; i: csize_t): cint {.cdecl, importc: "gsl_vector_ushort_set_basis", dynlib: libgsl.}
proc gsl_vector_ushort_fread*(stream: ptr FILE; v: ptr gsl_vector_ushort): cint {.cdecl, importc: "gsl_vector_ushort_fread", dynlib: libgsl.}
proc gsl_vector_ushort_fwrite*(stream: ptr FILE; v: ptr gsl_vector_ushort): cint {. cdecl, importc: "gsl_vector_ushort_fwrite", dynlib: libgsl.}
proc gsl_vector_ushort_fscanf*(stream: ptr FILE; v: ptr gsl_vector_ushort): cint {. cdecl, importc: "gsl_vector_ushort_fscanf", dynlib: libgsl.}
proc gsl_vector_ushort_fprintf*(stream: ptr FILE; v: ptr gsl_vector_ushort; format: cstring): cint {.cdecl, importc: "gsl_vector_ushort_fprintf", dynlib: libgsl.}
proc gsl_vector_ushort_memcpy*(dest: ptr gsl_vector_ushort;   src: ptr gsl_vector_ushort): cint {.cdecl, importc: "gsl_vector_ushort_memcpy", dynlib: libgsl.}
proc gsl_vector_ushort_reverse*(v: ptr gsl_vector_ushort): cint {.cdecl, importc: "gsl_vector_ushort_reverse", dynlib: libgsl.}
proc gsl_vector_ushort_swap*(v: ptr gsl_vector_ushort; w: ptr gsl_vector_ushort): cint {. cdecl, importc: "gsl_vector_ushort_swap", dynlib: libgsl.}
proc gsl_vector_ushort_swap_elements*(v: ptr gsl_vector_ushort; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_vector_ushort_swap_elements", dynlib: libgsl.}
proc gsl_vector_ushort_max*(v: ptr gsl_vector_ushort): cushort {.cdecl, importc: "gsl_vector_ushort_max", dynlib: libgsl.}
proc gsl_vector_ushort_min*(v: ptr gsl_vector_ushort): cushort {.cdecl, importc: "gsl_vector_ushort_min", dynlib: libgsl.}
proc gsl_vector_ushort_minmax*(v: ptr gsl_vector_ushort; min_out: ptr cushort;   max_out: ptr cushort) {.cdecl, importc: "gsl_vector_ushort_minmax", dynlib: libgsl.}
proc gsl_vector_ushort_max_index*(v: ptr gsl_vector_ushort): csize_t {.cdecl, importc: "gsl_vector_ushort_max_index", dynlib: libgsl.}
proc gsl_vector_ushort_min_index*(v: ptr gsl_vector_ushort): csize_t {.cdecl, importc: "gsl_vector_ushort_min_index", dynlib: libgsl.}
proc gsl_vector_ushort_minmax_index*(v: ptr gsl_vector_ushort; imin: ptr csize_t; imax: ptr csize_t) {.cdecl, importc: "gsl_vector_ushort_minmax_index", dynlib: libgsl.}
proc gsl_vector_ushort_add*(a: ptr gsl_vector_ushort; b: ptr gsl_vector_ushort): cint {. cdecl, importc: "gsl_vector_ushort_add", dynlib: libgsl.}
proc gsl_vector_ushort_sub*(a: ptr gsl_vector_ushort; b: ptr gsl_vector_ushort): cint {. cdecl, importc: "gsl_vector_ushort_sub", dynlib: libgsl.}
proc gsl_vector_ushort_mul*(a: ptr gsl_vector_ushort; b: ptr gsl_vector_ushort): cint {. cdecl, importc: "gsl_vector_ushort_mul", dynlib: libgsl.}
proc gsl_vector_ushort_div*(a: ptr gsl_vector_ushort; b: ptr gsl_vector_ushort): cint {. cdecl, importc: "gsl_vector_ushort_div", dynlib: libgsl.}
proc gsl_vector_ushort_scale*(a: ptr gsl_vector_ushort; x: cdouble): cint {.cdecl, importc: "gsl_vector_ushort_scale", dynlib: libgsl.}
proc gsl_vector_ushort_add_constant*(a: ptr gsl_vector_ushort; x: cdouble): cint {. cdecl, importc: "gsl_vector_ushort_add_constant", dynlib: libgsl.}
proc gsl_vector_ushort_equal*(u: ptr gsl_vector_ushort; v: ptr gsl_vector_ushort): cint {. cdecl, importc: "gsl_vector_ushort_equal", dynlib: libgsl.}
proc gsl_vector_ushort_isnull*(v: ptr gsl_vector_ushort): cint {.cdecl, importc: "gsl_vector_ushort_isnull", dynlib: libgsl.}
proc gsl_vector_ushort_ispos*(v: ptr gsl_vector_ushort): cint {.cdecl, importc: "gsl_vector_ushort_ispos", dynlib: libgsl.}
proc gsl_vector_ushort_isneg*(v: ptr gsl_vector_ushort): cint {.cdecl, importc: "gsl_vector_ushort_isneg", dynlib: libgsl.}
proc gsl_vector_ushort_isnonneg*(v: ptr gsl_vector_ushort): cint {.cdecl, importc: "gsl_vector_ushort_isnonneg", dynlib: libgsl.}
proc gsl_vector_ushort_get*(v: ptr gsl_vector_ushort; i: csize_t): cushort {.cdecl, importc: "gsl_vector_ushort_get", dynlib: libgsl.}
proc gsl_vector_ushort_set*(v: ptr gsl_vector_ushort; i: csize_t; x: cushort) {.cdecl, importc: "gsl_vector_ushort_set", dynlib: libgsl.}
proc gsl_vector_ushort_ptr*(v: ptr gsl_vector_ushort; i: csize_t): ptr cushort {.cdecl, importc: "gsl_vector_ushort_ptr", dynlib: libgsl.}
proc gsl_vector_ushort_const_ptr*(v: ptr gsl_vector_ushort; i: csize_t): ptr cushort {. cdecl, importc: "gsl_vector_ushort_const_ptr", dynlib: libgsl.}
proc gsl_block_short_alloc*(n: csize_t): ptr gsl_block_short {.cdecl, importc: "gsl_block_short_alloc", dynlib: libgsl.}
proc gsl_block_short_calloc*(n: csize_t): ptr gsl_block_short {.cdecl, importc: "gsl_block_short_calloc", dynlib: libgsl.}
proc gsl_block_short_free*(b: ptr gsl_block_short) {.cdecl, importc: "gsl_block_short_free", dynlib: libgsl.}
proc gsl_block_short_fread*(stream: ptr FILE; b: ptr gsl_block_short): cint {.cdecl, importc: "gsl_block_short_fread", dynlib: libgsl.}
proc gsl_block_short_fwrite*(stream: ptr FILE; b: ptr gsl_block_short): cint {.cdecl, importc: "gsl_block_short_fwrite", dynlib: libgsl.}
proc gsl_block_short_fscanf*(stream: ptr FILE; b: ptr gsl_block_short): cint {.cdecl, importc: "gsl_block_short_fscanf", dynlib: libgsl.}
proc gsl_block_short_fprintf*(stream: ptr FILE; b: ptr gsl_block_short; format: cstring): cint {. cdecl, importc: "gsl_block_short_fprintf", dynlib: libgsl.}
proc gsl_block_short_raw_fread*(stream: ptr FILE; b: ptr cshort; n: csize_t; stride: csize_t): cint {.cdecl, importc: "gsl_block_short_raw_fread", dynlib: libgsl.}
proc gsl_block_short_raw_fwrite*(stream: ptr FILE; b: ptr cshort; n: csize_t; stride: csize_t): cint {.cdecl, importc: "gsl_block_short_raw_fwrite", dynlib: libgsl.}
proc gsl_block_short_raw_fscanf*(stream: ptr FILE; b: ptr cshort; n: csize_t; stride: csize_t): cint {.cdecl, importc: "gsl_block_short_raw_fscanf", dynlib: libgsl.}
proc gsl_block_short_raw_fprintf*(stream: ptr FILE; b: ptr cshort; n: csize_t; stride: csize_t; format: cstring): cint {.cdecl, importc: "gsl_block_short_raw_fprintf", dynlib: libgsl.}
proc gsl_block_short_size*(b: ptr gsl_block_short): csize_t {.cdecl, importc: "gsl_block_short_size", dynlib: libgsl.}
proc gsl_block_short_data*(b: ptr gsl_block_short): ptr cshort {.cdecl, importc: "gsl_block_short_data", dynlib: libgsl.}
proc gsl_vector_short_alloc*(n: csize_t): ptr gsl_vector_short {.cdecl, importc: "gsl_vector_short_alloc", dynlib: libgsl.}
proc gsl_vector_short_calloc*(n: csize_t): ptr gsl_vector_short {.cdecl, importc: "gsl_vector_short_calloc", dynlib: libgsl.}
proc gsl_vector_short_alloc_from_block*(b: ptr gsl_block_short; offset: csize_t;    n: csize_t; stride: csize_t): ptr gsl_vector_short {. cdecl, importc: "gsl_vector_short_alloc_from_block", dynlib: libgsl.}
proc gsl_vector_short_alloc_from_vector*(v: ptr gsl_vector_short; offset: csize_t; n: csize_t; stride: csize_t): ptr gsl_vector_short {. cdecl, importc: "gsl_vector_short_alloc_from_vector", dynlib: libgsl.}
proc gsl_vector_short_free*(v: ptr gsl_vector_short) {.cdecl, importc: "gsl_vector_short_free", dynlib: libgsl.}
proc gsl_vector_short_view_array*(v: ptr cshort; n: csize_t): gsl_vector_short_view {. cdecl, importc: "gsl_vector_short_view_array", dynlib: libgsl.}
proc gsl_vector_short_view_array_with_stride*(base: ptr cshort; stride: csize_t; n: csize_t): gsl_vector_short_view {.cdecl, importc: "gsl_vector_short_view_array_with_stride",   dynlib: libgsl.}
proc gsl_vector_short_const_view_array*(v: ptr cshort; n: csize_t): gsl_vector_short_const_view {. cdecl, importc: "gsl_vector_short_const_view_array", dynlib: libgsl.}
proc gsl_vector_short_const_view_array_with_stride*(base: ptr cshort; stride: csize_t; n: csize_t): gsl_vector_short_const_view {.cdecl, importc: "gsl_vector_short_const_view_array_with_stride", dynlib: libgsl.}
proc gsl_vector_short_subvector*(v: ptr gsl_vector_short; i: csize_t; n: csize_t): gsl_vector_short_view {. cdecl, importc: "gsl_vector_short_subvector", dynlib: libgsl.}
proc gsl_vector_short_subvector_with_stride*(v: ptr gsl_vector_short; i: csize_t; stride: csize_t; n: csize_t): gsl_vector_short_view {.cdecl, importc: "gsl_vector_short_subvector_with_stride", dynlib: libgsl.}
proc gsl_vector_short_const_subvector*(v: ptr gsl_vector_short; i: csize_t; n: csize_t): gsl_vector_short_const_view {. cdecl, importc: "gsl_vector_short_const_subvector", dynlib: libgsl.}
proc gsl_vector_short_const_subvector_with_stride*(v: ptr gsl_vector_short; i: csize_t; stride: csize_t; n: csize_t): gsl_vector_short_const_view {.cdecl, importc: "gsl_vector_short_const_subvector_with_stride", dynlib: libgsl.}
proc gsl_vector_short_set_zero*(v: ptr gsl_vector_short) {.cdecl, importc: "gsl_vector_short_set_zero", dynlib: libgsl.}
proc gsl_vector_short_set_all*(v: ptr gsl_vector_short; x: cshort) {.cdecl, importc: "gsl_vector_short_set_all", dynlib: libgsl.}
proc gsl_vector_short_set_basis*(v: ptr gsl_vector_short; i: csize_t): cint {.cdecl, importc: "gsl_vector_short_set_basis", dynlib: libgsl.}
proc gsl_vector_short_fread*(stream: ptr FILE; v: ptr gsl_vector_short): cint {.cdecl, importc: "gsl_vector_short_fread", dynlib: libgsl.}
proc gsl_vector_short_fwrite*(stream: ptr FILE; v: ptr gsl_vector_short): cint {.cdecl, importc: "gsl_vector_short_fwrite", dynlib: libgsl.}
proc gsl_vector_short_fscanf*(stream: ptr FILE; v: ptr gsl_vector_short): cint {.cdecl, importc: "gsl_vector_short_fscanf", dynlib: libgsl.}
proc gsl_vector_short_fprintf*(stream: ptr FILE; v: ptr gsl_vector_short;   format: cstring): cint {.cdecl, importc: "gsl_vector_short_fprintf", dynlib: libgsl.}
proc gsl_vector_short_memcpy*(dest: ptr gsl_vector_short; src: ptr gsl_vector_short): cint {. cdecl, importc: "gsl_vector_short_memcpy", dynlib: libgsl.}
proc gsl_vector_short_reverse*(v: ptr gsl_vector_short): cint {.cdecl, importc: "gsl_vector_short_reverse", dynlib: libgsl.}
proc gsl_vector_short_swap*(v: ptr gsl_vector_short; w: ptr gsl_vector_short): cint {. cdecl, importc: "gsl_vector_short_swap", dynlib: libgsl.}
proc gsl_vector_short_swap_elements*(v: ptr gsl_vector_short; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_vector_short_swap_elements", dynlib: libgsl.}
proc gsl_vector_short_max*(v: ptr gsl_vector_short): cshort {.cdecl, importc: "gsl_vector_short_max", dynlib: libgsl.}
proc gsl_vector_short_min*(v: ptr gsl_vector_short): cshort {.cdecl, importc: "gsl_vector_short_min", dynlib: libgsl.}
proc gsl_vector_short_minmax*(v: ptr gsl_vector_short; min_out: ptr cshort;  max_out: ptr cshort) {.cdecl, importc: "gsl_vector_short_minmax", dynlib: libgsl.}
proc gsl_vector_short_max_index*(v: ptr gsl_vector_short): csize_t {.cdecl, importc: "gsl_vector_short_max_index", dynlib: libgsl.}
proc gsl_vector_short_min_index*(v: ptr gsl_vector_short): csize_t {.cdecl, importc: "gsl_vector_short_min_index", dynlib: libgsl.}
proc gsl_vector_short_minmax_index*(v: ptr gsl_vector_short; imin: ptr csize_t;  imax: ptr csize_t) {.cdecl, importc: "gsl_vector_short_minmax_index", dynlib: libgsl.}
proc gsl_vector_short_add*(a: ptr gsl_vector_short; b: ptr gsl_vector_short): cint {. cdecl, importc: "gsl_vector_short_add", dynlib: libgsl.}
proc gsl_vector_short_sub*(a: ptr gsl_vector_short; b: ptr gsl_vector_short): cint {. cdecl, importc: "gsl_vector_short_sub", dynlib: libgsl.}
proc gsl_vector_short_mul*(a: ptr gsl_vector_short; b: ptr gsl_vector_short): cint {. cdecl, importc: "gsl_vector_short_mul", dynlib: libgsl.}
proc gsl_vector_short_div*(a: ptr gsl_vector_short; b: ptr gsl_vector_short): cint {. cdecl, importc: "gsl_vector_short_div", dynlib: libgsl.}
proc gsl_vector_short_scale*(a: ptr gsl_vector_short; x: cdouble): cint {.cdecl, importc: "gsl_vector_short_scale", dynlib: libgsl.}
proc gsl_vector_short_add_constant*(a: ptr gsl_vector_short; x: cdouble): cint {.cdecl, importc: "gsl_vector_short_add_constant", dynlib: libgsl.}
proc gsl_vector_short_equal*(u: ptr gsl_vector_short; v: ptr gsl_vector_short): cint {. cdecl, importc: "gsl_vector_short_equal", dynlib: libgsl.}
proc gsl_vector_short_isnull*(v: ptr gsl_vector_short): cint {.cdecl, importc: "gsl_vector_short_isnull", dynlib: libgsl.}
proc gsl_vector_short_ispos*(v: ptr gsl_vector_short): cint {.cdecl, importc: "gsl_vector_short_ispos", dynlib: libgsl.}
proc gsl_vector_short_isneg*(v: ptr gsl_vector_short): cint {.cdecl, importc: "gsl_vector_short_isneg", dynlib: libgsl.}
proc gsl_vector_short_isnonneg*(v: ptr gsl_vector_short): cint {.cdecl, importc: "gsl_vector_short_isnonneg", dynlib: libgsl.}
proc gsl_vector_short_get*(v: ptr gsl_vector_short; i: csize_t): cshort {.cdecl, importc: "gsl_vector_short_get", dynlib: libgsl.}
proc gsl_vector_short_set*(v: ptr gsl_vector_short; i: csize_t; x: cshort) {.cdecl, importc: "gsl_vector_short_set", dynlib: libgsl.}
proc gsl_vector_short_ptr*(v: ptr gsl_vector_short; i: csize_t): ptr cshort {.cdecl, importc: "gsl_vector_short_ptr", dynlib: libgsl.}
proc gsl_vector_short_const_ptr*(v: ptr gsl_vector_short; i: csize_t): ptr cshort {. cdecl, importc: "gsl_vector_short_const_ptr", dynlib: libgsl.}
proc gsl_block_uchar_alloc*(n: csize_t): ptr gsl_block_uchar {.cdecl, importc: "gsl_block_uchar_alloc", dynlib: libgsl.}
proc gsl_block_uchar_calloc*(n: csize_t): ptr gsl_block_uchar {.cdecl, importc: "gsl_block_uchar_calloc", dynlib: libgsl.}
proc gsl_block_uchar_free*(b: ptr gsl_block_uchar) {.cdecl, importc: "gsl_block_uchar_free", dynlib: libgsl.}
proc gsl_block_uchar_fread*(stream: ptr FILE; b: ptr gsl_block_uchar): cint {.cdecl, importc: "gsl_block_uchar_fread", dynlib: libgsl.}
proc gsl_block_uchar_fwrite*(stream: ptr FILE; b: ptr gsl_block_uchar): cint {.cdecl, importc: "gsl_block_uchar_fwrite", dynlib: libgsl.}
proc gsl_block_uchar_fscanf*(stream: ptr FILE; b: ptr gsl_block_uchar): cint {.cdecl, importc: "gsl_block_uchar_fscanf", dynlib: libgsl.}
proc gsl_block_uchar_fprintf*(stream: ptr FILE; b: ptr gsl_block_uchar; format: cstring): cint {. cdecl, importc: "gsl_block_uchar_fprintf", dynlib: libgsl.}
proc gsl_block_uchar_raw_fread*(stream: ptr FILE; b: ptr cuchar; n: csize_t; stride: csize_t): cint {.cdecl, importc: "gsl_block_uchar_raw_fread", dynlib: libgsl.}
proc gsl_block_uchar_raw_fwrite*(stream: ptr FILE; b: ptr cuchar; n: csize_t; stride: csize_t): cint {.cdecl, importc: "gsl_block_uchar_raw_fwrite", dynlib: libgsl.}
proc gsl_block_uchar_raw_fscanf*(stream: ptr FILE; b: ptr cuchar; n: csize_t; stride: csize_t): cint {.cdecl, importc: "gsl_block_uchar_raw_fscanf", dynlib: libgsl.}
proc gsl_block_uchar_raw_fprintf*(stream: ptr FILE; b: ptr cuchar; n: csize_t; stride: csize_t; format: cstring): cint {.cdecl, importc: "gsl_block_uchar_raw_fprintf", dynlib: libgsl.}
proc gsl_block_uchar_size*(b: ptr gsl_block_uchar): csize_t {.cdecl, importc: "gsl_block_uchar_size", dynlib: libgsl.}
proc gsl_block_uchar_data*(b: ptr gsl_block_uchar): ptr cuchar {.cdecl, importc: "gsl_block_uchar_data", dynlib: libgsl.}
proc gsl_vector_uchar_alloc*(n: csize_t): ptr gsl_vector_uchar {.cdecl, importc: "gsl_vector_uchar_alloc", dynlib: libgsl.}
proc gsl_vector_uchar_calloc*(n: csize_t): ptr gsl_vector_uchar {.cdecl, importc: "gsl_vector_uchar_calloc", dynlib: libgsl.}
proc gsl_vector_uchar_alloc_from_block*(b: ptr gsl_block_uchar; offset: csize_t;    n: csize_t; stride: csize_t): ptr gsl_vector_uchar {. cdecl, importc: "gsl_vector_uchar_alloc_from_block", dynlib: libgsl.}
proc gsl_vector_uchar_alloc_from_vector*(v: ptr gsl_vector_uchar; offset: csize_t; n: csize_t; stride: csize_t): ptr gsl_vector_uchar {. cdecl, importc: "gsl_vector_uchar_alloc_from_vector", dynlib: libgsl.}
proc gsl_vector_uchar_free*(v: ptr gsl_vector_uchar) {.cdecl, importc: "gsl_vector_uchar_free", dynlib: libgsl.}
proc gsl_vector_uchar_view_array*(v: ptr cuchar; n: csize_t): gsl_vector_uchar_view {. cdecl, importc: "gsl_vector_uchar_view_array", dynlib: libgsl.}
proc gsl_vector_uchar_view_array_with_stride*(base: ptr cuchar; stride: csize_t; n: csize_t): gsl_vector_uchar_view {.cdecl, importc: "gsl_vector_uchar_view_array_with_stride",   dynlib: libgsl.}
proc gsl_vector_uchar_const_view_array*(v: ptr cuchar; n: csize_t): gsl_vector_uchar_const_view {. cdecl, importc: "gsl_vector_uchar_const_view_array", dynlib: libgsl.}
proc gsl_vector_uchar_const_view_array_with_stride*(base: ptr cuchar; stride: csize_t; n: csize_t): gsl_vector_uchar_const_view {.cdecl, importc: "gsl_vector_uchar_const_view_array_with_stride", dynlib: libgsl.}
proc gsl_vector_uchar_subvector*(v: ptr gsl_vector_uchar; i: csize_t; n: csize_t): gsl_vector_uchar_view {. cdecl, importc: "gsl_vector_uchar_subvector", dynlib: libgsl.}
proc gsl_vector_uchar_subvector_with_stride*(v: ptr gsl_vector_uchar; i: csize_t; stride: csize_t; n: csize_t): gsl_vector_uchar_view {.cdecl, importc: "gsl_vector_uchar_subvector_with_stride", dynlib: libgsl.}
proc gsl_vector_uchar_const_subvector*(v: ptr gsl_vector_uchar; i: csize_t; n: csize_t): gsl_vector_uchar_const_view {. cdecl, importc: "gsl_vector_uchar_const_subvector", dynlib: libgsl.}
proc gsl_vector_uchar_const_subvector_with_stride*(v: ptr gsl_vector_uchar; i: csize_t; stride: csize_t; n: csize_t): gsl_vector_uchar_const_view {.cdecl, importc: "gsl_vector_uchar_const_subvector_with_stride", dynlib: libgsl.}
proc gsl_vector_uchar_set_zero*(v: ptr gsl_vector_uchar) {.cdecl, importc: "gsl_vector_uchar_set_zero", dynlib: libgsl.}
proc gsl_vector_uchar_set_all*(v: ptr gsl_vector_uchar; x: cuchar) {.cdecl, importc: "gsl_vector_uchar_set_all", dynlib: libgsl.}
proc gsl_vector_uchar_set_basis*(v: ptr gsl_vector_uchar; i: csize_t): cint {.cdecl, importc: "gsl_vector_uchar_set_basis", dynlib: libgsl.}
proc gsl_vector_uchar_fread*(stream: ptr FILE; v: ptr gsl_vector_uchar): cint {.cdecl, importc: "gsl_vector_uchar_fread", dynlib: libgsl.}
proc gsl_vector_uchar_fwrite*(stream: ptr FILE; v: ptr gsl_vector_uchar): cint {.cdecl, importc: "gsl_vector_uchar_fwrite", dynlib: libgsl.}
proc gsl_vector_uchar_fscanf*(stream: ptr FILE; v: ptr gsl_vector_uchar): cint {.cdecl, importc: "gsl_vector_uchar_fscanf", dynlib: libgsl.}
proc gsl_vector_uchar_fprintf*(stream: ptr FILE; v: ptr gsl_vector_uchar;   format: cstring): cint {.cdecl, importc: "gsl_vector_uchar_fprintf", dynlib: libgsl.}
proc gsl_vector_uchar_memcpy*(dest: ptr gsl_vector_uchar; src: ptr gsl_vector_uchar): cint {. cdecl, importc: "gsl_vector_uchar_memcpy", dynlib: libgsl.}
proc gsl_vector_uchar_reverse*(v: ptr gsl_vector_uchar): cint {.cdecl, importc: "gsl_vector_uchar_reverse", dynlib: libgsl.}
proc gsl_vector_uchar_swap*(v: ptr gsl_vector_uchar; w: ptr gsl_vector_uchar): cint {. cdecl, importc: "gsl_vector_uchar_swap", dynlib: libgsl.}
proc gsl_vector_uchar_swap_elements*(v: ptr gsl_vector_uchar; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_vector_uchar_swap_elements", dynlib: libgsl.}
proc gsl_vector_uchar_max*(v: ptr gsl_vector_uchar): cuchar {.cdecl, importc: "gsl_vector_uchar_max", dynlib: libgsl.}
proc gsl_vector_uchar_min*(v: ptr gsl_vector_uchar): cuchar {.cdecl, importc: "gsl_vector_uchar_min", dynlib: libgsl.}
proc gsl_vector_uchar_minmax*(v: ptr gsl_vector_uchar; min_out: ptr cuchar;  max_out: ptr cuchar) {.cdecl, importc: "gsl_vector_uchar_minmax", dynlib: libgsl.}
proc gsl_vector_uchar_max_index*(v: ptr gsl_vector_uchar): csize_t {.cdecl, importc: "gsl_vector_uchar_max_index", dynlib: libgsl.}
proc gsl_vector_uchar_min_index*(v: ptr gsl_vector_uchar): csize_t {.cdecl, importc: "gsl_vector_uchar_min_index", dynlib: libgsl.}
proc gsl_vector_uchar_minmax_index*(v: ptr gsl_vector_uchar; imin: ptr csize_t;  imax: ptr csize_t) {.cdecl, importc: "gsl_vector_uchar_minmax_index", dynlib: libgsl.}
proc gsl_vector_uchar_add*(a: ptr gsl_vector_uchar; b: ptr gsl_vector_uchar): cint {. cdecl, importc: "gsl_vector_uchar_add", dynlib: libgsl.}
proc gsl_vector_uchar_sub*(a: ptr gsl_vector_uchar; b: ptr gsl_vector_uchar): cint {. cdecl, importc: "gsl_vector_uchar_sub", dynlib: libgsl.}
proc gsl_vector_uchar_mul*(a: ptr gsl_vector_uchar; b: ptr gsl_vector_uchar): cint {. cdecl, importc: "gsl_vector_uchar_mul", dynlib: libgsl.}
proc gsl_vector_uchar_div*(a: ptr gsl_vector_uchar; b: ptr gsl_vector_uchar): cint {. cdecl, importc: "gsl_vector_uchar_div", dynlib: libgsl.}
proc gsl_vector_uchar_scale*(a: ptr gsl_vector_uchar; x: cdouble): cint {.cdecl, importc: "gsl_vector_uchar_scale", dynlib: libgsl.}
proc gsl_vector_uchar_add_constant*(a: ptr gsl_vector_uchar; x: cdouble): cint {.cdecl, importc: "gsl_vector_uchar_add_constant", dynlib: libgsl.}
proc gsl_vector_uchar_equal*(u: ptr gsl_vector_uchar; v: ptr gsl_vector_uchar): cint {. cdecl, importc: "gsl_vector_uchar_equal", dynlib: libgsl.}
proc gsl_vector_uchar_isnull*(v: ptr gsl_vector_uchar): cint {.cdecl, importc: "gsl_vector_uchar_isnull", dynlib: libgsl.}
proc gsl_vector_uchar_ispos*(v: ptr gsl_vector_uchar): cint {.cdecl, importc: "gsl_vector_uchar_ispos", dynlib: libgsl.}
proc gsl_vector_uchar_isneg*(v: ptr gsl_vector_uchar): cint {.cdecl, importc: "gsl_vector_uchar_isneg", dynlib: libgsl.}
proc gsl_vector_uchar_isnonneg*(v: ptr gsl_vector_uchar): cint {.cdecl, importc: "gsl_vector_uchar_isnonneg", dynlib: libgsl.}
proc gsl_vector_uchar_get*(v: ptr gsl_vector_uchar; i: csize_t): cuchar {.cdecl, importc: "gsl_vector_uchar_get", dynlib: libgsl.}
proc gsl_vector_uchar_set*(v: ptr gsl_vector_uchar; i: csize_t; x: cuchar) {.cdecl, importc: "gsl_vector_uchar_set", dynlib: libgsl.}
proc gsl_vector_uchar_ptr*(v: ptr gsl_vector_uchar; i: csize_t): ptr cuchar {.cdecl, importc: "gsl_vector_uchar_ptr", dynlib: libgsl.}
proc gsl_vector_uchar_const_ptr*(v: ptr gsl_vector_uchar; i: csize_t): ptr cuchar {. cdecl, importc: "gsl_vector_uchar_const_ptr", dynlib: libgsl.}
proc gsl_block_char_alloc*(n: csize_t): ptr gsl_block_char {.cdecl, importc: "gsl_block_char_alloc", dynlib: libgsl.}
proc gsl_block_char_calloc*(n: csize_t): ptr gsl_block_char {.cdecl, importc: "gsl_block_char_calloc", dynlib: libgsl.}
proc gsl_block_char_free*(b: ptr gsl_block_char) {.cdecl, importc: "gsl_block_char_free", dynlib: libgsl.}
proc gsl_block_char_fread*(stream: ptr FILE; b: ptr gsl_block_char): cint {.cdecl, importc: "gsl_block_char_fread", dynlib: libgsl.}
proc gsl_block_char_fwrite*(stream: ptr FILE; b: ptr gsl_block_char): cint {.cdecl, importc: "gsl_block_char_fwrite", dynlib: libgsl.}
proc gsl_block_char_fscanf*(stream: ptr FILE; b: ptr gsl_block_char): cint {.cdecl, importc: "gsl_block_char_fscanf", dynlib: libgsl.}
proc gsl_block_char_fprintf*(stream: ptr FILE; b: ptr gsl_block_char; format: cstring): cint {. cdecl, importc: "gsl_block_char_fprintf", dynlib: libgsl.}
proc gsl_block_char_raw_fread*(stream: ptr FILE; b: cstring; n: csize_t; stride: csize_t): cint {. cdecl, importc: "gsl_block_char_raw_fread", dynlib: libgsl.}
proc gsl_block_char_raw_fwrite*(stream: ptr FILE; b: cstring; n: csize_t; stride: csize_t): cint {.cdecl, importc: "gsl_block_char_raw_fwrite", dynlib: libgsl.}
proc gsl_block_char_raw_fscanf*(stream: ptr FILE; b: cstring; n: csize_t; stride: csize_t): cint {.cdecl, importc: "gsl_block_char_raw_fscanf", dynlib: libgsl.}
proc gsl_block_char_raw_fprintf*(stream: ptr FILE; b: cstring; n: csize_t; stride: csize_t; format: cstring): cint {.cdecl, importc: "gsl_block_char_raw_fprintf", dynlib: libgsl.}
proc gsl_block_char_size*(b: ptr gsl_block_char): csize_t {.cdecl, importc: "gsl_block_char_size", dynlib: libgsl.}
proc gsl_block_char_data*(b: ptr gsl_block_char): cstring {.cdecl, importc: "gsl_block_char_data", dynlib: libgsl.}
proc gsl_vector_char_alloc*(n: csize_t): ptr gsl_vector_char {.cdecl, importc: "gsl_vector_char_alloc", dynlib: libgsl.}
proc gsl_vector_char_calloc*(n: csize_t): ptr gsl_vector_char {.cdecl, importc: "gsl_vector_char_calloc", dynlib: libgsl.}
proc gsl_vector_char_alloc_from_block*(b: ptr gsl_block_char; offset: csize_t;   n: csize_t; stride: csize_t): ptr gsl_vector_char {. cdecl, importc: "gsl_vector_char_alloc_from_block", dynlib: libgsl.}
proc gsl_vector_char_alloc_from_vector*(v: ptr gsl_vector_char; offset: csize_t;    n: csize_t; stride: csize_t): ptr gsl_vector_char {. cdecl, importc: "gsl_vector_char_alloc_from_vector", dynlib: libgsl.}
proc gsl_vector_char_free*(v: ptr gsl_vector_char) {.cdecl, importc: "gsl_vector_char_free", dynlib: libgsl.}
proc gsl_vector_char_view_array*(v: cstring; n: csize_t): gsl_vector_char_view {. cdecl, importc: "gsl_vector_char_view_array", dynlib: libgsl.}
proc gsl_vector_char_view_array_with_stride*(base: cstring; stride: csize_t; n: csize_t): gsl_vector_char_view {.cdecl, importc: "gsl_vector_char_view_array_with_stride",  dynlib: libgsl.}
proc gsl_vector_char_const_view_array*(v: cstring; n: csize_t): gsl_vector_char_const_view {. cdecl, importc: "gsl_vector_char_const_view_array", dynlib: libgsl.}
proc gsl_vector_char_const_view_array_with_stride*(base: cstring; stride: csize_t; n: csize_t): gsl_vector_char_const_view {.cdecl, importc: "gsl_vector_char_const_view_array_with_stride", dynlib: libgsl.}
proc gsl_vector_char_subvector*(v: ptr gsl_vector_char; i: csize_t; n: csize_t): gsl_vector_char_view {. cdecl, importc: "gsl_vector_char_subvector", dynlib: libgsl.}
proc gsl_vector_char_subvector_with_stride*(v: ptr gsl_vector_char; i: csize_t; stride: csize_t; n: csize_t): gsl_vector_char_view {.cdecl, importc: "gsl_vector_char_subvector_with_stride", dynlib: libgsl.}
proc gsl_vector_char_const_subvector*(v: ptr gsl_vector_char; i: csize_t; n: csize_t): gsl_vector_char_const_view {. cdecl, importc: "gsl_vector_char_const_subvector", dynlib: libgsl.}
proc gsl_vector_char_const_subvector_with_stride*(v: ptr gsl_vector_char; i: csize_t; stride: csize_t; n: csize_t): gsl_vector_char_const_view {.cdecl, importc: "gsl_vector_char_const_subvector_with_stride", dynlib: libgsl.}
proc gsl_vector_char_set_zero*(v: ptr gsl_vector_char) {.cdecl, importc: "gsl_vector_char_set_zero", dynlib: libgsl.}
proc gsl_vector_char_set_all*(v: ptr gsl_vector_char; x: char) {.cdecl, importc: "gsl_vector_char_set_all", dynlib: libgsl.}
proc gsl_vector_char_set_basis*(v: ptr gsl_vector_char; i: csize_t): cint {.cdecl, importc: "gsl_vector_char_set_basis", dynlib: libgsl.}
proc gsl_vector_char_fread*(stream: ptr FILE; v: ptr gsl_vector_char): cint {.cdecl, importc: "gsl_vector_char_fread", dynlib: libgsl.}
proc gsl_vector_char_fwrite*(stream: ptr FILE; v: ptr gsl_vector_char): cint {.cdecl, importc: "gsl_vector_char_fwrite", dynlib: libgsl.}
proc gsl_vector_char_fscanf*(stream: ptr FILE; v: ptr gsl_vector_char): cint {.cdecl, importc: "gsl_vector_char_fscanf", dynlib: libgsl.}
proc gsl_vector_char_fprintf*(stream: ptr FILE; v: ptr gsl_vector_char; format: cstring): cint {. cdecl, importc: "gsl_vector_char_fprintf", dynlib: libgsl.}
proc gsl_vector_char_memcpy*(dest: ptr gsl_vector_char; src: ptr gsl_vector_char): cint {. cdecl, importc: "gsl_vector_char_memcpy", dynlib: libgsl.}
proc gsl_vector_char_reverse*(v: ptr gsl_vector_char): cint {.cdecl, importc: "gsl_vector_char_reverse", dynlib: libgsl.}
proc gsl_vector_char_swap*(v: ptr gsl_vector_char; w: ptr gsl_vector_char): cint {. cdecl, importc: "gsl_vector_char_swap", dynlib: libgsl.}
proc gsl_vector_char_swap_elements*(v: ptr gsl_vector_char; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_vector_char_swap_elements", dynlib: libgsl.}
proc gsl_vector_char_max*(v: ptr gsl_vector_char): char {.cdecl, importc: "gsl_vector_char_max", dynlib: libgsl.}
proc gsl_vector_char_min*(v: ptr gsl_vector_char): char {.cdecl, importc: "gsl_vector_char_min", dynlib: libgsl.}
proc gsl_vector_char_minmax*(v: ptr gsl_vector_char; min_out: cstring; max_out: cstring) {.cdecl, importc: "gsl_vector_char_minmax", dynlib: libgsl.}
proc gsl_vector_char_max_index*(v: ptr gsl_vector_char): csize_t {.cdecl, importc: "gsl_vector_char_max_index", dynlib: libgsl.}
proc gsl_vector_char_min_index*(v: ptr gsl_vector_char): csize_t {.cdecl, importc: "gsl_vector_char_min_index", dynlib: libgsl.}
proc gsl_vector_char_minmax_index*(v: ptr gsl_vector_char; imin: ptr csize_t; imax: ptr csize_t) {.cdecl, importc: "gsl_vector_char_minmax_index", dynlib: libgsl.}
proc gsl_vector_char_add*(a: ptr gsl_vector_char; b: ptr gsl_vector_char): cint {.cdecl, importc: "gsl_vector_char_add", dynlib: libgsl.}
proc gsl_vector_char_sub*(a: ptr gsl_vector_char; b: ptr gsl_vector_char): cint {.cdecl, importc: "gsl_vector_char_sub", dynlib: libgsl.}
proc gsl_vector_char_mul*(a: ptr gsl_vector_char; b: ptr gsl_vector_char): cint {.cdecl, importc: "gsl_vector_char_mul", dynlib: libgsl.}
proc gsl_vector_char_div*(a: ptr gsl_vector_char; b: ptr gsl_vector_char): cint {.cdecl, importc: "gsl_vector_char_div", dynlib: libgsl.}
proc gsl_vector_char_scale*(a: ptr gsl_vector_char; x: cdouble): cint {.cdecl, importc: "gsl_vector_char_scale", dynlib: libgsl.}
proc gsl_vector_char_add_constant*(a: ptr gsl_vector_char; x: cdouble): cint {.cdecl, importc: "gsl_vector_char_add_constant", dynlib: libgsl.}
proc gsl_vector_char_equal*(u: ptr gsl_vector_char; v: ptr gsl_vector_char): cint {. cdecl, importc: "gsl_vector_char_equal", dynlib: libgsl.}
proc gsl_vector_char_isnull*(v: ptr gsl_vector_char): cint {.cdecl, importc: "gsl_vector_char_isnull", dynlib: libgsl.}
proc gsl_vector_char_ispos*(v: ptr gsl_vector_char): cint {.cdecl, importc: "gsl_vector_char_ispos", dynlib: libgsl.}
proc gsl_vector_char_isneg*(v: ptr gsl_vector_char): cint {.cdecl, importc: "gsl_vector_char_isneg", dynlib: libgsl.}
proc gsl_vector_char_isnonneg*(v: ptr gsl_vector_char): cint {.cdecl, importc: "gsl_vector_char_isnonneg", dynlib: libgsl.}
proc gsl_vector_char_get*(v: ptr gsl_vector_char; i: csize_t): char {.cdecl, importc: "gsl_vector_char_get", dynlib: libgsl.}
proc gsl_vector_char_set*(v: ptr gsl_vector_char; i: csize_t; x: char) {.cdecl, importc: "gsl_vector_char_set", dynlib: libgsl.}
proc gsl_vector_char_ptr*(v: ptr gsl_vector_char; i: csize_t): cstring {.cdecl, importc: "gsl_vector_char_ptr", dynlib: libgsl.}
proc gsl_vector_char_const_ptr*(v: ptr gsl_vector_char; i: csize_t): cstring {.cdecl, importc: "gsl_vector_char_const_ptr", dynlib: libgsl.}
proc gsl_movstat_alloc*(K: csize_t): ptr gsl_movstat_workspace {.cdecl, importc: "gsl_movstat_alloc", dynlib: libgsl.}
proc gsl_movstat_alloc2*(H: csize_t; J: csize_t): ptr gsl_movstat_workspace {.cdecl, importc: "gsl_movstat_alloc2", dynlib: libgsl.}
proc gsl_movstat_alloc_with_size*(accum_state_size: csize_t; H: csize_t; J: csize_t): ptr gsl_movstat_workspace {. cdecl, importc: "gsl_movstat_alloc_with_size", dynlib: libgsl.}
proc gsl_movstat_free*(w: ptr gsl_movstat_workspace) {.cdecl, importc: "gsl_movstat_free", dynlib: libgsl.}
proc gsl_movstat_apply_accum*(endtype: gsl_movstat_end_t; x: ptr gsl_vector;  accum: ptr gsl_movstat_accum; accum_params: pointer;  y: ptr gsl_vector; z: ptr gsl_vector;  w: ptr gsl_movstat_workspace): cint {.cdecl, importc: "gsl_movstat_apply_accum", dynlib: libgsl.}
proc gsl_movstat_apply*(endtype: gsl_movstat_end_t; F: ptr gsl_movstat_function;   x: ptr gsl_vector; y: ptr gsl_vector;   w: ptr gsl_movstat_workspace): cint {.cdecl, importc: "gsl_movstat_apply", dynlib: libgsl.}
proc gsl_movstat_fill*(endtype: gsl_movstat_end_t; x: ptr gsl_vector; idx: csize_t;  H: csize_t; J: csize_t; window: ptr cdouble): csize_t {.cdecl, importc: "gsl_movstat_fill", dynlib: libgsl.}
proc gsl_movstat_mean*(endtype: gsl_movstat_end_t; x: ptr gsl_vector;  y: ptr gsl_vector; w: ptr gsl_movstat_workspace): cint {.cdecl, importc: "gsl_movstat_mean", dynlib: libgsl.}
proc gsl_movstat_variance*(endtype: gsl_movstat_end_t; x: ptr gsl_vector;  y: ptr gsl_vector; w: ptr gsl_movstat_workspace): cint {. cdecl, importc: "gsl_movstat_variance", dynlib: libgsl.}
proc gsl_movstat_sd*(endtype: gsl_movstat_end_t; x: ptr gsl_vector; y: ptr gsl_vector;   w: ptr gsl_movstat_workspace): cint {.cdecl, importc: "gsl_movstat_sd", dynlib: libgsl.}
proc gsl_movstat_median*(endtype: gsl_movstat_end_t; x: ptr gsl_vector;    y: ptr gsl_vector; w: ptr gsl_movstat_workspace): cint {.cdecl, importc: "gsl_movstat_median", dynlib: libgsl.}
proc gsl_movstat_min*(endtype: gsl_movstat_end_t; x: ptr gsl_vector; y: ptr gsl_vector; w: ptr gsl_movstat_workspace): cint {.cdecl, importc: "gsl_movstat_min", dynlib: libgsl.}
proc gsl_movstat_max*(endtype: gsl_movstat_end_t; x: ptr gsl_vector; y: ptr gsl_vector; w: ptr gsl_movstat_workspace): cint {.cdecl, importc: "gsl_movstat_max", dynlib: libgsl.}
proc gsl_movstat_minmax*(endtype: gsl_movstat_end_t; x: ptr gsl_vector;    y_min: ptr gsl_vector; y_max: ptr gsl_vector;    w: ptr gsl_movstat_workspace): cint {.cdecl, importc: "gsl_movstat_minmax", dynlib: libgsl.}
proc gsl_movstat_mad0*(endtype: gsl_movstat_end_t; x: ptr gsl_vector;  xmedian: ptr gsl_vector; xmad: ptr gsl_vector;  w: ptr gsl_movstat_workspace): cint {.cdecl, importc: "gsl_movstat_mad0", dynlib: libgsl.}
proc gsl_movstat_mad*(endtype: gsl_movstat_end_t; x: ptr gsl_vector; xmedian: ptr gsl_vector; xmad: ptr gsl_vector; w: ptr gsl_movstat_workspace): cint {.cdecl, importc: "gsl_movstat_mad", dynlib: libgsl.}
proc gsl_movstat_qqr*(endtype: gsl_movstat_end_t; x: ptr gsl_vector; q: cdouble; xqqr: ptr gsl_vector; w: ptr gsl_movstat_workspace): cint {.cdecl, importc: "gsl_movstat_qqr", dynlib: libgsl.}
proc gsl_movstat_Sn*(endtype: gsl_movstat_end_t; x: ptr gsl_vector;   xscale: ptr gsl_vector; w: ptr gsl_movstat_workspace): cint {. cdecl, importc: "gsl_movstat_Sn", dynlib: libgsl.}
proc gsl_movstat_Qn*(endtype: gsl_movstat_end_t; x: ptr gsl_vector;   xscale: ptr gsl_vector; w: ptr gsl_movstat_workspace): cint {. cdecl, importc: "gsl_movstat_Qn", dynlib: libgsl.}
proc gsl_movstat_sum*(endtype: gsl_movstat_end_t; x: ptr gsl_vector; y: ptr gsl_vector; w: ptr gsl_movstat_workspace): cint {.cdecl, importc: "gsl_movstat_sum", dynlib: libgsl.}

var gsl_prec_eps* {.importc: "gsl_prec_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_sqrt_eps* {.importc: "gsl_prec_sqrt_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root3_eps* {.importc: "gsl_prec_root3_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root4_eps* {.importc: "gsl_prec_root4_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root5_eps* {.importc: "gsl_prec_root5_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root6_eps* {.importc: "gsl_prec_root6_eps", dynlib: libgsl.}: ptr cdouble

var gsl_check_range* {.importc: "gsl_check_range", dynlib: libgsl.}: cint

var gsl_movstat_accum_mad* {.importc: "gsl_movstat_accum_mad", dynlib: libgsl.}: ptr gsl_movstat_accum

var gsl_movstat_accum_max* {.importc: "gsl_movstat_accum_max", dynlib: libgsl.}: ptr gsl_movstat_accum

var gsl_movstat_accum_mean* {.importc: "gsl_movstat_accum_mean", dynlib: libgsl.}: ptr gsl_movstat_accum

var gsl_movstat_accum_median* {.importc: "gsl_movstat_accum_median", dynlib: libgsl.}: ptr gsl_movstat_accum

var gsl_movstat_accum_min* {.importc: "gsl_movstat_accum_min", dynlib: libgsl.}: ptr gsl_movstat_accum

var gsl_movstat_accum_minmax* {.importc: "gsl_movstat_accum_minmax", dynlib: libgsl.}: ptr gsl_movstat_accum

var gsl_movstat_accum_sd* {.importc: "gsl_movstat_accum_sd", dynlib: libgsl.}: ptr gsl_movstat_accum

var gsl_movstat_accum_Sn* {.importc: "gsl_movstat_accum_Sn", dynlib: libgsl.}: ptr gsl_movstat_accum

var gsl_movstat_accum_sum* {.importc: "gsl_movstat_accum_sum", dynlib: libgsl.}: ptr gsl_movstat_accum

var gsl_movstat_accum_Qn* {.importc: "gsl_movstat_accum_Qn", dynlib: libgsl.}: ptr gsl_movstat_accum

var gsl_movstat_accum_qqr* {.importc: "gsl_movstat_accum_qqr", dynlib: libgsl.}: ptr gsl_movstat_accum

var gsl_movstat_accum_userfunc* {.importc: "gsl_movstat_accum_userfunc",  dynlib: libgsl.}: ptr gsl_movstat_accum

var gsl_movstat_accum_variance* {.importc: "gsl_movstat_accum_variance",  dynlib: libgsl.}: ptr gsl_movstat_accum

