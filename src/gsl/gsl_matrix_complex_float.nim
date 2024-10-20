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

  gsl_matrix_complex_float* {.bycopy.} = object
    size1*: csize_t
    size2*: csize_t
    tda*: csize_t
    data*: ptr cfloat
    `block`*: ptr gsl_block_complex_float
    owner*: cint

  gsl_matrix_complex_float_view* {.bycopy.} = object
    matrix*: gsl_matrix_complex_float

  gsl_matrix_complex_float_const_view* {.bycopy.} = object
    matrix*: gsl_matrix_complex_float

proc gsl_error*(reason: cstring; file: cstring; line: cint; gsl_errno: cint) {.cdecl, importc: "gsl_error", dynlib: libgsl.}
proc gsl_stream_printf*(label: cstring; file: cstring; line: cint; reason: cstring) {. cdecl, importc: "gsl_stream_printf", dynlib: libgsl.}
proc gsl_strerror*(gsl_errno: cint): cstring {.cdecl, importc: "gsl_strerror", dynlib: libgsl.}
proc gsl_set_error_handler*(new_handler: ptr gsl_error_handler_t): ptr gsl_error_handler_t {. cdecl, importc: "gsl_set_error_handler", dynlib: libgsl.}
proc gsl_set_error_handler_off*(): ptr gsl_error_handler_t {.cdecl, importc: "gsl_set_error_handler_off", dynlib: libgsl.}
proc gsl_set_stream_handler*(new_handler: ptr gsl_stream_handler_t): ptr gsl_stream_handler_t {. cdecl, importc: "gsl_set_stream_handler", dynlib: libgsl.}
proc gsl_set_stream*(new_stream: ptr FILE): ptr FILE {.cdecl, importc: "gsl_set_stream", dynlib: libgsl.}
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
proc gsl_matrix_complex_float_alloc*(n1: csize_t; n2: csize_t): ptr gsl_matrix_complex_float {. cdecl, importc: "gsl_matrix_complex_float_alloc", dynlib: libgsl.}
proc gsl_matrix_complex_float_calloc*(n1: csize_t; n2: csize_t): ptr gsl_matrix_complex_float {. cdecl, importc: "gsl_matrix_complex_float_calloc", dynlib: libgsl.}
proc gsl_matrix_complex_float_alloc_from_block*(b: ptr gsl_block_complex_float; offset: csize_t; n1: csize_t; n2: csize_t; d2: csize_t): ptr gsl_matrix_complex_float {. cdecl, importc: "gsl_matrix_complex_float_alloc_from_block", dynlib: libgsl.}
proc gsl_matrix_complex_float_alloc_from_matrix*(b: ptr gsl_matrix_complex_float; k1: csize_t; k2: csize_t; n1: csize_t; n2: csize_t): ptr gsl_matrix_complex_float {. cdecl, importc: "gsl_matrix_complex_float_alloc_from_matrix", dynlib: libgsl.}
proc gsl_vector_complex_float_alloc_row_from_matrix*(m: ptr gsl_matrix_complex_float; i: csize_t): ptr gsl_vector_complex_float {.cdecl, importc: "gsl_vector_complex_float_alloc_row_from_matrix", dynlib: libgsl.}
proc gsl_vector_complex_float_alloc_col_from_matrix*(m: ptr gsl_matrix_complex_float; j: csize_t): ptr gsl_vector_complex_float {.cdecl, importc: "gsl_vector_complex_float_alloc_col_from_matrix", dynlib: libgsl.}
proc gsl_matrix_complex_float_free*(m: ptr gsl_matrix_complex_float) {.cdecl, importc: "gsl_matrix_complex_float_free", dynlib: libgsl.}
proc gsl_matrix_complex_float_submatrix*(m: ptr gsl_matrix_complex_float; i: csize_t; j: csize_t; n1: csize_t; n2: csize_t): gsl_matrix_complex_float_view {. cdecl, importc: "gsl_matrix_complex_float_submatrix", dynlib: libgsl.}
proc gsl_matrix_complex_float_row*(m: ptr gsl_matrix_complex_float; i: csize_t): gsl_vector_complex_float_view {. cdecl, importc: "gsl_matrix_complex_float_row", dynlib: libgsl.}
proc gsl_matrix_complex_float_column*(m: ptr gsl_matrix_complex_float; j: csize_t): gsl_vector_complex_float_view {. cdecl, importc: "gsl_matrix_complex_float_column", dynlib: libgsl.}
proc gsl_matrix_complex_float_diagonal*(m: ptr gsl_matrix_complex_float): gsl_vector_complex_float_view {. cdecl, importc: "gsl_matrix_complex_float_diagonal", dynlib: libgsl.}
proc gsl_matrix_complex_float_subdiagonal*(m: ptr gsl_matrix_complex_float; k: csize_t): gsl_vector_complex_float_view {.cdecl, importc: "gsl_matrix_complex_float_subdiagonal", dynlib: libgsl.}
proc gsl_matrix_complex_float_superdiagonal*(m: ptr gsl_matrix_complex_float; k: csize_t): gsl_vector_complex_float_view {.cdecl, importc: "gsl_matrix_complex_float_superdiagonal", dynlib: libgsl.}
proc gsl_matrix_complex_float_subrow*(m: ptr gsl_matrix_complex_float; i: csize_t;  offset: csize_t; n: csize_t): gsl_vector_complex_float_view {. cdecl, importc: "gsl_matrix_complex_float_subrow", dynlib: libgsl.}
proc gsl_matrix_complex_float_subcolumn*(m: ptr gsl_matrix_complex_float; j: csize_t; offset: csize_t; n: csize_t): gsl_vector_complex_float_view {. cdecl, importc: "gsl_matrix_complex_float_subcolumn", dynlib: libgsl.}
proc gsl_matrix_complex_float_view_array*(base: ptr cfloat; n1: csize_t; n2: csize_t): gsl_matrix_complex_float_view {. cdecl, importc: "gsl_matrix_complex_float_view_array", dynlib: libgsl.}
proc gsl_matrix_complex_float_view_array_with_tda*(base: ptr cfloat; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_complex_float_view {.cdecl, importc: "gsl_matrix_complex_float_view_array_with_tda", dynlib: libgsl.}
proc gsl_matrix_complex_float_view_vector*(v: ptr gsl_vector_complex_float; n1: csize_t; n2: csize_t): gsl_matrix_complex_float_view {.cdecl, importc: "gsl_matrix_complex_float_view_vector", dynlib: libgsl.}
proc gsl_matrix_complex_float_view_vector_with_tda*(v: ptr gsl_vector_complex_float; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_complex_float_view {. cdecl, importc: "gsl_matrix_complex_float_view_vector_with_tda", dynlib: libgsl.}
proc gsl_matrix_complex_float_const_submatrix*(m: ptr gsl_matrix_complex_float; i: csize_t; j: csize_t; n1: csize_t; n2: csize_t): gsl_matrix_complex_float_const_view {. cdecl, importc: "gsl_matrix_complex_float_const_submatrix", dynlib: libgsl.}
proc gsl_matrix_complex_float_const_row*(m: ptr gsl_matrix_complex_float; i: csize_t): gsl_vector_complex_float_const_view {. cdecl, importc: "gsl_matrix_complex_float_const_row", dynlib: libgsl.}
proc gsl_matrix_complex_float_const_column*(m: ptr gsl_matrix_complex_float; j: csize_t): gsl_vector_complex_float_const_view {.cdecl, importc: "gsl_matrix_complex_float_const_column", dynlib: libgsl.}
proc gsl_matrix_complex_float_const_diagonal*(m: ptr gsl_matrix_complex_float): gsl_vector_complex_float_const_view {. cdecl, importc: "gsl_matrix_complex_float_const_diagonal", dynlib: libgsl.}
proc gsl_matrix_complex_float_const_subdiagonal*(m: ptr gsl_matrix_complex_float; k: csize_t): gsl_vector_complex_float_const_view {.cdecl, importc: "gsl_matrix_complex_float_const_subdiagonal", dynlib: libgsl.}
proc gsl_matrix_complex_float_const_superdiagonal*(m: ptr gsl_matrix_complex_float; k: csize_t): gsl_vector_complex_float_const_view {. cdecl, importc: "gsl_matrix_complex_float_const_superdiagonal", dynlib: libgsl.}
proc gsl_matrix_complex_float_const_subrow*(m: ptr gsl_matrix_complex_float; i: csize_t; offset: csize_t; n: csize_t): gsl_vector_complex_float_const_view {. cdecl, importc: "gsl_matrix_complex_float_const_subrow", dynlib: libgsl.}
proc gsl_matrix_complex_float_const_subcolumn*(m: ptr gsl_matrix_complex_float; j: csize_t; offset: csize_t; n: csize_t): gsl_vector_complex_float_const_view {. cdecl, importc: "gsl_matrix_complex_float_const_subcolumn", dynlib: libgsl.}
proc gsl_matrix_complex_float_const_view_array*(base: ptr cfloat; n1: csize_t; n2: csize_t): gsl_matrix_complex_float_const_view {.cdecl, importc: "gsl_matrix_complex_float_const_view_array", dynlib: libgsl.}
proc gsl_matrix_complex_float_const_view_array_with_tda*(base: ptr cfloat; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_complex_float_const_view {. cdecl, importc: "gsl_matrix_complex_float_const_view_array_with_tda", dynlib: libgsl.}
proc gsl_matrix_complex_float_const_view_vector*(v: ptr gsl_vector_complex_float; n1: csize_t; n2: csize_t): gsl_matrix_complex_float_const_view {.cdecl, importc: "gsl_matrix_complex_float_const_view_vector", dynlib: libgsl.}
proc gsl_matrix_complex_float_const_view_vector_with_tda*(v: ptr gsl_vector_complex_float; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_complex_float_const_view {. cdecl, importc: "gsl_matrix_complex_float_const_view_vector_with_tda", dynlib: libgsl.}
proc gsl_matrix_complex_float_set_zero*(m: ptr gsl_matrix_complex_float) {.cdecl, importc: "gsl_matrix_complex_float_set_zero", dynlib: libgsl.}
proc gsl_matrix_complex_float_set_identity*(m: ptr gsl_matrix_complex_float) {. cdecl, importc: "gsl_matrix_complex_float_set_identity", dynlib: libgsl.}
proc gsl_matrix_complex_float_set_all*(m: ptr gsl_matrix_complex_float;   x: gsl_complex_float) {.cdecl, importc: "gsl_matrix_complex_float_set_all", dynlib: libgsl.}
proc gsl_matrix_complex_float_fread*(stream: ptr FILE; m: ptr gsl_matrix_complex_float): cint {.cdecl, importc: "gsl_matrix_complex_float_fread", dynlib: libgsl.}
proc gsl_matrix_complex_float_fwrite*(stream: ptr FILE;  m: ptr gsl_matrix_complex_float): cint {.cdecl, importc: "gsl_matrix_complex_float_fwrite", dynlib: libgsl.}
proc gsl_matrix_complex_float_fscanf*(stream: ptr FILE;  m: ptr gsl_matrix_complex_float): cint {.cdecl, importc: "gsl_matrix_complex_float_fscanf", dynlib: libgsl.}
proc gsl_matrix_complex_float_fprintf*(stream: ptr FILE;   m: ptr gsl_matrix_complex_float;   format: cstring): cint {.cdecl, importc: "gsl_matrix_complex_float_fprintf", dynlib: libgsl.}
proc gsl_matrix_complex_float_memcpy*(dest: ptr gsl_matrix_complex_float;  src: ptr gsl_matrix_complex_float): cint {. cdecl, importc: "gsl_matrix_complex_float_memcpy", dynlib: libgsl.}
proc gsl_matrix_complex_float_swap*(m1: ptr gsl_matrix_complex_float;  m2: ptr gsl_matrix_complex_float): cint {.cdecl, importc: "gsl_matrix_complex_float_swap", dynlib: libgsl.}
proc gsl_matrix_complex_float_tricpy*(uplo_src: char; copy_diag: cint;  dest: ptr gsl_matrix_complex_float;  src: ptr gsl_matrix_complex_float): cint {. cdecl, importc: "gsl_matrix_complex_float_tricpy", dynlib: libgsl.}
proc gsl_matrix_complex_float_swap_rows*(m: ptr gsl_matrix_complex_float; i: csize_t; j: csize_t): cint {.cdecl, importc: "gsl_matrix_complex_float_swap_rows", dynlib: libgsl.}
proc gsl_matrix_complex_float_swap_columns*(m: ptr gsl_matrix_complex_float; i: csize_t; j: csize_t): cint {.cdecl, importc: "gsl_matrix_complex_float_swap_columns", dynlib: libgsl.}
proc gsl_matrix_complex_float_swap_rowcol*(m: ptr gsl_matrix_complex_float; i: csize_t; j: csize_t): cint {.cdecl, importc: "gsl_matrix_complex_float_swap_rowcol", dynlib: libgsl.}
proc gsl_matrix_complex_float_transpose*(m: ptr gsl_matrix_complex_float): cint {. cdecl, importc: "gsl_matrix_complex_float_transpose", dynlib: libgsl.}
proc gsl_matrix_complex_float_transpose_memcpy*(dest: ptr gsl_matrix_complex_float; src: ptr gsl_matrix_complex_float): cint {. cdecl, importc: "gsl_matrix_complex_float_transpose_memcpy", dynlib: libgsl.}
proc gsl_matrix_complex_float_transpose_tricpy*(uplo_src: char; copy_diag: cint; dest: ptr gsl_matrix_complex_float; src: ptr gsl_matrix_complex_float): cint {. cdecl, importc: "gsl_matrix_complex_float_transpose_tricpy", dynlib: libgsl.}
proc gsl_matrix_complex_float_equal*(a: ptr gsl_matrix_complex_float; b: ptr gsl_matrix_complex_float): cint {.cdecl, importc: "gsl_matrix_complex_float_equal", dynlib: libgsl.}
proc gsl_matrix_complex_float_isnull*(m: ptr gsl_matrix_complex_float): cint {.cdecl, importc: "gsl_matrix_complex_float_isnull", dynlib: libgsl.}
proc gsl_matrix_complex_float_ispos*(m: ptr gsl_matrix_complex_float): cint {.cdecl, importc: "gsl_matrix_complex_float_ispos", dynlib: libgsl.}
proc gsl_matrix_complex_float_isneg*(m: ptr gsl_matrix_complex_float): cint {.cdecl, importc: "gsl_matrix_complex_float_isneg", dynlib: libgsl.}
proc gsl_matrix_complex_float_isnonneg*(m: ptr gsl_matrix_complex_float): cint {. cdecl, importc: "gsl_matrix_complex_float_isnonneg", dynlib: libgsl.}
proc gsl_matrix_complex_float_add*(a: ptr gsl_matrix_complex_float; b: ptr gsl_matrix_complex_float): cint {.cdecl, importc: "gsl_matrix_complex_float_add", dynlib: libgsl.}
proc gsl_matrix_complex_float_sub*(a: ptr gsl_matrix_complex_float; b: ptr gsl_matrix_complex_float): cint {.cdecl, importc: "gsl_matrix_complex_float_sub", dynlib: libgsl.}
proc gsl_matrix_complex_float_mul_elements*(a: ptr gsl_matrix_complex_float; b: ptr gsl_matrix_complex_float): cint {.cdecl, importc: "gsl_matrix_complex_float_mul_elements", dynlib: libgsl.}
proc gsl_matrix_complex_float_div_elements*(a: ptr gsl_matrix_complex_float; b: ptr gsl_matrix_complex_float): cint {.cdecl, importc: "gsl_matrix_complex_float_div_elements", dynlib: libgsl.}
proc gsl_matrix_complex_float_scale*(a: ptr gsl_matrix_complex_float; x: gsl_complex_float): cint {.cdecl, importc: "gsl_matrix_complex_float_scale", dynlib: libgsl.}
proc gsl_matrix_complex_float_add_constant*(a: ptr gsl_matrix_complex_float; x: gsl_complex_float): cint {.cdecl, importc: "gsl_matrix_complex_float_add_constant", dynlib: libgsl.}
proc gsl_matrix_complex_float_add_diagonal*(a: ptr gsl_matrix_complex_float; x: gsl_complex_float): cint {.cdecl, importc: "gsl_matrix_complex_float_add_diagonal", dynlib: libgsl.}
proc gsl_matrix_complex_float_get_row*(v: ptr gsl_vector_complex_float;   m: ptr gsl_matrix_complex_float; i: csize_t): cint {. cdecl, importc: "gsl_matrix_complex_float_get_row", dynlib: libgsl.}
proc gsl_matrix_complex_float_get_col*(v: ptr gsl_vector_complex_float;   m: ptr gsl_matrix_complex_float; j: csize_t): cint {. cdecl, importc: "gsl_matrix_complex_float_get_col", dynlib: libgsl.}
proc gsl_matrix_complex_float_set_row*(m: ptr gsl_matrix_complex_float; i: csize_t;   v: ptr gsl_vector_complex_float): cint {. cdecl, importc: "gsl_matrix_complex_float_set_row", dynlib: libgsl.}
proc gsl_matrix_complex_float_set_col*(m: ptr gsl_matrix_complex_float; j: csize_t;   v: ptr gsl_vector_complex_float): cint {. cdecl, importc: "gsl_matrix_complex_float_set_col", dynlib: libgsl.}
proc gsl_matrix_complex_float_get*(m: ptr gsl_matrix_complex_float; i: csize_t; j: csize_t): gsl_complex_float {.cdecl, importc: "gsl_matrix_complex_float_get", dynlib: libgsl.}
proc gsl_matrix_complex_float_set*(m: ptr gsl_matrix_complex_float; i: csize_t; j: csize_t; x: gsl_complex_float) {.cdecl, importc: "gsl_matrix_complex_float_set", dynlib: libgsl.}
proc gsl_matrix_complex_float_ptr*(m: ptr gsl_matrix_complex_float; i: csize_t; j: csize_t): ptr gsl_complex_float {.cdecl, importc: "gsl_matrix_complex_float_ptr", dynlib: libgsl.}
proc gsl_matrix_complex_float_const_ptr*(m: ptr gsl_matrix_complex_float; i: csize_t; j: csize_t): ptr gsl_complex_float {. cdecl, importc: "gsl_matrix_complex_float_const_ptr", dynlib: libgsl.}

var gsl_check_range* {.importc: "gsl_check_range", dynlib: libgsl.}: cint

