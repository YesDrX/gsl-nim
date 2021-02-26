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

proc gsl_error*(reason: cstring; file: cstring; line: cint; gsl_errno: cint) {.cdecl, importc: "gsl_error", dynlib: libgsl.}
proc gsl_stream_printf*(label: cstring; file: cstring; line: cint; reason: cstring) {. cdecl, importc: "gsl_stream_printf", dynlib: libgsl.}
proc gsl_strerror*(gsl_errno: cint): cstring {.cdecl, importc: "gsl_strerror", dynlib: libgsl.}
proc gsl_set_error_handler*(new_handler: ptr gsl_error_handler_t): ptr gsl_error_handler_t {. cdecl, importc: "gsl_set_error_handler", dynlib: libgsl.}
proc gsl_set_error_handler_off*(): ptr gsl_error_handler_t {.cdecl, importc: "gsl_set_error_handler_off", dynlib: libgsl.}
proc gsl_set_stream_handler*(new_handler: ptr gsl_stream_handler_t): ptr gsl_stream_handler_t {. cdecl, importc: "gsl_set_stream_handler", dynlib: libgsl.}
proc gsl_set_stream*(new_stream: ptr FILE): ptr FILE {.cdecl, importc: "gsl_set_stream", dynlib: libgsl.}
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

var gsl_check_range* {.importc: "gsl_check_range", dynlib: libgsl.}: cint

