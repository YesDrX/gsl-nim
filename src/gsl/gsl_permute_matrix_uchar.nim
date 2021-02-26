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

  gsl_permutation_struct* {.bycopy.} = object
    size*: csize_t
    data*: ptr csize_t

  gsl_permutation* = gsl_permutation_struct

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

  gsl_matrix_uchar* {.bycopy.} = object
    size1*: csize_t
    size2*: csize_t
    tda*: csize_t
    data*: ptr cuchar
    `block`*: ptr gsl_block_uchar
    owner*: cint

  gsl_matrix_uchar_view* {.bycopy.} = object
    matrix*: gsl_matrix_uchar

  gsl_matrix_uchar_const_view* {.bycopy.} = object
    matrix*: gsl_matrix_uchar

proc gsl_error*(reason: cstring; file: cstring; line: cint; gsl_errno: cint) {.cdecl, importc: "gsl_error", dynlib: libgsl.}
proc gsl_stream_printf*(label: cstring; file: cstring; line: cint; reason: cstring) {. cdecl, importc: "gsl_stream_printf", dynlib: libgsl.}
proc gsl_strerror*(gsl_errno: cint): cstring {.cdecl, importc: "gsl_strerror", dynlib: libgsl.}
proc gsl_set_error_handler*(new_handler: ptr gsl_error_handler_t): ptr gsl_error_handler_t {. cdecl, importc: "gsl_set_error_handler", dynlib: libgsl.}
proc gsl_set_error_handler_off*(): ptr gsl_error_handler_t {.cdecl, importc: "gsl_set_error_handler_off", dynlib: libgsl.}
proc gsl_set_stream_handler*(new_handler: ptr gsl_stream_handler_t): ptr gsl_stream_handler_t {. cdecl, importc: "gsl_set_stream_handler", dynlib: libgsl.}
proc gsl_set_stream*(new_stream: ptr FILE): ptr FILE {.cdecl, importc: "gsl_set_stream", dynlib: libgsl.}
proc gsl_permutation_alloc*(n: csize_t): ptr gsl_permutation {.cdecl, importc: "gsl_permutation_alloc", dynlib: libgsl.}
proc gsl_permutation_calloc*(n: csize_t): ptr gsl_permutation {.cdecl, importc: "gsl_permutation_calloc", dynlib: libgsl.}
proc gsl_permutation_init*(p: ptr gsl_permutation) {.cdecl, importc: "gsl_permutation_init", dynlib: libgsl.}
proc gsl_permutation_free*(p: ptr gsl_permutation) {.cdecl, importc: "gsl_permutation_free", dynlib: libgsl.}
proc gsl_permutation_memcpy*(dest: ptr gsl_permutation; src: ptr gsl_permutation): cint {. cdecl, importc: "gsl_permutation_memcpy", dynlib: libgsl.}
proc gsl_permutation_fread*(stream: ptr FILE; p: ptr gsl_permutation): cint {.cdecl, importc: "gsl_permutation_fread", dynlib: libgsl.}
proc gsl_permutation_fwrite*(stream: ptr FILE; p: ptr gsl_permutation): cint {.cdecl, importc: "gsl_permutation_fwrite", dynlib: libgsl.}
proc gsl_permutation_fscanf*(stream: ptr FILE; p: ptr gsl_permutation): cint {.cdecl, importc: "gsl_permutation_fscanf", dynlib: libgsl.}
proc gsl_permutation_fprintf*(stream: ptr FILE; p: ptr gsl_permutation; format: cstring): cint {. cdecl, importc: "gsl_permutation_fprintf", dynlib: libgsl.}
proc gsl_permutation_size*(p: ptr gsl_permutation): csize_t {.cdecl, importc: "gsl_permutation_size", dynlib: libgsl.}
proc gsl_permutation_data*(p: ptr gsl_permutation): ptr csize_t {.cdecl, importc: "gsl_permutation_data", dynlib: libgsl.}
proc gsl_permutation_swap*(p: ptr gsl_permutation; i: csize_t; j: csize_t): cint {.cdecl, importc: "gsl_permutation_swap", dynlib: libgsl.}
proc gsl_permutation_valid*(p: ptr gsl_permutation): cint {.cdecl, importc: "gsl_permutation_valid", dynlib: libgsl.}
proc gsl_permutation_reverse*(p: ptr gsl_permutation) {.cdecl, importc: "gsl_permutation_reverse", dynlib: libgsl.}
proc gsl_permutation_inverse*(inv: ptr gsl_permutation; p: ptr gsl_permutation): cint {. cdecl, importc: "gsl_permutation_inverse", dynlib: libgsl.}
proc gsl_permutation_next*(p: ptr gsl_permutation): cint {.cdecl, importc: "gsl_permutation_next", dynlib: libgsl.}
proc gsl_permutation_prev*(p: ptr gsl_permutation): cint {.cdecl, importc: "gsl_permutation_prev", dynlib: libgsl.}
proc gsl_permutation_mul*(p: ptr gsl_permutation; pa: ptr gsl_permutation; pb: ptr gsl_permutation): cint {.cdecl, importc: "gsl_permutation_mul", dynlib: libgsl.}
proc gsl_permutation_linear_to_canonical*(q: ptr gsl_permutation; p: ptr gsl_permutation): cint {.cdecl,  importc: "gsl_permutation_linear_to_canonical",  dynlib: libgsl.}
proc gsl_permutation_canonical_to_linear*(p: ptr gsl_permutation; q: ptr gsl_permutation): cint {.cdecl,  importc: "gsl_permutation_canonical_to_linear",  dynlib: libgsl.}
proc gsl_permutation_inversions*(p: ptr gsl_permutation): csize_t {.cdecl, importc: "gsl_permutation_inversions", dynlib: libgsl.}
proc gsl_permutation_linear_cycles*(p: ptr gsl_permutation): csize_t {.cdecl, importc: "gsl_permutation_linear_cycles", dynlib: libgsl.}
proc gsl_permutation_canonical_cycles*(q: ptr gsl_permutation): csize_t {.cdecl, importc: "gsl_permutation_canonical_cycles", dynlib: libgsl.}
proc gsl_permutation_get*(p: ptr gsl_permutation; i: csize_t): csize_t {.cdecl, importc: "gsl_permutation_get", dynlib: libgsl.}
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
proc gsl_matrix_uchar_alloc*(n1: csize_t; n2: csize_t): ptr gsl_matrix_uchar {.cdecl, importc: "gsl_matrix_uchar_alloc", dynlib: libgsl.}
proc gsl_matrix_uchar_calloc*(n1: csize_t; n2: csize_t): ptr gsl_matrix_uchar {.cdecl, importc: "gsl_matrix_uchar_calloc", dynlib: libgsl.}
proc gsl_matrix_uchar_alloc_from_block*(b: ptr gsl_block_uchar; offset: csize_t;    n1: csize_t; n2: csize_t; d2: csize_t): ptr gsl_matrix_uchar {. cdecl, importc: "gsl_matrix_uchar_alloc_from_block", dynlib: libgsl.}
proc gsl_matrix_uchar_alloc_from_matrix*(m: ptr gsl_matrix_uchar; k1: csize_t; k2: csize_t; n1: csize_t; n2: csize_t): ptr gsl_matrix_uchar {. cdecl, importc: "gsl_matrix_uchar_alloc_from_matrix", dynlib: libgsl.}
proc gsl_vector_uchar_alloc_row_from_matrix*(m: ptr gsl_matrix_uchar; i: csize_t): ptr gsl_vector_uchar {. cdecl, importc: "gsl_vector_uchar_alloc_row_from_matrix", dynlib: libgsl.}
proc gsl_vector_uchar_alloc_col_from_matrix*(m: ptr gsl_matrix_uchar; j: csize_t): ptr gsl_vector_uchar {. cdecl, importc: "gsl_vector_uchar_alloc_col_from_matrix", dynlib: libgsl.}
proc gsl_matrix_uchar_free*(m: ptr gsl_matrix_uchar) {.cdecl, importc: "gsl_matrix_uchar_free", dynlib: libgsl.}
proc gsl_matrix_uchar_submatrix*(m: ptr gsl_matrix_uchar; i: csize_t; j: csize_t; n1: csize_t; n2: csize_t): gsl_matrix_uchar_view {. cdecl, importc: "gsl_matrix_uchar_submatrix", dynlib: libgsl.}
proc gsl_matrix_uchar_row*(m: ptr gsl_matrix_uchar; i: csize_t): gsl_vector_uchar_view {. cdecl, importc: "gsl_matrix_uchar_row", dynlib: libgsl.}
proc gsl_matrix_uchar_column*(m: ptr gsl_matrix_uchar; j: csize_t): gsl_vector_uchar_view {. cdecl, importc: "gsl_matrix_uchar_column", dynlib: libgsl.}
proc gsl_matrix_uchar_diagonal*(m: ptr gsl_matrix_uchar): gsl_vector_uchar_view {. cdecl, importc: "gsl_matrix_uchar_diagonal", dynlib: libgsl.}
proc gsl_matrix_uchar_subdiagonal*(m: ptr gsl_matrix_uchar; k: csize_t): gsl_vector_uchar_view {. cdecl, importc: "gsl_matrix_uchar_subdiagonal", dynlib: libgsl.}
proc gsl_matrix_uchar_superdiagonal*(m: ptr gsl_matrix_uchar; k: csize_t): gsl_vector_uchar_view {. cdecl, importc: "gsl_matrix_uchar_superdiagonal", dynlib: libgsl.}
proc gsl_matrix_uchar_subrow*(m: ptr gsl_matrix_uchar; i: csize_t; offset: csize_t;  n: csize_t): gsl_vector_uchar_view {.cdecl, importc: "gsl_matrix_uchar_subrow", dynlib: libgsl.}
proc gsl_matrix_uchar_subcolumn*(m: ptr gsl_matrix_uchar; j: csize_t; offset: csize_t; n: csize_t): gsl_vector_uchar_view {.cdecl, importc: "gsl_matrix_uchar_subcolumn", dynlib: libgsl.}
proc gsl_matrix_uchar_view_array*(base: ptr cuchar; n1: csize_t; n2: csize_t): gsl_matrix_uchar_view {. cdecl, importc: "gsl_matrix_uchar_view_array", dynlib: libgsl.}
proc gsl_matrix_uchar_view_array_with_tda*(base: ptr cuchar; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_uchar_view {.cdecl, importc: "gsl_matrix_uchar_view_array_with_tda",  dynlib: libgsl.}
proc gsl_matrix_uchar_view_vector*(v: ptr gsl_vector_uchar; n1: csize_t; n2: csize_t): gsl_matrix_uchar_view {. cdecl, importc: "gsl_matrix_uchar_view_vector", dynlib: libgsl.}
proc gsl_matrix_uchar_view_vector_with_tda*(v: ptr gsl_vector_uchar; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_uchar_view {.cdecl, importc: "gsl_matrix_uchar_view_vector_with_tda", dynlib: libgsl.}
proc gsl_matrix_uchar_const_submatrix*(m: ptr gsl_matrix_uchar; i: csize_t;   j: csize_t; n1: csize_t; n2: csize_t): gsl_matrix_uchar_const_view {. cdecl, importc: "gsl_matrix_uchar_const_submatrix", dynlib: libgsl.}
proc gsl_matrix_uchar_const_row*(m: ptr gsl_matrix_uchar; i: csize_t): gsl_vector_uchar_const_view {. cdecl, importc: "gsl_matrix_uchar_const_row", dynlib: libgsl.}
proc gsl_matrix_uchar_const_column*(m: ptr gsl_matrix_uchar; j: csize_t): gsl_vector_uchar_const_view {. cdecl, importc: "gsl_matrix_uchar_const_column", dynlib: libgsl.}
proc gsl_matrix_uchar_const_diagonal*(m: ptr gsl_matrix_uchar): gsl_vector_uchar_const_view {. cdecl, importc: "gsl_matrix_uchar_const_diagonal", dynlib: libgsl.}
proc gsl_matrix_uchar_const_subdiagonal*(m: ptr gsl_matrix_uchar; k: csize_t): gsl_vector_uchar_const_view {. cdecl, importc: "gsl_matrix_uchar_const_subdiagonal", dynlib: libgsl.}
proc gsl_matrix_uchar_const_superdiagonal*(m: ptr gsl_matrix_uchar; k: csize_t): gsl_vector_uchar_const_view {. cdecl, importc: "gsl_matrix_uchar_const_superdiagonal", dynlib: libgsl.}
proc gsl_matrix_uchar_const_subrow*(m: ptr gsl_matrix_uchar; i: csize_t;  offset: csize_t; n: csize_t): gsl_vector_uchar_const_view {. cdecl, importc: "gsl_matrix_uchar_const_subrow", dynlib: libgsl.}
proc gsl_matrix_uchar_const_subcolumn*(m: ptr gsl_matrix_uchar; j: csize_t;   offset: csize_t; n: csize_t): gsl_vector_uchar_const_view {. cdecl, importc: "gsl_matrix_uchar_const_subcolumn", dynlib: libgsl.}
proc gsl_matrix_uchar_const_view_array*(base: ptr cuchar; n1: csize_t; n2: csize_t): gsl_matrix_uchar_const_view {. cdecl, importc: "gsl_matrix_uchar_const_view_array", dynlib: libgsl.}
proc gsl_matrix_uchar_const_view_array_with_tda*(base: ptr cuchar; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_uchar_const_view {.cdecl, importc: "gsl_matrix_uchar_const_view_array_with_tda", dynlib: libgsl.}
proc gsl_matrix_uchar_const_view_vector*(v: ptr gsl_vector_uchar; n1: csize_t; n2: csize_t): gsl_matrix_uchar_const_view {. cdecl, importc: "gsl_matrix_uchar_const_view_vector", dynlib: libgsl.}
proc gsl_matrix_uchar_const_view_vector_with_tda*(v: ptr gsl_vector_uchar; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_uchar_const_view {.cdecl, importc: "gsl_matrix_uchar_const_view_vector_with_tda", dynlib: libgsl.}
proc gsl_matrix_uchar_set_zero*(m: ptr gsl_matrix_uchar) {.cdecl, importc: "gsl_matrix_uchar_set_zero", dynlib: libgsl.}
proc gsl_matrix_uchar_set_identity*(m: ptr gsl_matrix_uchar) {.cdecl, importc: "gsl_matrix_uchar_set_identity", dynlib: libgsl.}
proc gsl_matrix_uchar_set_all*(m: ptr gsl_matrix_uchar; x: cuchar) {.cdecl, importc: "gsl_matrix_uchar_set_all", dynlib: libgsl.}
proc gsl_matrix_uchar_fread*(stream: ptr FILE; m: ptr gsl_matrix_uchar): cint {.cdecl, importc: "gsl_matrix_uchar_fread", dynlib: libgsl.}
proc gsl_matrix_uchar_fwrite*(stream: ptr FILE; m: ptr gsl_matrix_uchar): cint {.cdecl, importc: "gsl_matrix_uchar_fwrite", dynlib: libgsl.}
proc gsl_matrix_uchar_fscanf*(stream: ptr FILE; m: ptr gsl_matrix_uchar): cint {.cdecl, importc: "gsl_matrix_uchar_fscanf", dynlib: libgsl.}
proc gsl_matrix_uchar_fprintf*(stream: ptr FILE; m: ptr gsl_matrix_uchar;   format: cstring): cint {.cdecl, importc: "gsl_matrix_uchar_fprintf", dynlib: libgsl.}
proc gsl_matrix_uchar_memcpy*(dest: ptr gsl_matrix_uchar; src: ptr gsl_matrix_uchar): cint {. cdecl, importc: "gsl_matrix_uchar_memcpy", dynlib: libgsl.}
proc gsl_matrix_uchar_swap*(m1: ptr gsl_matrix_uchar; m2: ptr gsl_matrix_uchar): cint {. cdecl, importc: "gsl_matrix_uchar_swap", dynlib: libgsl.}
proc gsl_matrix_uchar_tricpy*(uplo_src: char; copy_diag: cint;  dest: ptr gsl_matrix_uchar; src: ptr gsl_matrix_uchar): cint {. cdecl, importc: "gsl_matrix_uchar_tricpy", dynlib: libgsl.}
proc gsl_matrix_uchar_swap_rows*(m: ptr gsl_matrix_uchar; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_matrix_uchar_swap_rows", dynlib: libgsl.}
proc gsl_matrix_uchar_swap_columns*(m: ptr gsl_matrix_uchar; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_matrix_uchar_swap_columns", dynlib: libgsl.}
proc gsl_matrix_uchar_swap_rowcol*(m: ptr gsl_matrix_uchar; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_matrix_uchar_swap_rowcol", dynlib: libgsl.}
proc gsl_matrix_uchar_transpose*(m: ptr gsl_matrix_uchar): cint {.cdecl, importc: "gsl_matrix_uchar_transpose", dynlib: libgsl.}
proc gsl_matrix_uchar_transpose_memcpy*(dest: ptr gsl_matrix_uchar;    src: ptr gsl_matrix_uchar): cint {.cdecl, importc: "gsl_matrix_uchar_transpose_memcpy", dynlib: libgsl.}
proc gsl_matrix_uchar_transpose_tricpy*(uplo_src: char; copy_diag: cint;    dest: ptr gsl_matrix_uchar;    src: ptr gsl_matrix_uchar): cint {.cdecl, importc: "gsl_matrix_uchar_transpose_tricpy", dynlib: libgsl.}
proc gsl_matrix_uchar_max*(m: ptr gsl_matrix_uchar): cuchar {.cdecl, importc: "gsl_matrix_uchar_max", dynlib: libgsl.}
proc gsl_matrix_uchar_min*(m: ptr gsl_matrix_uchar): cuchar {.cdecl, importc: "gsl_matrix_uchar_min", dynlib: libgsl.}
proc gsl_matrix_uchar_minmax*(m: ptr gsl_matrix_uchar; min_out: ptr cuchar;  max_out: ptr cuchar) {.cdecl, importc: "gsl_matrix_uchar_minmax", dynlib: libgsl.}
proc gsl_matrix_uchar_max_index*(m: ptr gsl_matrix_uchar; imax: ptr csize_t; jmax: ptr csize_t) {.cdecl, importc: "gsl_matrix_uchar_max_index", dynlib: libgsl.}
proc gsl_matrix_uchar_min_index*(m: ptr gsl_matrix_uchar; imin: ptr csize_t; jmin: ptr csize_t) {.cdecl, importc: "gsl_matrix_uchar_min_index", dynlib: libgsl.}
proc gsl_matrix_uchar_minmax_index*(m: ptr gsl_matrix_uchar; imin: ptr csize_t;  jmin: ptr csize_t; imax: ptr csize_t;  jmax: ptr csize_t) {.cdecl, importc: "gsl_matrix_uchar_minmax_index", dynlib: libgsl.}
proc gsl_matrix_uchar_equal*(a: ptr gsl_matrix_uchar; b: ptr gsl_matrix_uchar): cint {. cdecl, importc: "gsl_matrix_uchar_equal", dynlib: libgsl.}
proc gsl_matrix_uchar_isnull*(m: ptr gsl_matrix_uchar): cint {.cdecl, importc: "gsl_matrix_uchar_isnull", dynlib: libgsl.}
proc gsl_matrix_uchar_ispos*(m: ptr gsl_matrix_uchar): cint {.cdecl, importc: "gsl_matrix_uchar_ispos", dynlib: libgsl.}
proc gsl_matrix_uchar_isneg*(m: ptr gsl_matrix_uchar): cint {.cdecl, importc: "gsl_matrix_uchar_isneg", dynlib: libgsl.}
proc gsl_matrix_uchar_isnonneg*(m: ptr gsl_matrix_uchar): cint {.cdecl, importc: "gsl_matrix_uchar_isnonneg", dynlib: libgsl.}
proc gsl_matrix_uchar_add*(a: ptr gsl_matrix_uchar; b: ptr gsl_matrix_uchar): cint {. cdecl, importc: "gsl_matrix_uchar_add", dynlib: libgsl.}
proc gsl_matrix_uchar_sub*(a: ptr gsl_matrix_uchar; b: ptr gsl_matrix_uchar): cint {. cdecl, importc: "gsl_matrix_uchar_sub", dynlib: libgsl.}
proc gsl_matrix_uchar_mul_elements*(a: ptr gsl_matrix_uchar; b: ptr gsl_matrix_uchar): cint {. cdecl, importc: "gsl_matrix_uchar_mul_elements", dynlib: libgsl.}
proc gsl_matrix_uchar_div_elements*(a: ptr gsl_matrix_uchar; b: ptr gsl_matrix_uchar): cint {. cdecl, importc: "gsl_matrix_uchar_div_elements", dynlib: libgsl.}
proc gsl_matrix_uchar_scale*(a: ptr gsl_matrix_uchar; x: cdouble): cint {.cdecl, importc: "gsl_matrix_uchar_scale", dynlib: libgsl.}
proc gsl_matrix_uchar_add_constant*(a: ptr gsl_matrix_uchar; x: cdouble): cint {.cdecl, importc: "gsl_matrix_uchar_add_constant", dynlib: libgsl.}
proc gsl_matrix_uchar_add_diagonal*(a: ptr gsl_matrix_uchar; x: cdouble): cint {.cdecl, importc: "gsl_matrix_uchar_add_diagonal", dynlib: libgsl.}
proc gsl_matrix_uchar_get_row*(v: ptr gsl_vector_uchar; m: ptr gsl_matrix_uchar;   i: csize_t): cint {.cdecl, importc: "gsl_matrix_uchar_get_row", dynlib: libgsl.}
proc gsl_matrix_uchar_get_col*(v: ptr gsl_vector_uchar; m: ptr gsl_matrix_uchar;   j: csize_t): cint {.cdecl, importc: "gsl_matrix_uchar_get_col", dynlib: libgsl.}
proc gsl_matrix_uchar_set_row*(m: ptr gsl_matrix_uchar; i: csize_t;   v: ptr gsl_vector_uchar): cint {.cdecl, importc: "gsl_matrix_uchar_set_row", dynlib: libgsl.}
proc gsl_matrix_uchar_set_col*(m: ptr gsl_matrix_uchar; j: csize_t;   v: ptr gsl_vector_uchar): cint {.cdecl, importc: "gsl_matrix_uchar_set_col", dynlib: libgsl.}
proc gsl_matrix_uchar_get*(m: ptr gsl_matrix_uchar; i: csize_t; j: csize_t): cuchar {. cdecl, importc: "gsl_matrix_uchar_get", dynlib: libgsl.}
proc gsl_matrix_uchar_set*(m: ptr gsl_matrix_uchar; i: csize_t; j: csize_t; x: cuchar) {. cdecl, importc: "gsl_matrix_uchar_set", dynlib: libgsl.}
proc gsl_matrix_uchar_ptr*(m: ptr gsl_matrix_uchar; i: csize_t; j: csize_t): ptr cuchar {. cdecl, importc: "gsl_matrix_uchar_ptr", dynlib: libgsl.}
proc gsl_matrix_uchar_const_ptr*(m: ptr gsl_matrix_uchar; i: csize_t; j: csize_t): ptr cuchar {. cdecl, importc: "gsl_matrix_uchar_const_ptr", dynlib: libgsl.}
proc gsl_permute_matrix_uchar*(p: ptr gsl_permutation; A: ptr gsl_matrix_uchar): cint {. cdecl, importc: "gsl_permute_matrix_uchar", dynlib: libgsl.}

var gsl_check_range* {.importc: "gsl_check_range", dynlib: libgsl.}: cint

