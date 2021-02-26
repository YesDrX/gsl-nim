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

  gsl_matrix* {.bycopy.} = object
    size1*: csize_t
    size2*: csize_t
    tda*: csize_t
    data*: ptr cdouble
    `block`*: ptr gsl_block
    owner*: cint

  gsl_matrix_view* {.bycopy.} = object
    matrix*: gsl_matrix

  gsl_matrix_const_view* {.bycopy.} = object
    matrix*: gsl_matrix

  gsl_wavelet_direction* {.size: sizeof(cint).} = enum
    gsl_wavelet_backward = -1, gsl_wavelet_forward = 1
  gsl_wavelet_type* {.bycopy.} = object
    name*: cstring
    init*: proc (h1: ptr ptr cdouble; g1: ptr ptr cdouble; h2: ptr ptr cdouble; g2: ptr ptr cdouble; nc: ptr csize_t; offset: ptr csize_t; member: csize_t): cint {.     cdecl.}

  gsl_wavelet* {.bycopy.} = object
    `type`*: ptr gsl_wavelet_type
    h1*: ptr cdouble
    g1*: ptr cdouble
    h2*: ptr cdouble
    g2*: ptr cdouble
    nc*: csize_t
    offset*: csize_t

  gsl_wavelet_workspace* {.bycopy.} = object
    scratch*: ptr cdouble
    n*: csize_t

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
proc gsl_matrix_alloc*(n1: csize_t; n2: csize_t): ptr gsl_matrix {.cdecl, importc: "gsl_matrix_alloc", dynlib: libgsl.}
proc gsl_matrix_calloc*(n1: csize_t; n2: csize_t): ptr gsl_matrix {.cdecl, importc: "gsl_matrix_calloc", dynlib: libgsl.}
proc gsl_matrix_alloc_from_block*(b: ptr gsl_block; offset: csize_t; n1: csize_t; n2: csize_t; d2: csize_t): ptr gsl_matrix {.cdecl, importc: "gsl_matrix_alloc_from_block", dynlib: libgsl.}
proc gsl_matrix_alloc_from_matrix*(m: ptr gsl_matrix; k1: csize_t; k2: csize_t; n1: csize_t; n2: csize_t): ptr gsl_matrix {.cdecl, importc: "gsl_matrix_alloc_from_matrix", dynlib: libgsl.}
proc gsl_vector_alloc_row_from_matrix*(m: ptr gsl_matrix; i: csize_t): ptr gsl_vector {. cdecl, importc: "gsl_vector_alloc_row_from_matrix", dynlib: libgsl.}
proc gsl_vector_alloc_col_from_matrix*(m: ptr gsl_matrix; j: csize_t): ptr gsl_vector {. cdecl, importc: "gsl_vector_alloc_col_from_matrix", dynlib: libgsl.}
proc gsl_matrix_free*(m: ptr gsl_matrix) {.cdecl, importc: "gsl_matrix_free", dynlib: libgsl.}
proc gsl_matrix_submatrix*(m: ptr gsl_matrix; i: csize_t; j: csize_t; n1: csize_t;  n2: csize_t): gsl_matrix_view {.cdecl, importc: "gsl_matrix_submatrix", dynlib: libgsl.}
proc gsl_matrix_row*(m: ptr gsl_matrix; i: csize_t): gsl_vector_view {.cdecl, importc: "gsl_matrix_row", dynlib: libgsl.}
proc gsl_matrix_column*(m: ptr gsl_matrix; j: csize_t): gsl_vector_view {.cdecl, importc: "gsl_matrix_column", dynlib: libgsl.}
proc gsl_matrix_diagonal*(m: ptr gsl_matrix): gsl_vector_view {.cdecl, importc: "gsl_matrix_diagonal", dynlib: libgsl.}
proc gsl_matrix_subdiagonal*(m: ptr gsl_matrix; k: csize_t): gsl_vector_view {.cdecl, importc: "gsl_matrix_subdiagonal", dynlib: libgsl.}
proc gsl_matrix_superdiagonal*(m: ptr gsl_matrix; k: csize_t): gsl_vector_view {.cdecl, importc: "gsl_matrix_superdiagonal", dynlib: libgsl.}
proc gsl_matrix_subrow*(m: ptr gsl_matrix; i: csize_t; offset: csize_t; n: csize_t): gsl_vector_view {. cdecl, importc: "gsl_matrix_subrow", dynlib: libgsl.}
proc gsl_matrix_subcolumn*(m: ptr gsl_matrix; j: csize_t; offset: csize_t; n: csize_t): gsl_vector_view {. cdecl, importc: "gsl_matrix_subcolumn", dynlib: libgsl.}
proc gsl_matrix_view_array*(base: ptr cdouble; n1: csize_t; n2: csize_t): gsl_matrix_view {. cdecl, importc: "gsl_matrix_view_array", dynlib: libgsl.}
proc gsl_matrix_view_array_with_tda*(base: ptr cdouble; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_view {.cdecl, importc: "gsl_matrix_view_array_with_tda", dynlib: libgsl.}
proc gsl_matrix_view_vector*(v: ptr gsl_vector; n1: csize_t; n2: csize_t): gsl_matrix_view {. cdecl, importc: "gsl_matrix_view_vector", dynlib: libgsl.}
proc gsl_matrix_view_vector_with_tda*(v: ptr gsl_vector; n1: csize_t; n2: csize_t;  tda: csize_t): gsl_matrix_view {.cdecl, importc: "gsl_matrix_view_vector_with_tda", dynlib: libgsl.}
proc gsl_matrix_const_submatrix*(m: ptr gsl_matrix; i: csize_t; j: csize_t; n1: csize_t; n2: csize_t): gsl_matrix_const_view {.cdecl, importc: "gsl_matrix_const_submatrix", dynlib: libgsl.}
proc gsl_matrix_const_row*(m: ptr gsl_matrix; i: csize_t): gsl_vector_const_view {. cdecl, importc: "gsl_matrix_const_row", dynlib: libgsl.}
proc gsl_matrix_const_column*(m: ptr gsl_matrix; j: csize_t): gsl_vector_const_view {. cdecl, importc: "gsl_matrix_const_column", dynlib: libgsl.}
proc gsl_matrix_const_diagonal*(m: ptr gsl_matrix): gsl_vector_const_view {.cdecl, importc: "gsl_matrix_const_diagonal", dynlib: libgsl.}
proc gsl_matrix_const_subdiagonal*(m: ptr gsl_matrix; k: csize_t): gsl_vector_const_view {. cdecl, importc: "gsl_matrix_const_subdiagonal", dynlib: libgsl.}
proc gsl_matrix_const_superdiagonal*(m: ptr gsl_matrix; k: csize_t): gsl_vector_const_view {. cdecl, importc: "gsl_matrix_const_superdiagonal", dynlib: libgsl.}
proc gsl_matrix_const_subrow*(m: ptr gsl_matrix; i: csize_t; offset: csize_t; n: csize_t): gsl_vector_const_view {. cdecl, importc: "gsl_matrix_const_subrow", dynlib: libgsl.}
proc gsl_matrix_const_subcolumn*(m: ptr gsl_matrix; j: csize_t; offset: csize_t; n: csize_t): gsl_vector_const_view {.cdecl, importc: "gsl_matrix_const_subcolumn", dynlib: libgsl.}
proc gsl_matrix_const_view_array*(base: ptr cdouble; n1: csize_t; n2: csize_t): gsl_matrix_const_view {. cdecl, importc: "gsl_matrix_const_view_array", dynlib: libgsl.}
proc gsl_matrix_const_view_array_with_tda*(base: ptr cdouble; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_const_view {.cdecl, importc: "gsl_matrix_const_view_array_with_tda", dynlib: libgsl.}
proc gsl_matrix_const_view_vector*(v: ptr gsl_vector; n1: csize_t; n2: csize_t): gsl_matrix_const_view {. cdecl, importc: "gsl_matrix_const_view_vector", dynlib: libgsl.}
proc gsl_matrix_const_view_vector_with_tda*(v: ptr gsl_vector; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_const_view {.cdecl, importc: "gsl_matrix_const_view_vector_with_tda", dynlib: libgsl.}
proc gsl_matrix_set_zero*(m: ptr gsl_matrix) {.cdecl, importc: "gsl_matrix_set_zero", dynlib: libgsl.}
proc gsl_matrix_set_identity*(m: ptr gsl_matrix) {.cdecl, importc: "gsl_matrix_set_identity", dynlib: libgsl.}
proc gsl_matrix_set_all*(m: ptr gsl_matrix; x: cdouble) {.cdecl, importc: "gsl_matrix_set_all", dynlib: libgsl.}
proc gsl_matrix_fread*(stream: ptr FILE; m: ptr gsl_matrix): cint {.cdecl, importc: "gsl_matrix_fread", dynlib: libgsl.}
proc gsl_matrix_fwrite*(stream: ptr FILE; m: ptr gsl_matrix): cint {.cdecl, importc: "gsl_matrix_fwrite", dynlib: libgsl.}
proc gsl_matrix_fscanf*(stream: ptr FILE; m: ptr gsl_matrix): cint {.cdecl, importc: "gsl_matrix_fscanf", dynlib: libgsl.}
proc gsl_matrix_fprintf*(stream: ptr FILE; m: ptr gsl_matrix; format: cstring): cint {. cdecl, importc: "gsl_matrix_fprintf", dynlib: libgsl.}
proc gsl_matrix_memcpy*(dest: ptr gsl_matrix; src: ptr gsl_matrix): cint {.cdecl, importc: "gsl_matrix_memcpy", dynlib: libgsl.}
proc gsl_matrix_swap*(m1: ptr gsl_matrix; m2: ptr gsl_matrix): cint {.cdecl, importc: "gsl_matrix_swap", dynlib: libgsl.}
proc gsl_matrix_tricpy*(uplo_src: char; copy_diag: cint; dest: ptr gsl_matrix;   src: ptr gsl_matrix): cint {.cdecl, importc: "gsl_matrix_tricpy", dynlib: libgsl.}
proc gsl_matrix_swap_rows*(m: ptr gsl_matrix; i: csize_t; j: csize_t): cint {.cdecl, importc: "gsl_matrix_swap_rows", dynlib: libgsl.}
proc gsl_matrix_swap_columns*(m: ptr gsl_matrix; i: csize_t; j: csize_t): cint {.cdecl, importc: "gsl_matrix_swap_columns", dynlib: libgsl.}
proc gsl_matrix_swap_rowcol*(m: ptr gsl_matrix; i: csize_t; j: csize_t): cint {.cdecl, importc: "gsl_matrix_swap_rowcol", dynlib: libgsl.}
proc gsl_matrix_transpose*(m: ptr gsl_matrix): cint {.cdecl, importc: "gsl_matrix_transpose", dynlib: libgsl.}
proc gsl_matrix_transpose_memcpy*(dest: ptr gsl_matrix; src: ptr gsl_matrix): cint {. cdecl, importc: "gsl_matrix_transpose_memcpy", dynlib: libgsl.}
proc gsl_matrix_transpose_tricpy*(uplo_src: char; copy_diag: cint; dest: ptr gsl_matrix; src: ptr gsl_matrix): cint {. cdecl, importc: "gsl_matrix_transpose_tricpy", dynlib: libgsl.}
proc gsl_matrix_max*(m: ptr gsl_matrix): cdouble {.cdecl, importc: "gsl_matrix_max", dynlib: libgsl.}
proc gsl_matrix_min*(m: ptr gsl_matrix): cdouble {.cdecl, importc: "gsl_matrix_min", dynlib: libgsl.}
proc gsl_matrix_minmax*(m: ptr gsl_matrix; min_out: ptr cdouble; max_out: ptr cdouble) {. cdecl, importc: "gsl_matrix_minmax", dynlib: libgsl.}
proc gsl_matrix_max_index*(m: ptr gsl_matrix; imax: ptr csize_t; jmax: ptr csize_t) {. cdecl, importc: "gsl_matrix_max_index", dynlib: libgsl.}
proc gsl_matrix_min_index*(m: ptr gsl_matrix; imin: ptr csize_t; jmin: ptr csize_t) {. cdecl, importc: "gsl_matrix_min_index", dynlib: libgsl.}
proc gsl_matrix_minmax_index*(m: ptr gsl_matrix; imin: ptr csize_t; jmin: ptr csize_t;  imax: ptr csize_t; jmax: ptr csize_t) {.cdecl, importc: "gsl_matrix_minmax_index", dynlib: libgsl.}
proc gsl_matrix_equal*(a: ptr gsl_matrix; b: ptr gsl_matrix): cint {.cdecl, importc: "gsl_matrix_equal", dynlib: libgsl.}
proc gsl_matrix_isnull*(m: ptr gsl_matrix): cint {.cdecl, importc: "gsl_matrix_isnull", dynlib: libgsl.}
proc gsl_matrix_ispos*(m: ptr gsl_matrix): cint {.cdecl, importc: "gsl_matrix_ispos", dynlib: libgsl.}
proc gsl_matrix_isneg*(m: ptr gsl_matrix): cint {.cdecl, importc: "gsl_matrix_isneg", dynlib: libgsl.}
proc gsl_matrix_isnonneg*(m: ptr gsl_matrix): cint {.cdecl, importc: "gsl_matrix_isnonneg", dynlib: libgsl.}
proc gsl_matrix_add*(a: ptr gsl_matrix; b: ptr gsl_matrix): cint {.cdecl, importc: "gsl_matrix_add", dynlib: libgsl.}
proc gsl_matrix_sub*(a: ptr gsl_matrix; b: ptr gsl_matrix): cint {.cdecl, importc: "gsl_matrix_sub", dynlib: libgsl.}
proc gsl_matrix_mul_elements*(a: ptr gsl_matrix; b: ptr gsl_matrix): cint {.cdecl, importc: "gsl_matrix_mul_elements", dynlib: libgsl.}
proc gsl_matrix_div_elements*(a: ptr gsl_matrix; b: ptr gsl_matrix): cint {.cdecl, importc: "gsl_matrix_div_elements", dynlib: libgsl.}
proc gsl_matrix_scale*(a: ptr gsl_matrix; x: cdouble): cint {.cdecl, importc: "gsl_matrix_scale", dynlib: libgsl.}
proc gsl_matrix_add_constant*(a: ptr gsl_matrix; x: cdouble): cint {.cdecl, importc: "gsl_matrix_add_constant", dynlib: libgsl.}
proc gsl_matrix_add_diagonal*(a: ptr gsl_matrix; x: cdouble): cint {.cdecl, importc: "gsl_matrix_add_diagonal", dynlib: libgsl.}
proc gsl_matrix_get_row*(v: ptr gsl_vector; m: ptr gsl_matrix; i: csize_t): cint {.cdecl, importc: "gsl_matrix_get_row", dynlib: libgsl.}
proc gsl_matrix_get_col*(v: ptr gsl_vector; m: ptr gsl_matrix; j: csize_t): cint {.cdecl, importc: "gsl_matrix_get_col", dynlib: libgsl.}
proc gsl_matrix_set_row*(m: ptr gsl_matrix; i: csize_t; v: ptr gsl_vector): cint {.cdecl, importc: "gsl_matrix_set_row", dynlib: libgsl.}
proc gsl_matrix_set_col*(m: ptr gsl_matrix; j: csize_t; v: ptr gsl_vector): cint {.cdecl, importc: "gsl_matrix_set_col", dynlib: libgsl.}
proc gsl_matrix_get*(m: ptr gsl_matrix; i: csize_t; j: csize_t): cdouble {.cdecl, importc: "gsl_matrix_get", dynlib: libgsl.}
proc gsl_matrix_set*(m: ptr gsl_matrix; i: csize_t; j: csize_t; x: cdouble) {.cdecl, importc: "gsl_matrix_set", dynlib: libgsl.}
proc gsl_matrix_ptr*(m: ptr gsl_matrix; i: csize_t; j: csize_t): ptr cdouble {.cdecl, importc: "gsl_matrix_ptr", dynlib: libgsl.}
proc gsl_matrix_const_ptr*(m: ptr gsl_matrix; i: csize_t; j: csize_t): ptr cdouble {. cdecl, importc: "gsl_matrix_const_ptr", dynlib: libgsl.}
proc gsl_wavelet_alloc*(T: ptr gsl_wavelet_type; k: csize_t): ptr gsl_wavelet {.cdecl, importc: "gsl_wavelet_alloc", dynlib: libgsl.}
proc gsl_wavelet_free*(w: ptr gsl_wavelet) {.cdecl, importc: "gsl_wavelet_free", dynlib: libgsl.}
proc gsl_wavelet_name*(w: ptr gsl_wavelet): cstring {.cdecl, importc: "gsl_wavelet_name", dynlib: libgsl.}
proc gsl_wavelet_workspace_alloc*(n: csize_t): ptr gsl_wavelet_workspace {.cdecl, importc: "gsl_wavelet_workspace_alloc", dynlib: libgsl.}
proc gsl_wavelet_workspace_free*(work: ptr gsl_wavelet_workspace) {.cdecl, importc: "gsl_wavelet_workspace_free", dynlib: libgsl.}
proc gsl_wavelet_transform*(w: ptr gsl_wavelet; data: ptr cdouble; stride: csize_t;   n: csize_t; dir: gsl_wavelet_direction;   work: ptr gsl_wavelet_workspace): cint {.cdecl, importc: "gsl_wavelet_transform", dynlib: libgsl.}
proc gsl_wavelet_transform_forward*(w: ptr gsl_wavelet; data: ptr cdouble;  stride: csize_t; n: csize_t;  work: ptr gsl_wavelet_workspace): cint {.cdecl, importc: "gsl_wavelet_transform_forward", dynlib: libgsl.}
proc gsl_wavelet_transform_inverse*(w: ptr gsl_wavelet; data: ptr cdouble;  stride: csize_t; n: csize_t;  work: ptr gsl_wavelet_workspace): cint {.cdecl, importc: "gsl_wavelet_transform_inverse", dynlib: libgsl.}
proc gsl_wavelet2d_transform*(w: ptr gsl_wavelet; data: ptr cdouble; tda: csize_t;  size1: csize_t; size2: csize_t;  dir: gsl_wavelet_direction;  work: ptr gsl_wavelet_workspace): cint {.cdecl, importc: "gsl_wavelet2d_transform", dynlib: libgsl.}
proc gsl_wavelet2d_transform_forward*(w: ptr gsl_wavelet; data: ptr cdouble;  tda: csize_t; size1: csize_t; size2: csize_t;  work: ptr gsl_wavelet_workspace): cint {.cdecl, importc: "gsl_wavelet2d_transform_forward", dynlib: libgsl.}
proc gsl_wavelet2d_transform_inverse*(w: ptr gsl_wavelet; data: ptr cdouble;  tda: csize_t; size1: csize_t; size2: csize_t;  work: ptr gsl_wavelet_workspace): cint {.cdecl, importc: "gsl_wavelet2d_transform_inverse", dynlib: libgsl.}
proc gsl_wavelet2d_nstransform*(w: ptr gsl_wavelet; data: ptr cdouble; tda: csize_t; size1: csize_t; size2: csize_t; dir: gsl_wavelet_direction; work: ptr gsl_wavelet_workspace): cint {.cdecl, importc: "gsl_wavelet2d_nstransform", dynlib: libgsl.}
proc gsl_wavelet2d_nstransform_forward*(w: ptr gsl_wavelet; data: ptr cdouble;    tda: csize_t; size1: csize_t; size2: csize_t;    work: ptr gsl_wavelet_workspace): cint {. cdecl, importc: "gsl_wavelet2d_nstransform_forward", dynlib: libgsl.}
proc gsl_wavelet2d_nstransform_inverse*(w: ptr gsl_wavelet; data: ptr cdouble;    tda: csize_t; size1: csize_t; size2: csize_t;    work: ptr gsl_wavelet_workspace): cint {. cdecl, importc: "gsl_wavelet2d_nstransform_inverse", dynlib: libgsl.}
proc gsl_wavelet2d_transform_matrix*(w: ptr gsl_wavelet; a: ptr gsl_matrix; dir: gsl_wavelet_direction; work: ptr gsl_wavelet_workspace): cint {.cdecl, importc: "gsl_wavelet2d_transform_matrix", dynlib: libgsl.}
proc gsl_wavelet2d_transform_matrix_forward*(w: ptr gsl_wavelet; a: ptr gsl_matrix; work: ptr gsl_wavelet_workspace): cint {.cdecl, importc: "gsl_wavelet2d_transform_matrix_forward", dynlib: libgsl.}
proc gsl_wavelet2d_transform_matrix_inverse*(w: ptr gsl_wavelet; a: ptr gsl_matrix; work: ptr gsl_wavelet_workspace): cint {.cdecl, importc: "gsl_wavelet2d_transform_matrix_inverse", dynlib: libgsl.}
proc gsl_wavelet2d_nstransform_matrix*(w: ptr gsl_wavelet; a: ptr gsl_matrix;   dir: gsl_wavelet_direction;   work: ptr gsl_wavelet_workspace): cint {. cdecl, importc: "gsl_wavelet2d_nstransform_matrix", dynlib: libgsl.}
proc gsl_wavelet2d_nstransform_matrix_forward*(w: ptr gsl_wavelet; a: ptr gsl_matrix; work: ptr gsl_wavelet_workspace): cint {.cdecl, importc: "gsl_wavelet2d_nstransform_matrix_forward", dynlib: libgsl.}
proc gsl_wavelet2d_nstransform_matrix_inverse*(w: ptr gsl_wavelet; a: ptr gsl_matrix; work: ptr gsl_wavelet_workspace): cint {.cdecl, importc: "gsl_wavelet2d_nstransform_matrix_inverse", dynlib: libgsl.}

var gsl_check_range* {.importc: "gsl_check_range", dynlib: libgsl.}: cint

var gsl_wavelet_daubechies* {.importc: "gsl_wavelet_daubechies", dynlib: libgsl.}: ptr gsl_wavelet_type

var gsl_wavelet_daubechies_centered* {.importc: "gsl_wavelet_daubechies_centered",  dynlib: libgsl.}: ptr gsl_wavelet_type

var gsl_wavelet_haar* {.importc: "gsl_wavelet_haar", dynlib: libgsl.}: ptr gsl_wavelet_type

var gsl_wavelet_haar_centered* {.importc: "gsl_wavelet_haar_centered", dynlib: libgsl.}: ptr gsl_wavelet_type

var gsl_wavelet_bspline* {.importc: "gsl_wavelet_bspline", dynlib: libgsl.}: ptr gsl_wavelet_type

var gsl_wavelet_bspline_centered* {.importc: "gsl_wavelet_bspline_centered", dynlib: libgsl.}: ptr gsl_wavelet_type

