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

proc gsl_error*(reason: cstring; file: cstring; line: cint; gsl_errno: cint) {.cdecl, importc: "gsl_error", dynlib: libgsl.}
proc gsl_stream_printf*(label: cstring; file: cstring; line: cint; reason: cstring) {. cdecl, importc: "gsl_stream_printf", dynlib: libgsl.}
proc gsl_strerror*(gsl_errno: cint): cstring {.cdecl, importc: "gsl_strerror", dynlib: libgsl.}
proc gsl_set_error_handler*(new_handler: ptr gsl_error_handler_t): ptr gsl_error_handler_t {. cdecl, importc: "gsl_set_error_handler", dynlib: libgsl.}
proc gsl_set_error_handler_off*(): ptr gsl_error_handler_t {.cdecl, importc: "gsl_set_error_handler_off", dynlib: libgsl.}
proc gsl_set_stream_handler*(new_handler: ptr gsl_stream_handler_t): ptr gsl_stream_handler_t {. cdecl, importc: "gsl_set_stream_handler", dynlib: libgsl.}
proc gsl_set_stream*(new_stream: ptr FILE): ptr FILE {.cdecl, importc: "gsl_set_stream", dynlib: libgsl.}
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

var gsl_check_range* {.importc: "gsl_check_range", dynlib: libgsl.}: cint

