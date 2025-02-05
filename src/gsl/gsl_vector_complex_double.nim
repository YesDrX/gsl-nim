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

proc gsl_error*(reason: cstring; file: cstring; line: cint; gsl_errno: cint) {.cdecl, importc: "gsl_error", dynlib: libgsl.}
proc gsl_stream_printf*(label: cstring; file: cstring; line: cint; reason: cstring) {. cdecl, importc: "gsl_stream_printf", dynlib: libgsl.}
proc gsl_strerror*(gsl_errno: cint): cstring {.cdecl, importc: "gsl_strerror", dynlib: libgsl.}
proc gsl_set_error_handler*(new_handler: ptr gsl_error_handler_t): ptr gsl_error_handler_t {. cdecl, importc: "gsl_set_error_handler", dynlib: libgsl.}
proc gsl_set_error_handler_off*(): ptr gsl_error_handler_t {.cdecl, importc: "gsl_set_error_handler_off", dynlib: libgsl.}
proc gsl_set_stream_handler*(new_handler: ptr gsl_stream_handler_t): ptr gsl_stream_handler_t {. cdecl, importc: "gsl_set_stream_handler", dynlib: libgsl.}
proc gsl_set_stream*(new_stream: ptr FILE): ptr FILE {.cdecl, importc: "gsl_set_stream", dynlib: libgsl.}
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

var gsl_check_range* {.importc: "gsl_check_range", dynlib: libgsl.}: cint

