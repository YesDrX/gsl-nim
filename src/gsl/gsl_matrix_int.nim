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

  gsl_matrix_int* {.bycopy.} = object
    size1*: csize_t
    size2*: csize_t
    tda*: csize_t
    data*: ptr cint
    `block`*: ptr gsl_block_int
    owner*: cint

  gsl_matrix_int_view* {.bycopy.} = object
    matrix*: gsl_matrix_int

  gsl_matrix_int_const_view* {.bycopy.} = object
    matrix*: gsl_matrix_int

proc gsl_error*(reason: cstring; file: cstring; line: cint; gsl_errno: cint) {.cdecl, importc: "gsl_error", dynlib: libgsl.}
proc gsl_stream_printf*(label: cstring; file: cstring; line: cint; reason: cstring) {. cdecl, importc: "gsl_stream_printf", dynlib: libgsl.}
proc gsl_strerror*(gsl_errno: cint): cstring {.cdecl, importc: "gsl_strerror", dynlib: libgsl.}
proc gsl_set_error_handler*(new_handler: ptr gsl_error_handler_t): ptr gsl_error_handler_t {. cdecl, importc: "gsl_set_error_handler", dynlib: libgsl.}
proc gsl_set_error_handler_off*(): ptr gsl_error_handler_t {.cdecl, importc: "gsl_set_error_handler_off", dynlib: libgsl.}
proc gsl_set_stream_handler*(new_handler: ptr gsl_stream_handler_t): ptr gsl_stream_handler_t {. cdecl, importc: "gsl_set_stream_handler", dynlib: libgsl.}
proc gsl_set_stream*(new_stream: ptr FILE): ptr FILE {.cdecl, importc: "gsl_set_stream", dynlib: libgsl.}
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
proc gsl_matrix_int_alloc*(n1: csize_t; n2: csize_t): ptr gsl_matrix_int {.cdecl, importc: "gsl_matrix_int_alloc", dynlib: libgsl.}
proc gsl_matrix_int_calloc*(n1: csize_t; n2: csize_t): ptr gsl_matrix_int {.cdecl, importc: "gsl_matrix_int_calloc", dynlib: libgsl.}
proc gsl_matrix_int_alloc_from_block*(b: ptr gsl_block_int; offset: csize_t;  n1: csize_t; n2: csize_t; d2: csize_t): ptr gsl_matrix_int {. cdecl, importc: "gsl_matrix_int_alloc_from_block", dynlib: libgsl.}
proc gsl_matrix_int_alloc_from_matrix*(m: ptr gsl_matrix_int; k1: csize_t;   k2: csize_t; n1: csize_t; n2: csize_t): ptr gsl_matrix_int {. cdecl, importc: "gsl_matrix_int_alloc_from_matrix", dynlib: libgsl.}
proc gsl_vector_int_alloc_row_from_matrix*(m: ptr gsl_matrix_int; i: csize_t): ptr gsl_vector_int {. cdecl, importc: "gsl_vector_int_alloc_row_from_matrix", dynlib: libgsl.}
proc gsl_vector_int_alloc_col_from_matrix*(m: ptr gsl_matrix_int; j: csize_t): ptr gsl_vector_int {. cdecl, importc: "gsl_vector_int_alloc_col_from_matrix", dynlib: libgsl.}
proc gsl_matrix_int_free*(m: ptr gsl_matrix_int) {.cdecl, importc: "gsl_matrix_int_free", dynlib: libgsl.}
proc gsl_matrix_int_submatrix*(m: ptr gsl_matrix_int; i: csize_t; j: csize_t;   n1: csize_t; n2: csize_t): gsl_matrix_int_view {.cdecl, importc: "gsl_matrix_int_submatrix", dynlib: libgsl.}
proc gsl_matrix_int_row*(m: ptr gsl_matrix_int; i: csize_t): gsl_vector_int_view {. cdecl, importc: "gsl_matrix_int_row", dynlib: libgsl.}
proc gsl_matrix_int_column*(m: ptr gsl_matrix_int; j: csize_t): gsl_vector_int_view {. cdecl, importc: "gsl_matrix_int_column", dynlib: libgsl.}
proc gsl_matrix_int_diagonal*(m: ptr gsl_matrix_int): gsl_vector_int_view {.cdecl, importc: "gsl_matrix_int_diagonal", dynlib: libgsl.}
proc gsl_matrix_int_subdiagonal*(m: ptr gsl_matrix_int; k: csize_t): gsl_vector_int_view {. cdecl, importc: "gsl_matrix_int_subdiagonal", dynlib: libgsl.}
proc gsl_matrix_int_superdiagonal*(m: ptr gsl_matrix_int; k: csize_t): gsl_vector_int_view {. cdecl, importc: "gsl_matrix_int_superdiagonal", dynlib: libgsl.}
proc gsl_matrix_int_subrow*(m: ptr gsl_matrix_int; i: csize_t; offset: csize_t;   n: csize_t): gsl_vector_int_view {.cdecl, importc: "gsl_matrix_int_subrow", dynlib: libgsl.}
proc gsl_matrix_int_subcolumn*(m: ptr gsl_matrix_int; j: csize_t; offset: csize_t;   n: csize_t): gsl_vector_int_view {.cdecl, importc: "gsl_matrix_int_subcolumn", dynlib: libgsl.}
proc gsl_matrix_int_view_array*(base: ptr cint; n1: csize_t; n2: csize_t): gsl_matrix_int_view {. cdecl, importc: "gsl_matrix_int_view_array", dynlib: libgsl.}
proc gsl_matrix_int_view_array_with_tda*(base: ptr cint; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_int_view {.cdecl, importc: "gsl_matrix_int_view_array_with_tda", dynlib: libgsl.}
proc gsl_matrix_int_view_vector*(v: ptr gsl_vector_int; n1: csize_t; n2: csize_t): gsl_matrix_int_view {. cdecl, importc: "gsl_matrix_int_view_vector", dynlib: libgsl.}
proc gsl_matrix_int_view_vector_with_tda*(v: ptr gsl_vector_int; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_int_view {.cdecl, importc: "gsl_matrix_int_view_vector_with_tda", dynlib: libgsl.}
proc gsl_matrix_int_const_submatrix*(m: ptr gsl_matrix_int; i: csize_t; j: csize_t; n1: csize_t; n2: csize_t): gsl_matrix_int_const_view {. cdecl, importc: "gsl_matrix_int_const_submatrix", dynlib: libgsl.}
proc gsl_matrix_int_const_row*(m: ptr gsl_matrix_int; i: csize_t): gsl_vector_int_const_view {. cdecl, importc: "gsl_matrix_int_const_row", dynlib: libgsl.}
proc gsl_matrix_int_const_column*(m: ptr gsl_matrix_int; j: csize_t): gsl_vector_int_const_view {. cdecl, importc: "gsl_matrix_int_const_column", dynlib: libgsl.}
proc gsl_matrix_int_const_diagonal*(m: ptr gsl_matrix_int): gsl_vector_int_const_view {. cdecl, importc: "gsl_matrix_int_const_diagonal", dynlib: libgsl.}
proc gsl_matrix_int_const_subdiagonal*(m: ptr gsl_matrix_int; k: csize_t): gsl_vector_int_const_view {. cdecl, importc: "gsl_matrix_int_const_subdiagonal", dynlib: libgsl.}
proc gsl_matrix_int_const_superdiagonal*(m: ptr gsl_matrix_int; k: csize_t): gsl_vector_int_const_view {. cdecl, importc: "gsl_matrix_int_const_superdiagonal", dynlib: libgsl.}
proc gsl_matrix_int_const_subrow*(m: ptr gsl_matrix_int; i: csize_t; offset: csize_t; n: csize_t): gsl_vector_int_const_view {.cdecl, importc: "gsl_matrix_int_const_subrow", dynlib: libgsl.}
proc gsl_matrix_int_const_subcolumn*(m: ptr gsl_matrix_int; j: csize_t; offset: csize_t; n: csize_t): gsl_vector_int_const_view {. cdecl, importc: "gsl_matrix_int_const_subcolumn", dynlib: libgsl.}
proc gsl_matrix_int_const_view_array*(base: ptr cint; n1: csize_t; n2: csize_t): gsl_matrix_int_const_view {. cdecl, importc: "gsl_matrix_int_const_view_array", dynlib: libgsl.}
proc gsl_matrix_int_const_view_array_with_tda*(base: ptr cint; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_int_const_view {.cdecl, importc: "gsl_matrix_int_const_view_array_with_tda", dynlib: libgsl.}
proc gsl_matrix_int_const_view_vector*(v: ptr gsl_vector_int; n1: csize_t; n2: csize_t): gsl_matrix_int_const_view {. cdecl, importc: "gsl_matrix_int_const_view_vector", dynlib: libgsl.}
proc gsl_matrix_int_const_view_vector_with_tda*(v: ptr gsl_vector_int; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_int_const_view {.cdecl, importc: "gsl_matrix_int_const_view_vector_with_tda", dynlib: libgsl.}
proc gsl_matrix_int_set_zero*(m: ptr gsl_matrix_int) {.cdecl, importc: "gsl_matrix_int_set_zero", dynlib: libgsl.}
proc gsl_matrix_int_set_identity*(m: ptr gsl_matrix_int) {.cdecl, importc: "gsl_matrix_int_set_identity", dynlib: libgsl.}
proc gsl_matrix_int_set_all*(m: ptr gsl_matrix_int; x: cint) {.cdecl, importc: "gsl_matrix_int_set_all", dynlib: libgsl.}
proc gsl_matrix_int_fread*(stream: ptr FILE; m: ptr gsl_matrix_int): cint {.cdecl, importc: "gsl_matrix_int_fread", dynlib: libgsl.}
proc gsl_matrix_int_fwrite*(stream: ptr FILE; m: ptr gsl_matrix_int): cint {.cdecl, importc: "gsl_matrix_int_fwrite", dynlib: libgsl.}
proc gsl_matrix_int_fscanf*(stream: ptr FILE; m: ptr gsl_matrix_int): cint {.cdecl, importc: "gsl_matrix_int_fscanf", dynlib: libgsl.}
proc gsl_matrix_int_fprintf*(stream: ptr FILE; m: ptr gsl_matrix_int; format: cstring): cint {. cdecl, importc: "gsl_matrix_int_fprintf", dynlib: libgsl.}
proc gsl_matrix_int_memcpy*(dest: ptr gsl_matrix_int; src: ptr gsl_matrix_int): cint {. cdecl, importc: "gsl_matrix_int_memcpy", dynlib: libgsl.}
proc gsl_matrix_int_swap*(m1: ptr gsl_matrix_int; m2: ptr gsl_matrix_int): cint {.cdecl, importc: "gsl_matrix_int_swap", dynlib: libgsl.}
proc gsl_matrix_int_tricpy*(uplo_src: char; copy_diag: cint;   dest: ptr gsl_matrix_int; src: ptr gsl_matrix_int): cint {. cdecl, importc: "gsl_matrix_int_tricpy", dynlib: libgsl.}
proc gsl_matrix_int_swap_rows*(m: ptr gsl_matrix_int; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_matrix_int_swap_rows", dynlib: libgsl.}
proc gsl_matrix_int_swap_columns*(m: ptr gsl_matrix_int; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_matrix_int_swap_columns", dynlib: libgsl.}
proc gsl_matrix_int_swap_rowcol*(m: ptr gsl_matrix_int; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_matrix_int_swap_rowcol", dynlib: libgsl.}
proc gsl_matrix_int_transpose*(m: ptr gsl_matrix_int): cint {.cdecl, importc: "gsl_matrix_int_transpose", dynlib: libgsl.}
proc gsl_matrix_int_transpose_memcpy*(dest: ptr gsl_matrix_int;  src: ptr gsl_matrix_int): cint {.cdecl, importc: "gsl_matrix_int_transpose_memcpy", dynlib: libgsl.}
proc gsl_matrix_int_transpose_tricpy*(uplo_src: char; copy_diag: cint;  dest: ptr gsl_matrix_int;  src: ptr gsl_matrix_int): cint {.cdecl, importc: "gsl_matrix_int_transpose_tricpy", dynlib: libgsl.}
proc gsl_matrix_int_max*(m: ptr gsl_matrix_int): cint {.cdecl, importc: "gsl_matrix_int_max", dynlib: libgsl.}
proc gsl_matrix_int_min*(m: ptr gsl_matrix_int): cint {.cdecl, importc: "gsl_matrix_int_min", dynlib: libgsl.}
proc gsl_matrix_int_minmax*(m: ptr gsl_matrix_int; min_out: ptr cint; max_out: ptr cint) {. cdecl, importc: "gsl_matrix_int_minmax", dynlib: libgsl.}
proc gsl_matrix_int_max_index*(m: ptr gsl_matrix_int; imax: ptr csize_t;   jmax: ptr csize_t) {.cdecl, importc: "gsl_matrix_int_max_index", dynlib: libgsl.}
proc gsl_matrix_int_min_index*(m: ptr gsl_matrix_int; imin: ptr csize_t;   jmin: ptr csize_t) {.cdecl, importc: "gsl_matrix_int_min_index", dynlib: libgsl.}
proc gsl_matrix_int_minmax_index*(m: ptr gsl_matrix_int; imin: ptr csize_t; jmin: ptr csize_t; imax: ptr csize_t; jmax: ptr csize_t) {.cdecl, importc: "gsl_matrix_int_minmax_index", dynlib: libgsl.}
proc gsl_matrix_int_equal*(a: ptr gsl_matrix_int; b: ptr gsl_matrix_int): cint {.cdecl, importc: "gsl_matrix_int_equal", dynlib: libgsl.}
proc gsl_matrix_int_isnull*(m: ptr gsl_matrix_int): cint {.cdecl, importc: "gsl_matrix_int_isnull", dynlib: libgsl.}
proc gsl_matrix_int_ispos*(m: ptr gsl_matrix_int): cint {.cdecl, importc: "gsl_matrix_int_ispos", dynlib: libgsl.}
proc gsl_matrix_int_isneg*(m: ptr gsl_matrix_int): cint {.cdecl, importc: "gsl_matrix_int_isneg", dynlib: libgsl.}
proc gsl_matrix_int_isnonneg*(m: ptr gsl_matrix_int): cint {.cdecl, importc: "gsl_matrix_int_isnonneg", dynlib: libgsl.}
proc gsl_matrix_int_add*(a: ptr gsl_matrix_int; b: ptr gsl_matrix_int): cint {.cdecl, importc: "gsl_matrix_int_add", dynlib: libgsl.}
proc gsl_matrix_int_sub*(a: ptr gsl_matrix_int; b: ptr gsl_matrix_int): cint {.cdecl, importc: "gsl_matrix_int_sub", dynlib: libgsl.}
proc gsl_matrix_int_mul_elements*(a: ptr gsl_matrix_int; b: ptr gsl_matrix_int): cint {. cdecl, importc: "gsl_matrix_int_mul_elements", dynlib: libgsl.}
proc gsl_matrix_int_div_elements*(a: ptr gsl_matrix_int; b: ptr gsl_matrix_int): cint {. cdecl, importc: "gsl_matrix_int_div_elements", dynlib: libgsl.}
proc gsl_matrix_int_scale*(a: ptr gsl_matrix_int; x: cdouble): cint {.cdecl, importc: "gsl_matrix_int_scale", dynlib: libgsl.}
proc gsl_matrix_int_add_constant*(a: ptr gsl_matrix_int; x: cdouble): cint {.cdecl, importc: "gsl_matrix_int_add_constant", dynlib: libgsl.}
proc gsl_matrix_int_add_diagonal*(a: ptr gsl_matrix_int; x: cdouble): cint {.cdecl, importc: "gsl_matrix_int_add_diagonal", dynlib: libgsl.}
proc gsl_matrix_int_get_row*(v: ptr gsl_vector_int; m: ptr gsl_matrix_int; i: csize_t): cint {. cdecl, importc: "gsl_matrix_int_get_row", dynlib: libgsl.}
proc gsl_matrix_int_get_col*(v: ptr gsl_vector_int; m: ptr gsl_matrix_int; j: csize_t): cint {. cdecl, importc: "gsl_matrix_int_get_col", dynlib: libgsl.}
proc gsl_matrix_int_set_row*(m: ptr gsl_matrix_int; i: csize_t; v: ptr gsl_vector_int): cint {. cdecl, importc: "gsl_matrix_int_set_row", dynlib: libgsl.}
proc gsl_matrix_int_set_col*(m: ptr gsl_matrix_int; j: csize_t; v: ptr gsl_vector_int): cint {. cdecl, importc: "gsl_matrix_int_set_col", dynlib: libgsl.}
proc gsl_matrix_int_get*(m: ptr gsl_matrix_int; i: csize_t; j: csize_t): cint {.cdecl, importc: "gsl_matrix_int_get", dynlib: libgsl.}
proc gsl_matrix_int_set*(m: ptr gsl_matrix_int; i: csize_t; j: csize_t; x: cint) {.cdecl, importc: "gsl_matrix_int_set", dynlib: libgsl.}
proc gsl_matrix_int_ptr*(m: ptr gsl_matrix_int; i: csize_t; j: csize_t): ptr cint {.cdecl, importc: "gsl_matrix_int_ptr", dynlib: libgsl.}
proc gsl_matrix_int_const_ptr*(m: ptr gsl_matrix_int; i: csize_t; j: csize_t): ptr cint {. cdecl, importc: "gsl_matrix_int_const_ptr", dynlib: libgsl.}

var gsl_check_range* {.importc: "gsl_check_range", dynlib: libgsl.}: cint

