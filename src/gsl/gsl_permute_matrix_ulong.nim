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

  gsl_matrix_ulong* {.bycopy.} = object
    size1*: csize_t
    size2*: csize_t
    tda*: csize_t
    data*: ptr culong
    `block`*: ptr gsl_block_ulong
    owner*: cint

  gsl_matrix_ulong_view* {.bycopy.} = object
    matrix*: gsl_matrix_ulong

  gsl_matrix_ulong_const_view* {.bycopy.} = object
    matrix*: gsl_matrix_ulong

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
proc gsl_matrix_ulong_alloc*(n1: csize_t; n2: csize_t): ptr gsl_matrix_ulong {.cdecl, importc: "gsl_matrix_ulong_alloc", dynlib: libgsl.}
proc gsl_matrix_ulong_calloc*(n1: csize_t; n2: csize_t): ptr gsl_matrix_ulong {.cdecl, importc: "gsl_matrix_ulong_calloc", dynlib: libgsl.}
proc gsl_matrix_ulong_alloc_from_block*(b: ptr gsl_block_ulong; offset: csize_t;    n1: csize_t; n2: csize_t; d2: csize_t): ptr gsl_matrix_ulong {. cdecl, importc: "gsl_matrix_ulong_alloc_from_block", dynlib: libgsl.}
proc gsl_matrix_ulong_alloc_from_matrix*(m: ptr gsl_matrix_ulong; k1: csize_t; k2: csize_t; n1: csize_t; n2: csize_t): ptr gsl_matrix_ulong {. cdecl, importc: "gsl_matrix_ulong_alloc_from_matrix", dynlib: libgsl.}
proc gsl_vector_ulong_alloc_row_from_matrix*(m: ptr gsl_matrix_ulong; i: csize_t): ptr gsl_vector_ulong {. cdecl, importc: "gsl_vector_ulong_alloc_row_from_matrix", dynlib: libgsl.}
proc gsl_vector_ulong_alloc_col_from_matrix*(m: ptr gsl_matrix_ulong; j: csize_t): ptr gsl_vector_ulong {. cdecl, importc: "gsl_vector_ulong_alloc_col_from_matrix", dynlib: libgsl.}
proc gsl_matrix_ulong_free*(m: ptr gsl_matrix_ulong) {.cdecl, importc: "gsl_matrix_ulong_free", dynlib: libgsl.}
proc gsl_matrix_ulong_submatrix*(m: ptr gsl_matrix_ulong; i: csize_t; j: csize_t; n1: csize_t; n2: csize_t): gsl_matrix_ulong_view {. cdecl, importc: "gsl_matrix_ulong_submatrix", dynlib: libgsl.}
proc gsl_matrix_ulong_row*(m: ptr gsl_matrix_ulong; i: csize_t): gsl_vector_ulong_view {. cdecl, importc: "gsl_matrix_ulong_row", dynlib: libgsl.}
proc gsl_matrix_ulong_column*(m: ptr gsl_matrix_ulong; j: csize_t): gsl_vector_ulong_view {. cdecl, importc: "gsl_matrix_ulong_column", dynlib: libgsl.}
proc gsl_matrix_ulong_diagonal*(m: ptr gsl_matrix_ulong): gsl_vector_ulong_view {. cdecl, importc: "gsl_matrix_ulong_diagonal", dynlib: libgsl.}
proc gsl_matrix_ulong_subdiagonal*(m: ptr gsl_matrix_ulong; k: csize_t): gsl_vector_ulong_view {. cdecl, importc: "gsl_matrix_ulong_subdiagonal", dynlib: libgsl.}
proc gsl_matrix_ulong_superdiagonal*(m: ptr gsl_matrix_ulong; k: csize_t): gsl_vector_ulong_view {. cdecl, importc: "gsl_matrix_ulong_superdiagonal", dynlib: libgsl.}
proc gsl_matrix_ulong_subrow*(m: ptr gsl_matrix_ulong; i: csize_t; offset: csize_t;  n: csize_t): gsl_vector_ulong_view {.cdecl, importc: "gsl_matrix_ulong_subrow", dynlib: libgsl.}
proc gsl_matrix_ulong_subcolumn*(m: ptr gsl_matrix_ulong; j: csize_t; offset: csize_t; n: csize_t): gsl_vector_ulong_view {.cdecl, importc: "gsl_matrix_ulong_subcolumn", dynlib: libgsl.}
proc gsl_matrix_ulong_view_array*(base: ptr culong; n1: csize_t; n2: csize_t): gsl_matrix_ulong_view {. cdecl, importc: "gsl_matrix_ulong_view_array", dynlib: libgsl.}
proc gsl_matrix_ulong_view_array_with_tda*(base: ptr culong; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_ulong_view {.cdecl, importc: "gsl_matrix_ulong_view_array_with_tda",  dynlib: libgsl.}
proc gsl_matrix_ulong_view_vector*(v: ptr gsl_vector_ulong; n1: csize_t; n2: csize_t): gsl_matrix_ulong_view {. cdecl, importc: "gsl_matrix_ulong_view_vector", dynlib: libgsl.}
proc gsl_matrix_ulong_view_vector_with_tda*(v: ptr gsl_vector_ulong; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_ulong_view {.cdecl, importc: "gsl_matrix_ulong_view_vector_with_tda", dynlib: libgsl.}
proc gsl_matrix_ulong_const_submatrix*(m: ptr gsl_matrix_ulong; i: csize_t;   j: csize_t; n1: csize_t; n2: csize_t): gsl_matrix_ulong_const_view {. cdecl, importc: "gsl_matrix_ulong_const_submatrix", dynlib: libgsl.}
proc gsl_matrix_ulong_const_row*(m: ptr gsl_matrix_ulong; i: csize_t): gsl_vector_ulong_const_view {. cdecl, importc: "gsl_matrix_ulong_const_row", dynlib: libgsl.}
proc gsl_matrix_ulong_const_column*(m: ptr gsl_matrix_ulong; j: csize_t): gsl_vector_ulong_const_view {. cdecl, importc: "gsl_matrix_ulong_const_column", dynlib: libgsl.}
proc gsl_matrix_ulong_const_diagonal*(m: ptr gsl_matrix_ulong): gsl_vector_ulong_const_view {. cdecl, importc: "gsl_matrix_ulong_const_diagonal", dynlib: libgsl.}
proc gsl_matrix_ulong_const_subdiagonal*(m: ptr gsl_matrix_ulong; k: csize_t): gsl_vector_ulong_const_view {. cdecl, importc: "gsl_matrix_ulong_const_subdiagonal", dynlib: libgsl.}
proc gsl_matrix_ulong_const_superdiagonal*(m: ptr gsl_matrix_ulong; k: csize_t): gsl_vector_ulong_const_view {. cdecl, importc: "gsl_matrix_ulong_const_superdiagonal", dynlib: libgsl.}
proc gsl_matrix_ulong_const_subrow*(m: ptr gsl_matrix_ulong; i: csize_t;  offset: csize_t; n: csize_t): gsl_vector_ulong_const_view {. cdecl, importc: "gsl_matrix_ulong_const_subrow", dynlib: libgsl.}
proc gsl_matrix_ulong_const_subcolumn*(m: ptr gsl_matrix_ulong; j: csize_t;   offset: csize_t; n: csize_t): gsl_vector_ulong_const_view {. cdecl, importc: "gsl_matrix_ulong_const_subcolumn", dynlib: libgsl.}
proc gsl_matrix_ulong_const_view_array*(base: ptr culong; n1: csize_t; n2: csize_t): gsl_matrix_ulong_const_view {. cdecl, importc: "gsl_matrix_ulong_const_view_array", dynlib: libgsl.}
proc gsl_matrix_ulong_const_view_array_with_tda*(base: ptr culong; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_ulong_const_view {.cdecl, importc: "gsl_matrix_ulong_const_view_array_with_tda", dynlib: libgsl.}
proc gsl_matrix_ulong_const_view_vector*(v: ptr gsl_vector_ulong; n1: csize_t; n2: csize_t): gsl_matrix_ulong_const_view {. cdecl, importc: "gsl_matrix_ulong_const_view_vector", dynlib: libgsl.}
proc gsl_matrix_ulong_const_view_vector_with_tda*(v: ptr gsl_vector_ulong; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_ulong_const_view {.cdecl, importc: "gsl_matrix_ulong_const_view_vector_with_tda", dynlib: libgsl.}
proc gsl_matrix_ulong_set_zero*(m: ptr gsl_matrix_ulong) {.cdecl, importc: "gsl_matrix_ulong_set_zero", dynlib: libgsl.}
proc gsl_matrix_ulong_set_identity*(m: ptr gsl_matrix_ulong) {.cdecl, importc: "gsl_matrix_ulong_set_identity", dynlib: libgsl.}
proc gsl_matrix_ulong_set_all*(m: ptr gsl_matrix_ulong; x: culong) {.cdecl, importc: "gsl_matrix_ulong_set_all", dynlib: libgsl.}
proc gsl_matrix_ulong_fread*(stream: ptr FILE; m: ptr gsl_matrix_ulong): cint {.cdecl, importc: "gsl_matrix_ulong_fread", dynlib: libgsl.}
proc gsl_matrix_ulong_fwrite*(stream: ptr FILE; m: ptr gsl_matrix_ulong): cint {.cdecl, importc: "gsl_matrix_ulong_fwrite", dynlib: libgsl.}
proc gsl_matrix_ulong_fscanf*(stream: ptr FILE; m: ptr gsl_matrix_ulong): cint {.cdecl, importc: "gsl_matrix_ulong_fscanf", dynlib: libgsl.}
proc gsl_matrix_ulong_fprintf*(stream: ptr FILE; m: ptr gsl_matrix_ulong;   format: cstring): cint {.cdecl, importc: "gsl_matrix_ulong_fprintf", dynlib: libgsl.}
proc gsl_matrix_ulong_memcpy*(dest: ptr gsl_matrix_ulong; src: ptr gsl_matrix_ulong): cint {. cdecl, importc: "gsl_matrix_ulong_memcpy", dynlib: libgsl.}
proc gsl_matrix_ulong_swap*(m1: ptr gsl_matrix_ulong; m2: ptr gsl_matrix_ulong): cint {. cdecl, importc: "gsl_matrix_ulong_swap", dynlib: libgsl.}
proc gsl_matrix_ulong_tricpy*(uplo_src: char; copy_diag: cint;  dest: ptr gsl_matrix_ulong; src: ptr gsl_matrix_ulong): cint {. cdecl, importc: "gsl_matrix_ulong_tricpy", dynlib: libgsl.}
proc gsl_matrix_ulong_swap_rows*(m: ptr gsl_matrix_ulong; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_matrix_ulong_swap_rows", dynlib: libgsl.}
proc gsl_matrix_ulong_swap_columns*(m: ptr gsl_matrix_ulong; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_matrix_ulong_swap_columns", dynlib: libgsl.}
proc gsl_matrix_ulong_swap_rowcol*(m: ptr gsl_matrix_ulong; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_matrix_ulong_swap_rowcol", dynlib: libgsl.}
proc gsl_matrix_ulong_transpose*(m: ptr gsl_matrix_ulong): cint {.cdecl, importc: "gsl_matrix_ulong_transpose", dynlib: libgsl.}
proc gsl_matrix_ulong_transpose_memcpy*(dest: ptr gsl_matrix_ulong;    src: ptr gsl_matrix_ulong): cint {.cdecl, importc: "gsl_matrix_ulong_transpose_memcpy", dynlib: libgsl.}
proc gsl_matrix_ulong_transpose_tricpy*(uplo_src: char; copy_diag: cint;    dest: ptr gsl_matrix_ulong;    src: ptr gsl_matrix_ulong): cint {.cdecl, importc: "gsl_matrix_ulong_transpose_tricpy", dynlib: libgsl.}
proc gsl_matrix_ulong_max*(m: ptr gsl_matrix_ulong): culong {.cdecl, importc: "gsl_matrix_ulong_max", dynlib: libgsl.}
proc gsl_matrix_ulong_min*(m: ptr gsl_matrix_ulong): culong {.cdecl, importc: "gsl_matrix_ulong_min", dynlib: libgsl.}
proc gsl_matrix_ulong_minmax*(m: ptr gsl_matrix_ulong; min_out: ptr culong;  max_out: ptr culong) {.cdecl, importc: "gsl_matrix_ulong_minmax", dynlib: libgsl.}
proc gsl_matrix_ulong_max_index*(m: ptr gsl_matrix_ulong; imax: ptr csize_t; jmax: ptr csize_t) {.cdecl, importc: "gsl_matrix_ulong_max_index", dynlib: libgsl.}
proc gsl_matrix_ulong_min_index*(m: ptr gsl_matrix_ulong; imin: ptr csize_t; jmin: ptr csize_t) {.cdecl, importc: "gsl_matrix_ulong_min_index", dynlib: libgsl.}
proc gsl_matrix_ulong_minmax_index*(m: ptr gsl_matrix_ulong; imin: ptr csize_t;  jmin: ptr csize_t; imax: ptr csize_t;  jmax: ptr csize_t) {.cdecl, importc: "gsl_matrix_ulong_minmax_index", dynlib: libgsl.}
proc gsl_matrix_ulong_equal*(a: ptr gsl_matrix_ulong; b: ptr gsl_matrix_ulong): cint {. cdecl, importc: "gsl_matrix_ulong_equal", dynlib: libgsl.}
proc gsl_matrix_ulong_isnull*(m: ptr gsl_matrix_ulong): cint {.cdecl, importc: "gsl_matrix_ulong_isnull", dynlib: libgsl.}
proc gsl_matrix_ulong_ispos*(m: ptr gsl_matrix_ulong): cint {.cdecl, importc: "gsl_matrix_ulong_ispos", dynlib: libgsl.}
proc gsl_matrix_ulong_isneg*(m: ptr gsl_matrix_ulong): cint {.cdecl, importc: "gsl_matrix_ulong_isneg", dynlib: libgsl.}
proc gsl_matrix_ulong_isnonneg*(m: ptr gsl_matrix_ulong): cint {.cdecl, importc: "gsl_matrix_ulong_isnonneg", dynlib: libgsl.}
proc gsl_matrix_ulong_add*(a: ptr gsl_matrix_ulong; b: ptr gsl_matrix_ulong): cint {. cdecl, importc: "gsl_matrix_ulong_add", dynlib: libgsl.}
proc gsl_matrix_ulong_sub*(a: ptr gsl_matrix_ulong; b: ptr gsl_matrix_ulong): cint {. cdecl, importc: "gsl_matrix_ulong_sub", dynlib: libgsl.}
proc gsl_matrix_ulong_mul_elements*(a: ptr gsl_matrix_ulong; b: ptr gsl_matrix_ulong): cint {. cdecl, importc: "gsl_matrix_ulong_mul_elements", dynlib: libgsl.}
proc gsl_matrix_ulong_div_elements*(a: ptr gsl_matrix_ulong; b: ptr gsl_matrix_ulong): cint {. cdecl, importc: "gsl_matrix_ulong_div_elements", dynlib: libgsl.}
proc gsl_matrix_ulong_scale*(a: ptr gsl_matrix_ulong; x: cdouble): cint {.cdecl, importc: "gsl_matrix_ulong_scale", dynlib: libgsl.}
proc gsl_matrix_ulong_add_constant*(a: ptr gsl_matrix_ulong; x: cdouble): cint {.cdecl, importc: "gsl_matrix_ulong_add_constant", dynlib: libgsl.}
proc gsl_matrix_ulong_add_diagonal*(a: ptr gsl_matrix_ulong; x: cdouble): cint {.cdecl, importc: "gsl_matrix_ulong_add_diagonal", dynlib: libgsl.}
proc gsl_matrix_ulong_get_row*(v: ptr gsl_vector_ulong; m: ptr gsl_matrix_ulong;   i: csize_t): cint {.cdecl, importc: "gsl_matrix_ulong_get_row", dynlib: libgsl.}
proc gsl_matrix_ulong_get_col*(v: ptr gsl_vector_ulong; m: ptr gsl_matrix_ulong;   j: csize_t): cint {.cdecl, importc: "gsl_matrix_ulong_get_col", dynlib: libgsl.}
proc gsl_matrix_ulong_set_row*(m: ptr gsl_matrix_ulong; i: csize_t;   v: ptr gsl_vector_ulong): cint {.cdecl, importc: "gsl_matrix_ulong_set_row", dynlib: libgsl.}
proc gsl_matrix_ulong_set_col*(m: ptr gsl_matrix_ulong; j: csize_t;   v: ptr gsl_vector_ulong): cint {.cdecl, importc: "gsl_matrix_ulong_set_col", dynlib: libgsl.}
proc gsl_matrix_ulong_get*(m: ptr gsl_matrix_ulong; i: csize_t; j: csize_t): culong {. cdecl, importc: "gsl_matrix_ulong_get", dynlib: libgsl.}
proc gsl_matrix_ulong_set*(m: ptr gsl_matrix_ulong; i: csize_t; j: csize_t; x: culong) {. cdecl, importc: "gsl_matrix_ulong_set", dynlib: libgsl.}
proc gsl_matrix_ulong_ptr*(m: ptr gsl_matrix_ulong; i: csize_t; j: csize_t): ptr culong {. cdecl, importc: "gsl_matrix_ulong_ptr", dynlib: libgsl.}
proc gsl_matrix_ulong_const_ptr*(m: ptr gsl_matrix_ulong; i: csize_t; j: csize_t): ptr culong {. cdecl, importc: "gsl_matrix_ulong_const_ptr", dynlib: libgsl.}
proc gsl_permute_matrix_ulong*(p: ptr gsl_permutation; A: ptr gsl_matrix_ulong): cint {. cdecl, importc: "gsl_permute_matrix_ulong", dynlib: libgsl.}

var gsl_check_range* {.importc: "gsl_check_range", dynlib: libgsl.}: cint

