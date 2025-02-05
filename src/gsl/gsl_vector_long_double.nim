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

var gsl_check_range* {.importc: "gsl_check_range", dynlib: libgsl.}: cint

