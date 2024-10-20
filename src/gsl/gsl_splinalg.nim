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

  gsl_matrix_complex_long_double* {.bycopy.} = object
    size1*: csize_t
    size2*: csize_t
    tda*: csize_t
    data*: ptr clongdouble
    `block`*: ptr gsl_block_complex_long_double
    owner*: cint

  gsl_matrix_complex_long_double_view* {.bycopy.} = object
    matrix*: gsl_matrix_complex_long_double

  gsl_matrix_complex_long_double_const_view* {.bycopy.} = object
    matrix*: gsl_matrix_complex_long_double

  gsl_matrix_complex* {.bycopy.} = object
    size1*: csize_t
    size2*: csize_t
    tda*: csize_t
    data*: ptr cdouble
    `block`*: ptr gsl_block_complex
    owner*: cint

  gsl_matrix_complex_view* {.bycopy.} = object
    matrix*: gsl_matrix_complex

  gsl_matrix_complex_const_view* {.bycopy.} = object
    matrix*: gsl_matrix_complex

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

  gsl_matrix_long_double* {.bycopy.} = object
    size1*: csize_t
    size2*: csize_t
    tda*: csize_t
    data*: ptr clongdouble
    `block`*: ptr gsl_block_long_double
    owner*: cint

  gsl_matrix_long_double_view* {.bycopy.} = object
    matrix*: gsl_matrix_long_double

  gsl_matrix_long_double_const_view* {.bycopy.} = object
    matrix*: gsl_matrix_long_double

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

  gsl_matrix_float* {.bycopy.} = object
    size1*: csize_t
    size2*: csize_t
    tda*: csize_t
    data*: ptr cfloat
    `block`*: ptr gsl_block_float
    owner*: cint

  gsl_matrix_float_view* {.bycopy.} = object
    matrix*: gsl_matrix_float

  gsl_matrix_float_const_view* {.bycopy.} = object
    matrix*: gsl_matrix_float

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

  gsl_matrix_long* {.bycopy.} = object
    size1*: csize_t
    size2*: csize_t
    tda*: csize_t
    data*: ptr clong
    `block`*: ptr gsl_block_long
    owner*: cint

  gsl_matrix_long_view* {.bycopy.} = object
    matrix*: gsl_matrix_long

  gsl_matrix_long_const_view* {.bycopy.} = object
    matrix*: gsl_matrix_long

  gsl_matrix_uint* {.bycopy.} = object
    size1*: csize_t
    size2*: csize_t
    tda*: csize_t
    data*: ptr cuint
    `block`*: ptr gsl_block_uint
    owner*: cint

  gsl_matrix_uint_view* {.bycopy.} = object
    matrix*: gsl_matrix_uint

  gsl_matrix_uint_const_view* {.bycopy.} = object
    matrix*: gsl_matrix_uint

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

  gsl_matrix_ushort* {.bycopy.} = object
    size1*: csize_t
    size2*: csize_t
    tda*: csize_t
    data*: ptr cushort
    `block`*: ptr gsl_block_ushort
    owner*: cint

  gsl_matrix_ushort_view* {.bycopy.} = object
    matrix*: gsl_matrix_ushort

  gsl_matrix_ushort_const_view* {.bycopy.} = object
    matrix*: gsl_matrix_ushort

  gsl_matrix_short* {.bycopy.} = object
    size1*: csize_t
    size2*: csize_t
    tda*: csize_t
    data*: ptr cshort
    `block`*: ptr gsl_block_short
    owner*: cint

  gsl_matrix_short_view* {.bycopy.} = object
    matrix*: gsl_matrix_short

  gsl_matrix_short_const_view* {.bycopy.} = object
    matrix*: gsl_matrix_short

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

  gsl_matrix_char* {.bycopy.} = object
    size1*: csize_t
    size2*: csize_t
    tda*: csize_t
    data*: cstring
    `block`*: ptr gsl_block_char
    owner*: cint

  gsl_matrix_char_view* {.bycopy.} = object
    matrix*: gsl_matrix_char

  gsl_matrix_char_const_view* {.bycopy.} = object
    matrix*: gsl_matrix_char

  INNER_C_UNION_gsl_splinalg_expanded_2438* {.bycopy.} = object {.union.}
    work*: pointer
    work_sze*: ptr csize_t
    work_dbl*: ptr cdouble

  gsl_spmatrix_tree* {.bycopy.} = object
    tree*: pointer
    node_array*: pointer
    n*: csize_t

  gsl_spmatrix* {.bycopy.} = object
    size1*: csize_t
    size2*: csize_t
    i*: ptr csize_t
    data*: ptr cdouble
    p*: ptr csize_t
    nzmax*: csize_t
    nz*: csize_t
    tree_data*: ptr gsl_spmatrix_tree
    ano_gsl_splinalg_expanded_2441*: INNER_C_UNION_gsl_splinalg_expanded_2438
    sptype*: csize_t

  gsl_mode_t* = cuint
  gsl_permutation_struct* {.bycopy.} = object
    size*: csize_t
    data*: ptr csize_t

  gsl_permutation* = gsl_permutation_struct

  CBLAS_ORDER* {.size: sizeof(cint).} = enum
    CblasRowMajor = 101, CblasColMajor = 102

  CBLAS_TRANSPOSE* {.size: sizeof(cint).} = enum
    CblasNoTrans = 111, CblasTrans = 112, CblasConjTrans = 113

  CBLAS_UPLO* {.size: sizeof(cint).} = enum
    CblasUpper = 121, CblasLower = 122

  CBLAS_DIAG* {.size: sizeof(cint).} = enum
    CblasNonUnit = 131, CblasUnit = 132

  CBLAS_SIDE* {.size: sizeof(cint).} = enum
    CblasLeft = 141, CblasRight = 142

  CBLAS_INDEX_t* = csize_t
  CBLAS_ORDER_t* = CBLAS_ORDER
  CBLAS_TRANSPOSE_t* = CBLAS_TRANSPOSE
  CBLAS_UPLO_t* = CBLAS_UPLO
  CBLAS_DIAG_t* = CBLAS_DIAG
  CBLAS_SIDE_t* = CBLAS_SIDE

  gsl_linalg_matrix_mod_t* {.size: sizeof(cint).} = enum
    GSL_LINALG_MOD_NONE = 0, GSL_LINALG_MOD_TRANSPOSE = 1, GSL_LINALG_MOD_CONJUGATE = 2

  gsl_splinalg_itersolve_type* {.bycopy.} = object
    name*: cstring
    alloc*: proc (n: csize_t; m: csize_t): pointer {.cdecl.}
    iterate*: proc (A: ptr gsl_spmatrix; b: ptr gsl_vector; tol: cdouble; x: ptr gsl_vector; a5: pointer): cint {.cdecl.}
    normr*: proc (a1: pointer): cdouble {.cdecl.}
    free*: proc (a1: pointer) {.cdecl.}

  gsl_splinalg_itersolve* {.bycopy.} = object
    `type`*: ptr gsl_splinalg_itersolve_type
    normr*: cdouble
    state*: pointer

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
proc gsl_matrix_complex_long_double_alloc*(n1: csize_t; n2: csize_t): ptr gsl_matrix_complex_long_double {. cdecl, importc: "gsl_matrix_complex_long_double_alloc", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_calloc*(n1: csize_t; n2: csize_t): ptr gsl_matrix_complex_long_double {. cdecl, importc: "gsl_matrix_complex_long_double_calloc", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_alloc_from_block*(b: ptr gsl_block_complex_long_double; offset: csize_t; n1: csize_t; n2: csize_t; d2: csize_t): ptr gsl_matrix_complex_long_double {.cdecl, importc: "gsl_matrix_complex_long_double_alloc_from_block", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_alloc_from_matrix*(b: ptr gsl_matrix_complex_long_double; k1: csize_t; k2: csize_t; n1: csize_t; n2: csize_t): ptr gsl_matrix_complex_long_double {.cdecl, importc: "gsl_matrix_complex_long_double_alloc_from_matrix", dynlib: libgsl.}
proc gsl_vector_complex_long_double_alloc_row_from_matrix*(m: ptr gsl_matrix_complex_long_double; i: csize_t): ptr gsl_vector_complex_long_double {. cdecl, importc: "gsl_vector_complex_long_double_alloc_row_from_matrix", dynlib: libgsl.}
proc gsl_vector_complex_long_double_alloc_col_from_matrix*(m: ptr gsl_matrix_complex_long_double; j: csize_t): ptr gsl_vector_complex_long_double {. cdecl, importc: "gsl_vector_complex_long_double_alloc_col_from_matrix", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_free*(m: ptr gsl_matrix_complex_long_double) {. cdecl, importc: "gsl_matrix_complex_long_double_free", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_submatrix*(m: ptr gsl_matrix_complex_long_double; i: csize_t; j: csize_t; n1: csize_t; n2: csize_t): gsl_matrix_complex_long_double_view {.cdecl, importc: "gsl_matrix_complex_long_double_submatrix", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_row*(m: ptr gsl_matrix_complex_long_double; i: csize_t): gsl_vector_complex_long_double_view {. cdecl, importc: "gsl_matrix_complex_long_double_row", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_column*(m: ptr gsl_matrix_complex_long_double; j: csize_t): gsl_vector_complex_long_double_view {. cdecl, importc: "gsl_matrix_complex_long_double_column", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_diagonal*(m: ptr gsl_matrix_complex_long_double): gsl_vector_complex_long_double_view {. cdecl, importc: "gsl_matrix_complex_long_double_diagonal", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_subdiagonal*(m: ptr gsl_matrix_complex_long_double; k: csize_t): gsl_vector_complex_long_double_view {. cdecl, importc: "gsl_matrix_complex_long_double_subdiagonal", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_superdiagonal*(m: ptr gsl_matrix_complex_long_double; k: csize_t): gsl_vector_complex_long_double_view {. cdecl, importc: "gsl_matrix_complex_long_double_superdiagonal", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_subrow*(m: ptr gsl_matrix_complex_long_double; i: csize_t; offset: csize_t; n: csize_t): gsl_vector_complex_long_double_view {. cdecl, importc: "gsl_matrix_complex_long_double_subrow", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_subcolumn*(m: ptr gsl_matrix_complex_long_double; j: csize_t; offset: csize_t; n: csize_t): gsl_vector_complex_long_double_view {. cdecl, importc: "gsl_matrix_complex_long_double_subcolumn", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_view_array*(base: ptr clongdouble; n1: csize_t; n2: csize_t): gsl_matrix_complex_long_double_view {.cdecl, importc: "gsl_matrix_complex_long_double_view_array", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_view_array_with_tda*(base: ptr clongdouble; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_complex_long_double_view {. cdecl, importc: "gsl_matrix_complex_long_double_view_array_with_tda", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_view_vector*(v: ptr gsl_vector_complex_long_double; n1: csize_t; n2: csize_t): gsl_matrix_complex_long_double_view {. cdecl, importc: "gsl_matrix_complex_long_double_view_vector", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_view_vector_with_tda*(v: ptr gsl_vector_complex_long_double; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_complex_long_double_view {. cdecl, importc: "gsl_matrix_complex_long_double_view_vector_with_tda", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_const_submatrix*(m: ptr gsl_matrix_complex_long_double; i: csize_t; j: csize_t; n1: csize_t; n2: csize_t): gsl_matrix_complex_long_double_const_view {.cdecl, importc: "gsl_matrix_complex_long_double_const_submatrix", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_const_row*(m: ptr gsl_matrix_complex_long_double; i: csize_t): gsl_vector_complex_long_double_const_view {. cdecl, importc: "gsl_matrix_complex_long_double_const_row", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_const_column*(m: ptr gsl_matrix_complex_long_double; j: csize_t): gsl_vector_complex_long_double_const_view {. cdecl, importc: "gsl_matrix_complex_long_double_const_column", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_const_diagonal*(m: ptr gsl_matrix_complex_long_double): gsl_vector_complex_long_double_const_view {. cdecl, importc: "gsl_matrix_complex_long_double_const_diagonal", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_const_subdiagonal*(m: ptr gsl_matrix_complex_long_double; k: csize_t): gsl_vector_complex_long_double_const_view {. cdecl, importc: "gsl_matrix_complex_long_double_const_subdiagonal", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_const_superdiagonal*(m: ptr gsl_matrix_complex_long_double; k: csize_t): gsl_vector_complex_long_double_const_view {. cdecl, importc: "gsl_matrix_complex_long_double_const_superdiagonal", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_const_subrow*(m: ptr gsl_matrix_complex_long_double; i: csize_t; offset: csize_t; n: csize_t): gsl_vector_complex_long_double_const_view {. cdecl, importc: "gsl_matrix_complex_long_double_const_subrow", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_const_subcolumn*(m: ptr gsl_matrix_complex_long_double; j: csize_t; offset: csize_t; n: csize_t): gsl_vector_complex_long_double_const_view {. cdecl, importc: "gsl_matrix_complex_long_double_const_subcolumn", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_const_view_array*(base: ptr clongdouble; n1: csize_t; n2: csize_t): gsl_matrix_complex_long_double_const_view {.cdecl, importc: "gsl_matrix_complex_long_double_const_view_array", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_const_view_array_with_tda*(base: ptr clongdouble; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_complex_long_double_const_view {. cdecl, importc: "gsl_matrix_complex_long_double_const_view_array_with_tda", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_const_view_vector*(v: ptr gsl_vector_complex_long_double; n1: csize_t; n2: csize_t): gsl_matrix_complex_long_double_const_view {. cdecl, importc: "gsl_matrix_complex_long_double_const_view_vector", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_const_view_vector_with_tda*(v: ptr gsl_vector_complex_long_double; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_complex_long_double_const_view {. cdecl, importc: "gsl_matrix_complex_long_double_const_view_vector_with_tda", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_set_zero*(m: ptr gsl_matrix_complex_long_double) {.cdecl, importc: "gsl_matrix_complex_long_double_set_zero", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_set_identity*(m: ptr gsl_matrix_complex_long_double) {.cdecl, importc: "gsl_matrix_complex_long_double_set_identity", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_set_all*(m: ptr gsl_matrix_complex_long_double; x: gsl_complex_long_double) {.cdecl, importc: "gsl_matrix_complex_long_double_set_all", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_fread*(stream: ptr FILE; m: ptr gsl_matrix_complex_long_double): cint {.cdecl, importc: "gsl_matrix_complex_long_double_fread", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_fwrite*(stream: ptr FILE; m: ptr gsl_matrix_complex_long_double): cint {.cdecl, importc: "gsl_matrix_complex_long_double_fwrite", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_fscanf*(stream: ptr FILE; m: ptr gsl_matrix_complex_long_double): cint {.cdecl, importc: "gsl_matrix_complex_long_double_fscanf", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_fprintf*(stream: ptr FILE; m: ptr gsl_matrix_complex_long_double; format: cstring): cint {.cdecl, importc: "gsl_matrix_complex_long_double_fprintf", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_memcpy*(dest: ptr gsl_matrix_complex_long_double; src: ptr gsl_matrix_complex_long_double): cint {.cdecl, importc: "gsl_matrix_complex_long_double_memcpy", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_swap*(m1: ptr gsl_matrix_complex_long_double; m2: ptr gsl_matrix_complex_long_double): cint {.cdecl, importc: "gsl_matrix_complex_long_double_swap", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_tricpy*(uplo_src: char; copy_diag: cint; dest: ptr gsl_matrix_complex_long_double; src: ptr gsl_matrix_complex_long_double): cint {.cdecl, importc: "gsl_matrix_complex_long_double_tricpy", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_swap_rows*(m: ptr gsl_matrix_complex_long_double; i: csize_t; j: csize_t): cint {.cdecl, importc: "gsl_matrix_complex_long_double_swap_rows", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_swap_columns*(m: ptr gsl_matrix_complex_long_double; i: csize_t; j: csize_t): cint {.cdecl, importc: "gsl_matrix_complex_long_double_swap_columns", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_swap_rowcol*(m: ptr gsl_matrix_complex_long_double; i: csize_t; j: csize_t): cint {.cdecl, importc: "gsl_matrix_complex_long_double_swap_rowcol", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_transpose*(m: ptr gsl_matrix_complex_long_double): cint {.cdecl, importc: "gsl_matrix_complex_long_double_transpose", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_transpose_memcpy*(dest: ptr gsl_matrix_complex_long_double; src: ptr gsl_matrix_complex_long_double): cint {.cdecl, importc: "gsl_matrix_complex_long_double_transpose_memcpy", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_transpose_tricpy*(uplo_src: char; copy_diag: cint; dest: ptr gsl_matrix_complex_long_double; src: ptr gsl_matrix_complex_long_double): cint {.cdecl, importc: "gsl_matrix_complex_long_double_transpose_tricpy", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_equal*(a: ptr gsl_matrix_complex_long_double; b: ptr gsl_matrix_complex_long_double): cint {.cdecl, importc: "gsl_matrix_complex_long_double_equal", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_isnull*(m: ptr gsl_matrix_complex_long_double): cint {. cdecl, importc: "gsl_matrix_complex_long_double_isnull", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_ispos*(m: ptr gsl_matrix_complex_long_double): cint {. cdecl, importc: "gsl_matrix_complex_long_double_ispos", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_isneg*(m: ptr gsl_matrix_complex_long_double): cint {. cdecl, importc: "gsl_matrix_complex_long_double_isneg", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_isnonneg*(m: ptr gsl_matrix_complex_long_double): cint {.cdecl, importc: "gsl_matrix_complex_long_double_isnonneg", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_add*(a: ptr gsl_matrix_complex_long_double; b: ptr gsl_matrix_complex_long_double): cint {. cdecl, importc: "gsl_matrix_complex_long_double_add", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_sub*(a: ptr gsl_matrix_complex_long_double; b: ptr gsl_matrix_complex_long_double): cint {. cdecl, importc: "gsl_matrix_complex_long_double_sub", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_mul_elements*(a: ptr gsl_matrix_complex_long_double; b: ptr gsl_matrix_complex_long_double): cint {. cdecl, importc: "gsl_matrix_complex_long_double_mul_elements", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_div_elements*(a: ptr gsl_matrix_complex_long_double; b: ptr gsl_matrix_complex_long_double): cint {. cdecl, importc: "gsl_matrix_complex_long_double_div_elements", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_scale*(a: ptr gsl_matrix_complex_long_double; x: gsl_complex_long_double): cint {.cdecl, importc: "gsl_matrix_complex_long_double_scale",  dynlib: libgsl.}
proc gsl_matrix_complex_long_double_add_constant*(a: ptr gsl_matrix_complex_long_double; x: gsl_complex_long_double): cint {.cdecl, importc: "gsl_matrix_complex_long_double_add_constant", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_add_diagonal*(a: ptr gsl_matrix_complex_long_double; x: gsl_complex_long_double): cint {.cdecl, importc: "gsl_matrix_complex_long_double_add_diagonal", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_get_row*(v: ptr gsl_vector_complex_long_double; m: ptr gsl_matrix_complex_long_double; i: csize_t): cint {.cdecl, importc: "gsl_matrix_complex_long_double_get_row", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_get_col*(v: ptr gsl_vector_complex_long_double; m: ptr gsl_matrix_complex_long_double; j: csize_t): cint {.cdecl, importc: "gsl_matrix_complex_long_double_get_col", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_set_row*(m: ptr gsl_matrix_complex_long_double; i: csize_t; v: ptr gsl_vector_complex_long_double): cint {.cdecl, importc: "gsl_matrix_complex_long_double_set_row", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_set_col*(m: ptr gsl_matrix_complex_long_double; j: csize_t; v: ptr gsl_vector_complex_long_double): cint {.cdecl, importc: "gsl_matrix_complex_long_double_set_col", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_get*(m: ptr gsl_matrix_complex_long_double; i: csize_t; j: csize_t): gsl_complex_long_double {. cdecl, importc: "gsl_matrix_complex_long_double_get", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_set*(m: ptr gsl_matrix_complex_long_double; i: csize_t; j: csize_t; x: gsl_complex_long_double) {.cdecl, importc: "gsl_matrix_complex_long_double_set", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_ptr*(m: ptr gsl_matrix_complex_long_double; i: csize_t; j: csize_t): ptr gsl_complex_long_double {. cdecl, importc: "gsl_matrix_complex_long_double_ptr", dynlib: libgsl.}
proc gsl_matrix_complex_long_double_const_ptr*(m: ptr gsl_matrix_complex_long_double; i: csize_t; j: csize_t): ptr gsl_complex_long_double {. cdecl, importc: "gsl_matrix_complex_long_double_const_ptr", dynlib: libgsl.}
proc gsl_matrix_complex_alloc*(n1: csize_t; n2: csize_t): ptr gsl_matrix_complex {. cdecl, importc: "gsl_matrix_complex_alloc", dynlib: libgsl.}
proc gsl_matrix_complex_calloc*(n1: csize_t; n2: csize_t): ptr gsl_matrix_complex {. cdecl, importc: "gsl_matrix_complex_calloc", dynlib: libgsl.}
proc gsl_matrix_complex_alloc_from_block*(b: ptr gsl_block_complex; offset: csize_t; n1: csize_t; n2: csize_t; d2: csize_t): ptr gsl_matrix_complex {.cdecl, importc: "gsl_matrix_complex_alloc_from_block", dynlib: libgsl.}
proc gsl_matrix_complex_alloc_from_matrix*(b: ptr gsl_matrix_complex; k1: csize_t; k2: csize_t; n1: csize_t; n2: csize_t): ptr gsl_matrix_complex {.cdecl, importc: "gsl_matrix_complex_alloc_from_matrix", dynlib: libgsl.}
proc gsl_vector_complex_alloc_row_from_matrix*(m: ptr gsl_matrix_complex; i: csize_t): ptr gsl_vector_complex {. cdecl, importc: "gsl_vector_complex_alloc_row_from_matrix", dynlib: libgsl.}
proc gsl_vector_complex_alloc_col_from_matrix*(m: ptr gsl_matrix_complex; j: csize_t): ptr gsl_vector_complex {. cdecl, importc: "gsl_vector_complex_alloc_col_from_matrix", dynlib: libgsl.}
proc gsl_matrix_complex_free*(m: ptr gsl_matrix_complex) {.cdecl, importc: "gsl_matrix_complex_free", dynlib: libgsl.}
proc gsl_matrix_complex_submatrix*(m: ptr gsl_matrix_complex; i: csize_t; j: csize_t; n1: csize_t; n2: csize_t): gsl_matrix_complex_view {. cdecl, importc: "gsl_matrix_complex_submatrix", dynlib: libgsl.}
proc gsl_matrix_complex_row*(m: ptr gsl_matrix_complex; i: csize_t): gsl_vector_complex_view {. cdecl, importc: "gsl_matrix_complex_row", dynlib: libgsl.}
proc gsl_matrix_complex_column*(m: ptr gsl_matrix_complex; j: csize_t): gsl_vector_complex_view {. cdecl, importc: "gsl_matrix_complex_column", dynlib: libgsl.}
proc gsl_matrix_complex_diagonal*(m: ptr gsl_matrix_complex): gsl_vector_complex_view {. cdecl, importc: "gsl_matrix_complex_diagonal", dynlib: libgsl.}
proc gsl_matrix_complex_subdiagonal*(m: ptr gsl_matrix_complex; k: csize_t): gsl_vector_complex_view {. cdecl, importc: "gsl_matrix_complex_subdiagonal", dynlib: libgsl.}
proc gsl_matrix_complex_superdiagonal*(m: ptr gsl_matrix_complex; k: csize_t): gsl_vector_complex_view {. cdecl, importc: "gsl_matrix_complex_superdiagonal", dynlib: libgsl.}
proc gsl_matrix_complex_subrow*(m: ptr gsl_matrix_complex; i: csize_t; offset: csize_t; n: csize_t): gsl_vector_complex_view {. cdecl, importc: "gsl_matrix_complex_subrow", dynlib: libgsl.}
proc gsl_matrix_complex_subcolumn*(m: ptr gsl_matrix_complex; j: csize_t; offset: csize_t; n: csize_t): gsl_vector_complex_view {. cdecl, importc: "gsl_matrix_complex_subcolumn", dynlib: libgsl.}
proc gsl_matrix_complex_view_array*(base: ptr cdouble; n1: csize_t; n2: csize_t): gsl_matrix_complex_view {. cdecl, importc: "gsl_matrix_complex_view_array", dynlib: libgsl.}
proc gsl_matrix_complex_view_array_with_tda*(base: ptr cdouble; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_complex_view {.cdecl, importc: "gsl_matrix_complex_view_array_with_tda", dynlib: libgsl.}
proc gsl_matrix_complex_view_vector*(v: ptr gsl_vector_complex; n1: csize_t; n2: csize_t): gsl_matrix_complex_view {.cdecl, importc: "gsl_matrix_complex_view_vector", dynlib: libgsl.}
proc gsl_matrix_complex_view_vector_with_tda*(v: ptr gsl_vector_complex; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_complex_view {.cdecl, importc: "gsl_matrix_complex_view_vector_with_tda", dynlib: libgsl.}
proc gsl_matrix_complex_const_submatrix*(m: ptr gsl_matrix_complex; i: csize_t; j: csize_t; n1: csize_t; n2: csize_t): gsl_matrix_complex_const_view {. cdecl, importc: "gsl_matrix_complex_const_submatrix", dynlib: libgsl.}
proc gsl_matrix_complex_const_row*(m: ptr gsl_matrix_complex; i: csize_t): gsl_vector_complex_const_view {. cdecl, importc: "gsl_matrix_complex_const_row", dynlib: libgsl.}
proc gsl_matrix_complex_const_column*(m: ptr gsl_matrix_complex; j: csize_t): gsl_vector_complex_const_view {. cdecl, importc: "gsl_matrix_complex_const_column", dynlib: libgsl.}
proc gsl_matrix_complex_const_diagonal*(m: ptr gsl_matrix_complex): gsl_vector_complex_const_view {. cdecl, importc: "gsl_matrix_complex_const_diagonal", dynlib: libgsl.}
proc gsl_matrix_complex_const_subdiagonal*(m: ptr gsl_matrix_complex; k: csize_t): gsl_vector_complex_const_view {. cdecl, importc: "gsl_matrix_complex_const_subdiagonal", dynlib: libgsl.}
proc gsl_matrix_complex_const_superdiagonal*(m: ptr gsl_matrix_complex; k: csize_t): gsl_vector_complex_const_view {. cdecl, importc: "gsl_matrix_complex_const_superdiagonal", dynlib: libgsl.}
proc gsl_matrix_complex_const_subrow*(m: ptr gsl_matrix_complex; i: csize_t;  offset: csize_t; n: csize_t): gsl_vector_complex_const_view {. cdecl, importc: "gsl_matrix_complex_const_subrow", dynlib: libgsl.}
proc gsl_matrix_complex_const_subcolumn*(m: ptr gsl_matrix_complex; j: csize_t; offset: csize_t; n: csize_t): gsl_vector_complex_const_view {. cdecl, importc: "gsl_matrix_complex_const_subcolumn", dynlib: libgsl.}
proc gsl_matrix_complex_const_view_array*(base: ptr cdouble; n1: csize_t; n2: csize_t): gsl_matrix_complex_const_view {. cdecl, importc: "gsl_matrix_complex_const_view_array", dynlib: libgsl.}
proc gsl_matrix_complex_const_view_array_with_tda*(base: ptr cdouble; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_complex_const_view {.cdecl, importc: "gsl_matrix_complex_const_view_array_with_tda", dynlib: libgsl.}
proc gsl_matrix_complex_const_view_vector*(v: ptr gsl_vector_complex; n1: csize_t; n2: csize_t): gsl_matrix_complex_const_view {.cdecl, importc: "gsl_matrix_complex_const_view_vector", dynlib: libgsl.}
proc gsl_matrix_complex_const_view_vector_with_tda*(v: ptr gsl_vector_complex; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_complex_const_view {.cdecl, importc: "gsl_matrix_complex_const_view_vector_with_tda", dynlib: libgsl.}
proc gsl_matrix_complex_set_zero*(m: ptr gsl_matrix_complex) {.cdecl, importc: "gsl_matrix_complex_set_zero", dynlib: libgsl.}
proc gsl_matrix_complex_set_identity*(m: ptr gsl_matrix_complex) {.cdecl, importc: "gsl_matrix_complex_set_identity", dynlib: libgsl.}
proc gsl_matrix_complex_set_all*(m: ptr gsl_matrix_complex; x: gsl_complex) {.cdecl, importc: "gsl_matrix_complex_set_all", dynlib: libgsl.}
proc gsl_matrix_complex_fread*(stream: ptr FILE; m: ptr gsl_matrix_complex): cint {. cdecl, importc: "gsl_matrix_complex_fread", dynlib: libgsl.}
proc gsl_matrix_complex_fwrite*(stream: ptr FILE; m: ptr gsl_matrix_complex): cint {. cdecl, importc: "gsl_matrix_complex_fwrite", dynlib: libgsl.}
proc gsl_matrix_complex_fscanf*(stream: ptr FILE; m: ptr gsl_matrix_complex): cint {. cdecl, importc: "gsl_matrix_complex_fscanf", dynlib: libgsl.}
proc gsl_matrix_complex_fprintf*(stream: ptr FILE; m: ptr gsl_matrix_complex; format: cstring): cint {.cdecl, importc: "gsl_matrix_complex_fprintf", dynlib: libgsl.}
proc gsl_matrix_complex_memcpy*(dest: ptr gsl_matrix_complex; src: ptr gsl_matrix_complex): cint {.cdecl, importc: "gsl_matrix_complex_memcpy", dynlib: libgsl.}
proc gsl_matrix_complex_swap*(m1: ptr gsl_matrix_complex; m2: ptr gsl_matrix_complex): cint {. cdecl, importc: "gsl_matrix_complex_swap", dynlib: libgsl.}
proc gsl_matrix_complex_tricpy*(uplo_src: char; copy_diag: cint; dest: ptr gsl_matrix_complex; src: ptr gsl_matrix_complex): cint {.cdecl, importc: "gsl_matrix_complex_tricpy", dynlib: libgsl.}
proc gsl_matrix_complex_swap_rows*(m: ptr gsl_matrix_complex; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_matrix_complex_swap_rows", dynlib: libgsl.}
proc gsl_matrix_complex_swap_columns*(m: ptr gsl_matrix_complex; i: csize_t;  j: csize_t): cint {.cdecl, importc: "gsl_matrix_complex_swap_columns", dynlib: libgsl.}
proc gsl_matrix_complex_swap_rowcol*(m: ptr gsl_matrix_complex; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_matrix_complex_swap_rowcol", dynlib: libgsl.}
proc gsl_matrix_complex_transpose*(m: ptr gsl_matrix_complex): cint {.cdecl, importc: "gsl_matrix_complex_transpose", dynlib: libgsl.}
proc gsl_matrix_complex_transpose_memcpy*(dest: ptr gsl_matrix_complex; src: ptr gsl_matrix_complex): cint {.cdecl, importc: "gsl_matrix_complex_transpose_memcpy",  dynlib: libgsl.}
proc gsl_matrix_complex_transpose_tricpy*(uplo_src: char; copy_diag: cint; dest: ptr gsl_matrix_complex; src: ptr gsl_matrix_complex): cint {.cdecl, importc: "gsl_matrix_complex_transpose_tricpy", dynlib: libgsl.}
proc gsl_matrix_complex_equal*(a: ptr gsl_matrix_complex; b: ptr gsl_matrix_complex): cint {. cdecl, importc: "gsl_matrix_complex_equal", dynlib: libgsl.}
proc gsl_matrix_complex_isnull*(m: ptr gsl_matrix_complex): cint {.cdecl, importc: "gsl_matrix_complex_isnull", dynlib: libgsl.}
proc gsl_matrix_complex_ispos*(m: ptr gsl_matrix_complex): cint {.cdecl, importc: "gsl_matrix_complex_ispos", dynlib: libgsl.}
proc gsl_matrix_complex_isneg*(m: ptr gsl_matrix_complex): cint {.cdecl, importc: "gsl_matrix_complex_isneg", dynlib: libgsl.}
proc gsl_matrix_complex_isnonneg*(m: ptr gsl_matrix_complex): cint {.cdecl, importc: "gsl_matrix_complex_isnonneg", dynlib: libgsl.}
proc gsl_matrix_complex_add*(a: ptr gsl_matrix_complex; b: ptr gsl_matrix_complex): cint {. cdecl, importc: "gsl_matrix_complex_add", dynlib: libgsl.}
proc gsl_matrix_complex_sub*(a: ptr gsl_matrix_complex; b: ptr gsl_matrix_complex): cint {. cdecl, importc: "gsl_matrix_complex_sub", dynlib: libgsl.}
proc gsl_matrix_complex_mul_elements*(a: ptr gsl_matrix_complex;  b: ptr gsl_matrix_complex): cint {.cdecl, importc: "gsl_matrix_complex_mul_elements", dynlib: libgsl.}
proc gsl_matrix_complex_div_elements*(a: ptr gsl_matrix_complex;  b: ptr gsl_matrix_complex): cint {.cdecl, importc: "gsl_matrix_complex_div_elements", dynlib: libgsl.}
proc gsl_matrix_complex_scale*(a: ptr gsl_matrix_complex; x: gsl_complex): cint {. cdecl, importc: "gsl_matrix_complex_scale", dynlib: libgsl.}
proc gsl_matrix_complex_add_constant*(a: ptr gsl_matrix_complex; x: gsl_complex): cint {. cdecl, importc: "gsl_matrix_complex_add_constant", dynlib: libgsl.}
proc gsl_matrix_complex_add_diagonal*(a: ptr gsl_matrix_complex; x: gsl_complex): cint {. cdecl, importc: "gsl_matrix_complex_add_diagonal", dynlib: libgsl.}
proc gsl_matrix_complex_get_row*(v: ptr gsl_vector_complex; m: ptr gsl_matrix_complex; i: csize_t): cint {.cdecl, importc: "gsl_matrix_complex_get_row", dynlib: libgsl.}
proc gsl_matrix_complex_get_col*(v: ptr gsl_vector_complex; m: ptr gsl_matrix_complex; j: csize_t): cint {.cdecl, importc: "gsl_matrix_complex_get_col", dynlib: libgsl.}
proc gsl_matrix_complex_set_row*(m: ptr gsl_matrix_complex; i: csize_t; v: ptr gsl_vector_complex): cint {.cdecl, importc: "gsl_matrix_complex_set_row", dynlib: libgsl.}
proc gsl_matrix_complex_set_col*(m: ptr gsl_matrix_complex; j: csize_t; v: ptr gsl_vector_complex): cint {.cdecl, importc: "gsl_matrix_complex_set_col", dynlib: libgsl.}
proc gsl_matrix_complex_get*(m: ptr gsl_matrix_complex; i: csize_t; j: csize_t): gsl_complex {. cdecl, importc: "gsl_matrix_complex_get", dynlib: libgsl.}
proc gsl_matrix_complex_set*(m: ptr gsl_matrix_complex; i: csize_t; j: csize_t; x: gsl_complex) {.cdecl, importc: "gsl_matrix_complex_set", dynlib: libgsl.}
proc gsl_matrix_complex_ptr*(m: ptr gsl_matrix_complex; i: csize_t; j: csize_t): ptr gsl_complex {. cdecl, importc: "gsl_matrix_complex_ptr", dynlib: libgsl.}
proc gsl_matrix_complex_const_ptr*(m: ptr gsl_matrix_complex; i: csize_t; j: csize_t): ptr gsl_complex {. cdecl, importc: "gsl_matrix_complex_const_ptr", dynlib: libgsl.}
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
proc gsl_matrix_long_double_alloc*(n1: csize_t; n2: csize_t): ptr gsl_matrix_long_double {. cdecl, importc: "gsl_matrix_long_double_alloc", dynlib: libgsl.}
proc gsl_matrix_long_double_calloc*(n1: csize_t; n2: csize_t): ptr gsl_matrix_long_double {. cdecl, importc: "gsl_matrix_long_double_calloc", dynlib: libgsl.}
proc gsl_matrix_long_double_alloc_from_block*(b: ptr gsl_block_long_double; offset: csize_t; n1: csize_t; n2: csize_t; d2: csize_t): ptr gsl_matrix_long_double {. cdecl, importc: "gsl_matrix_long_double_alloc_from_block", dynlib: libgsl.}
proc gsl_matrix_long_double_alloc_from_matrix*(m: ptr gsl_matrix_long_double; k1: csize_t; k2: csize_t; n1: csize_t; n2: csize_t): ptr gsl_matrix_long_double {. cdecl, importc: "gsl_matrix_long_double_alloc_from_matrix", dynlib: libgsl.}
proc gsl_vector_long_double_alloc_row_from_matrix*(m: ptr gsl_matrix_long_double; i: csize_t): ptr gsl_vector_long_double {.cdecl, importc: "gsl_vector_long_double_alloc_row_from_matrix", dynlib: libgsl.}
proc gsl_vector_long_double_alloc_col_from_matrix*(m: ptr gsl_matrix_long_double; j: csize_t): ptr gsl_vector_long_double {.cdecl, importc: "gsl_vector_long_double_alloc_col_from_matrix", dynlib: libgsl.}
proc gsl_matrix_long_double_free*(m: ptr gsl_matrix_long_double) {.cdecl, importc: "gsl_matrix_long_double_free", dynlib: libgsl.}
proc gsl_matrix_long_double_submatrix*(m: ptr gsl_matrix_long_double; i: csize_t;   j: csize_t; n1: csize_t; n2: csize_t): gsl_matrix_long_double_view {. cdecl, importc: "gsl_matrix_long_double_submatrix", dynlib: libgsl.}
proc gsl_matrix_long_double_row*(m: ptr gsl_matrix_long_double; i: csize_t): gsl_vector_long_double_view {. cdecl, importc: "gsl_matrix_long_double_row", dynlib: libgsl.}
proc gsl_matrix_long_double_column*(m: ptr gsl_matrix_long_double; j: csize_t): gsl_vector_long_double_view {. cdecl, importc: "gsl_matrix_long_double_column", dynlib: libgsl.}
proc gsl_matrix_long_double_diagonal*(m: ptr gsl_matrix_long_double): gsl_vector_long_double_view {. cdecl, importc: "gsl_matrix_long_double_diagonal", dynlib: libgsl.}
proc gsl_matrix_long_double_subdiagonal*(m: ptr gsl_matrix_long_double; k: csize_t): gsl_vector_long_double_view {. cdecl, importc: "gsl_matrix_long_double_subdiagonal", dynlib: libgsl.}
proc gsl_matrix_long_double_superdiagonal*(m: ptr gsl_matrix_long_double; k: csize_t): gsl_vector_long_double_view {. cdecl, importc: "gsl_matrix_long_double_superdiagonal", dynlib: libgsl.}
proc gsl_matrix_long_double_subrow*(m: ptr gsl_matrix_long_double; i: csize_t;  offset: csize_t; n: csize_t): gsl_vector_long_double_view {. cdecl, importc: "gsl_matrix_long_double_subrow", dynlib: libgsl.}
proc gsl_matrix_long_double_subcolumn*(m: ptr gsl_matrix_long_double; j: csize_t;   offset: csize_t; n: csize_t): gsl_vector_long_double_view {. cdecl, importc: "gsl_matrix_long_double_subcolumn", dynlib: libgsl.}
proc gsl_matrix_long_double_view_array*(base: ptr clongdouble; n1: csize_t;    n2: csize_t): gsl_matrix_long_double_view {. cdecl, importc: "gsl_matrix_long_double_view_array", dynlib: libgsl.}
proc gsl_matrix_long_double_view_array_with_tda*(base: ptr clongdouble; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_long_double_view {.cdecl, importc: "gsl_matrix_long_double_view_array_with_tda", dynlib: libgsl.}
proc gsl_matrix_long_double_view_vector*(v: ptr gsl_vector_long_double; n1: csize_t; n2: csize_t): gsl_matrix_long_double_view {. cdecl, importc: "gsl_matrix_long_double_view_vector", dynlib: libgsl.}
proc gsl_matrix_long_double_view_vector_with_tda*(v: ptr gsl_vector_long_double; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_long_double_view {.cdecl, importc: "gsl_matrix_long_double_view_vector_with_tda", dynlib: libgsl.}
proc gsl_matrix_long_double_const_submatrix*(m: ptr gsl_matrix_long_double; i: csize_t; j: csize_t; n1: csize_t; n2: csize_t): gsl_matrix_long_double_const_view {. cdecl, importc: "gsl_matrix_long_double_const_submatrix", dynlib: libgsl.}
proc gsl_matrix_long_double_const_row*(m: ptr gsl_matrix_long_double; i: csize_t): gsl_vector_long_double_const_view {. cdecl, importc: "gsl_matrix_long_double_const_row", dynlib: libgsl.}
proc gsl_matrix_long_double_const_column*(m: ptr gsl_matrix_long_double; j: csize_t): gsl_vector_long_double_const_view {. cdecl, importc: "gsl_matrix_long_double_const_column", dynlib: libgsl.}
proc gsl_matrix_long_double_const_diagonal*(m: ptr gsl_matrix_long_double): gsl_vector_long_double_const_view {. cdecl, importc: "gsl_matrix_long_double_const_diagonal", dynlib: libgsl.}
proc gsl_matrix_long_double_const_subdiagonal*(m: ptr gsl_matrix_long_double; k: csize_t): gsl_vector_long_double_const_view {.cdecl, importc: "gsl_matrix_long_double_const_subdiagonal", dynlib: libgsl.}
proc gsl_matrix_long_double_const_superdiagonal*(m: ptr gsl_matrix_long_double; k: csize_t): gsl_vector_long_double_const_view {.cdecl, importc: "gsl_matrix_long_double_const_superdiagonal", dynlib: libgsl.}
proc gsl_matrix_long_double_const_subrow*(m: ptr gsl_matrix_long_double; i: csize_t; offset: csize_t; n: csize_t): gsl_vector_long_double_const_view {.cdecl, importc: "gsl_matrix_long_double_const_subrow", dynlib: libgsl.}
proc gsl_matrix_long_double_const_subcolumn*(m: ptr gsl_matrix_long_double; j: csize_t; offset: csize_t; n: csize_t): gsl_vector_long_double_const_view {. cdecl, importc: "gsl_matrix_long_double_const_subcolumn", dynlib: libgsl.}
proc gsl_matrix_long_double_const_view_array*(base: ptr clongdouble; n1: csize_t; n2: csize_t): gsl_matrix_long_double_const_view {.cdecl, importc: "gsl_matrix_long_double_const_view_array", dynlib: libgsl.}
proc gsl_matrix_long_double_const_view_array_with_tda*(base: ptr clongdouble; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_long_double_const_view {.cdecl, importc: "gsl_matrix_long_double_const_view_array_with_tda", dynlib: libgsl.}
proc gsl_matrix_long_double_const_view_vector*(v: ptr gsl_vector_long_double; n1: csize_t; n2: csize_t): gsl_matrix_long_double_const_view {.cdecl, importc: "gsl_matrix_long_double_const_view_vector", dynlib: libgsl.}
proc gsl_matrix_long_double_const_view_vector_with_tda*(v: ptr gsl_vector_long_double; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_long_double_const_view {. cdecl, importc: "gsl_matrix_long_double_const_view_vector_with_tda", dynlib: libgsl.}
proc gsl_matrix_long_double_set_zero*(m: ptr gsl_matrix_long_double) {.cdecl, importc: "gsl_matrix_long_double_set_zero", dynlib: libgsl.}
proc gsl_matrix_long_double_set_identity*(m: ptr gsl_matrix_long_double) {.cdecl, importc: "gsl_matrix_long_double_set_identity", dynlib: libgsl.}
proc gsl_matrix_long_double_set_all*(m: ptr gsl_matrix_long_double; x: clongdouble) {. cdecl, importc: "gsl_matrix_long_double_set_all", dynlib: libgsl.}
proc gsl_matrix_long_double_fread*(stream: ptr FILE; m: ptr gsl_matrix_long_double): cint {. cdecl, importc: "gsl_matrix_long_double_fread", dynlib: libgsl.}
proc gsl_matrix_long_double_fwrite*(stream: ptr FILE; m: ptr gsl_matrix_long_double): cint {. cdecl, importc: "gsl_matrix_long_double_fwrite", dynlib: libgsl.}
proc gsl_matrix_long_double_fscanf*(stream: ptr FILE; m: ptr gsl_matrix_long_double): cint {. cdecl, importc: "gsl_matrix_long_double_fscanf", dynlib: libgsl.}
proc gsl_matrix_long_double_fprintf*(stream: ptr FILE; m: ptr gsl_matrix_long_double; format: cstring): cint {. cdecl, importc: "gsl_matrix_long_double_fprintf", dynlib: libgsl.}
proc gsl_matrix_long_double_memcpy*(dest: ptr gsl_matrix_long_double;  src: ptr gsl_matrix_long_double): cint {.cdecl, importc: "gsl_matrix_long_double_memcpy", dynlib: libgsl.}
proc gsl_matrix_long_double_swap*(m1: ptr gsl_matrix_long_double; m2: ptr gsl_matrix_long_double): cint {.cdecl, importc: "gsl_matrix_long_double_swap", dynlib: libgsl.}
proc gsl_matrix_long_double_tricpy*(uplo_src: char; copy_diag: cint;  dest: ptr gsl_matrix_long_double;  src: ptr gsl_matrix_long_double): cint {.cdecl, importc: "gsl_matrix_long_double_tricpy", dynlib: libgsl.}
proc gsl_matrix_long_double_swap_rows*(m: ptr gsl_matrix_long_double; i: csize_t;   j: csize_t): cint {.cdecl, importc: "gsl_matrix_long_double_swap_rows", dynlib: libgsl.}
proc gsl_matrix_long_double_swap_columns*(m: ptr gsl_matrix_long_double; i: csize_t; j: csize_t): cint {.cdecl, importc: "gsl_matrix_long_double_swap_columns", dynlib: libgsl.}
proc gsl_matrix_long_double_swap_rowcol*(m: ptr gsl_matrix_long_double; i: csize_t; j: csize_t): cint {.cdecl, importc: "gsl_matrix_long_double_swap_rowcol", dynlib: libgsl.}
proc gsl_matrix_long_double_transpose*(m: ptr gsl_matrix_long_double): cint {.cdecl, importc: "gsl_matrix_long_double_transpose", dynlib: libgsl.}
proc gsl_matrix_long_double_transpose_memcpy*(dest: ptr gsl_matrix_long_double; src: ptr gsl_matrix_long_double): cint {.cdecl, importc: "gsl_matrix_long_double_transpose_memcpy", dynlib: libgsl.}
proc gsl_matrix_long_double_transpose_tricpy*(uplo_src: char; copy_diag: cint; dest: ptr gsl_matrix_long_double; src: ptr gsl_matrix_long_double): cint {.cdecl, importc: "gsl_matrix_long_double_transpose_tricpy", dynlib: libgsl.}
proc gsl_matrix_long_double_max*(m: ptr gsl_matrix_long_double): clongdouble {.cdecl, importc: "gsl_matrix_long_double_max", dynlib: libgsl.}
proc gsl_matrix_long_double_min*(m: ptr gsl_matrix_long_double): clongdouble {.cdecl, importc: "gsl_matrix_long_double_min", dynlib: libgsl.}
proc gsl_matrix_long_double_minmax*(m: ptr gsl_matrix_long_double;  min_out: ptr clongdouble;  max_out: ptr clongdouble) {.cdecl, importc: "gsl_matrix_long_double_minmax", dynlib: libgsl.}
proc gsl_matrix_long_double_max_index*(m: ptr gsl_matrix_long_double;   imax: ptr csize_t; jmax: ptr csize_t) {.cdecl, importc: "gsl_matrix_long_double_max_index", dynlib: libgsl.}
proc gsl_matrix_long_double_min_index*(m: ptr gsl_matrix_long_double;   imin: ptr csize_t; jmin: ptr csize_t) {.cdecl, importc: "gsl_matrix_long_double_min_index", dynlib: libgsl.}
proc gsl_matrix_long_double_minmax_index*(m: ptr gsl_matrix_long_double; imin: ptr csize_t; jmin: ptr csize_t; imax: ptr csize_t; jmax: ptr csize_t) {.cdecl, importc: "gsl_matrix_long_double_minmax_index", dynlib: libgsl.}
proc gsl_matrix_long_double_equal*(a: ptr gsl_matrix_long_double; b: ptr gsl_matrix_long_double): cint {.cdecl, importc: "gsl_matrix_long_double_equal", dynlib: libgsl.}
proc gsl_matrix_long_double_isnull*(m: ptr gsl_matrix_long_double): cint {.cdecl, importc: "gsl_matrix_long_double_isnull", dynlib: libgsl.}
proc gsl_matrix_long_double_ispos*(m: ptr gsl_matrix_long_double): cint {.cdecl, importc: "gsl_matrix_long_double_ispos", dynlib: libgsl.}
proc gsl_matrix_long_double_isneg*(m: ptr gsl_matrix_long_double): cint {.cdecl, importc: "gsl_matrix_long_double_isneg", dynlib: libgsl.}
proc gsl_matrix_long_double_isnonneg*(m: ptr gsl_matrix_long_double): cint {.cdecl, importc: "gsl_matrix_long_double_isnonneg", dynlib: libgsl.}
proc gsl_matrix_long_double_add*(a: ptr gsl_matrix_long_double; b: ptr gsl_matrix_long_double): cint {.cdecl, importc: "gsl_matrix_long_double_add", dynlib: libgsl.}
proc gsl_matrix_long_double_sub*(a: ptr gsl_matrix_long_double; b: ptr gsl_matrix_long_double): cint {.cdecl, importc: "gsl_matrix_long_double_sub", dynlib: libgsl.}
proc gsl_matrix_long_double_mul_elements*(a: ptr gsl_matrix_long_double; b: ptr gsl_matrix_long_double): cint {.cdecl, importc: "gsl_matrix_long_double_mul_elements", dynlib: libgsl.}
proc gsl_matrix_long_double_div_elements*(a: ptr gsl_matrix_long_double; b: ptr gsl_matrix_long_double): cint {.cdecl, importc: "gsl_matrix_long_double_div_elements", dynlib: libgsl.}
proc gsl_matrix_long_double_scale*(a: ptr gsl_matrix_long_double; x: cdouble): cint {. cdecl, importc: "gsl_matrix_long_double_scale", dynlib: libgsl.}
proc gsl_matrix_long_double_add_constant*(a: ptr gsl_matrix_long_double; x: cdouble): cint {. cdecl, importc: "gsl_matrix_long_double_add_constant", dynlib: libgsl.}
proc gsl_matrix_long_double_add_diagonal*(a: ptr gsl_matrix_long_double; x: cdouble): cint {. cdecl, importc: "gsl_matrix_long_double_add_diagonal", dynlib: libgsl.}
proc gsl_matrix_long_double_get_row*(v: ptr gsl_vector_long_double; m: ptr gsl_matrix_long_double; i: csize_t): cint {. cdecl, importc: "gsl_matrix_long_double_get_row", dynlib: libgsl.}
proc gsl_matrix_long_double_get_col*(v: ptr gsl_vector_long_double; m: ptr gsl_matrix_long_double; j: csize_t): cint {. cdecl, importc: "gsl_matrix_long_double_get_col", dynlib: libgsl.}
proc gsl_matrix_long_double_set_row*(m: ptr gsl_matrix_long_double; i: csize_t; v: ptr gsl_vector_long_double): cint {.cdecl, importc: "gsl_matrix_long_double_set_row", dynlib: libgsl.}
proc gsl_matrix_long_double_set_col*(m: ptr gsl_matrix_long_double; j: csize_t; v: ptr gsl_vector_long_double): cint {.cdecl, importc: "gsl_matrix_long_double_set_col", dynlib: libgsl.}
proc gsl_matrix_long_double_get*(m: ptr gsl_matrix_long_double; i: csize_t; j: csize_t): clongdouble {. cdecl, importc: "gsl_matrix_long_double_get", dynlib: libgsl.}
proc gsl_matrix_long_double_set*(m: ptr gsl_matrix_long_double; i: csize_t; j: csize_t; x: clongdouble) {.cdecl, importc: "gsl_matrix_long_double_set", dynlib: libgsl.}
proc gsl_matrix_long_double_ptr*(m: ptr gsl_matrix_long_double; i: csize_t; j: csize_t): ptr clongdouble {. cdecl, importc: "gsl_matrix_long_double_ptr", dynlib: libgsl.}
proc gsl_matrix_long_double_const_ptr*(m: ptr gsl_matrix_long_double; i: csize_t;   j: csize_t): ptr clongdouble {.cdecl, importc: "gsl_matrix_long_double_const_ptr", dynlib: libgsl.}
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
proc gsl_matrix_float_alloc*(n1: csize_t; n2: csize_t): ptr gsl_matrix_float {.cdecl, importc: "gsl_matrix_float_alloc", dynlib: libgsl.}
proc gsl_matrix_float_calloc*(n1: csize_t; n2: csize_t): ptr gsl_matrix_float {.cdecl, importc: "gsl_matrix_float_calloc", dynlib: libgsl.}
proc gsl_matrix_float_alloc_from_block*(b: ptr gsl_block_float; offset: csize_t;    n1: csize_t; n2: csize_t; d2: csize_t): ptr gsl_matrix_float {. cdecl, importc: "gsl_matrix_float_alloc_from_block", dynlib: libgsl.}
proc gsl_matrix_float_alloc_from_matrix*(m: ptr gsl_matrix_float; k1: csize_t; k2: csize_t; n1: csize_t; n2: csize_t): ptr gsl_matrix_float {. cdecl, importc: "gsl_matrix_float_alloc_from_matrix", dynlib: libgsl.}
proc gsl_vector_float_alloc_row_from_matrix*(m: ptr gsl_matrix_float; i: csize_t): ptr gsl_vector_float {. cdecl, importc: "gsl_vector_float_alloc_row_from_matrix", dynlib: libgsl.}
proc gsl_vector_float_alloc_col_from_matrix*(m: ptr gsl_matrix_float; j: csize_t): ptr gsl_vector_float {. cdecl, importc: "gsl_vector_float_alloc_col_from_matrix", dynlib: libgsl.}
proc gsl_matrix_float_free*(m: ptr gsl_matrix_float) {.cdecl, importc: "gsl_matrix_float_free", dynlib: libgsl.}
proc gsl_matrix_float_submatrix*(m: ptr gsl_matrix_float; i: csize_t; j: csize_t; n1: csize_t; n2: csize_t): gsl_matrix_float_view {. cdecl, importc: "gsl_matrix_float_submatrix", dynlib: libgsl.}
proc gsl_matrix_float_row*(m: ptr gsl_matrix_float; i: csize_t): gsl_vector_float_view {. cdecl, importc: "gsl_matrix_float_row", dynlib: libgsl.}
proc gsl_matrix_float_column*(m: ptr gsl_matrix_float; j: csize_t): gsl_vector_float_view {. cdecl, importc: "gsl_matrix_float_column", dynlib: libgsl.}
proc gsl_matrix_float_diagonal*(m: ptr gsl_matrix_float): gsl_vector_float_view {. cdecl, importc: "gsl_matrix_float_diagonal", dynlib: libgsl.}
proc gsl_matrix_float_subdiagonal*(m: ptr gsl_matrix_float; k: csize_t): gsl_vector_float_view {. cdecl, importc: "gsl_matrix_float_subdiagonal", dynlib: libgsl.}
proc gsl_matrix_float_superdiagonal*(m: ptr gsl_matrix_float; k: csize_t): gsl_vector_float_view {. cdecl, importc: "gsl_matrix_float_superdiagonal", dynlib: libgsl.}
proc gsl_matrix_float_subrow*(m: ptr gsl_matrix_float; i: csize_t; offset: csize_t;  n: csize_t): gsl_vector_float_view {.cdecl, importc: "gsl_matrix_float_subrow", dynlib: libgsl.}
proc gsl_matrix_float_subcolumn*(m: ptr gsl_matrix_float; j: csize_t; offset: csize_t; n: csize_t): gsl_vector_float_view {.cdecl, importc: "gsl_matrix_float_subcolumn", dynlib: libgsl.}
proc gsl_matrix_float_view_array*(base: ptr cfloat; n1: csize_t; n2: csize_t): gsl_matrix_float_view {. cdecl, importc: "gsl_matrix_float_view_array", dynlib: libgsl.}
proc gsl_matrix_float_view_array_with_tda*(base: ptr cfloat; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_float_view {.cdecl, importc: "gsl_matrix_float_view_array_with_tda",  dynlib: libgsl.}
proc gsl_matrix_float_view_vector*(v: ptr gsl_vector_float; n1: csize_t; n2: csize_t): gsl_matrix_float_view {. cdecl, importc: "gsl_matrix_float_view_vector", dynlib: libgsl.}
proc gsl_matrix_float_view_vector_with_tda*(v: ptr gsl_vector_float; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_float_view {.cdecl, importc: "gsl_matrix_float_view_vector_with_tda", dynlib: libgsl.}
proc gsl_matrix_float_const_submatrix*(m: ptr gsl_matrix_float; i: csize_t;   j: csize_t; n1: csize_t; n2: csize_t): gsl_matrix_float_const_view {. cdecl, importc: "gsl_matrix_float_const_submatrix", dynlib: libgsl.}
proc gsl_matrix_float_const_row*(m: ptr gsl_matrix_float; i: csize_t): gsl_vector_float_const_view {. cdecl, importc: "gsl_matrix_float_const_row", dynlib: libgsl.}
proc gsl_matrix_float_const_column*(m: ptr gsl_matrix_float; j: csize_t): gsl_vector_float_const_view {. cdecl, importc: "gsl_matrix_float_const_column", dynlib: libgsl.}
proc gsl_matrix_float_const_diagonal*(m: ptr gsl_matrix_float): gsl_vector_float_const_view {. cdecl, importc: "gsl_matrix_float_const_diagonal", dynlib: libgsl.}
proc gsl_matrix_float_const_subdiagonal*(m: ptr gsl_matrix_float; k: csize_t): gsl_vector_float_const_view {. cdecl, importc: "gsl_matrix_float_const_subdiagonal", dynlib: libgsl.}
proc gsl_matrix_float_const_superdiagonal*(m: ptr gsl_matrix_float; k: csize_t): gsl_vector_float_const_view {. cdecl, importc: "gsl_matrix_float_const_superdiagonal", dynlib: libgsl.}
proc gsl_matrix_float_const_subrow*(m: ptr gsl_matrix_float; i: csize_t;  offset: csize_t; n: csize_t): gsl_vector_float_const_view {. cdecl, importc: "gsl_matrix_float_const_subrow", dynlib: libgsl.}
proc gsl_matrix_float_const_subcolumn*(m: ptr gsl_matrix_float; j: csize_t;   offset: csize_t; n: csize_t): gsl_vector_float_const_view {. cdecl, importc: "gsl_matrix_float_const_subcolumn", dynlib: libgsl.}
proc gsl_matrix_float_const_view_array*(base: ptr cfloat; n1: csize_t; n2: csize_t): gsl_matrix_float_const_view {. cdecl, importc: "gsl_matrix_float_const_view_array", dynlib: libgsl.}
proc gsl_matrix_float_const_view_array_with_tda*(base: ptr cfloat; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_float_const_view {.cdecl, importc: "gsl_matrix_float_const_view_array_with_tda", dynlib: libgsl.}
proc gsl_matrix_float_const_view_vector*(v: ptr gsl_vector_float; n1: csize_t; n2: csize_t): gsl_matrix_float_const_view {. cdecl, importc: "gsl_matrix_float_const_view_vector", dynlib: libgsl.}
proc gsl_matrix_float_const_view_vector_with_tda*(v: ptr gsl_vector_float; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_float_const_view {.cdecl, importc: "gsl_matrix_float_const_view_vector_with_tda", dynlib: libgsl.}
proc gsl_matrix_float_set_zero*(m: ptr gsl_matrix_float) {.cdecl, importc: "gsl_matrix_float_set_zero", dynlib: libgsl.}
proc gsl_matrix_float_set_identity*(m: ptr gsl_matrix_float) {.cdecl, importc: "gsl_matrix_float_set_identity", dynlib: libgsl.}
proc gsl_matrix_float_set_all*(m: ptr gsl_matrix_float; x: cfloat) {.cdecl, importc: "gsl_matrix_float_set_all", dynlib: libgsl.}
proc gsl_matrix_float_fread*(stream: ptr FILE; m: ptr gsl_matrix_float): cint {.cdecl, importc: "gsl_matrix_float_fread", dynlib: libgsl.}
proc gsl_matrix_float_fwrite*(stream: ptr FILE; m: ptr gsl_matrix_float): cint {.cdecl, importc: "gsl_matrix_float_fwrite", dynlib: libgsl.}
proc gsl_matrix_float_fscanf*(stream: ptr FILE; m: ptr gsl_matrix_float): cint {.cdecl, importc: "gsl_matrix_float_fscanf", dynlib: libgsl.}
proc gsl_matrix_float_fprintf*(stream: ptr FILE; m: ptr gsl_matrix_float;   format: cstring): cint {.cdecl, importc: "gsl_matrix_float_fprintf", dynlib: libgsl.}
proc gsl_matrix_float_memcpy*(dest: ptr gsl_matrix_float; src: ptr gsl_matrix_float): cint {. cdecl, importc: "gsl_matrix_float_memcpy", dynlib: libgsl.}
proc gsl_matrix_float_swap*(m1: ptr gsl_matrix_float; m2: ptr gsl_matrix_float): cint {. cdecl, importc: "gsl_matrix_float_swap", dynlib: libgsl.}
proc gsl_matrix_float_tricpy*(uplo_src: char; copy_diag: cint;  dest: ptr gsl_matrix_float; src: ptr gsl_matrix_float): cint {. cdecl, importc: "gsl_matrix_float_tricpy", dynlib: libgsl.}
proc gsl_matrix_float_swap_rows*(m: ptr gsl_matrix_float; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_matrix_float_swap_rows", dynlib: libgsl.}
proc gsl_matrix_float_swap_columns*(m: ptr gsl_matrix_float; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_matrix_float_swap_columns", dynlib: libgsl.}
proc gsl_matrix_float_swap_rowcol*(m: ptr gsl_matrix_float; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_matrix_float_swap_rowcol", dynlib: libgsl.}
proc gsl_matrix_float_transpose*(m: ptr gsl_matrix_float): cint {.cdecl, importc: "gsl_matrix_float_transpose", dynlib: libgsl.}
proc gsl_matrix_float_transpose_memcpy*(dest: ptr gsl_matrix_float;    src: ptr gsl_matrix_float): cint {.cdecl, importc: "gsl_matrix_float_transpose_memcpy", dynlib: libgsl.}
proc gsl_matrix_float_transpose_tricpy*(uplo_src: char; copy_diag: cint;    dest: ptr gsl_matrix_float;    src: ptr gsl_matrix_float): cint {.cdecl, importc: "gsl_matrix_float_transpose_tricpy", dynlib: libgsl.}
proc gsl_matrix_float_max*(m: ptr gsl_matrix_float): cfloat {.cdecl, importc: "gsl_matrix_float_max", dynlib: libgsl.}
proc gsl_matrix_float_min*(m: ptr gsl_matrix_float): cfloat {.cdecl, importc: "gsl_matrix_float_min", dynlib: libgsl.}
proc gsl_matrix_float_minmax*(m: ptr gsl_matrix_float; min_out: ptr cfloat;  max_out: ptr cfloat) {.cdecl, importc: "gsl_matrix_float_minmax", dynlib: libgsl.}
proc gsl_matrix_float_max_index*(m: ptr gsl_matrix_float; imax: ptr csize_t; jmax: ptr csize_t) {.cdecl, importc: "gsl_matrix_float_max_index", dynlib: libgsl.}
proc gsl_matrix_float_min_index*(m: ptr gsl_matrix_float; imin: ptr csize_t; jmin: ptr csize_t) {.cdecl, importc: "gsl_matrix_float_min_index", dynlib: libgsl.}
proc gsl_matrix_float_minmax_index*(m: ptr gsl_matrix_float; imin: ptr csize_t;  jmin: ptr csize_t; imax: ptr csize_t;  jmax: ptr csize_t) {.cdecl, importc: "gsl_matrix_float_minmax_index", dynlib: libgsl.}
proc gsl_matrix_float_equal*(a: ptr gsl_matrix_float; b: ptr gsl_matrix_float): cint {. cdecl, importc: "gsl_matrix_float_equal", dynlib: libgsl.}
proc gsl_matrix_float_isnull*(m: ptr gsl_matrix_float): cint {.cdecl, importc: "gsl_matrix_float_isnull", dynlib: libgsl.}
proc gsl_matrix_float_ispos*(m: ptr gsl_matrix_float): cint {.cdecl, importc: "gsl_matrix_float_ispos", dynlib: libgsl.}
proc gsl_matrix_float_isneg*(m: ptr gsl_matrix_float): cint {.cdecl, importc: "gsl_matrix_float_isneg", dynlib: libgsl.}
proc gsl_matrix_float_isnonneg*(m: ptr gsl_matrix_float): cint {.cdecl, importc: "gsl_matrix_float_isnonneg", dynlib: libgsl.}
proc gsl_matrix_float_add*(a: ptr gsl_matrix_float; b: ptr gsl_matrix_float): cint {. cdecl, importc: "gsl_matrix_float_add", dynlib: libgsl.}
proc gsl_matrix_float_sub*(a: ptr gsl_matrix_float; b: ptr gsl_matrix_float): cint {. cdecl, importc: "gsl_matrix_float_sub", dynlib: libgsl.}
proc gsl_matrix_float_mul_elements*(a: ptr gsl_matrix_float; b: ptr gsl_matrix_float): cint {. cdecl, importc: "gsl_matrix_float_mul_elements", dynlib: libgsl.}
proc gsl_matrix_float_div_elements*(a: ptr gsl_matrix_float; b: ptr gsl_matrix_float): cint {. cdecl, importc: "gsl_matrix_float_div_elements", dynlib: libgsl.}
proc gsl_matrix_float_scale*(a: ptr gsl_matrix_float; x: cdouble): cint {.cdecl, importc: "gsl_matrix_float_scale", dynlib: libgsl.}
proc gsl_matrix_float_add_constant*(a: ptr gsl_matrix_float; x: cdouble): cint {.cdecl, importc: "gsl_matrix_float_add_constant", dynlib: libgsl.}
proc gsl_matrix_float_add_diagonal*(a: ptr gsl_matrix_float; x: cdouble): cint {.cdecl, importc: "gsl_matrix_float_add_diagonal", dynlib: libgsl.}
proc gsl_matrix_float_get_row*(v: ptr gsl_vector_float; m: ptr gsl_matrix_float;   i: csize_t): cint {.cdecl, importc: "gsl_matrix_float_get_row", dynlib: libgsl.}
proc gsl_matrix_float_get_col*(v: ptr gsl_vector_float; m: ptr gsl_matrix_float;   j: csize_t): cint {.cdecl, importc: "gsl_matrix_float_get_col", dynlib: libgsl.}
proc gsl_matrix_float_set_row*(m: ptr gsl_matrix_float; i: csize_t;   v: ptr gsl_vector_float): cint {.cdecl, importc: "gsl_matrix_float_set_row", dynlib: libgsl.}
proc gsl_matrix_float_set_col*(m: ptr gsl_matrix_float; j: csize_t;   v: ptr gsl_vector_float): cint {.cdecl, importc: "gsl_matrix_float_set_col", dynlib: libgsl.}
proc gsl_matrix_float_get*(m: ptr gsl_matrix_float; i: csize_t; j: csize_t): cfloat {. cdecl, importc: "gsl_matrix_float_get", dynlib: libgsl.}
proc gsl_matrix_float_set*(m: ptr gsl_matrix_float; i: csize_t; j: csize_t; x: cfloat) {. cdecl, importc: "gsl_matrix_float_set", dynlib: libgsl.}
proc gsl_matrix_float_ptr*(m: ptr gsl_matrix_float; i: csize_t; j: csize_t): ptr cfloat {. cdecl, importc: "gsl_matrix_float_ptr", dynlib: libgsl.}
proc gsl_matrix_float_const_ptr*(m: ptr gsl_matrix_float; i: csize_t; j: csize_t): ptr cfloat {. cdecl, importc: "gsl_matrix_float_const_ptr", dynlib: libgsl.}
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
proc gsl_matrix_long_alloc*(n1: csize_t; n2: csize_t): ptr gsl_matrix_long {.cdecl, importc: "gsl_matrix_long_alloc", dynlib: libgsl.}
proc gsl_matrix_long_calloc*(n1: csize_t; n2: csize_t): ptr gsl_matrix_long {.cdecl, importc: "gsl_matrix_long_calloc", dynlib: libgsl.}
proc gsl_matrix_long_alloc_from_block*(b: ptr gsl_block_long; offset: csize_t;   n1: csize_t; n2: csize_t; d2: csize_t): ptr gsl_matrix_long {. cdecl, importc: "gsl_matrix_long_alloc_from_block", dynlib: libgsl.}
proc gsl_matrix_long_alloc_from_matrix*(m: ptr gsl_matrix_long; k1: csize_t;    k2: csize_t; n1: csize_t; n2: csize_t): ptr gsl_matrix_long {. cdecl, importc: "gsl_matrix_long_alloc_from_matrix", dynlib: libgsl.}
proc gsl_vector_long_alloc_row_from_matrix*(m: ptr gsl_matrix_long; i: csize_t): ptr gsl_vector_long {. cdecl, importc: "gsl_vector_long_alloc_row_from_matrix", dynlib: libgsl.}
proc gsl_vector_long_alloc_col_from_matrix*(m: ptr gsl_matrix_long; j: csize_t): ptr gsl_vector_long {. cdecl, importc: "gsl_vector_long_alloc_col_from_matrix", dynlib: libgsl.}
proc gsl_matrix_long_free*(m: ptr gsl_matrix_long) {.cdecl, importc: "gsl_matrix_long_free", dynlib: libgsl.}
proc gsl_matrix_long_submatrix*(m: ptr gsl_matrix_long; i: csize_t; j: csize_t; n1: csize_t; n2: csize_t): gsl_matrix_long_view {. cdecl, importc: "gsl_matrix_long_submatrix", dynlib: libgsl.}
proc gsl_matrix_long_row*(m: ptr gsl_matrix_long; i: csize_t): gsl_vector_long_view {. cdecl, importc: "gsl_matrix_long_row", dynlib: libgsl.}
proc gsl_matrix_long_column*(m: ptr gsl_matrix_long; j: csize_t): gsl_vector_long_view {. cdecl, importc: "gsl_matrix_long_column", dynlib: libgsl.}
proc gsl_matrix_long_diagonal*(m: ptr gsl_matrix_long): gsl_vector_long_view {.cdecl, importc: "gsl_matrix_long_diagonal", dynlib: libgsl.}
proc gsl_matrix_long_subdiagonal*(m: ptr gsl_matrix_long; k: csize_t): gsl_vector_long_view {. cdecl, importc: "gsl_matrix_long_subdiagonal", dynlib: libgsl.}
proc gsl_matrix_long_superdiagonal*(m: ptr gsl_matrix_long; k: csize_t): gsl_vector_long_view {. cdecl, importc: "gsl_matrix_long_superdiagonal", dynlib: libgsl.}
proc gsl_matrix_long_subrow*(m: ptr gsl_matrix_long; i: csize_t; offset: csize_t; n: csize_t): gsl_vector_long_view {.cdecl, importc: "gsl_matrix_long_subrow", dynlib: libgsl.}
proc gsl_matrix_long_subcolumn*(m: ptr gsl_matrix_long; j: csize_t; offset: csize_t; n: csize_t): gsl_vector_long_view {.cdecl, importc: "gsl_matrix_long_subcolumn", dynlib: libgsl.}
proc gsl_matrix_long_view_array*(base: ptr clong; n1: csize_t; n2: csize_t): gsl_matrix_long_view {. cdecl, importc: "gsl_matrix_long_view_array", dynlib: libgsl.}
proc gsl_matrix_long_view_array_with_tda*(base: ptr clong; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_long_view {.cdecl, importc: "gsl_matrix_long_view_array_with_tda", dynlib: libgsl.}
proc gsl_matrix_long_view_vector*(v: ptr gsl_vector_long; n1: csize_t; n2: csize_t): gsl_matrix_long_view {. cdecl, importc: "gsl_matrix_long_view_vector", dynlib: libgsl.}
proc gsl_matrix_long_view_vector_with_tda*(v: ptr gsl_vector_long; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_long_view {.cdecl, importc: "gsl_matrix_long_view_vector_with_tda", dynlib: libgsl.}
proc gsl_matrix_long_const_submatrix*(m: ptr gsl_matrix_long; i: csize_t; j: csize_t;  n1: csize_t; n2: csize_t): gsl_matrix_long_const_view {. cdecl, importc: "gsl_matrix_long_const_submatrix", dynlib: libgsl.}
proc gsl_matrix_long_const_row*(m: ptr gsl_matrix_long; i: csize_t): gsl_vector_long_const_view {. cdecl, importc: "gsl_matrix_long_const_row", dynlib: libgsl.}
proc gsl_matrix_long_const_column*(m: ptr gsl_matrix_long; j: csize_t): gsl_vector_long_const_view {. cdecl, importc: "gsl_matrix_long_const_column", dynlib: libgsl.}
proc gsl_matrix_long_const_diagonal*(m: ptr gsl_matrix_long): gsl_vector_long_const_view {. cdecl, importc: "gsl_matrix_long_const_diagonal", dynlib: libgsl.}
proc gsl_matrix_long_const_subdiagonal*(m: ptr gsl_matrix_long; k: csize_t): gsl_vector_long_const_view {. cdecl, importc: "gsl_matrix_long_const_subdiagonal", dynlib: libgsl.}
proc gsl_matrix_long_const_superdiagonal*(m: ptr gsl_matrix_long; k: csize_t): gsl_vector_long_const_view {. cdecl, importc: "gsl_matrix_long_const_superdiagonal", dynlib: libgsl.}
proc gsl_matrix_long_const_subrow*(m: ptr gsl_matrix_long; i: csize_t; offset: csize_t; n: csize_t): gsl_vector_long_const_view {. cdecl, importc: "gsl_matrix_long_const_subrow", dynlib: libgsl.}
proc gsl_matrix_long_const_subcolumn*(m: ptr gsl_matrix_long; j: csize_t;  offset: csize_t; n: csize_t): gsl_vector_long_const_view {. cdecl, importc: "gsl_matrix_long_const_subcolumn", dynlib: libgsl.}
proc gsl_matrix_long_const_view_array*(base: ptr clong; n1: csize_t; n2: csize_t): gsl_matrix_long_const_view {. cdecl, importc: "gsl_matrix_long_const_view_array", dynlib: libgsl.}
proc gsl_matrix_long_const_view_array_with_tda*(base: ptr clong; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_long_const_view {.cdecl, importc: "gsl_matrix_long_const_view_array_with_tda", dynlib: libgsl.}
proc gsl_matrix_long_const_view_vector*(v: ptr gsl_vector_long; n1: csize_t;    n2: csize_t): gsl_matrix_long_const_view {. cdecl, importc: "gsl_matrix_long_const_view_vector", dynlib: libgsl.}
proc gsl_matrix_long_const_view_vector_with_tda*(v: ptr gsl_vector_long; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_long_const_view {.cdecl, importc: "gsl_matrix_long_const_view_vector_with_tda", dynlib: libgsl.}
proc gsl_matrix_long_set_zero*(m: ptr gsl_matrix_long) {.cdecl, importc: "gsl_matrix_long_set_zero", dynlib: libgsl.}
proc gsl_matrix_long_set_identity*(m: ptr gsl_matrix_long) {.cdecl, importc: "gsl_matrix_long_set_identity", dynlib: libgsl.}
proc gsl_matrix_long_set_all*(m: ptr gsl_matrix_long; x: clong) {.cdecl, importc: "gsl_matrix_long_set_all", dynlib: libgsl.}
proc gsl_matrix_long_fread*(stream: ptr FILE; m: ptr gsl_matrix_long): cint {.cdecl, importc: "gsl_matrix_long_fread", dynlib: libgsl.}
proc gsl_matrix_long_fwrite*(stream: ptr FILE; m: ptr gsl_matrix_long): cint {.cdecl, importc: "gsl_matrix_long_fwrite", dynlib: libgsl.}
proc gsl_matrix_long_fscanf*(stream: ptr FILE; m: ptr gsl_matrix_long): cint {.cdecl, importc: "gsl_matrix_long_fscanf", dynlib: libgsl.}
proc gsl_matrix_long_fprintf*(stream: ptr FILE; m: ptr gsl_matrix_long; format: cstring): cint {. cdecl, importc: "gsl_matrix_long_fprintf", dynlib: libgsl.}
proc gsl_matrix_long_memcpy*(dest: ptr gsl_matrix_long; src: ptr gsl_matrix_long): cint {. cdecl, importc: "gsl_matrix_long_memcpy", dynlib: libgsl.}
proc gsl_matrix_long_swap*(m1: ptr gsl_matrix_long; m2: ptr gsl_matrix_long): cint {. cdecl, importc: "gsl_matrix_long_swap", dynlib: libgsl.}
proc gsl_matrix_long_tricpy*(uplo_src: char; copy_diag: cint; dest: ptr gsl_matrix_long; src: ptr gsl_matrix_long): cint {. cdecl, importc: "gsl_matrix_long_tricpy", dynlib: libgsl.}
proc gsl_matrix_long_swap_rows*(m: ptr gsl_matrix_long; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_matrix_long_swap_rows", dynlib: libgsl.}
proc gsl_matrix_long_swap_columns*(m: ptr gsl_matrix_long; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_matrix_long_swap_columns", dynlib: libgsl.}
proc gsl_matrix_long_swap_rowcol*(m: ptr gsl_matrix_long; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_matrix_long_swap_rowcol", dynlib: libgsl.}
proc gsl_matrix_long_transpose*(m: ptr gsl_matrix_long): cint {.cdecl, importc: "gsl_matrix_long_transpose", dynlib: libgsl.}
proc gsl_matrix_long_transpose_memcpy*(dest: ptr gsl_matrix_long;   src: ptr gsl_matrix_long): cint {.cdecl, importc: "gsl_matrix_long_transpose_memcpy", dynlib: libgsl.}
proc gsl_matrix_long_transpose_tricpy*(uplo_src: char; copy_diag: cint;   dest: ptr gsl_matrix_long;   src: ptr gsl_matrix_long): cint {.cdecl, importc: "gsl_matrix_long_transpose_tricpy", dynlib: libgsl.}
proc gsl_matrix_long_max*(m: ptr gsl_matrix_long): clong {.cdecl, importc: "gsl_matrix_long_max", dynlib: libgsl.}
proc gsl_matrix_long_min*(m: ptr gsl_matrix_long): clong {.cdecl, importc: "gsl_matrix_long_min", dynlib: libgsl.}
proc gsl_matrix_long_minmax*(m: ptr gsl_matrix_long; min_out: ptr clong; max_out: ptr clong) {.cdecl, importc: "gsl_matrix_long_minmax", dynlib: libgsl.}
proc gsl_matrix_long_max_index*(m: ptr gsl_matrix_long; imax: ptr csize_t; jmax: ptr csize_t) {.cdecl, importc: "gsl_matrix_long_max_index", dynlib: libgsl.}
proc gsl_matrix_long_min_index*(m: ptr gsl_matrix_long; imin: ptr csize_t; jmin: ptr csize_t) {.cdecl, importc: "gsl_matrix_long_min_index", dynlib: libgsl.}
proc gsl_matrix_long_minmax_index*(m: ptr gsl_matrix_long; imin: ptr csize_t; jmin: ptr csize_t; imax: ptr csize_t; jmax: ptr csize_t) {.cdecl, importc: "gsl_matrix_long_minmax_index", dynlib: libgsl.}
proc gsl_matrix_long_equal*(a: ptr gsl_matrix_long; b: ptr gsl_matrix_long): cint {. cdecl, importc: "gsl_matrix_long_equal", dynlib: libgsl.}
proc gsl_matrix_long_isnull*(m: ptr gsl_matrix_long): cint {.cdecl, importc: "gsl_matrix_long_isnull", dynlib: libgsl.}
proc gsl_matrix_long_ispos*(m: ptr gsl_matrix_long): cint {.cdecl, importc: "gsl_matrix_long_ispos", dynlib: libgsl.}
proc gsl_matrix_long_isneg*(m: ptr gsl_matrix_long): cint {.cdecl, importc: "gsl_matrix_long_isneg", dynlib: libgsl.}
proc gsl_matrix_long_isnonneg*(m: ptr gsl_matrix_long): cint {.cdecl, importc: "gsl_matrix_long_isnonneg", dynlib: libgsl.}
proc gsl_matrix_long_add*(a: ptr gsl_matrix_long; b: ptr gsl_matrix_long): cint {.cdecl, importc: "gsl_matrix_long_add", dynlib: libgsl.}
proc gsl_matrix_long_sub*(a: ptr gsl_matrix_long; b: ptr gsl_matrix_long): cint {.cdecl, importc: "gsl_matrix_long_sub", dynlib: libgsl.}
proc gsl_matrix_long_mul_elements*(a: ptr gsl_matrix_long; b: ptr gsl_matrix_long): cint {. cdecl, importc: "gsl_matrix_long_mul_elements", dynlib: libgsl.}
proc gsl_matrix_long_div_elements*(a: ptr gsl_matrix_long; b: ptr gsl_matrix_long): cint {. cdecl, importc: "gsl_matrix_long_div_elements", dynlib: libgsl.}
proc gsl_matrix_long_scale*(a: ptr gsl_matrix_long; x: cdouble): cint {.cdecl, importc: "gsl_matrix_long_scale", dynlib: libgsl.}
proc gsl_matrix_long_add_constant*(a: ptr gsl_matrix_long; x: cdouble): cint {.cdecl, importc: "gsl_matrix_long_add_constant", dynlib: libgsl.}
proc gsl_matrix_long_add_diagonal*(a: ptr gsl_matrix_long; x: cdouble): cint {.cdecl, importc: "gsl_matrix_long_add_diagonal", dynlib: libgsl.}
proc gsl_matrix_long_get_row*(v: ptr gsl_vector_long; m: ptr gsl_matrix_long;  i: csize_t): cint {.cdecl, importc: "gsl_matrix_long_get_row", dynlib: libgsl.}
proc gsl_matrix_long_get_col*(v: ptr gsl_vector_long; m: ptr gsl_matrix_long;  j: csize_t): cint {.cdecl, importc: "gsl_matrix_long_get_col", dynlib: libgsl.}
proc gsl_matrix_long_set_row*(m: ptr gsl_matrix_long; i: csize_t;  v: ptr gsl_vector_long): cint {.cdecl, importc: "gsl_matrix_long_set_row", dynlib: libgsl.}
proc gsl_matrix_long_set_col*(m: ptr gsl_matrix_long; j: csize_t;  v: ptr gsl_vector_long): cint {.cdecl, importc: "gsl_matrix_long_set_col", dynlib: libgsl.}
proc gsl_matrix_long_get*(m: ptr gsl_matrix_long; i: csize_t; j: csize_t): clong {.cdecl, importc: "gsl_matrix_long_get", dynlib: libgsl.}
proc gsl_matrix_long_set*(m: ptr gsl_matrix_long; i: csize_t; j: csize_t; x: clong) {. cdecl, importc: "gsl_matrix_long_set", dynlib: libgsl.}
proc gsl_matrix_long_ptr*(m: ptr gsl_matrix_long; i: csize_t; j: csize_t): ptr clong {. cdecl, importc: "gsl_matrix_long_ptr", dynlib: libgsl.}
proc gsl_matrix_long_const_ptr*(m: ptr gsl_matrix_long; i: csize_t; j: csize_t): ptr clong {. cdecl, importc: "gsl_matrix_long_const_ptr", dynlib: libgsl.}
proc gsl_matrix_uint_alloc*(n1: csize_t; n2: csize_t): ptr gsl_matrix_uint {.cdecl, importc: "gsl_matrix_uint_alloc", dynlib: libgsl.}
proc gsl_matrix_uint_calloc*(n1: csize_t; n2: csize_t): ptr gsl_matrix_uint {.cdecl, importc: "gsl_matrix_uint_calloc", dynlib: libgsl.}
proc gsl_matrix_uint_alloc_from_block*(b: ptr gsl_block_uint; offset: csize_t;   n1: csize_t; n2: csize_t; d2: csize_t): ptr gsl_matrix_uint {. cdecl, importc: "gsl_matrix_uint_alloc_from_block", dynlib: libgsl.}
proc gsl_matrix_uint_alloc_from_matrix*(m: ptr gsl_matrix_uint; k1: csize_t;    k2: csize_t; n1: csize_t; n2: csize_t): ptr gsl_matrix_uint {. cdecl, importc: "gsl_matrix_uint_alloc_from_matrix", dynlib: libgsl.}
proc gsl_vector_uint_alloc_row_from_matrix*(m: ptr gsl_matrix_uint; i: csize_t): ptr gsl_vector_uint {. cdecl, importc: "gsl_vector_uint_alloc_row_from_matrix", dynlib: libgsl.}
proc gsl_vector_uint_alloc_col_from_matrix*(m: ptr gsl_matrix_uint; j: csize_t): ptr gsl_vector_uint {. cdecl, importc: "gsl_vector_uint_alloc_col_from_matrix", dynlib: libgsl.}
proc gsl_matrix_uint_free*(m: ptr gsl_matrix_uint) {.cdecl, importc: "gsl_matrix_uint_free", dynlib: libgsl.}
proc gsl_matrix_uint_submatrix*(m: ptr gsl_matrix_uint; i: csize_t; j: csize_t; n1: csize_t; n2: csize_t): gsl_matrix_uint_view {. cdecl, importc: "gsl_matrix_uint_submatrix", dynlib: libgsl.}
proc gsl_matrix_uint_row*(m: ptr gsl_matrix_uint; i: csize_t): gsl_vector_uint_view {. cdecl, importc: "gsl_matrix_uint_row", dynlib: libgsl.}
proc gsl_matrix_uint_column*(m: ptr gsl_matrix_uint; j: csize_t): gsl_vector_uint_view {. cdecl, importc: "gsl_matrix_uint_column", dynlib: libgsl.}
proc gsl_matrix_uint_diagonal*(m: ptr gsl_matrix_uint): gsl_vector_uint_view {.cdecl, importc: "gsl_matrix_uint_diagonal", dynlib: libgsl.}
proc gsl_matrix_uint_subdiagonal*(m: ptr gsl_matrix_uint; k: csize_t): gsl_vector_uint_view {. cdecl, importc: "gsl_matrix_uint_subdiagonal", dynlib: libgsl.}
proc gsl_matrix_uint_superdiagonal*(m: ptr gsl_matrix_uint; k: csize_t): gsl_vector_uint_view {. cdecl, importc: "gsl_matrix_uint_superdiagonal", dynlib: libgsl.}
proc gsl_matrix_uint_subrow*(m: ptr gsl_matrix_uint; i: csize_t; offset: csize_t; n: csize_t): gsl_vector_uint_view {.cdecl, importc: "gsl_matrix_uint_subrow", dynlib: libgsl.}
proc gsl_matrix_uint_subcolumn*(m: ptr gsl_matrix_uint; j: csize_t; offset: csize_t; n: csize_t): gsl_vector_uint_view {.cdecl, importc: "gsl_matrix_uint_subcolumn", dynlib: libgsl.}
proc gsl_matrix_uint_view_array*(base: ptr cuint; n1: csize_t; n2: csize_t): gsl_matrix_uint_view {. cdecl, importc: "gsl_matrix_uint_view_array", dynlib: libgsl.}
proc gsl_matrix_uint_view_array_with_tda*(base: ptr cuint; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_uint_view {.cdecl, importc: "gsl_matrix_uint_view_array_with_tda", dynlib: libgsl.}
proc gsl_matrix_uint_view_vector*(v: ptr gsl_vector_uint; n1: csize_t; n2: csize_t): gsl_matrix_uint_view {. cdecl, importc: "gsl_matrix_uint_view_vector", dynlib: libgsl.}
proc gsl_matrix_uint_view_vector_with_tda*(v: ptr gsl_vector_uint; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_uint_view {.cdecl, importc: "gsl_matrix_uint_view_vector_with_tda", dynlib: libgsl.}
proc gsl_matrix_uint_const_submatrix*(m: ptr gsl_matrix_uint; i: csize_t; j: csize_t;  n1: csize_t; n2: csize_t): gsl_matrix_uint_const_view {. cdecl, importc: "gsl_matrix_uint_const_submatrix", dynlib: libgsl.}
proc gsl_matrix_uint_const_row*(m: ptr gsl_matrix_uint; i: csize_t): gsl_vector_uint_const_view {. cdecl, importc: "gsl_matrix_uint_const_row", dynlib: libgsl.}
proc gsl_matrix_uint_const_column*(m: ptr gsl_matrix_uint; j: csize_t): gsl_vector_uint_const_view {. cdecl, importc: "gsl_matrix_uint_const_column", dynlib: libgsl.}
proc gsl_matrix_uint_const_diagonal*(m: ptr gsl_matrix_uint): gsl_vector_uint_const_view {. cdecl, importc: "gsl_matrix_uint_const_diagonal", dynlib: libgsl.}
proc gsl_matrix_uint_const_subdiagonal*(m: ptr gsl_matrix_uint; k: csize_t): gsl_vector_uint_const_view {. cdecl, importc: "gsl_matrix_uint_const_subdiagonal", dynlib: libgsl.}
proc gsl_matrix_uint_const_superdiagonal*(m: ptr gsl_matrix_uint; k: csize_t): gsl_vector_uint_const_view {. cdecl, importc: "gsl_matrix_uint_const_superdiagonal", dynlib: libgsl.}
proc gsl_matrix_uint_const_subrow*(m: ptr gsl_matrix_uint; i: csize_t; offset: csize_t; n: csize_t): gsl_vector_uint_const_view {. cdecl, importc: "gsl_matrix_uint_const_subrow", dynlib: libgsl.}
proc gsl_matrix_uint_const_subcolumn*(m: ptr gsl_matrix_uint; j: csize_t;  offset: csize_t; n: csize_t): gsl_vector_uint_const_view {. cdecl, importc: "gsl_matrix_uint_const_subcolumn", dynlib: libgsl.}
proc gsl_matrix_uint_const_view_array*(base: ptr cuint; n1: csize_t; n2: csize_t): gsl_matrix_uint_const_view {. cdecl, importc: "gsl_matrix_uint_const_view_array", dynlib: libgsl.}
proc gsl_matrix_uint_const_view_array_with_tda*(base: ptr cuint; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_uint_const_view {.cdecl, importc: "gsl_matrix_uint_const_view_array_with_tda", dynlib: libgsl.}
proc gsl_matrix_uint_const_view_vector*(v: ptr gsl_vector_uint; n1: csize_t;    n2: csize_t): gsl_matrix_uint_const_view {. cdecl, importc: "gsl_matrix_uint_const_view_vector", dynlib: libgsl.}
proc gsl_matrix_uint_const_view_vector_with_tda*(v: ptr gsl_vector_uint; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_uint_const_view {.cdecl, importc: "gsl_matrix_uint_const_view_vector_with_tda", dynlib: libgsl.}
proc gsl_matrix_uint_set_zero*(m: ptr gsl_matrix_uint) {.cdecl, importc: "gsl_matrix_uint_set_zero", dynlib: libgsl.}
proc gsl_matrix_uint_set_identity*(m: ptr gsl_matrix_uint) {.cdecl, importc: "gsl_matrix_uint_set_identity", dynlib: libgsl.}
proc gsl_matrix_uint_set_all*(m: ptr gsl_matrix_uint; x: cuint) {.cdecl, importc: "gsl_matrix_uint_set_all", dynlib: libgsl.}
proc gsl_matrix_uint_fread*(stream: ptr FILE; m: ptr gsl_matrix_uint): cint {.cdecl, importc: "gsl_matrix_uint_fread", dynlib: libgsl.}
proc gsl_matrix_uint_fwrite*(stream: ptr FILE; m: ptr gsl_matrix_uint): cint {.cdecl, importc: "gsl_matrix_uint_fwrite", dynlib: libgsl.}
proc gsl_matrix_uint_fscanf*(stream: ptr FILE; m: ptr gsl_matrix_uint): cint {.cdecl, importc: "gsl_matrix_uint_fscanf", dynlib: libgsl.}
proc gsl_matrix_uint_fprintf*(stream: ptr FILE; m: ptr gsl_matrix_uint; format: cstring): cint {. cdecl, importc: "gsl_matrix_uint_fprintf", dynlib: libgsl.}
proc gsl_matrix_uint_memcpy*(dest: ptr gsl_matrix_uint; src: ptr gsl_matrix_uint): cint {. cdecl, importc: "gsl_matrix_uint_memcpy", dynlib: libgsl.}
proc gsl_matrix_uint_swap*(m1: ptr gsl_matrix_uint; m2: ptr gsl_matrix_uint): cint {. cdecl, importc: "gsl_matrix_uint_swap", dynlib: libgsl.}
proc gsl_matrix_uint_tricpy*(uplo_src: char; copy_diag: cint; dest: ptr gsl_matrix_uint; src: ptr gsl_matrix_uint): cint {. cdecl, importc: "gsl_matrix_uint_tricpy", dynlib: libgsl.}
proc gsl_matrix_uint_swap_rows*(m: ptr gsl_matrix_uint; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_matrix_uint_swap_rows", dynlib: libgsl.}
proc gsl_matrix_uint_swap_columns*(m: ptr gsl_matrix_uint; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_matrix_uint_swap_columns", dynlib: libgsl.}
proc gsl_matrix_uint_swap_rowcol*(m: ptr gsl_matrix_uint; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_matrix_uint_swap_rowcol", dynlib: libgsl.}
proc gsl_matrix_uint_transpose*(m: ptr gsl_matrix_uint): cint {.cdecl, importc: "gsl_matrix_uint_transpose", dynlib: libgsl.}
proc gsl_matrix_uint_transpose_memcpy*(dest: ptr gsl_matrix_uint;   src: ptr gsl_matrix_uint): cint {.cdecl, importc: "gsl_matrix_uint_transpose_memcpy", dynlib: libgsl.}
proc gsl_matrix_uint_transpose_tricpy*(uplo_src: char; copy_diag: cint;   dest: ptr gsl_matrix_uint;   src: ptr gsl_matrix_uint): cint {.cdecl, importc: "gsl_matrix_uint_transpose_tricpy", dynlib: libgsl.}
proc gsl_matrix_uint_max*(m: ptr gsl_matrix_uint): cuint {.cdecl, importc: "gsl_matrix_uint_max", dynlib: libgsl.}
proc gsl_matrix_uint_min*(m: ptr gsl_matrix_uint): cuint {.cdecl, importc: "gsl_matrix_uint_min", dynlib: libgsl.}
proc gsl_matrix_uint_minmax*(m: ptr gsl_matrix_uint; min_out: ptr cuint; max_out: ptr cuint) {.cdecl, importc: "gsl_matrix_uint_minmax", dynlib: libgsl.}
proc gsl_matrix_uint_max_index*(m: ptr gsl_matrix_uint; imax: ptr csize_t; jmax: ptr csize_t) {.cdecl, importc: "gsl_matrix_uint_max_index", dynlib: libgsl.}
proc gsl_matrix_uint_min_index*(m: ptr gsl_matrix_uint; imin: ptr csize_t; jmin: ptr csize_t) {.cdecl, importc: "gsl_matrix_uint_min_index", dynlib: libgsl.}
proc gsl_matrix_uint_minmax_index*(m: ptr gsl_matrix_uint; imin: ptr csize_t; jmin: ptr csize_t; imax: ptr csize_t; jmax: ptr csize_t) {.cdecl, importc: "gsl_matrix_uint_minmax_index", dynlib: libgsl.}
proc gsl_matrix_uint_equal*(a: ptr gsl_matrix_uint; b: ptr gsl_matrix_uint): cint {. cdecl, importc: "gsl_matrix_uint_equal", dynlib: libgsl.}
proc gsl_matrix_uint_isnull*(m: ptr gsl_matrix_uint): cint {.cdecl, importc: "gsl_matrix_uint_isnull", dynlib: libgsl.}
proc gsl_matrix_uint_ispos*(m: ptr gsl_matrix_uint): cint {.cdecl, importc: "gsl_matrix_uint_ispos", dynlib: libgsl.}
proc gsl_matrix_uint_isneg*(m: ptr gsl_matrix_uint): cint {.cdecl, importc: "gsl_matrix_uint_isneg", dynlib: libgsl.}
proc gsl_matrix_uint_isnonneg*(m: ptr gsl_matrix_uint): cint {.cdecl, importc: "gsl_matrix_uint_isnonneg", dynlib: libgsl.}
proc gsl_matrix_uint_add*(a: ptr gsl_matrix_uint; b: ptr gsl_matrix_uint): cint {.cdecl, importc: "gsl_matrix_uint_add", dynlib: libgsl.}
proc gsl_matrix_uint_sub*(a: ptr gsl_matrix_uint; b: ptr gsl_matrix_uint): cint {.cdecl, importc: "gsl_matrix_uint_sub", dynlib: libgsl.}
proc gsl_matrix_uint_mul_elements*(a: ptr gsl_matrix_uint; b: ptr gsl_matrix_uint): cint {. cdecl, importc: "gsl_matrix_uint_mul_elements", dynlib: libgsl.}
proc gsl_matrix_uint_div_elements*(a: ptr gsl_matrix_uint; b: ptr gsl_matrix_uint): cint {. cdecl, importc: "gsl_matrix_uint_div_elements", dynlib: libgsl.}
proc gsl_matrix_uint_scale*(a: ptr gsl_matrix_uint; x: cdouble): cint {.cdecl, importc: "gsl_matrix_uint_scale", dynlib: libgsl.}
proc gsl_matrix_uint_add_constant*(a: ptr gsl_matrix_uint; x: cdouble): cint {.cdecl, importc: "gsl_matrix_uint_add_constant", dynlib: libgsl.}
proc gsl_matrix_uint_add_diagonal*(a: ptr gsl_matrix_uint; x: cdouble): cint {.cdecl, importc: "gsl_matrix_uint_add_diagonal", dynlib: libgsl.}
proc gsl_matrix_uint_get_row*(v: ptr gsl_vector_uint; m: ptr gsl_matrix_uint;  i: csize_t): cint {.cdecl, importc: "gsl_matrix_uint_get_row", dynlib: libgsl.}
proc gsl_matrix_uint_get_col*(v: ptr gsl_vector_uint; m: ptr gsl_matrix_uint;  j: csize_t): cint {.cdecl, importc: "gsl_matrix_uint_get_col", dynlib: libgsl.}
proc gsl_matrix_uint_set_row*(m: ptr gsl_matrix_uint; i: csize_t;  v: ptr gsl_vector_uint): cint {.cdecl, importc: "gsl_matrix_uint_set_row", dynlib: libgsl.}
proc gsl_matrix_uint_set_col*(m: ptr gsl_matrix_uint; j: csize_t;  v: ptr gsl_vector_uint): cint {.cdecl, importc: "gsl_matrix_uint_set_col", dynlib: libgsl.}
proc gsl_matrix_uint_get*(m: ptr gsl_matrix_uint; i: csize_t; j: csize_t): cuint {.cdecl, importc: "gsl_matrix_uint_get", dynlib: libgsl.}
proc gsl_matrix_uint_set*(m: ptr gsl_matrix_uint; i: csize_t; j: csize_t; x: cuint) {. cdecl, importc: "gsl_matrix_uint_set", dynlib: libgsl.}
proc gsl_matrix_uint_ptr*(m: ptr gsl_matrix_uint; i: csize_t; j: csize_t): ptr cuint {. cdecl, importc: "gsl_matrix_uint_ptr", dynlib: libgsl.}
proc gsl_matrix_uint_const_ptr*(m: ptr gsl_matrix_uint; i: csize_t; j: csize_t): ptr cuint {. cdecl, importc: "gsl_matrix_uint_const_ptr", dynlib: libgsl.}
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
proc gsl_matrix_ushort_alloc*(n1: csize_t; n2: csize_t): ptr gsl_matrix_ushort {.cdecl, importc: "gsl_matrix_ushort_alloc", dynlib: libgsl.}
proc gsl_matrix_ushort_calloc*(n1: csize_t; n2: csize_t): ptr gsl_matrix_ushort {. cdecl, importc: "gsl_matrix_ushort_calloc", dynlib: libgsl.}
proc gsl_matrix_ushort_alloc_from_block*(b: ptr gsl_block_ushort; offset: csize_t; n1: csize_t; n2: csize_t; d2: csize_t): ptr gsl_matrix_ushort {. cdecl, importc: "gsl_matrix_ushort_alloc_from_block", dynlib: libgsl.}
proc gsl_matrix_ushort_alloc_from_matrix*(m: ptr gsl_matrix_ushort; k1: csize_t; k2: csize_t; n1: csize_t; n2: csize_t): ptr gsl_matrix_ushort {.cdecl, importc: "gsl_matrix_ushort_alloc_from_matrix", dynlib: libgsl.}
proc gsl_vector_ushort_alloc_row_from_matrix*(m: ptr gsl_matrix_ushort; i: csize_t): ptr gsl_vector_ushort {. cdecl, importc: "gsl_vector_ushort_alloc_row_from_matrix", dynlib: libgsl.}
proc gsl_vector_ushort_alloc_col_from_matrix*(m: ptr gsl_matrix_ushort; j: csize_t): ptr gsl_vector_ushort {. cdecl, importc: "gsl_vector_ushort_alloc_col_from_matrix", dynlib: libgsl.}
proc gsl_matrix_ushort_free*(m: ptr gsl_matrix_ushort) {.cdecl, importc: "gsl_matrix_ushort_free", dynlib: libgsl.}
proc gsl_matrix_ushort_submatrix*(m: ptr gsl_matrix_ushort; i: csize_t; j: csize_t; n1: csize_t; n2: csize_t): gsl_matrix_ushort_view {. cdecl, importc: "gsl_matrix_ushort_submatrix", dynlib: libgsl.}
proc gsl_matrix_ushort_row*(m: ptr gsl_matrix_ushort; i: csize_t): gsl_vector_ushort_view {. cdecl, importc: "gsl_matrix_ushort_row", dynlib: libgsl.}
proc gsl_matrix_ushort_column*(m: ptr gsl_matrix_ushort; j: csize_t): gsl_vector_ushort_view {. cdecl, importc: "gsl_matrix_ushort_column", dynlib: libgsl.}
proc gsl_matrix_ushort_diagonal*(m: ptr gsl_matrix_ushort): gsl_vector_ushort_view {. cdecl, importc: "gsl_matrix_ushort_diagonal", dynlib: libgsl.}
proc gsl_matrix_ushort_subdiagonal*(m: ptr gsl_matrix_ushort; k: csize_t): gsl_vector_ushort_view {. cdecl, importc: "gsl_matrix_ushort_subdiagonal", dynlib: libgsl.}
proc gsl_matrix_ushort_superdiagonal*(m: ptr gsl_matrix_ushort; k: csize_t): gsl_vector_ushort_view {. cdecl, importc: "gsl_matrix_ushort_superdiagonal", dynlib: libgsl.}
proc gsl_matrix_ushort_subrow*(m: ptr gsl_matrix_ushort; i: csize_t; offset: csize_t;   n: csize_t): gsl_vector_ushort_view {.cdecl, importc: "gsl_matrix_ushort_subrow", dynlib: libgsl.}
proc gsl_matrix_ushort_subcolumn*(m: ptr gsl_matrix_ushort; j: csize_t; offset: csize_t; n: csize_t): gsl_vector_ushort_view {. cdecl, importc: "gsl_matrix_ushort_subcolumn", dynlib: libgsl.}
proc gsl_matrix_ushort_view_array*(base: ptr cushort; n1: csize_t; n2: csize_t): gsl_matrix_ushort_view {. cdecl, importc: "gsl_matrix_ushort_view_array", dynlib: libgsl.}
proc gsl_matrix_ushort_view_array_with_tda*(base: ptr cushort; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_ushort_view {.cdecl, importc: "gsl_matrix_ushort_view_array_with_tda", dynlib: libgsl.}
proc gsl_matrix_ushort_view_vector*(v: ptr gsl_vector_ushort; n1: csize_t; n2: csize_t): gsl_matrix_ushort_view {. cdecl, importc: "gsl_matrix_ushort_view_vector", dynlib: libgsl.}
proc gsl_matrix_ushort_view_vector_with_tda*(v: ptr gsl_vector_ushort; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_ushort_view {.cdecl, importc: "gsl_matrix_ushort_view_vector_with_tda", dynlib: libgsl.}
proc gsl_matrix_ushort_const_submatrix*(m: ptr gsl_matrix_ushort; i: csize_t;    j: csize_t; n1: csize_t; n2: csize_t): gsl_matrix_ushort_const_view {. cdecl, importc: "gsl_matrix_ushort_const_submatrix", dynlib: libgsl.}
proc gsl_matrix_ushort_const_row*(m: ptr gsl_matrix_ushort; i: csize_t): gsl_vector_ushort_const_view {. cdecl, importc: "gsl_matrix_ushort_const_row", dynlib: libgsl.}
proc gsl_matrix_ushort_const_column*(m: ptr gsl_matrix_ushort; j: csize_t): gsl_vector_ushort_const_view {. cdecl, importc: "gsl_matrix_ushort_const_column", dynlib: libgsl.}
proc gsl_matrix_ushort_const_diagonal*(m: ptr gsl_matrix_ushort): gsl_vector_ushort_const_view {. cdecl, importc: "gsl_matrix_ushort_const_diagonal", dynlib: libgsl.}
proc gsl_matrix_ushort_const_subdiagonal*(m: ptr gsl_matrix_ushort; k: csize_t): gsl_vector_ushort_const_view {. cdecl, importc: "gsl_matrix_ushort_const_subdiagonal", dynlib: libgsl.}
proc gsl_matrix_ushort_const_superdiagonal*(m: ptr gsl_matrix_ushort; k: csize_t): gsl_vector_ushort_const_view {. cdecl, importc: "gsl_matrix_ushort_const_superdiagonal", dynlib: libgsl.}
proc gsl_matrix_ushort_const_subrow*(m: ptr gsl_matrix_ushort; i: csize_t; offset: csize_t; n: csize_t): gsl_vector_ushort_const_view {. cdecl, importc: "gsl_matrix_ushort_const_subrow", dynlib: libgsl.}
proc gsl_matrix_ushort_const_subcolumn*(m: ptr gsl_matrix_ushort; j: csize_t;    offset: csize_t; n: csize_t): gsl_vector_ushort_const_view {. cdecl, importc: "gsl_matrix_ushort_const_subcolumn", dynlib: libgsl.}
proc gsl_matrix_ushort_const_view_array*(base: ptr cushort; n1: csize_t; n2: csize_t): gsl_matrix_ushort_const_view {. cdecl, importc: "gsl_matrix_ushort_const_view_array", dynlib: libgsl.}
proc gsl_matrix_ushort_const_view_array_with_tda*(base: ptr cushort; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_ushort_const_view {.cdecl, importc: "gsl_matrix_ushort_const_view_array_with_tda", dynlib: libgsl.}
proc gsl_matrix_ushort_const_view_vector*(v: ptr gsl_vector_ushort; n1: csize_t; n2: csize_t): gsl_matrix_ushort_const_view {.cdecl, importc: "gsl_matrix_ushort_const_view_vector", dynlib: libgsl.}
proc gsl_matrix_ushort_const_view_vector_with_tda*(v: ptr gsl_vector_ushort; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_ushort_const_view {.cdecl, importc: "gsl_matrix_ushort_const_view_vector_with_tda", dynlib: libgsl.}
proc gsl_matrix_ushort_set_zero*(m: ptr gsl_matrix_ushort) {.cdecl, importc: "gsl_matrix_ushort_set_zero", dynlib: libgsl.}
proc gsl_matrix_ushort_set_identity*(m: ptr gsl_matrix_ushort) {.cdecl, importc: "gsl_matrix_ushort_set_identity", dynlib: libgsl.}
proc gsl_matrix_ushort_set_all*(m: ptr gsl_matrix_ushort; x: cushort) {.cdecl, importc: "gsl_matrix_ushort_set_all", dynlib: libgsl.}
proc gsl_matrix_ushort_fread*(stream: ptr FILE; m: ptr gsl_matrix_ushort): cint {.cdecl, importc: "gsl_matrix_ushort_fread", dynlib: libgsl.}
proc gsl_matrix_ushort_fwrite*(stream: ptr FILE; m: ptr gsl_matrix_ushort): cint {. cdecl, importc: "gsl_matrix_ushort_fwrite", dynlib: libgsl.}
proc gsl_matrix_ushort_fscanf*(stream: ptr FILE; m: ptr gsl_matrix_ushort): cint {. cdecl, importc: "gsl_matrix_ushort_fscanf", dynlib: libgsl.}
proc gsl_matrix_ushort_fprintf*(stream: ptr FILE; m: ptr gsl_matrix_ushort; format: cstring): cint {.cdecl, importc: "gsl_matrix_ushort_fprintf", dynlib: libgsl.}
proc gsl_matrix_ushort_memcpy*(dest: ptr gsl_matrix_ushort;   src: ptr gsl_matrix_ushort): cint {.cdecl, importc: "gsl_matrix_ushort_memcpy", dynlib: libgsl.}
proc gsl_matrix_ushort_swap*(m1: ptr gsl_matrix_ushort; m2: ptr gsl_matrix_ushort): cint {. cdecl, importc: "gsl_matrix_ushort_swap", dynlib: libgsl.}
proc gsl_matrix_ushort_tricpy*(uplo_src: char; copy_diag: cint;   dest: ptr gsl_matrix_ushort;   src: ptr gsl_matrix_ushort): cint {.cdecl, importc: "gsl_matrix_ushort_tricpy", dynlib: libgsl.}
proc gsl_matrix_ushort_swap_rows*(m: ptr gsl_matrix_ushort; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_matrix_ushort_swap_rows", dynlib: libgsl.}
proc gsl_matrix_ushort_swap_columns*(m: ptr gsl_matrix_ushort; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_matrix_ushort_swap_columns", dynlib: libgsl.}
proc gsl_matrix_ushort_swap_rowcol*(m: ptr gsl_matrix_ushort; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_matrix_ushort_swap_rowcol", dynlib: libgsl.}
proc gsl_matrix_ushort_transpose*(m: ptr gsl_matrix_ushort): cint {.cdecl, importc: "gsl_matrix_ushort_transpose", dynlib: libgsl.}
proc gsl_matrix_ushort_transpose_memcpy*(dest: ptr gsl_matrix_ushort; src: ptr gsl_matrix_ushort): cint {.cdecl, importc: "gsl_matrix_ushort_transpose_memcpy", dynlib: libgsl.}
proc gsl_matrix_ushort_transpose_tricpy*(uplo_src: char; copy_diag: cint; dest: ptr gsl_matrix_ushort; src: ptr gsl_matrix_ushort): cint {.cdecl, importc: "gsl_matrix_ushort_transpose_tricpy", dynlib: libgsl.}
proc gsl_matrix_ushort_max*(m: ptr gsl_matrix_ushort): cushort {.cdecl, importc: "gsl_matrix_ushort_max", dynlib: libgsl.}
proc gsl_matrix_ushort_min*(m: ptr gsl_matrix_ushort): cushort {.cdecl, importc: "gsl_matrix_ushort_min", dynlib: libgsl.}
proc gsl_matrix_ushort_minmax*(m: ptr gsl_matrix_ushort; min_out: ptr cushort;   max_out: ptr cushort) {.cdecl, importc: "gsl_matrix_ushort_minmax", dynlib: libgsl.}
proc gsl_matrix_ushort_max_index*(m: ptr gsl_matrix_ushort; imax: ptr csize_t; jmax: ptr csize_t) {.cdecl, importc: "gsl_matrix_ushort_max_index", dynlib: libgsl.}
proc gsl_matrix_ushort_min_index*(m: ptr gsl_matrix_ushort; imin: ptr csize_t; jmin: ptr csize_t) {.cdecl, importc: "gsl_matrix_ushort_min_index", dynlib: libgsl.}
proc gsl_matrix_ushort_minmax_index*(m: ptr gsl_matrix_ushort; imin: ptr csize_t; jmin: ptr csize_t; imax: ptr csize_t; jmax: ptr csize_t) {.cdecl, importc: "gsl_matrix_ushort_minmax_index", dynlib: libgsl.}
proc gsl_matrix_ushort_equal*(a: ptr gsl_matrix_ushort; b: ptr gsl_matrix_ushort): cint {. cdecl, importc: "gsl_matrix_ushort_equal", dynlib: libgsl.}
proc gsl_matrix_ushort_isnull*(m: ptr gsl_matrix_ushort): cint {.cdecl, importc: "gsl_matrix_ushort_isnull", dynlib: libgsl.}
proc gsl_matrix_ushort_ispos*(m: ptr gsl_matrix_ushort): cint {.cdecl, importc: "gsl_matrix_ushort_ispos", dynlib: libgsl.}
proc gsl_matrix_ushort_isneg*(m: ptr gsl_matrix_ushort): cint {.cdecl, importc: "gsl_matrix_ushort_isneg", dynlib: libgsl.}
proc gsl_matrix_ushort_isnonneg*(m: ptr gsl_matrix_ushort): cint {.cdecl, importc: "gsl_matrix_ushort_isnonneg", dynlib: libgsl.}
proc gsl_matrix_ushort_add*(a: ptr gsl_matrix_ushort; b: ptr gsl_matrix_ushort): cint {. cdecl, importc: "gsl_matrix_ushort_add", dynlib: libgsl.}
proc gsl_matrix_ushort_sub*(a: ptr gsl_matrix_ushort; b: ptr gsl_matrix_ushort): cint {. cdecl, importc: "gsl_matrix_ushort_sub", dynlib: libgsl.}
proc gsl_matrix_ushort_mul_elements*(a: ptr gsl_matrix_ushort; b: ptr gsl_matrix_ushort): cint {.cdecl, importc: "gsl_matrix_ushort_mul_elements", dynlib: libgsl.}
proc gsl_matrix_ushort_div_elements*(a: ptr gsl_matrix_ushort; b: ptr gsl_matrix_ushort): cint {.cdecl, importc: "gsl_matrix_ushort_div_elements", dynlib: libgsl.}
proc gsl_matrix_ushort_scale*(a: ptr gsl_matrix_ushort; x: cdouble): cint {.cdecl, importc: "gsl_matrix_ushort_scale", dynlib: libgsl.}
proc gsl_matrix_ushort_add_constant*(a: ptr gsl_matrix_ushort; x: cdouble): cint {. cdecl, importc: "gsl_matrix_ushort_add_constant", dynlib: libgsl.}
proc gsl_matrix_ushort_add_diagonal*(a: ptr gsl_matrix_ushort; x: cdouble): cint {. cdecl, importc: "gsl_matrix_ushort_add_diagonal", dynlib: libgsl.}
proc gsl_matrix_ushort_get_row*(v: ptr gsl_vector_ushort; m: ptr gsl_matrix_ushort; i: csize_t): cint {.cdecl, importc: "gsl_matrix_ushort_get_row", dynlib: libgsl.}
proc gsl_matrix_ushort_get_col*(v: ptr gsl_vector_ushort; m: ptr gsl_matrix_ushort; j: csize_t): cint {.cdecl, importc: "gsl_matrix_ushort_get_col", dynlib: libgsl.}
proc gsl_matrix_ushort_set_row*(m: ptr gsl_matrix_ushort; i: csize_t; v: ptr gsl_vector_ushort): cint {.cdecl, importc: "gsl_matrix_ushort_set_row", dynlib: libgsl.}
proc gsl_matrix_ushort_set_col*(m: ptr gsl_matrix_ushort; j: csize_t; v: ptr gsl_vector_ushort): cint {.cdecl, importc: "gsl_matrix_ushort_set_col", dynlib: libgsl.}
proc gsl_matrix_ushort_get*(m: ptr gsl_matrix_ushort; i: csize_t; j: csize_t): cushort {. cdecl, importc: "gsl_matrix_ushort_get", dynlib: libgsl.}
proc gsl_matrix_ushort_set*(m: ptr gsl_matrix_ushort; i: csize_t; j: csize_t; x: cushort) {. cdecl, importc: "gsl_matrix_ushort_set", dynlib: libgsl.}
proc gsl_matrix_ushort_ptr*(m: ptr gsl_matrix_ushort; i: csize_t; j: csize_t): ptr cushort {. cdecl, importc: "gsl_matrix_ushort_ptr", dynlib: libgsl.}
proc gsl_matrix_ushort_const_ptr*(m: ptr gsl_matrix_ushort; i: csize_t; j: csize_t): ptr cushort {. cdecl, importc: "gsl_matrix_ushort_const_ptr", dynlib: libgsl.}
proc gsl_matrix_short_alloc*(n1: csize_t; n2: csize_t): ptr gsl_matrix_short {.cdecl, importc: "gsl_matrix_short_alloc", dynlib: libgsl.}
proc gsl_matrix_short_calloc*(n1: csize_t; n2: csize_t): ptr gsl_matrix_short {.cdecl, importc: "gsl_matrix_short_calloc", dynlib: libgsl.}
proc gsl_matrix_short_alloc_from_block*(b: ptr gsl_block_short; offset: csize_t;    n1: csize_t; n2: csize_t; d2: csize_t): ptr gsl_matrix_short {. cdecl, importc: "gsl_matrix_short_alloc_from_block", dynlib: libgsl.}
proc gsl_matrix_short_alloc_from_matrix*(m: ptr gsl_matrix_short; k1: csize_t; k2: csize_t; n1: csize_t; n2: csize_t): ptr gsl_matrix_short {. cdecl, importc: "gsl_matrix_short_alloc_from_matrix", dynlib: libgsl.}
proc gsl_vector_short_alloc_row_from_matrix*(m: ptr gsl_matrix_short; i: csize_t): ptr gsl_vector_short {. cdecl, importc: "gsl_vector_short_alloc_row_from_matrix", dynlib: libgsl.}
proc gsl_vector_short_alloc_col_from_matrix*(m: ptr gsl_matrix_short; j: csize_t): ptr gsl_vector_short {. cdecl, importc: "gsl_vector_short_alloc_col_from_matrix", dynlib: libgsl.}
proc gsl_matrix_short_free*(m: ptr gsl_matrix_short) {.cdecl, importc: "gsl_matrix_short_free", dynlib: libgsl.}
proc gsl_matrix_short_submatrix*(m: ptr gsl_matrix_short; i: csize_t; j: csize_t; n1: csize_t; n2: csize_t): gsl_matrix_short_view {. cdecl, importc: "gsl_matrix_short_submatrix", dynlib: libgsl.}
proc gsl_matrix_short_row*(m: ptr gsl_matrix_short; i: csize_t): gsl_vector_short_view {. cdecl, importc: "gsl_matrix_short_row", dynlib: libgsl.}
proc gsl_matrix_short_column*(m: ptr gsl_matrix_short; j: csize_t): gsl_vector_short_view {. cdecl, importc: "gsl_matrix_short_column", dynlib: libgsl.}
proc gsl_matrix_short_diagonal*(m: ptr gsl_matrix_short): gsl_vector_short_view {. cdecl, importc: "gsl_matrix_short_diagonal", dynlib: libgsl.}
proc gsl_matrix_short_subdiagonal*(m: ptr gsl_matrix_short; k: csize_t): gsl_vector_short_view {. cdecl, importc: "gsl_matrix_short_subdiagonal", dynlib: libgsl.}
proc gsl_matrix_short_superdiagonal*(m: ptr gsl_matrix_short; k: csize_t): gsl_vector_short_view {. cdecl, importc: "gsl_matrix_short_superdiagonal", dynlib: libgsl.}
proc gsl_matrix_short_subrow*(m: ptr gsl_matrix_short; i: csize_t; offset: csize_t;  n: csize_t): gsl_vector_short_view {.cdecl, importc: "gsl_matrix_short_subrow", dynlib: libgsl.}
proc gsl_matrix_short_subcolumn*(m: ptr gsl_matrix_short; j: csize_t; offset: csize_t; n: csize_t): gsl_vector_short_view {.cdecl, importc: "gsl_matrix_short_subcolumn", dynlib: libgsl.}
proc gsl_matrix_short_view_array*(base: ptr cshort; n1: csize_t; n2: csize_t): gsl_matrix_short_view {. cdecl, importc: "gsl_matrix_short_view_array", dynlib: libgsl.}
proc gsl_matrix_short_view_array_with_tda*(base: ptr cshort; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_short_view {.cdecl, importc: "gsl_matrix_short_view_array_with_tda",  dynlib: libgsl.}
proc gsl_matrix_short_view_vector*(v: ptr gsl_vector_short; n1: csize_t; n2: csize_t): gsl_matrix_short_view {. cdecl, importc: "gsl_matrix_short_view_vector", dynlib: libgsl.}
proc gsl_matrix_short_view_vector_with_tda*(v: ptr gsl_vector_short; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_short_view {.cdecl, importc: "gsl_matrix_short_view_vector_with_tda", dynlib: libgsl.}
proc gsl_matrix_short_const_submatrix*(m: ptr gsl_matrix_short; i: csize_t;   j: csize_t; n1: csize_t; n2: csize_t): gsl_matrix_short_const_view {. cdecl, importc: "gsl_matrix_short_const_submatrix", dynlib: libgsl.}
proc gsl_matrix_short_const_row*(m: ptr gsl_matrix_short; i: csize_t): gsl_vector_short_const_view {. cdecl, importc: "gsl_matrix_short_const_row", dynlib: libgsl.}
proc gsl_matrix_short_const_column*(m: ptr gsl_matrix_short; j: csize_t): gsl_vector_short_const_view {. cdecl, importc: "gsl_matrix_short_const_column", dynlib: libgsl.}
proc gsl_matrix_short_const_diagonal*(m: ptr gsl_matrix_short): gsl_vector_short_const_view {. cdecl, importc: "gsl_matrix_short_const_diagonal", dynlib: libgsl.}
proc gsl_matrix_short_const_subdiagonal*(m: ptr gsl_matrix_short; k: csize_t): gsl_vector_short_const_view {. cdecl, importc: "gsl_matrix_short_const_subdiagonal", dynlib: libgsl.}
proc gsl_matrix_short_const_superdiagonal*(m: ptr gsl_matrix_short; k: csize_t): gsl_vector_short_const_view {. cdecl, importc: "gsl_matrix_short_const_superdiagonal", dynlib: libgsl.}
proc gsl_matrix_short_const_subrow*(m: ptr gsl_matrix_short; i: csize_t;  offset: csize_t; n: csize_t): gsl_vector_short_const_view {. cdecl, importc: "gsl_matrix_short_const_subrow", dynlib: libgsl.}
proc gsl_matrix_short_const_subcolumn*(m: ptr gsl_matrix_short; j: csize_t;   offset: csize_t; n: csize_t): gsl_vector_short_const_view {. cdecl, importc: "gsl_matrix_short_const_subcolumn", dynlib: libgsl.}
proc gsl_matrix_short_const_view_array*(base: ptr cshort; n1: csize_t; n2: csize_t): gsl_matrix_short_const_view {. cdecl, importc: "gsl_matrix_short_const_view_array", dynlib: libgsl.}
proc gsl_matrix_short_const_view_array_with_tda*(base: ptr cshort; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_short_const_view {.cdecl, importc: "gsl_matrix_short_const_view_array_with_tda", dynlib: libgsl.}
proc gsl_matrix_short_const_view_vector*(v: ptr gsl_vector_short; n1: csize_t; n2: csize_t): gsl_matrix_short_const_view {. cdecl, importc: "gsl_matrix_short_const_view_vector", dynlib: libgsl.}
proc gsl_matrix_short_const_view_vector_with_tda*(v: ptr gsl_vector_short; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_short_const_view {.cdecl, importc: "gsl_matrix_short_const_view_vector_with_tda", dynlib: libgsl.}
proc gsl_matrix_short_set_zero*(m: ptr gsl_matrix_short) {.cdecl, importc: "gsl_matrix_short_set_zero", dynlib: libgsl.}
proc gsl_matrix_short_set_identity*(m: ptr gsl_matrix_short) {.cdecl, importc: "gsl_matrix_short_set_identity", dynlib: libgsl.}
proc gsl_matrix_short_set_all*(m: ptr gsl_matrix_short; x: cshort) {.cdecl, importc: "gsl_matrix_short_set_all", dynlib: libgsl.}
proc gsl_matrix_short_fread*(stream: ptr FILE; m: ptr gsl_matrix_short): cint {.cdecl, importc: "gsl_matrix_short_fread", dynlib: libgsl.}
proc gsl_matrix_short_fwrite*(stream: ptr FILE; m: ptr gsl_matrix_short): cint {.cdecl, importc: "gsl_matrix_short_fwrite", dynlib: libgsl.}
proc gsl_matrix_short_fscanf*(stream: ptr FILE; m: ptr gsl_matrix_short): cint {.cdecl, importc: "gsl_matrix_short_fscanf", dynlib: libgsl.}
proc gsl_matrix_short_fprintf*(stream: ptr FILE; m: ptr gsl_matrix_short;   format: cstring): cint {.cdecl, importc: "gsl_matrix_short_fprintf", dynlib: libgsl.}
proc gsl_matrix_short_memcpy*(dest: ptr gsl_matrix_short; src: ptr gsl_matrix_short): cint {. cdecl, importc: "gsl_matrix_short_memcpy", dynlib: libgsl.}
proc gsl_matrix_short_swap*(m1: ptr gsl_matrix_short; m2: ptr gsl_matrix_short): cint {. cdecl, importc: "gsl_matrix_short_swap", dynlib: libgsl.}
proc gsl_matrix_short_tricpy*(uplo_src: char; copy_diag: cint;  dest: ptr gsl_matrix_short; src: ptr gsl_matrix_short): cint {. cdecl, importc: "gsl_matrix_short_tricpy", dynlib: libgsl.}
proc gsl_matrix_short_swap_rows*(m: ptr gsl_matrix_short; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_matrix_short_swap_rows", dynlib: libgsl.}
proc gsl_matrix_short_swap_columns*(m: ptr gsl_matrix_short; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_matrix_short_swap_columns", dynlib: libgsl.}
proc gsl_matrix_short_swap_rowcol*(m: ptr gsl_matrix_short; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_matrix_short_swap_rowcol", dynlib: libgsl.}
proc gsl_matrix_short_transpose*(m: ptr gsl_matrix_short): cint {.cdecl, importc: "gsl_matrix_short_transpose", dynlib: libgsl.}
proc gsl_matrix_short_transpose_memcpy*(dest: ptr gsl_matrix_short;    src: ptr gsl_matrix_short): cint {.cdecl, importc: "gsl_matrix_short_transpose_memcpy", dynlib: libgsl.}
proc gsl_matrix_short_transpose_tricpy*(uplo_src: char; copy_diag: cint;    dest: ptr gsl_matrix_short;    src: ptr gsl_matrix_short): cint {.cdecl, importc: "gsl_matrix_short_transpose_tricpy", dynlib: libgsl.}
proc gsl_matrix_short_max*(m: ptr gsl_matrix_short): cshort {.cdecl, importc: "gsl_matrix_short_max", dynlib: libgsl.}
proc gsl_matrix_short_min*(m: ptr gsl_matrix_short): cshort {.cdecl, importc: "gsl_matrix_short_min", dynlib: libgsl.}
proc gsl_matrix_short_minmax*(m: ptr gsl_matrix_short; min_out: ptr cshort;  max_out: ptr cshort) {.cdecl, importc: "gsl_matrix_short_minmax", dynlib: libgsl.}
proc gsl_matrix_short_max_index*(m: ptr gsl_matrix_short; imax: ptr csize_t; jmax: ptr csize_t) {.cdecl, importc: "gsl_matrix_short_max_index", dynlib: libgsl.}
proc gsl_matrix_short_min_index*(m: ptr gsl_matrix_short; imin: ptr csize_t; jmin: ptr csize_t) {.cdecl, importc: "gsl_matrix_short_min_index", dynlib: libgsl.}
proc gsl_matrix_short_minmax_index*(m: ptr gsl_matrix_short; imin: ptr csize_t;  jmin: ptr csize_t; imax: ptr csize_t;  jmax: ptr csize_t) {.cdecl, importc: "gsl_matrix_short_minmax_index", dynlib: libgsl.}
proc gsl_matrix_short_equal*(a: ptr gsl_matrix_short; b: ptr gsl_matrix_short): cint {. cdecl, importc: "gsl_matrix_short_equal", dynlib: libgsl.}
proc gsl_matrix_short_isnull*(m: ptr gsl_matrix_short): cint {.cdecl, importc: "gsl_matrix_short_isnull", dynlib: libgsl.}
proc gsl_matrix_short_ispos*(m: ptr gsl_matrix_short): cint {.cdecl, importc: "gsl_matrix_short_ispos", dynlib: libgsl.}
proc gsl_matrix_short_isneg*(m: ptr gsl_matrix_short): cint {.cdecl, importc: "gsl_matrix_short_isneg", dynlib: libgsl.}
proc gsl_matrix_short_isnonneg*(m: ptr gsl_matrix_short): cint {.cdecl, importc: "gsl_matrix_short_isnonneg", dynlib: libgsl.}
proc gsl_matrix_short_add*(a: ptr gsl_matrix_short; b: ptr gsl_matrix_short): cint {. cdecl, importc: "gsl_matrix_short_add", dynlib: libgsl.}
proc gsl_matrix_short_sub*(a: ptr gsl_matrix_short; b: ptr gsl_matrix_short): cint {. cdecl, importc: "gsl_matrix_short_sub", dynlib: libgsl.}
proc gsl_matrix_short_mul_elements*(a: ptr gsl_matrix_short; b: ptr gsl_matrix_short): cint {. cdecl, importc: "gsl_matrix_short_mul_elements", dynlib: libgsl.}
proc gsl_matrix_short_div_elements*(a: ptr gsl_matrix_short; b: ptr gsl_matrix_short): cint {. cdecl, importc: "gsl_matrix_short_div_elements", dynlib: libgsl.}
proc gsl_matrix_short_scale*(a: ptr gsl_matrix_short; x: cdouble): cint {.cdecl, importc: "gsl_matrix_short_scale", dynlib: libgsl.}
proc gsl_matrix_short_add_constant*(a: ptr gsl_matrix_short; x: cdouble): cint {.cdecl, importc: "gsl_matrix_short_add_constant", dynlib: libgsl.}
proc gsl_matrix_short_add_diagonal*(a: ptr gsl_matrix_short; x: cdouble): cint {.cdecl, importc: "gsl_matrix_short_add_diagonal", dynlib: libgsl.}
proc gsl_matrix_short_get_row*(v: ptr gsl_vector_short; m: ptr gsl_matrix_short;   i: csize_t): cint {.cdecl, importc: "gsl_matrix_short_get_row", dynlib: libgsl.}
proc gsl_matrix_short_get_col*(v: ptr gsl_vector_short; m: ptr gsl_matrix_short;   j: csize_t): cint {.cdecl, importc: "gsl_matrix_short_get_col", dynlib: libgsl.}
proc gsl_matrix_short_set_row*(m: ptr gsl_matrix_short; i: csize_t;   v: ptr gsl_vector_short): cint {.cdecl, importc: "gsl_matrix_short_set_row", dynlib: libgsl.}
proc gsl_matrix_short_set_col*(m: ptr gsl_matrix_short; j: csize_t;   v: ptr gsl_vector_short): cint {.cdecl, importc: "gsl_matrix_short_set_col", dynlib: libgsl.}
proc gsl_matrix_short_get*(m: ptr gsl_matrix_short; i: csize_t; j: csize_t): cshort {. cdecl, importc: "gsl_matrix_short_get", dynlib: libgsl.}
proc gsl_matrix_short_set*(m: ptr gsl_matrix_short; i: csize_t; j: csize_t; x: cshort) {. cdecl, importc: "gsl_matrix_short_set", dynlib: libgsl.}
proc gsl_matrix_short_ptr*(m: ptr gsl_matrix_short; i: csize_t; j: csize_t): ptr cshort {. cdecl, importc: "gsl_matrix_short_ptr", dynlib: libgsl.}
proc gsl_matrix_short_const_ptr*(m: ptr gsl_matrix_short; i: csize_t; j: csize_t): ptr cshort {. cdecl, importc: "gsl_matrix_short_const_ptr", dynlib: libgsl.}
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
proc gsl_matrix_char_alloc*(n1: csize_t; n2: csize_t): ptr gsl_matrix_char {.cdecl, importc: "gsl_matrix_char_alloc", dynlib: libgsl.}
proc gsl_matrix_char_calloc*(n1: csize_t; n2: csize_t): ptr gsl_matrix_char {.cdecl, importc: "gsl_matrix_char_calloc", dynlib: libgsl.}
proc gsl_matrix_char_alloc_from_block*(b: ptr gsl_block_char; offset: csize_t;   n1: csize_t; n2: csize_t; d2: csize_t): ptr gsl_matrix_char {. cdecl, importc: "gsl_matrix_char_alloc_from_block", dynlib: libgsl.}
proc gsl_matrix_char_alloc_from_matrix*(m: ptr gsl_matrix_char; k1: csize_t;    k2: csize_t; n1: csize_t; n2: csize_t): ptr gsl_matrix_char {. cdecl, importc: "gsl_matrix_char_alloc_from_matrix", dynlib: libgsl.}
proc gsl_vector_char_alloc_row_from_matrix*(m: ptr gsl_matrix_char; i: csize_t): ptr gsl_vector_char {. cdecl, importc: "gsl_vector_char_alloc_row_from_matrix", dynlib: libgsl.}
proc gsl_vector_char_alloc_col_from_matrix*(m: ptr gsl_matrix_char; j: csize_t): ptr gsl_vector_char {. cdecl, importc: "gsl_vector_char_alloc_col_from_matrix", dynlib: libgsl.}
proc gsl_matrix_char_free*(m: ptr gsl_matrix_char) {.cdecl, importc: "gsl_matrix_char_free", dynlib: libgsl.}
proc gsl_matrix_char_submatrix*(m: ptr gsl_matrix_char; i: csize_t; j: csize_t; n1: csize_t; n2: csize_t): gsl_matrix_char_view {. cdecl, importc: "gsl_matrix_char_submatrix", dynlib: libgsl.}
proc gsl_matrix_char_row*(m: ptr gsl_matrix_char; i: csize_t): gsl_vector_char_view {. cdecl, importc: "gsl_matrix_char_row", dynlib: libgsl.}
proc gsl_matrix_char_column*(m: ptr gsl_matrix_char; j: csize_t): gsl_vector_char_view {. cdecl, importc: "gsl_matrix_char_column", dynlib: libgsl.}
proc gsl_matrix_char_diagonal*(m: ptr gsl_matrix_char): gsl_vector_char_view {.cdecl, importc: "gsl_matrix_char_diagonal", dynlib: libgsl.}
proc gsl_matrix_char_subdiagonal*(m: ptr gsl_matrix_char; k: csize_t): gsl_vector_char_view {. cdecl, importc: "gsl_matrix_char_subdiagonal", dynlib: libgsl.}
proc gsl_matrix_char_superdiagonal*(m: ptr gsl_matrix_char; k: csize_t): gsl_vector_char_view {. cdecl, importc: "gsl_matrix_char_superdiagonal", dynlib: libgsl.}
proc gsl_matrix_char_subrow*(m: ptr gsl_matrix_char; i: csize_t; offset: csize_t; n: csize_t): gsl_vector_char_view {.cdecl, importc: "gsl_matrix_char_subrow", dynlib: libgsl.}
proc gsl_matrix_char_subcolumn*(m: ptr gsl_matrix_char; j: csize_t; offset: csize_t; n: csize_t): gsl_vector_char_view {.cdecl, importc: "gsl_matrix_char_subcolumn", dynlib: libgsl.}
proc gsl_matrix_char_view_array*(base: cstring; n1: csize_t; n2: csize_t): gsl_matrix_char_view {. cdecl, importc: "gsl_matrix_char_view_array", dynlib: libgsl.}
proc gsl_matrix_char_view_array_with_tda*(base: cstring; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_char_view {.cdecl, importc: "gsl_matrix_char_view_array_with_tda", dynlib: libgsl.}
proc gsl_matrix_char_view_vector*(v: ptr gsl_vector_char; n1: csize_t; n2: csize_t): gsl_matrix_char_view {. cdecl, importc: "gsl_matrix_char_view_vector", dynlib: libgsl.}
proc gsl_matrix_char_view_vector_with_tda*(v: ptr gsl_vector_char; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_char_view {.cdecl, importc: "gsl_matrix_char_view_vector_with_tda", dynlib: libgsl.}
proc gsl_matrix_char_const_submatrix*(m: ptr gsl_matrix_char; i: csize_t; j: csize_t;  n1: csize_t; n2: csize_t): gsl_matrix_char_const_view {. cdecl, importc: "gsl_matrix_char_const_submatrix", dynlib: libgsl.}
proc gsl_matrix_char_const_row*(m: ptr gsl_matrix_char; i: csize_t): gsl_vector_char_const_view {. cdecl, importc: "gsl_matrix_char_const_row", dynlib: libgsl.}
proc gsl_matrix_char_const_column*(m: ptr gsl_matrix_char; j: csize_t): gsl_vector_char_const_view {. cdecl, importc: "gsl_matrix_char_const_column", dynlib: libgsl.}
proc gsl_matrix_char_const_diagonal*(m: ptr gsl_matrix_char): gsl_vector_char_const_view {. cdecl, importc: "gsl_matrix_char_const_diagonal", dynlib: libgsl.}
proc gsl_matrix_char_const_subdiagonal*(m: ptr gsl_matrix_char; k: csize_t): gsl_vector_char_const_view {. cdecl, importc: "gsl_matrix_char_const_subdiagonal", dynlib: libgsl.}
proc gsl_matrix_char_const_superdiagonal*(m: ptr gsl_matrix_char; k: csize_t): gsl_vector_char_const_view {. cdecl, importc: "gsl_matrix_char_const_superdiagonal", dynlib: libgsl.}
proc gsl_matrix_char_const_subrow*(m: ptr gsl_matrix_char; i: csize_t; offset: csize_t; n: csize_t): gsl_vector_char_const_view {. cdecl, importc: "gsl_matrix_char_const_subrow", dynlib: libgsl.}
proc gsl_matrix_char_const_subcolumn*(m: ptr gsl_matrix_char; j: csize_t;  offset: csize_t; n: csize_t): gsl_vector_char_const_view {. cdecl, importc: "gsl_matrix_char_const_subcolumn", dynlib: libgsl.}
proc gsl_matrix_char_const_view_array*(base: cstring; n1: csize_t; n2: csize_t): gsl_matrix_char_const_view {. cdecl, importc: "gsl_matrix_char_const_view_array", dynlib: libgsl.}
proc gsl_matrix_char_const_view_array_with_tda*(base: cstring; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_char_const_view {.cdecl, importc: "gsl_matrix_char_const_view_array_with_tda", dynlib: libgsl.}
proc gsl_matrix_char_const_view_vector*(v: ptr gsl_vector_char; n1: csize_t;    n2: csize_t): gsl_matrix_char_const_view {. cdecl, importc: "gsl_matrix_char_const_view_vector", dynlib: libgsl.}
proc gsl_matrix_char_const_view_vector_with_tda*(v: ptr gsl_vector_char; n1: csize_t; n2: csize_t; tda: csize_t): gsl_matrix_char_const_view {.cdecl, importc: "gsl_matrix_char_const_view_vector_with_tda", dynlib: libgsl.}
proc gsl_matrix_char_set_zero*(m: ptr gsl_matrix_char) {.cdecl, importc: "gsl_matrix_char_set_zero", dynlib: libgsl.}
proc gsl_matrix_char_set_identity*(m: ptr gsl_matrix_char) {.cdecl, importc: "gsl_matrix_char_set_identity", dynlib: libgsl.}
proc gsl_matrix_char_set_all*(m: ptr gsl_matrix_char; x: char) {.cdecl, importc: "gsl_matrix_char_set_all", dynlib: libgsl.}
proc gsl_matrix_char_fread*(stream: ptr FILE; m: ptr gsl_matrix_char): cint {.cdecl, importc: "gsl_matrix_char_fread", dynlib: libgsl.}
proc gsl_matrix_char_fwrite*(stream: ptr FILE; m: ptr gsl_matrix_char): cint {.cdecl, importc: "gsl_matrix_char_fwrite", dynlib: libgsl.}
proc gsl_matrix_char_fscanf*(stream: ptr FILE; m: ptr gsl_matrix_char): cint {.cdecl, importc: "gsl_matrix_char_fscanf", dynlib: libgsl.}
proc gsl_matrix_char_fprintf*(stream: ptr FILE; m: ptr gsl_matrix_char; format: cstring): cint {. cdecl, importc: "gsl_matrix_char_fprintf", dynlib: libgsl.}
proc gsl_matrix_char_memcpy*(dest: ptr gsl_matrix_char; src: ptr gsl_matrix_char): cint {. cdecl, importc: "gsl_matrix_char_memcpy", dynlib: libgsl.}
proc gsl_matrix_char_swap*(m1: ptr gsl_matrix_char; m2: ptr gsl_matrix_char): cint {. cdecl, importc: "gsl_matrix_char_swap", dynlib: libgsl.}
proc gsl_matrix_char_tricpy*(uplo_src: char; copy_diag: cint; dest: ptr gsl_matrix_char; src: ptr gsl_matrix_char): cint {. cdecl, importc: "gsl_matrix_char_tricpy", dynlib: libgsl.}
proc gsl_matrix_char_swap_rows*(m: ptr gsl_matrix_char; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_matrix_char_swap_rows", dynlib: libgsl.}
proc gsl_matrix_char_swap_columns*(m: ptr gsl_matrix_char; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_matrix_char_swap_columns", dynlib: libgsl.}
proc gsl_matrix_char_swap_rowcol*(m: ptr gsl_matrix_char; i: csize_t; j: csize_t): cint {. cdecl, importc: "gsl_matrix_char_swap_rowcol", dynlib: libgsl.}
proc gsl_matrix_char_transpose*(m: ptr gsl_matrix_char): cint {.cdecl, importc: "gsl_matrix_char_transpose", dynlib: libgsl.}
proc gsl_matrix_char_transpose_memcpy*(dest: ptr gsl_matrix_char;   src: ptr gsl_matrix_char): cint {.cdecl, importc: "gsl_matrix_char_transpose_memcpy", dynlib: libgsl.}
proc gsl_matrix_char_transpose_tricpy*(uplo_src: char; copy_diag: cint;   dest: ptr gsl_matrix_char;   src: ptr gsl_matrix_char): cint {.cdecl, importc: "gsl_matrix_char_transpose_tricpy", dynlib: libgsl.}
proc gsl_matrix_char_max*(m: ptr gsl_matrix_char): char {.cdecl, importc: "gsl_matrix_char_max", dynlib: libgsl.}
proc gsl_matrix_char_min*(m: ptr gsl_matrix_char): char {.cdecl, importc: "gsl_matrix_char_min", dynlib: libgsl.}
proc gsl_matrix_char_minmax*(m: ptr gsl_matrix_char; min_out: cstring; max_out: cstring) {.cdecl, importc: "gsl_matrix_char_minmax", dynlib: libgsl.}
proc gsl_matrix_char_max_index*(m: ptr gsl_matrix_char; imax: ptr csize_t; jmax: ptr csize_t) {.cdecl, importc: "gsl_matrix_char_max_index", dynlib: libgsl.}
proc gsl_matrix_char_min_index*(m: ptr gsl_matrix_char; imin: ptr csize_t; jmin: ptr csize_t) {.cdecl, importc: "gsl_matrix_char_min_index", dynlib: libgsl.}
proc gsl_matrix_char_minmax_index*(m: ptr gsl_matrix_char; imin: ptr csize_t; jmin: ptr csize_t; imax: ptr csize_t; jmax: ptr csize_t) {.cdecl, importc: "gsl_matrix_char_minmax_index", dynlib: libgsl.}
proc gsl_matrix_char_equal*(a: ptr gsl_matrix_char; b: ptr gsl_matrix_char): cint {. cdecl, importc: "gsl_matrix_char_equal", dynlib: libgsl.}
proc gsl_matrix_char_isnull*(m: ptr gsl_matrix_char): cint {.cdecl, importc: "gsl_matrix_char_isnull", dynlib: libgsl.}
proc gsl_matrix_char_ispos*(m: ptr gsl_matrix_char): cint {.cdecl, importc: "gsl_matrix_char_ispos", dynlib: libgsl.}
proc gsl_matrix_char_isneg*(m: ptr gsl_matrix_char): cint {.cdecl, importc: "gsl_matrix_char_isneg", dynlib: libgsl.}
proc gsl_matrix_char_isnonneg*(m: ptr gsl_matrix_char): cint {.cdecl, importc: "gsl_matrix_char_isnonneg", dynlib: libgsl.}
proc gsl_matrix_char_add*(a: ptr gsl_matrix_char; b: ptr gsl_matrix_char): cint {.cdecl, importc: "gsl_matrix_char_add", dynlib: libgsl.}
proc gsl_matrix_char_sub*(a: ptr gsl_matrix_char; b: ptr gsl_matrix_char): cint {.cdecl, importc: "gsl_matrix_char_sub", dynlib: libgsl.}
proc gsl_matrix_char_mul_elements*(a: ptr gsl_matrix_char; b: ptr gsl_matrix_char): cint {. cdecl, importc: "gsl_matrix_char_mul_elements", dynlib: libgsl.}
proc gsl_matrix_char_div_elements*(a: ptr gsl_matrix_char; b: ptr gsl_matrix_char): cint {. cdecl, importc: "gsl_matrix_char_div_elements", dynlib: libgsl.}
proc gsl_matrix_char_scale*(a: ptr gsl_matrix_char; x: cdouble): cint {.cdecl, importc: "gsl_matrix_char_scale", dynlib: libgsl.}
proc gsl_matrix_char_add_constant*(a: ptr gsl_matrix_char; x: cdouble): cint {.cdecl, importc: "gsl_matrix_char_add_constant", dynlib: libgsl.}
proc gsl_matrix_char_add_diagonal*(a: ptr gsl_matrix_char; x: cdouble): cint {.cdecl, importc: "gsl_matrix_char_add_diagonal", dynlib: libgsl.}
proc gsl_matrix_char_get_row*(v: ptr gsl_vector_char; m: ptr gsl_matrix_char;  i: csize_t): cint {.cdecl, importc: "gsl_matrix_char_get_row", dynlib: libgsl.}
proc gsl_matrix_char_get_col*(v: ptr gsl_vector_char; m: ptr gsl_matrix_char;  j: csize_t): cint {.cdecl, importc: "gsl_matrix_char_get_col", dynlib: libgsl.}
proc gsl_matrix_char_set_row*(m: ptr gsl_matrix_char; i: csize_t;  v: ptr gsl_vector_char): cint {.cdecl, importc: "gsl_matrix_char_set_row", dynlib: libgsl.}
proc gsl_matrix_char_set_col*(m: ptr gsl_matrix_char; j: csize_t;  v: ptr gsl_vector_char): cint {.cdecl, importc: "gsl_matrix_char_set_col", dynlib: libgsl.}
proc gsl_matrix_char_get*(m: ptr gsl_matrix_char; i: csize_t; j: csize_t): char {.cdecl, importc: "gsl_matrix_char_get", dynlib: libgsl.}
proc gsl_matrix_char_set*(m: ptr gsl_matrix_char; i: csize_t; j: csize_t; x: char) {. cdecl, importc: "gsl_matrix_char_set", dynlib: libgsl.}
proc gsl_matrix_char_ptr*(m: ptr gsl_matrix_char; i: csize_t; j: csize_t): cstring {. cdecl, importc: "gsl_matrix_char_ptr", dynlib: libgsl.}
proc gsl_matrix_char_const_ptr*(m: ptr gsl_matrix_char; i: csize_t; j: csize_t): cstring {. cdecl, importc: "gsl_matrix_char_const_ptr", dynlib: libgsl.}
proc gsl_spmatrix_alloc*(n1: csize_t; n2: csize_t): ptr gsl_spmatrix {.cdecl, importc: "gsl_spmatrix_alloc", dynlib: libgsl.}
proc gsl_spmatrix_alloc_nzmax*(n1: csize_t; n2: csize_t; nzmax: csize_t; flags: csize_t): ptr gsl_spmatrix {. cdecl, importc: "gsl_spmatrix_alloc_nzmax", dynlib: libgsl.}
proc gsl_spmatrix_free*(m: ptr gsl_spmatrix) {.cdecl, importc: "gsl_spmatrix_free", dynlib: libgsl.}
proc gsl_spmatrix_realloc*(nzmax: csize_t; m: ptr gsl_spmatrix): cint {.cdecl, importc: "gsl_spmatrix_realloc", dynlib: libgsl.}
proc gsl_spmatrix_set_zero*(m: ptr gsl_spmatrix): cint {.cdecl, importc: "gsl_spmatrix_set_zero", dynlib: libgsl.}
proc gsl_spmatrix_nnz*(m: ptr gsl_spmatrix): csize_t {.cdecl, importc: "gsl_spmatrix_nnz", dynlib: libgsl.}
proc gsl_spmatrix_compare_idx*(ia: csize_t; ja: csize_t; ib: csize_t; jb: csize_t): cint {. cdecl, importc: "gsl_spmatrix_compare_idx", dynlib: libgsl.}
proc gsl_spmatrix_tree_rebuild*(m: ptr gsl_spmatrix): cint {.cdecl, importc: "gsl_spmatrix_tree_rebuild", dynlib: libgsl.}
proc gsl_spmatrix_memcpy*(dest: ptr gsl_spmatrix; src: ptr gsl_spmatrix): cint {.cdecl, importc: "gsl_spmatrix_memcpy", dynlib: libgsl.}
proc gsl_spmatrix_get*(m: ptr gsl_spmatrix; i: csize_t; j: csize_t): cdouble {.cdecl, importc: "gsl_spmatrix_get", dynlib: libgsl.}
proc gsl_spmatrix_set*(m: ptr gsl_spmatrix; i: csize_t; j: csize_t; x: cdouble): cint {. cdecl, importc: "gsl_spmatrix_set", dynlib: libgsl.}
proc gsl_spmatrix_ptr*(m: ptr gsl_spmatrix; i: csize_t; j: csize_t): ptr cdouble {.cdecl, importc: "gsl_spmatrix_ptr", dynlib: libgsl.}
proc gsl_spmatrix_compcol*(T: ptr gsl_spmatrix): ptr gsl_spmatrix {.cdecl, importc: "gsl_spmatrix_compcol", dynlib: libgsl.}
proc gsl_spmatrix_ccs*(T: ptr gsl_spmatrix): ptr gsl_spmatrix {.cdecl, importc: "gsl_spmatrix_ccs", dynlib: libgsl.}
proc gsl_spmatrix_crs*(T: ptr gsl_spmatrix): ptr gsl_spmatrix {.cdecl, importc: "gsl_spmatrix_crs", dynlib: libgsl.}
proc gsl_spmatrix_cumsum*(n: csize_t; c: ptr csize_t) {.cdecl, importc: "gsl_spmatrix_cumsum", dynlib: libgsl.}
proc gsl_spmatrix_fprintf*(stream: ptr FILE; m: ptr gsl_spmatrix; format: cstring): cint {. cdecl, importc: "gsl_spmatrix_fprintf", dynlib: libgsl.}
proc gsl_spmatrix_fscanf*(stream: ptr FILE): ptr gsl_spmatrix {.cdecl, importc: "gsl_spmatrix_fscanf", dynlib: libgsl.}
proc gsl_spmatrix_fwrite*(stream: ptr FILE; m: ptr gsl_spmatrix): cint {.cdecl, importc: "gsl_spmatrix_fwrite", dynlib: libgsl.}
proc gsl_spmatrix_fread*(stream: ptr FILE; m: ptr gsl_spmatrix): cint {.cdecl, importc: "gsl_spmatrix_fread", dynlib: libgsl.}
proc gsl_spmatrix_scale*(m: ptr gsl_spmatrix; x: cdouble): cint {.cdecl, importc: "gsl_spmatrix_scale", dynlib: libgsl.}
proc gsl_spmatrix_minmax*(m: ptr gsl_spmatrix; min_out: ptr cdouble; max_out: ptr cdouble): cint {.cdecl, importc: "gsl_spmatrix_minmax", dynlib: libgsl.}
proc gsl_spmatrix_add*(c: ptr gsl_spmatrix; a: ptr gsl_spmatrix; b: ptr gsl_spmatrix): cint {. cdecl, importc: "gsl_spmatrix_add", dynlib: libgsl.}
proc gsl_spmatrix_d2sp*(S: ptr gsl_spmatrix; A: ptr gsl_matrix): cint {.cdecl, importc: "gsl_spmatrix_d2sp", dynlib: libgsl.}
proc gsl_spmatrix_sp2d*(A: ptr gsl_matrix; S: ptr gsl_spmatrix): cint {.cdecl, importc: "gsl_spmatrix_sp2d", dynlib: libgsl.}
proc gsl_spmatrix_equal*(a: ptr gsl_spmatrix; b: ptr gsl_spmatrix): cint {.cdecl, importc: "gsl_spmatrix_equal", dynlib: libgsl.}
proc gsl_spmatrix_transpose*(m: ptr gsl_spmatrix): cint {.cdecl, importc: "gsl_spmatrix_transpose", dynlib: libgsl.}
proc gsl_spmatrix_transpose2*(m: ptr gsl_spmatrix): cint {.cdecl, importc: "gsl_spmatrix_transpose2", dynlib: libgsl.}
proc gsl_spmatrix_transpose_memcpy*(dest: ptr gsl_spmatrix; src: ptr gsl_spmatrix): cint {. cdecl, importc: "gsl_spmatrix_transpose_memcpy", dynlib: libgsl.}
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
proc cblas_sdsdot*(N: cint; alpha: cfloat; X: ptr cfloat; incX: cint; Y: ptr cfloat; incY: cint): cfloat {.cdecl, importc: "cblas_sdsdot", dynlib: libgsl.}
proc cblas_dsdot*(N: cint; X: ptr cfloat; incX: cint; Y: ptr cfloat; incY: cint): cdouble {. cdecl, importc: "cblas_dsdot", dynlib: libgsl.}
proc cblas_sdot*(N: cint; X: ptr cfloat; incX: cint; Y: ptr cfloat; incY: cint): cfloat {. cdecl, importc: "cblas_sdot", dynlib: libgsl.}
proc cblas_ddot*(N: cint; X: ptr cdouble; incX: cint; Y: ptr cdouble; incY: cint): cdouble {. cdecl, importc: "cblas_ddot", dynlib: libgsl.}
proc cblas_cdotu_sub*(N: cint; X: pointer; incX: cint; Y: pointer; incY: cint; dotu: pointer) {.cdecl, importc: "cblas_cdotu_sub", dynlib: libgsl.}
proc cblas_cdotc_sub*(N: cint; X: pointer; incX: cint; Y: pointer; incY: cint; dotc: pointer) {.cdecl, importc: "cblas_cdotc_sub", dynlib: libgsl.}
proc cblas_zdotu_sub*(N: cint; X: pointer; incX: cint; Y: pointer; incY: cint; dotu: pointer) {.cdecl, importc: "cblas_zdotu_sub", dynlib: libgsl.}
proc cblas_zdotc_sub*(N: cint; X: pointer; incX: cint; Y: pointer; incY: cint; dotc: pointer) {.cdecl, importc: "cblas_zdotc_sub", dynlib: libgsl.}
proc cblas_snrm2*(N: cint; X: ptr cfloat; incX: cint): cfloat {.cdecl, importc: "cblas_snrm2", dynlib: libgsl.}
proc cblas_sasum*(N: cint; X: ptr cfloat; incX: cint): cfloat {.cdecl, importc: "cblas_sasum", dynlib: libgsl.}
proc cblas_dnrm2*(N: cint; X: ptr cdouble; incX: cint): cdouble {.cdecl, importc: "cblas_dnrm2", dynlib: libgsl.}
proc cblas_dasum*(N: cint; X: ptr cdouble; incX: cint): cdouble {.cdecl, importc: "cblas_dasum", dynlib: libgsl.}
proc cblas_scnrm2*(N: cint; X: pointer; incX: cint): cfloat {.cdecl, importc: "cblas_scnrm2", dynlib: libgsl.}
proc cblas_scasum*(N: cint; X: pointer; incX: cint): cfloat {.cdecl, importc: "cblas_scasum", dynlib: libgsl.}
proc cblas_dznrm2*(N: cint; X: pointer; incX: cint): cdouble {.cdecl, importc: "cblas_dznrm2", dynlib: libgsl.}
proc cblas_dzasum*(N: cint; X: pointer; incX: cint): cdouble {.cdecl, importc: "cblas_dzasum", dynlib: libgsl.}
proc cblas_isamax*(N: cint; X: ptr cfloat; incX: cint): csize_t {.cdecl, importc: "cblas_isamax", dynlib: libgsl.}
proc cblas_idamax*(N: cint; X: ptr cdouble; incX: cint): csize_t {.cdecl, importc: "cblas_idamax", dynlib: libgsl.}
proc cblas_icamax*(N: cint; X: pointer; incX: cint): csize_t {.cdecl, importc: "cblas_icamax", dynlib: libgsl.}
proc cblas_izamax*(N: cint; X: pointer; incX: cint): csize_t {.cdecl, importc: "cblas_izamax", dynlib: libgsl.}
proc cblas_sswap*(N: cint; X: ptr cfloat; incX: cint; Y: ptr cfloat; incY: cint) {.cdecl, importc: "cblas_sswap", dynlib: libgsl.}
proc cblas_scopy*(N: cint; X: ptr cfloat; incX: cint; Y: ptr cfloat; incY: cint) {.cdecl, importc: "cblas_scopy", dynlib: libgsl.}
proc cblas_saxpy*(N: cint; alpha: cfloat; X: ptr cfloat; incX: cint; Y: ptr cfloat; incY: cint) {.cdecl, importc: "cblas_saxpy", dynlib: libgsl.}
proc cblas_dswap*(N: cint; X: ptr cdouble; incX: cint; Y: ptr cdouble; incY: cint) {.cdecl, importc: "cblas_dswap", dynlib: libgsl.}
proc cblas_dcopy*(N: cint; X: ptr cdouble; incX: cint; Y: ptr cdouble; incY: cint) {.cdecl, importc: "cblas_dcopy", dynlib: libgsl.}
proc cblas_daxpy*(N: cint; alpha: cdouble; X: ptr cdouble; incX: cint; Y: ptr cdouble; incY: cint) {.cdecl, importc: "cblas_daxpy", dynlib: libgsl.}
proc cblas_cswap*(N: cint; X: pointer; incX: cint; Y: pointer; incY: cint) {.cdecl, importc: "cblas_cswap", dynlib: libgsl.}
proc cblas_ccopy*(N: cint; X: pointer; incX: cint; Y: pointer; incY: cint) {.cdecl, importc: "cblas_ccopy", dynlib: libgsl.}
proc cblas_caxpy*(N: cint; alpha: pointer; X: pointer; incX: cint; Y: pointer; incY: cint) {. cdecl, importc: "cblas_caxpy", dynlib: libgsl.}
proc cblas_zswap*(N: cint; X: pointer; incX: cint; Y: pointer; incY: cint) {.cdecl, importc: "cblas_zswap", dynlib: libgsl.}
proc cblas_zcopy*(N: cint; X: pointer; incX: cint; Y: pointer; incY: cint) {.cdecl, importc: "cblas_zcopy", dynlib: libgsl.}
proc cblas_zaxpy*(N: cint; alpha: pointer; X: pointer; incX: cint; Y: pointer; incY: cint) {. cdecl, importc: "cblas_zaxpy", dynlib: libgsl.}
proc cblas_srotg*(a: ptr cfloat; b: ptr cfloat; c: ptr cfloat; s: ptr cfloat) {.cdecl, importc: "cblas_srotg", dynlib: libgsl.}
proc cblas_srotmg*(d1: ptr cfloat; d2: ptr cfloat; b1: ptr cfloat; b2: cfloat; P: ptr cfloat) {. cdecl, importc: "cblas_srotmg", dynlib: libgsl.}
proc cblas_srot*(N: cint; X: ptr cfloat; incX: cint; Y: ptr cfloat; incY: cint; c: cfloat; s: cfloat) {.cdecl, importc: "cblas_srot", dynlib: libgsl.}
proc cblas_srotm*(N: cint; X: ptr cfloat; incX: cint; Y: ptr cfloat; incY: cint; P: ptr cfloat) {.cdecl, importc: "cblas_srotm", dynlib: libgsl.}
proc cblas_drotg*(a: ptr cdouble; b: ptr cdouble; c: ptr cdouble; s: ptr cdouble) {.cdecl, importc: "cblas_drotg", dynlib: libgsl.}
proc cblas_drotmg*(d1: ptr cdouble; d2: ptr cdouble; b1: ptr cdouble; b2: cdouble; P: ptr cdouble) {.cdecl, importc: "cblas_drotmg", dynlib: libgsl.}
proc cblas_drot*(N: cint; X: ptr cdouble; incX: cint; Y: ptr cdouble; incY: cint; c: cdouble; s: cdouble) {.cdecl, importc: "cblas_drot", dynlib: libgsl.}
proc cblas_drotm*(N: cint; X: ptr cdouble; incX: cint; Y: ptr cdouble; incY: cint; P: ptr cdouble) {.cdecl, importc: "cblas_drotm", dynlib: libgsl.}
proc cblas_sscal*(N: cint; alpha: cfloat; X: ptr cfloat; incX: cint) {.cdecl, importc: "cblas_sscal", dynlib: libgsl.}
proc cblas_dscal*(N: cint; alpha: cdouble; X: ptr cdouble; incX: cint) {.cdecl, importc: "cblas_dscal", dynlib: libgsl.}
proc cblas_cscal*(N: cint; alpha: pointer; X: pointer; incX: cint) {.cdecl, importc: "cblas_cscal", dynlib: libgsl.}
proc cblas_zscal*(N: cint; alpha: pointer; X: pointer; incX: cint) {.cdecl, importc: "cblas_zscal", dynlib: libgsl.}
proc cblas_csscal*(N: cint; alpha: cfloat; X: pointer; incX: cint) {.cdecl, importc: "cblas_csscal", dynlib: libgsl.}
proc cblas_zdscal*(N: cint; alpha: cdouble; X: pointer; incX: cint) {.cdecl, importc: "cblas_zdscal", dynlib: libgsl.}
proc cblas_sgemv*(order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; M: cint; N: cint; alpha: cfloat; A: ptr cfloat; lda: cint; X: ptr cfloat; incX: cint; beta: cfloat; Y: ptr cfloat; incY: cint) {.cdecl, importc: "cblas_sgemv", dynlib: libgsl.}
proc cblas_sgbmv*(order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; M: cint; N: cint; KL: cint; KU: cint; alpha: cfloat; A: ptr cfloat; lda: cint; X: ptr cfloat; incX: cint; beta: cfloat; Y: ptr cfloat; incY: cint) {. cdecl, importc: "cblas_sgbmv", dynlib: libgsl.}
proc cblas_strmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; A: ptr cfloat; lda: cint; X: ptr cfloat; incX: cint) {.cdecl, importc: "cblas_strmv", dynlib: libgsl.}
proc cblas_stbmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; K: cint; A: ptr cfloat; lda: cint; X: ptr cfloat; incX: cint) {.cdecl, importc: "cblas_stbmv", dynlib: libgsl.}
proc cblas_stpmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; Ap: ptr cfloat; X: ptr cfloat; incX: cint) {. cdecl, importc: "cblas_stpmv", dynlib: libgsl.}
proc cblas_strsv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; A: ptr cfloat; lda: cint; X: ptr cfloat; incX: cint) {.cdecl, importc: "cblas_strsv", dynlib: libgsl.}
proc cblas_stbsv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; K: cint; A: ptr cfloat; lda: cint; X: ptr cfloat; incX: cint) {.cdecl, importc: "cblas_stbsv", dynlib: libgsl.}
proc cblas_stpsv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; Ap: ptr cfloat; X: ptr cfloat; incX: cint) {. cdecl, importc: "cblas_stpsv", dynlib: libgsl.}
proc cblas_dgemv*(order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; M: cint; N: cint; alpha: cdouble; A: ptr cdouble; lda: cint; X: ptr cdouble; incX: cint; beta: cdouble; Y: ptr cdouble; incY: cint) {.cdecl, importc: "cblas_dgemv", dynlib: libgsl.}
proc cblas_dgbmv*(order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; M: cint; N: cint; KL: cint; KU: cint; alpha: cdouble; A: ptr cdouble; lda: cint; X: ptr cdouble; incX: cint; beta: cdouble; Y: ptr cdouble; incY: cint) {. cdecl, importc: "cblas_dgbmv", dynlib: libgsl.}
proc cblas_dtrmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; A: ptr cdouble; lda: cint; X: ptr cdouble; incX: cint) {.cdecl, importc: "cblas_dtrmv", dynlib: libgsl.}
proc cblas_dtbmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; K: cint; A: ptr cdouble; lda: cint; X: ptr cdouble; incX: cint) {.cdecl, importc: "cblas_dtbmv", dynlib: libgsl.}
proc cblas_dtpmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; Ap: ptr cdouble; X: ptr cdouble; incX: cint) {. cdecl, importc: "cblas_dtpmv", dynlib: libgsl.}
proc cblas_dtrsv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; A: ptr cdouble; lda: cint; X: ptr cdouble; incX: cint) {.cdecl, importc: "cblas_dtrsv", dynlib: libgsl.}
proc cblas_dtbsv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; K: cint; A: ptr cdouble; lda: cint; X: ptr cdouble; incX: cint) {.cdecl, importc: "cblas_dtbsv", dynlib: libgsl.}
proc cblas_dtpsv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; Ap: ptr cdouble; X: ptr cdouble; incX: cint) {. cdecl, importc: "cblas_dtpsv", dynlib: libgsl.}
proc cblas_cgemv*(order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; M: cint; N: cint; alpha: pointer; A: pointer; lda: cint; X: pointer; incX: cint; beta: pointer; Y: pointer; incY: cint) {.cdecl, importc: "cblas_cgemv", dynlib: libgsl.}
proc cblas_cgbmv*(order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; M: cint; N: cint; KL: cint; KU: cint; alpha: pointer; A: pointer; lda: cint; X: pointer; incX: cint; beta: pointer; Y: pointer; incY: cint) {.cdecl, importc: "cblas_cgbmv", dynlib: libgsl.}
proc cblas_ctrmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; A: pointer; lda: cint; X: pointer; incX: cint) {. cdecl, importc: "cblas_ctrmv", dynlib: libgsl.}
proc cblas_ctbmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; K: cint; A: pointer; lda: cint; X: pointer; incX: cint) {.cdecl, importc: "cblas_ctbmv", dynlib: libgsl.}
proc cblas_ctpmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; Ap: pointer; X: pointer; incX: cint) {.cdecl, importc: "cblas_ctpmv", dynlib: libgsl.}
proc cblas_ctrsv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; A: pointer; lda: cint; X: pointer; incX: cint) {. cdecl, importc: "cblas_ctrsv", dynlib: libgsl.}
proc cblas_ctbsv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; K: cint; A: pointer; lda: cint; X: pointer; incX: cint) {.cdecl, importc: "cblas_ctbsv", dynlib: libgsl.}
proc cblas_ctpsv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; Ap: pointer; X: pointer; incX: cint) {.cdecl, importc: "cblas_ctpsv", dynlib: libgsl.}
proc cblas_zgemv*(order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; M: cint; N: cint; alpha: pointer; A: pointer; lda: cint; X: pointer; incX: cint; beta: pointer; Y: pointer; incY: cint) {.cdecl, importc: "cblas_zgemv", dynlib: libgsl.}
proc cblas_zgbmv*(order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; M: cint; N: cint; KL: cint; KU: cint; alpha: pointer; A: pointer; lda: cint; X: pointer; incX: cint; beta: pointer; Y: pointer; incY: cint) {.cdecl, importc: "cblas_zgbmv", dynlib: libgsl.}
proc cblas_ztrmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; A: pointer; lda: cint; X: pointer; incX: cint) {. cdecl, importc: "cblas_ztrmv", dynlib: libgsl.}
proc cblas_ztbmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; K: cint; A: pointer; lda: cint; X: pointer; incX: cint) {.cdecl, importc: "cblas_ztbmv", dynlib: libgsl.}
proc cblas_ztpmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; Ap: pointer; X: pointer; incX: cint) {.cdecl, importc: "cblas_ztpmv", dynlib: libgsl.}
proc cblas_ztrsv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; A: pointer; lda: cint; X: pointer; incX: cint) {. cdecl, importc: "cblas_ztrsv", dynlib: libgsl.}
proc cblas_ztbsv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; K: cint; A: pointer; lda: cint; X: pointer; incX: cint) {.cdecl, importc: "cblas_ztbsv", dynlib: libgsl.}
proc cblas_ztpsv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; Ap: pointer; X: pointer; incX: cint) {.cdecl, importc: "cblas_ztpsv", dynlib: libgsl.}
proc cblas_ssymv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cfloat; A: ptr cfloat; lda: cint; X: ptr cfloat; incX: cint; beta: cfloat; Y: ptr cfloat; incY: cint) {.cdecl, importc: "cblas_ssymv", dynlib: libgsl.}
proc cblas_ssbmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; K: cint; alpha: cfloat; A: ptr cfloat; lda: cint; X: ptr cfloat; incX: cint; beta: cfloat; Y: ptr cfloat; incY: cint) {.cdecl, importc: "cblas_ssbmv", dynlib: libgsl.}
proc cblas_sspmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cfloat; Ap: ptr cfloat; X: ptr cfloat; incX: cint; beta: cfloat; Y: ptr cfloat; incY: cint) {.cdecl, importc: "cblas_sspmv", dynlib: libgsl.}
proc cblas_sger*(order: CBLAS_ORDER; M: cint; N: cint; alpha: cfloat; X: ptr cfloat; incX: cint; Y: ptr cfloat; incY: cint; A: ptr cfloat; lda: cint) {.cdecl, importc: "cblas_sger", dynlib: libgsl.}
proc cblas_ssyr*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cfloat; X: ptr cfloat; incX: cint; A: ptr cfloat; lda: cint) {.cdecl, importc: "cblas_ssyr", dynlib: libgsl.}
proc cblas_sspr*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cfloat; X: ptr cfloat; incX: cint; Ap: ptr cfloat) {.cdecl, importc: "cblas_sspr", dynlib: libgsl.}
proc cblas_ssyr2*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cfloat; X: ptr cfloat; incX: cint; Y: ptr cfloat; incY: cint; A: ptr cfloat; lda: cint) {.cdecl, importc: "cblas_ssyr2", dynlib: libgsl.}
proc cblas_sspr2*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cfloat; X: ptr cfloat; incX: cint; Y: ptr cfloat; incY: cint; A: ptr cfloat) {. cdecl, importc: "cblas_sspr2", dynlib: libgsl.}
proc cblas_dsymv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cdouble; A: ptr cdouble; lda: cint; X: ptr cdouble; incX: cint; beta: cdouble; Y: ptr cdouble; incY: cint) {.cdecl, importc: "cblas_dsymv", dynlib: libgsl.}
proc cblas_dsbmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; K: cint; alpha: cdouble; A: ptr cdouble; lda: cint; X: ptr cdouble; incX: cint; beta: cdouble; Y: ptr cdouble; incY: cint) {.cdecl, importc: "cblas_dsbmv", dynlib: libgsl.}
proc cblas_dspmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cdouble; Ap: ptr cdouble; X: ptr cdouble; incX: cint; beta: cdouble; Y: ptr cdouble; incY: cint) {.cdecl, importc: "cblas_dspmv", dynlib: libgsl.}
proc cblas_dger*(order: CBLAS_ORDER; M: cint; N: cint; alpha: cdouble; X: ptr cdouble; incX: cint; Y: ptr cdouble; incY: cint; A: ptr cdouble; lda: cint) {.cdecl, importc: "cblas_dger", dynlib: libgsl.}
proc cblas_dsyr*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cdouble; X: ptr cdouble; incX: cint; A: ptr cdouble; lda: cint) {.cdecl, importc: "cblas_dsyr", dynlib: libgsl.}
proc cblas_dspr*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cdouble; X: ptr cdouble; incX: cint; Ap: ptr cdouble) {.cdecl, importc: "cblas_dspr", dynlib: libgsl.}
proc cblas_dsyr2*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cdouble; X: ptr cdouble; incX: cint; Y: ptr cdouble; incY: cint; A: ptr cdouble; lda: cint) {.cdecl, importc: "cblas_dsyr2", dynlib: libgsl.}
proc cblas_dspr2*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cdouble; X: ptr cdouble; incX: cint; Y: ptr cdouble; incY: cint; A: ptr cdouble) {. cdecl, importc: "cblas_dspr2", dynlib: libgsl.}
proc cblas_chemv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: pointer; A: pointer; lda: cint; X: pointer; incX: cint; beta: pointer; Y: pointer; incY: cint) {.cdecl, importc: "cblas_chemv", dynlib: libgsl.}
proc cblas_chbmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; K: cint; alpha: pointer; A: pointer; lda: cint; X: pointer; incX: cint; beta: pointer; Y: pointer; incY: cint) {.cdecl, importc: "cblas_chbmv", dynlib: libgsl.}
proc cblas_chpmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: pointer; Ap: pointer; X: pointer; incX: cint; beta: pointer; Y: pointer; incY: cint) {.cdecl, importc: "cblas_chpmv", dynlib: libgsl.}
proc cblas_cgeru*(order: CBLAS_ORDER; M: cint; N: cint; alpha: pointer; X: pointer; incX: cint; Y: pointer; incY: cint; A: pointer; lda: cint) {.cdecl, importc: "cblas_cgeru", dynlib: libgsl.}
proc cblas_cgerc*(order: CBLAS_ORDER; M: cint; N: cint; alpha: pointer; X: pointer; incX: cint; Y: pointer; incY: cint; A: pointer; lda: cint) {.cdecl, importc: "cblas_cgerc", dynlib: libgsl.}
proc cblas_cher*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cfloat; X: pointer; incX: cint; A: pointer; lda: cint) {.cdecl, importc: "cblas_cher", dynlib: libgsl.}
proc cblas_chpr*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cfloat; X: pointer; incX: cint; A: pointer) {.cdecl, importc: "cblas_chpr", dynlib: libgsl.}
proc cblas_cher2*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: pointer; X: pointer; incX: cint; Y: pointer; incY: cint; A: pointer; lda: cint) {. cdecl, importc: "cblas_cher2", dynlib: libgsl.}
proc cblas_chpr2*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: pointer; X: pointer; incX: cint; Y: pointer; incY: cint; Ap: pointer) {.cdecl, importc: "cblas_chpr2", dynlib: libgsl.}
proc cblas_zhemv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: pointer; A: pointer; lda: cint; X: pointer; incX: cint; beta: pointer; Y: pointer; incY: cint) {.cdecl, importc: "cblas_zhemv", dynlib: libgsl.}
proc cblas_zhbmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; K: cint; alpha: pointer; A: pointer; lda: cint; X: pointer; incX: cint; beta: pointer; Y: pointer; incY: cint) {.cdecl, importc: "cblas_zhbmv", dynlib: libgsl.}
proc cblas_zhpmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: pointer; Ap: pointer; X: pointer; incX: cint; beta: pointer; Y: pointer; incY: cint) {.cdecl, importc: "cblas_zhpmv", dynlib: libgsl.}
proc cblas_zgeru*(order: CBLAS_ORDER; M: cint; N: cint; alpha: pointer; X: pointer; incX: cint; Y: pointer; incY: cint; A: pointer; lda: cint) {.cdecl, importc: "cblas_zgeru", dynlib: libgsl.}
proc cblas_zgerc*(order: CBLAS_ORDER; M: cint; N: cint; alpha: pointer; X: pointer; incX: cint; Y: pointer; incY: cint; A: pointer; lda: cint) {.cdecl, importc: "cblas_zgerc", dynlib: libgsl.}
proc cblas_zher*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cdouble; X: pointer; incX: cint; A: pointer; lda: cint) {.cdecl, importc: "cblas_zher", dynlib: libgsl.}
proc cblas_zhpr*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cdouble; X: pointer; incX: cint; A: pointer) {.cdecl, importc: "cblas_zhpr", dynlib: libgsl.}
proc cblas_zher2*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: pointer; X: pointer; incX: cint; Y: pointer; incY: cint; A: pointer; lda: cint) {. cdecl, importc: "cblas_zher2", dynlib: libgsl.}
proc cblas_zhpr2*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: pointer; X: pointer; incX: cint; Y: pointer; incY: cint; Ap: pointer) {.cdecl, importc: "cblas_zhpr2", dynlib: libgsl.}
proc cblas_sgemm*(Order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; TransB: CBLAS_TRANSPOSE; M: cint; N: cint; K: cint; alpha: cfloat; A: ptr cfloat; lda: cint; B: ptr cfloat; ldb: cint; beta: cfloat; C: ptr cfloat; ldc: cint) {.cdecl, importc: "cblas_sgemm",  dynlib: libgsl.}
proc cblas_ssymm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; M: cint; N: cint; alpha: cfloat; A: ptr cfloat; lda: cint; B: ptr cfloat; ldb: cint; beta: cfloat; C: ptr cfloat; ldc: cint) {.cdecl, importc: "cblas_ssymm", dynlib: libgsl.}
proc cblas_ssyrk*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: cfloat; A: ptr cfloat; lda: cint; beta: cfloat; C: ptr cfloat; ldc: cint) {.cdecl, importc: "cblas_ssyrk",  dynlib: libgsl.}
proc cblas_ssyr2k*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: cfloat; A: ptr cfloat; lda: cint; B: ptr cfloat; ldb: cint; beta: cfloat; C: ptr cfloat; ldc: cint) {.cdecl, importc: "cblas_ssyr2k", dynlib: libgsl.}
proc cblas_strmm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; M: cint; N: cint; alpha: cfloat; A: ptr cfloat; lda: cint; B: ptr cfloat; ldb: cint) {.cdecl, importc: "cblas_strmm", dynlib: libgsl.}
proc cblas_strsm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; M: cint; N: cint; alpha: cfloat; A: ptr cfloat; lda: cint; B: ptr cfloat; ldb: cint) {.cdecl, importc: "cblas_strsm", dynlib: libgsl.}
proc cblas_dgemm*(Order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; TransB: CBLAS_TRANSPOSE; M: cint; N: cint; K: cint; alpha: cdouble; A: ptr cdouble; lda: cint; B: ptr cdouble; ldb: cint; beta: cdouble; C: ptr cdouble; ldc: cint) {.cdecl, importc: "cblas_dgemm", dynlib: libgsl.}
proc cblas_dsymm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; M: cint; N: cint; alpha: cdouble; A: ptr cdouble; lda: cint; B: ptr cdouble; ldb: cint; beta: cdouble; C: ptr cdouble; ldc: cint) {.cdecl, importc: "cblas_dsymm", dynlib: libgsl.}
proc cblas_dsyrk*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: cdouble; A: ptr cdouble; lda: cint; beta: cdouble; C: ptr cdouble; ldc: cint) {.cdecl, importc: "cblas_dsyrk", dynlib: libgsl.}
proc cblas_dsyr2k*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: cdouble; A: ptr cdouble; lda: cint; B: ptr cdouble; ldb: cint; beta: cdouble; C: ptr cdouble; ldc: cint) {. cdecl, importc: "cblas_dsyr2k", dynlib: libgsl.}
proc cblas_dtrmm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; M: cint; N: cint; alpha: cdouble; A: ptr cdouble; lda: cint; B: ptr cdouble; ldb: cint) {. cdecl, importc: "cblas_dtrmm", dynlib: libgsl.}
proc cblas_dtrsm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; M: cint; N: cint; alpha: cdouble; A: ptr cdouble; lda: cint; B: ptr cdouble; ldb: cint) {. cdecl, importc: "cblas_dtrsm", dynlib: libgsl.}
proc cblas_cgemm*(Order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; TransB: CBLAS_TRANSPOSE; M: cint; N: cint; K: cint; alpha: pointer; A: pointer; lda: cint; B: pointer; ldb: cint; beta: pointer; C: pointer; ldc: cint) {.cdecl, importc: "cblas_cgemm", dynlib: libgsl.}
proc cblas_csymm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; M: cint; N: cint; alpha: pointer; A: pointer; lda: cint; B: pointer; ldb: cint; beta: pointer; C: pointer; ldc: cint) {.cdecl, importc: "cblas_csymm", dynlib: libgsl.}
proc cblas_csyrk*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: pointer; A: pointer; lda: cint; beta: pointer; C: pointer; ldc: cint) {.cdecl, importc: "cblas_csyrk", dynlib: libgsl.}
proc cblas_csyr2k*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: pointer; A: pointer; lda: cint; B: pointer; ldb: cint; beta: pointer; C: pointer; ldc: cint) {.cdecl, importc: "cblas_csyr2k", dynlib: libgsl.}
proc cblas_ctrmm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; M: cint; N: cint; alpha: pointer; A: pointer; lda: cint; B: pointer; ldb: cint) {.cdecl, importc: "cblas_ctrmm", dynlib: libgsl.}
proc cblas_ctrsm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; M: cint; N: cint; alpha: pointer; A: pointer; lda: cint; B: pointer; ldb: cint) {.cdecl, importc: "cblas_ctrsm", dynlib: libgsl.}
proc cblas_zgemm*(Order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; TransB: CBLAS_TRANSPOSE; M: cint; N: cint; K: cint; alpha: pointer; A: pointer; lda: cint; B: pointer; ldb: cint; beta: pointer; C: pointer; ldc: cint) {.cdecl, importc: "cblas_zgemm", dynlib: libgsl.}
proc cblas_zsymm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; M: cint; N: cint; alpha: pointer; A: pointer; lda: cint; B: pointer; ldb: cint; beta: pointer; C: pointer; ldc: cint) {.cdecl, importc: "cblas_zsymm", dynlib: libgsl.}
proc cblas_zsyrk*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: pointer; A: pointer; lda: cint; beta: pointer; C: pointer; ldc: cint) {.cdecl, importc: "cblas_zsyrk", dynlib: libgsl.}
proc cblas_zsyr2k*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: pointer; A: pointer; lda: cint; B: pointer; ldb: cint; beta: pointer; C: pointer; ldc: cint) {.cdecl, importc: "cblas_zsyr2k", dynlib: libgsl.}
proc cblas_ztrmm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; M: cint; N: cint; alpha: pointer; A: pointer; lda: cint; B: pointer; ldb: cint) {.cdecl, importc: "cblas_ztrmm", dynlib: libgsl.}
proc cblas_ztrsm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; M: cint; N: cint; alpha: pointer; A: pointer; lda: cint; B: pointer; ldb: cint) {.cdecl, importc: "cblas_ztrsm", dynlib: libgsl.}
proc cblas_chemm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; M: cint; N: cint; alpha: pointer; A: pointer; lda: cint; B: pointer; ldb: cint; beta: pointer; C: pointer; ldc: cint) {.cdecl, importc: "cblas_chemm", dynlib: libgsl.}
proc cblas_cherk*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: cfloat; A: pointer; lda: cint; beta: cfloat; C: pointer; ldc: cint) {.cdecl, importc: "cblas_cherk", dynlib: libgsl.}
proc cblas_cher2k*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: pointer; A: pointer; lda: cint; B: pointer; ldb: cint; beta: cfloat; C: pointer; ldc: cint) {.cdecl, importc: "cblas_cher2k", dynlib: libgsl.}
proc cblas_zhemm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; M: cint; N: cint; alpha: pointer; A: pointer; lda: cint; B: pointer; ldb: cint; beta: pointer; C: pointer; ldc: cint) {.cdecl, importc: "cblas_zhemm", dynlib: libgsl.}
proc cblas_zherk*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: cdouble; A: pointer; lda: cint; beta: cdouble; C: pointer; ldc: cint) {.cdecl, importc: "cblas_zherk", dynlib: libgsl.}
proc cblas_zher2k*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: pointer; A: pointer; lda: cint; B: pointer; ldb: cint; beta: cdouble; C: pointer; ldc: cint) {.cdecl, importc: "cblas_zher2k", dynlib: libgsl.}
proc cblas_xerbla*(p: cint; rout: cstring; form: cstring) {.varargs, cdecl, importc: "cblas_xerbla", dynlib: libgsl.}
proc gsl_blas_sdsdot*(alpha: cfloat; X: ptr gsl_vector_float; Y: ptr gsl_vector_float; result: ptr cfloat): cint {.cdecl, importc: "gsl_blas_sdsdot", dynlib: libgsl.}
proc gsl_blas_dsdot*(X: ptr gsl_vector_float; Y: ptr gsl_vector_float;   result: ptr cdouble): cint {.cdecl, importc: "gsl_blas_dsdot", dynlib: libgsl.}
proc gsl_blas_sdot*(X: ptr gsl_vector_float; Y: ptr gsl_vector_float;  result: ptr cfloat): cint {.cdecl, importc: "gsl_blas_sdot", dynlib: libgsl.}
proc gsl_blas_ddot*(X: ptr gsl_vector; Y: ptr gsl_vector; result: ptr cdouble): cint {. cdecl, importc: "gsl_blas_ddot", dynlib: libgsl.}
proc gsl_blas_cdotu*(X: ptr gsl_vector_complex_float;   Y: ptr gsl_vector_complex_float; dotu: ptr gsl_complex_float): cint {. cdecl, importc: "gsl_blas_cdotu", dynlib: libgsl.}
proc gsl_blas_cdotc*(X: ptr gsl_vector_complex_float;   Y: ptr gsl_vector_complex_float; dotc: ptr gsl_complex_float): cint {. cdecl, importc: "gsl_blas_cdotc", dynlib: libgsl.}
proc gsl_blas_zdotu*(X: ptr gsl_vector_complex; Y: ptr gsl_vector_complex;   dotu: ptr gsl_complex): cint {.cdecl, importc: "gsl_blas_zdotu", dynlib: libgsl.}
proc gsl_blas_zdotc*(X: ptr gsl_vector_complex; Y: ptr gsl_vector_complex;   dotc: ptr gsl_complex): cint {.cdecl, importc: "gsl_blas_zdotc", dynlib: libgsl.}
proc gsl_blas_snrm2*(X: ptr gsl_vector_float): cfloat {.cdecl, importc: "gsl_blas_snrm2", dynlib: libgsl.}
proc gsl_blas_sasum*(X: ptr gsl_vector_float): cfloat {.cdecl, importc: "gsl_blas_sasum", dynlib: libgsl.}
proc gsl_blas_dnrm2*(X: ptr gsl_vector): cdouble {.cdecl, importc: "gsl_blas_dnrm2", dynlib: libgsl.}
proc gsl_blas_dasum*(X: ptr gsl_vector): cdouble {.cdecl, importc: "gsl_blas_dasum", dynlib: libgsl.}
proc gsl_blas_scnrm2*(X: ptr gsl_vector_complex_float): cfloat {.cdecl, importc: "gsl_blas_scnrm2", dynlib: libgsl.}
proc gsl_blas_scasum*(X: ptr gsl_vector_complex_float): cfloat {.cdecl, importc: "gsl_blas_scasum", dynlib: libgsl.}
proc gsl_blas_dznrm2*(X: ptr gsl_vector_complex): cdouble {.cdecl, importc: "gsl_blas_dznrm2", dynlib: libgsl.}
proc gsl_blas_dzasum*(X: ptr gsl_vector_complex): cdouble {.cdecl, importc: "gsl_blas_dzasum", dynlib: libgsl.}
proc gsl_blas_isamax*(X: ptr gsl_vector_float): CBLAS_INDEX_t {.cdecl, importc: "gsl_blas_isamax", dynlib: libgsl.}
proc gsl_blas_idamax*(X: ptr gsl_vector): CBLAS_INDEX_t {.cdecl, importc: "gsl_blas_idamax", dynlib: libgsl.}
proc gsl_blas_icamax*(X: ptr gsl_vector_complex_float): CBLAS_INDEX_t {.cdecl, importc: "gsl_blas_icamax", dynlib: libgsl.}
proc gsl_blas_izamax*(X: ptr gsl_vector_complex): CBLAS_INDEX_t {.cdecl, importc: "gsl_blas_izamax", dynlib: libgsl.}
proc gsl_blas_sswap*(X: ptr gsl_vector_float; Y: ptr gsl_vector_float): cint {.cdecl, importc: "gsl_blas_sswap", dynlib: libgsl.}
proc gsl_blas_scopy*(X: ptr gsl_vector_float; Y: ptr gsl_vector_float): cint {.cdecl, importc: "gsl_blas_scopy", dynlib: libgsl.}
proc gsl_blas_saxpy*(alpha: cfloat; X: ptr gsl_vector_float; Y: ptr gsl_vector_float): cint {. cdecl, importc: "gsl_blas_saxpy", dynlib: libgsl.}
proc gsl_blas_dswap*(X: ptr gsl_vector; Y: ptr gsl_vector): cint {.cdecl, importc: "gsl_blas_dswap", dynlib: libgsl.}
proc gsl_blas_dcopy*(X: ptr gsl_vector; Y: ptr gsl_vector): cint {.cdecl, importc: "gsl_blas_dcopy", dynlib: libgsl.}
proc gsl_blas_daxpy*(alpha: cdouble; X: ptr gsl_vector; Y: ptr gsl_vector): cint {.cdecl, importc: "gsl_blas_daxpy", dynlib: libgsl.}
proc gsl_blas_cswap*(X: ptr gsl_vector_complex_float;   Y: ptr gsl_vector_complex_float): cint {.cdecl, importc: "gsl_blas_cswap", dynlib: libgsl.}
proc gsl_blas_ccopy*(X: ptr gsl_vector_complex_float;   Y: ptr gsl_vector_complex_float): cint {.cdecl, importc: "gsl_blas_ccopy", dynlib: libgsl.}
proc gsl_blas_caxpy*(alpha: gsl_complex_float; X: ptr gsl_vector_complex_float;   Y: ptr gsl_vector_complex_float): cint {.cdecl, importc: "gsl_blas_caxpy", dynlib: libgsl.}
proc gsl_blas_zswap*(X: ptr gsl_vector_complex; Y: ptr gsl_vector_complex): cint {. cdecl, importc: "gsl_blas_zswap", dynlib: libgsl.}
proc gsl_blas_zcopy*(X: ptr gsl_vector_complex; Y: ptr gsl_vector_complex): cint {. cdecl, importc: "gsl_blas_zcopy", dynlib: libgsl.}
proc gsl_blas_zaxpy*(alpha: gsl_complex; X: ptr gsl_vector_complex;   Y: ptr gsl_vector_complex): cint {.cdecl, importc: "gsl_blas_zaxpy", dynlib: libgsl.}
proc gsl_blas_srotg*(a: ptr cfloat; b: ptr cfloat; c: ptr cfloat; s: ptr cfloat): cint {. cdecl, importc: "gsl_blas_srotg", dynlib: libgsl.}
proc gsl_blas_srotmg*(d1: ptr cfloat; d2: ptr cfloat; b1: ptr cfloat; b2: cfloat; P: ptr cfloat): cint {.cdecl, importc: "gsl_blas_srotmg",  dynlib: libgsl.}
proc gsl_blas_srot*(X: ptr gsl_vector_float; Y: ptr gsl_vector_float; c: cfloat;  s: cfloat): cint {.cdecl, importc: "gsl_blas_srot", dynlib: libgsl.}
proc gsl_blas_srotm*(X: ptr gsl_vector_float; Y: ptr gsl_vector_float; P: ptr cfloat): cint {. cdecl, importc: "gsl_blas_srotm", dynlib: libgsl.}
proc gsl_blas_drotg*(a: ptr cdouble; b: ptr cdouble; c: ptr cdouble; s: ptr cdouble): cint {. cdecl, importc: "gsl_blas_drotg", dynlib: libgsl.}
proc gsl_blas_drotmg*(d1: ptr cdouble; d2: ptr cdouble; b1: ptr cdouble; b2: cdouble; P: ptr cdouble): cint {.cdecl, importc: "gsl_blas_drotmg", dynlib: libgsl.}
proc gsl_blas_drot*(X: ptr gsl_vector; Y: ptr gsl_vector; c: cdouble; s: cdouble): cint {. cdecl, importc: "gsl_blas_drot", dynlib: libgsl.}
proc gsl_blas_drotm*(X: ptr gsl_vector; Y: ptr gsl_vector; P: ptr cdouble): cint {.cdecl, importc: "gsl_blas_drotm", dynlib: libgsl.}
proc gsl_blas_sscal*(alpha: cfloat; X: ptr gsl_vector_float) {.cdecl, importc: "gsl_blas_sscal", dynlib: libgsl.}
proc gsl_blas_dscal*(alpha: cdouble; X: ptr gsl_vector) {.cdecl, importc: "gsl_blas_dscal", dynlib: libgsl.}
proc gsl_blas_cscal*(alpha: gsl_complex_float; X: ptr gsl_vector_complex_float) {. cdecl, importc: "gsl_blas_cscal", dynlib: libgsl.}
proc gsl_blas_zscal*(alpha: gsl_complex; X: ptr gsl_vector_complex) {.cdecl, importc: "gsl_blas_zscal", dynlib: libgsl.}
proc gsl_blas_csscal*(alpha: cfloat; X: ptr gsl_vector_complex_float) {.cdecl, importc: "gsl_blas_csscal", dynlib: libgsl.}
proc gsl_blas_zdscal*(alpha: cdouble; X: ptr gsl_vector_complex) {.cdecl, importc: "gsl_blas_zdscal", dynlib: libgsl.}
proc gsl_blas_sgemv*(TransA: CBLAS_TRANSPOSE_t; alpha: cfloat;   A: ptr gsl_matrix_float; X: ptr gsl_vector_float; beta: cfloat;   Y: ptr gsl_vector_float): cint {.cdecl, importc: "gsl_blas_sgemv", dynlib: libgsl.}
proc gsl_blas_strmv*(Uplo: CBLAS_UPLO_t; TransA: CBLAS_TRANSPOSE_t;   Diag: CBLAS_DIAG_t; A: ptr gsl_matrix_float;   X: ptr gsl_vector_float): cint {.cdecl, importc: "gsl_blas_strmv", dynlib: libgsl.}
proc gsl_blas_strsv*(Uplo: CBLAS_UPLO_t; TransA: CBLAS_TRANSPOSE_t;   Diag: CBLAS_DIAG_t; A: ptr gsl_matrix_float;   X: ptr gsl_vector_float): cint {.cdecl, importc: "gsl_blas_strsv", dynlib: libgsl.}
proc gsl_blas_dgemv*(TransA: CBLAS_TRANSPOSE_t; alpha: cdouble; A: ptr gsl_matrix;   X: ptr gsl_vector; beta: cdouble; Y: ptr gsl_vector): cint {.cdecl, importc: "gsl_blas_dgemv", dynlib: libgsl.}
proc gsl_blas_dtrmv*(Uplo: CBLAS_UPLO_t; TransA: CBLAS_TRANSPOSE_t;   Diag: CBLAS_DIAG_t; A: ptr gsl_matrix; X: ptr gsl_vector): cint {. cdecl, importc: "gsl_blas_dtrmv", dynlib: libgsl.}
proc gsl_blas_dtrsv*(Uplo: CBLAS_UPLO_t; TransA: CBLAS_TRANSPOSE_t;   Diag: CBLAS_DIAG_t; A: ptr gsl_matrix; X: ptr gsl_vector): cint {. cdecl, importc: "gsl_blas_dtrsv", dynlib: libgsl.}
proc gsl_blas_cgemv*(TransA: CBLAS_TRANSPOSE_t; alpha: gsl_complex_float;   A: ptr gsl_matrix_complex_float;   X: ptr gsl_vector_complex_float; beta: gsl_complex_float;   Y: ptr gsl_vector_complex_float): cint {.cdecl, importc: "gsl_blas_cgemv", dynlib: libgsl.}
proc gsl_blas_ctrmv*(Uplo: CBLAS_UPLO_t; TransA: CBLAS_TRANSPOSE_t;   Diag: CBLAS_DIAG_t; A: ptr gsl_matrix_complex_float;   X: ptr gsl_vector_complex_float): cint {.cdecl, importc: "gsl_blas_ctrmv", dynlib: libgsl.}
proc gsl_blas_ctrsv*(Uplo: CBLAS_UPLO_t; TransA: CBLAS_TRANSPOSE_t;   Diag: CBLAS_DIAG_t; A: ptr gsl_matrix_complex_float;   X: ptr gsl_vector_complex_float): cint {.cdecl, importc: "gsl_blas_ctrsv", dynlib: libgsl.}
proc gsl_blas_zgemv*(TransA: CBLAS_TRANSPOSE_t; alpha: gsl_complex;   A: ptr gsl_matrix_complex; X: ptr gsl_vector_complex;   beta: gsl_complex; Y: ptr gsl_vector_complex): cint {.cdecl, importc: "gsl_blas_zgemv", dynlib: libgsl.}
proc gsl_blas_ztrmv*(Uplo: CBLAS_UPLO_t; TransA: CBLAS_TRANSPOSE_t;   Diag: CBLAS_DIAG_t; A: ptr gsl_matrix_complex;   X: ptr gsl_vector_complex): cint {.cdecl, importc: "gsl_blas_ztrmv", dynlib: libgsl.}
proc gsl_blas_ztrsv*(Uplo: CBLAS_UPLO_t; TransA: CBLAS_TRANSPOSE_t;   Diag: CBLAS_DIAG_t; A: ptr gsl_matrix_complex;   X: ptr gsl_vector_complex): cint {.cdecl, importc: "gsl_blas_ztrsv", dynlib: libgsl.}
proc gsl_blas_ssymv*(Uplo: CBLAS_UPLO_t; alpha: cfloat; A: ptr gsl_matrix_float;   X: ptr gsl_vector_float; beta: cfloat; Y: ptr gsl_vector_float): cint {. cdecl, importc: "gsl_blas_ssymv", dynlib: libgsl.}
proc gsl_blas_sger*(alpha: cfloat; X: ptr gsl_vector_float; Y: ptr gsl_vector_float;  A: ptr gsl_matrix_float): cint {.cdecl, importc: "gsl_blas_sger", dynlib: libgsl.}
proc gsl_blas_ssyr*(Uplo: CBLAS_UPLO_t; alpha: cfloat; X: ptr gsl_vector_float;  A: ptr gsl_matrix_float): cint {.cdecl, importc: "gsl_blas_ssyr", dynlib: libgsl.}
proc gsl_blas_ssyr2*(Uplo: CBLAS_UPLO_t; alpha: cfloat; X: ptr gsl_vector_float;   Y: ptr gsl_vector_float; A: ptr gsl_matrix_float): cint {.cdecl, importc: "gsl_blas_ssyr2", dynlib: libgsl.}
proc gsl_blas_dsymv*(Uplo: CBLAS_UPLO_t; alpha: cdouble; A: ptr gsl_matrix;   X: ptr gsl_vector; beta: cdouble; Y: ptr gsl_vector): cint {.cdecl, importc: "gsl_blas_dsymv", dynlib: libgsl.}
proc gsl_blas_dger*(alpha: cdouble; X: ptr gsl_vector; Y: ptr gsl_vector;  A: ptr gsl_matrix): cint {.cdecl, importc: "gsl_blas_dger", dynlib: libgsl.}
proc gsl_blas_dsyr*(Uplo: CBLAS_UPLO_t; alpha: cdouble; X: ptr gsl_vector;  A: ptr gsl_matrix): cint {.cdecl, importc: "gsl_blas_dsyr", dynlib: libgsl.}
proc gsl_blas_dsyr2*(Uplo: CBLAS_UPLO_t; alpha: cdouble; X: ptr gsl_vector;   Y: ptr gsl_vector; A: ptr gsl_matrix): cint {.cdecl, importc: "gsl_blas_dsyr2", dynlib: libgsl.}
proc gsl_blas_chemv*(Uplo: CBLAS_UPLO_t; alpha: gsl_complex_float;   A: ptr gsl_matrix_complex_float;   X: ptr gsl_vector_complex_float; beta: gsl_complex_float;   Y: ptr gsl_vector_complex_float): cint {.cdecl, importc: "gsl_blas_chemv", dynlib: libgsl.}
proc gsl_blas_cgeru*(alpha: gsl_complex_float; X: ptr gsl_vector_complex_float;   Y: ptr gsl_vector_complex_float;   A: ptr gsl_matrix_complex_float): cint {.cdecl, importc: "gsl_blas_cgeru", dynlib: libgsl.}
proc gsl_blas_cgerc*(alpha: gsl_complex_float; X: ptr gsl_vector_complex_float;   Y: ptr gsl_vector_complex_float;   A: ptr gsl_matrix_complex_float): cint {.cdecl, importc: "gsl_blas_cgerc", dynlib: libgsl.}
proc gsl_blas_cher*(Uplo: CBLAS_UPLO_t; alpha: cfloat;  X: ptr gsl_vector_complex_float; A: ptr gsl_matrix_complex_float): cint {. cdecl, importc: "gsl_blas_cher", dynlib: libgsl.}
proc gsl_blas_cher2*(Uplo: CBLAS_UPLO_t; alpha: gsl_complex_float;   X: ptr gsl_vector_complex_float;   Y: ptr gsl_vector_complex_float;   A: ptr gsl_matrix_complex_float): cint {.cdecl, importc: "gsl_blas_cher2", dynlib: libgsl.}
proc gsl_blas_zhemv*(Uplo: CBLAS_UPLO_t; alpha: gsl_complex;   A: ptr gsl_matrix_complex; X: ptr gsl_vector_complex;   beta: gsl_complex; Y: ptr gsl_vector_complex): cint {.cdecl, importc: "gsl_blas_zhemv", dynlib: libgsl.}
proc gsl_blas_zgeru*(alpha: gsl_complex; X: ptr gsl_vector_complex;   Y: ptr gsl_vector_complex; A: ptr gsl_matrix_complex): cint {. cdecl, importc: "gsl_blas_zgeru", dynlib: libgsl.}
proc gsl_blas_zgerc*(alpha: gsl_complex; X: ptr gsl_vector_complex;   Y: ptr gsl_vector_complex; A: ptr gsl_matrix_complex): cint {. cdecl, importc: "gsl_blas_zgerc", dynlib: libgsl.}
proc gsl_blas_zher*(Uplo: CBLAS_UPLO_t; alpha: cdouble; X: ptr gsl_vector_complex;  A: ptr gsl_matrix_complex): cint {.cdecl, importc: "gsl_blas_zher", dynlib: libgsl.}
proc gsl_blas_zher2*(Uplo: CBLAS_UPLO_t; alpha: gsl_complex;   X: ptr gsl_vector_complex; Y: ptr gsl_vector_complex;   A: ptr gsl_matrix_complex): cint {.cdecl, importc: "gsl_blas_zher2", dynlib: libgsl.}
proc gsl_blas_sgemm*(TransA: CBLAS_TRANSPOSE_t; TransB: CBLAS_TRANSPOSE_t;   alpha: cfloat; A: ptr gsl_matrix_float; B: ptr gsl_matrix_float;   beta: cfloat; C: ptr gsl_matrix_float): cint {.cdecl, importc: "gsl_blas_sgemm", dynlib: libgsl.}
proc gsl_blas_ssymm*(Side: CBLAS_SIDE_t; Uplo: CBLAS_UPLO_t; alpha: cfloat;   A: ptr gsl_matrix_float; B: ptr gsl_matrix_float; beta: cfloat;   C: ptr gsl_matrix_float): cint {.cdecl, importc: "gsl_blas_ssymm", dynlib: libgsl.}
proc gsl_blas_ssyrk*(Uplo: CBLAS_UPLO_t; Trans: CBLAS_TRANSPOSE_t; alpha: cfloat;   A: ptr gsl_matrix_float; beta: cfloat; C: ptr gsl_matrix_float): cint {. cdecl, importc: "gsl_blas_ssyrk", dynlib: libgsl.}
proc gsl_blas_ssyr2k*(Uplo: CBLAS_UPLO_t; Trans: CBLAS_TRANSPOSE_t; alpha: cfloat; A: ptr gsl_matrix_float; B: ptr gsl_matrix_float; beta: cfloat; C: ptr gsl_matrix_float): cint {.cdecl, importc: "gsl_blas_ssyr2k", dynlib: libgsl.}
proc gsl_blas_strmm*(Side: CBLAS_SIDE_t; Uplo: CBLAS_UPLO_t;   TransA: CBLAS_TRANSPOSE_t; Diag: CBLAS_DIAG_t; alpha: cfloat;   A: ptr gsl_matrix_float; B: ptr gsl_matrix_float): cint {.cdecl, importc: "gsl_blas_strmm", dynlib: libgsl.}
proc gsl_blas_strsm*(Side: CBLAS_SIDE_t; Uplo: CBLAS_UPLO_t;   TransA: CBLAS_TRANSPOSE_t; Diag: CBLAS_DIAG_t; alpha: cfloat;   A: ptr gsl_matrix_float; B: ptr gsl_matrix_float): cint {.cdecl, importc: "gsl_blas_strsm", dynlib: libgsl.}
proc gsl_blas_dgemm*(TransA: CBLAS_TRANSPOSE_t; TransB: CBLAS_TRANSPOSE_t;   alpha: cdouble; A: ptr gsl_matrix; B: ptr gsl_matrix; beta: cdouble;   C: ptr gsl_matrix): cint {.cdecl, importc: "gsl_blas_dgemm", dynlib: libgsl.}
proc gsl_blas_dsymm*(Side: CBLAS_SIDE_t; Uplo: CBLAS_UPLO_t; alpha: cdouble;   A: ptr gsl_matrix; B: ptr gsl_matrix; beta: cdouble;   C: ptr gsl_matrix): cint {.cdecl, importc: "gsl_blas_dsymm", dynlib: libgsl.}
proc gsl_blas_dsyrk*(Uplo: CBLAS_UPLO_t; Trans: CBLAS_TRANSPOSE_t; alpha: cdouble;   A: ptr gsl_matrix; beta: cdouble; C: ptr gsl_matrix): cint {.cdecl, importc: "gsl_blas_dsyrk", dynlib: libgsl.}
proc gsl_blas_dsyr2k*(Uplo: CBLAS_UPLO_t; Trans: CBLAS_TRANSPOSE_t; alpha: cdouble; A: ptr gsl_matrix; B: ptr gsl_matrix; beta: cdouble; C: ptr gsl_matrix): cint {.cdecl, importc: "gsl_blas_dsyr2k", dynlib: libgsl.}
proc gsl_blas_dtrmm*(Side: CBLAS_SIDE_t; Uplo: CBLAS_UPLO_t;   TransA: CBLAS_TRANSPOSE_t; Diag: CBLAS_DIAG_t; alpha: cdouble;   A: ptr gsl_matrix; B: ptr gsl_matrix): cint {.cdecl, importc: "gsl_blas_dtrmm", dynlib: libgsl.}
proc gsl_blas_dtrsm*(Side: CBLAS_SIDE_t; Uplo: CBLAS_UPLO_t;   TransA: CBLAS_TRANSPOSE_t; Diag: CBLAS_DIAG_t; alpha: cdouble;   A: ptr gsl_matrix; B: ptr gsl_matrix): cint {.cdecl, importc: "gsl_blas_dtrsm", dynlib: libgsl.}
proc gsl_blas_cgemm*(TransA: CBLAS_TRANSPOSE_t; TransB: CBLAS_TRANSPOSE_t;   alpha: gsl_complex_float; A: ptr gsl_matrix_complex_float;   B: ptr gsl_matrix_complex_float; beta: gsl_complex_float;   C: ptr gsl_matrix_complex_float): cint {.cdecl, importc: "gsl_blas_cgemm", dynlib: libgsl.}
proc gsl_blas_csymm*(Side: CBLAS_SIDE_t; Uplo: CBLAS_UPLO_t;   alpha: gsl_complex_float; A: ptr gsl_matrix_complex_float;   B: ptr gsl_matrix_complex_float; beta: gsl_complex_float;   C: ptr gsl_matrix_complex_float): cint {.cdecl, importc: "gsl_blas_csymm", dynlib: libgsl.}
proc gsl_blas_csyrk*(Uplo: CBLAS_UPLO_t; Trans: CBLAS_TRANSPOSE_t;   alpha: gsl_complex_float; A: ptr gsl_matrix_complex_float;   beta: gsl_complex_float; C: ptr gsl_matrix_complex_float): cint {. cdecl, importc: "gsl_blas_csyrk", dynlib: libgsl.}
proc gsl_blas_csyr2k*(Uplo: CBLAS_UPLO_t; Trans: CBLAS_TRANSPOSE_t; alpha: gsl_complex_float; A: ptr gsl_matrix_complex_float; B: ptr gsl_matrix_complex_float; beta: gsl_complex_float; C: ptr gsl_matrix_complex_float): cint {.cdecl, importc: "gsl_blas_csyr2k", dynlib: libgsl.}
proc gsl_blas_ctrmm*(Side: CBLAS_SIDE_t; Uplo: CBLAS_UPLO_t;   TransA: CBLAS_TRANSPOSE_t; Diag: CBLAS_DIAG_t;   alpha: gsl_complex_float; A: ptr gsl_matrix_complex_float;   B: ptr gsl_matrix_complex_float): cint {.cdecl, importc: "gsl_blas_ctrmm", dynlib: libgsl.}
proc gsl_blas_ctrsm*(Side: CBLAS_SIDE_t; Uplo: CBLAS_UPLO_t;   TransA: CBLAS_TRANSPOSE_t; Diag: CBLAS_DIAG_t;   alpha: gsl_complex_float; A: ptr gsl_matrix_complex_float;   B: ptr gsl_matrix_complex_float): cint {.cdecl, importc: "gsl_blas_ctrsm", dynlib: libgsl.}
proc gsl_blas_zgemm*(TransA: CBLAS_TRANSPOSE_t; TransB: CBLAS_TRANSPOSE_t;   alpha: gsl_complex; A: ptr gsl_matrix_complex;   B: ptr gsl_matrix_complex; beta: gsl_complex;   C: ptr gsl_matrix_complex): cint {.cdecl, importc: "gsl_blas_zgemm", dynlib: libgsl.}
proc gsl_blas_zsymm*(Side: CBLAS_SIDE_t; Uplo: CBLAS_UPLO_t; alpha: gsl_complex;   A: ptr gsl_matrix_complex; B: ptr gsl_matrix_complex;   beta: gsl_complex; C: ptr gsl_matrix_complex): cint {.cdecl, importc: "gsl_blas_zsymm", dynlib: libgsl.}
proc gsl_blas_zsyrk*(Uplo: CBLAS_UPLO_t; Trans: CBLAS_TRANSPOSE_t;   alpha: gsl_complex; A: ptr gsl_matrix_complex; beta: gsl_complex;   C: ptr gsl_matrix_complex): cint {.cdecl, importc: "gsl_blas_zsyrk", dynlib: libgsl.}
proc gsl_blas_zsyr2k*(Uplo: CBLAS_UPLO_t; Trans: CBLAS_TRANSPOSE_t; alpha: gsl_complex; A: ptr gsl_matrix_complex; B: ptr gsl_matrix_complex; beta: gsl_complex; C: ptr gsl_matrix_complex): cint {.cdecl, importc: "gsl_blas_zsyr2k", dynlib: libgsl.}
proc gsl_blas_ztrmm*(Side: CBLAS_SIDE_t; Uplo: CBLAS_UPLO_t;   TransA: CBLAS_TRANSPOSE_t; Diag: CBLAS_DIAG_t;   alpha: gsl_complex; A: ptr gsl_matrix_complex;   B: ptr gsl_matrix_complex): cint {.cdecl, importc: "gsl_blas_ztrmm", dynlib: libgsl.}
proc gsl_blas_ztrsm*(Side: CBLAS_SIDE_t; Uplo: CBLAS_UPLO_t;   TransA: CBLAS_TRANSPOSE_t; Diag: CBLAS_DIAG_t;   alpha: gsl_complex; A: ptr gsl_matrix_complex;   B: ptr gsl_matrix_complex): cint {.cdecl, importc: "gsl_blas_ztrsm", dynlib: libgsl.}
proc gsl_blas_chemm*(Side: CBLAS_SIDE_t; Uplo: CBLAS_UPLO_t;   alpha: gsl_complex_float; A: ptr gsl_matrix_complex_float;   B: ptr gsl_matrix_complex_float; beta: gsl_complex_float;   C: ptr gsl_matrix_complex_float): cint {.cdecl, importc: "gsl_blas_chemm", dynlib: libgsl.}
proc gsl_blas_cherk*(Uplo: CBLAS_UPLO_t; Trans: CBLAS_TRANSPOSE_t; alpha: cfloat;   A: ptr gsl_matrix_complex_float; beta: cfloat;   C: ptr gsl_matrix_complex_float): cint {.cdecl, importc: "gsl_blas_cherk", dynlib: libgsl.}
proc gsl_blas_cher2k*(Uplo: CBLAS_UPLO_t; Trans: CBLAS_TRANSPOSE_t; alpha: gsl_complex_float; A: ptr gsl_matrix_complex_float; B: ptr gsl_matrix_complex_float; beta: cfloat; C: ptr gsl_matrix_complex_float): cint {.cdecl, importc: "gsl_blas_cher2k", dynlib: libgsl.}
proc gsl_blas_zhemm*(Side: CBLAS_SIDE_t; Uplo: CBLAS_UPLO_t; alpha: gsl_complex;   A: ptr gsl_matrix_complex; B: ptr gsl_matrix_complex;   beta: gsl_complex; C: ptr gsl_matrix_complex): cint {.cdecl, importc: "gsl_blas_zhemm", dynlib: libgsl.}
proc gsl_blas_zherk*(Uplo: CBLAS_UPLO_t; Trans: CBLAS_TRANSPOSE_t; alpha: cdouble;   A: ptr gsl_matrix_complex; beta: cdouble;   C: ptr gsl_matrix_complex): cint {.cdecl, importc: "gsl_blas_zherk", dynlib: libgsl.}
proc gsl_blas_zher2k*(Uplo: CBLAS_UPLO_t; Trans: CBLAS_TRANSPOSE_t; alpha: gsl_complex; A: ptr gsl_matrix_complex; B: ptr gsl_matrix_complex; beta: cdouble; C: ptr gsl_matrix_complex): cint {.cdecl, importc: "gsl_blas_zher2k", dynlib: libgsl.}
proc gsl_linalg_matmult*(A: ptr gsl_matrix; B: ptr gsl_matrix; C: ptr gsl_matrix): cint {. cdecl, importc: "gsl_linalg_matmult", dynlib: libgsl.}
proc gsl_linalg_matmult_mod*(A: ptr gsl_matrix; modA: gsl_linalg_matrix_mod_t; B: ptr gsl_matrix; modB: gsl_linalg_matrix_mod_t; C: ptr gsl_matrix): cint {.cdecl, importc: "gsl_linalg_matmult_mod", dynlib: libgsl.}
proc gsl_linalg_exponential_ss*(A: ptr gsl_matrix; eA: ptr gsl_matrix; mode: gsl_mode_t): cint {. cdecl, importc: "gsl_linalg_exponential_ss", dynlib: libgsl.}
proc gsl_linalg_householder_transform*(v: ptr gsl_vector): cdouble {.cdecl, importc: "gsl_linalg_householder_transform", dynlib: libgsl.}
proc gsl_linalg_complex_householder_transform*(v: ptr gsl_vector_complex): gsl_complex {. cdecl, importc: "gsl_linalg_complex_householder_transform", dynlib: libgsl.}
proc gsl_linalg_householder_hm*(tau: cdouble; v: ptr gsl_vector; A: ptr gsl_matrix): cint {. cdecl, importc: "gsl_linalg_householder_hm", dynlib: libgsl.}
proc gsl_linalg_householder_mh*(tau: cdouble; v: ptr gsl_vector; A: ptr gsl_matrix): cint {. cdecl, importc: "gsl_linalg_householder_mh", dynlib: libgsl.}
proc gsl_linalg_householder_hv*(tau: cdouble; v: ptr gsl_vector; w: ptr gsl_vector): cint {. cdecl, importc: "gsl_linalg_householder_hv", dynlib: libgsl.}
proc gsl_linalg_householder_hm1*(tau: cdouble; A: ptr gsl_matrix): cint {.cdecl, importc: "gsl_linalg_householder_hm1", dynlib: libgsl.}
proc gsl_linalg_complex_householder_hm*(tau: gsl_complex;    v: ptr gsl_vector_complex;    A: ptr gsl_matrix_complex): cint {.cdecl, importc: "gsl_linalg_complex_householder_hm", dynlib: libgsl.}
proc gsl_linalg_complex_householder_mh*(tau: gsl_complex;    v: ptr gsl_vector_complex;    A: ptr gsl_matrix_complex): cint {.cdecl, importc: "gsl_linalg_complex_householder_mh", dynlib: libgsl.}
proc gsl_linalg_complex_householder_hv*(tau: gsl_complex;    v: ptr gsl_vector_complex;    w: ptr gsl_vector_complex): cint {.cdecl, importc: "gsl_linalg_complex_householder_hv", dynlib: libgsl.}
proc gsl_linalg_hessenberg_decomp*(A: ptr gsl_matrix; tau: ptr gsl_vector): cint {. cdecl, importc: "gsl_linalg_hessenberg_decomp", dynlib: libgsl.}
proc gsl_linalg_hessenberg_unpack*(H: ptr gsl_matrix; tau: ptr gsl_vector; U: ptr gsl_matrix): cint {.cdecl, importc: "gsl_linalg_hessenberg_unpack", dynlib: libgsl.}
proc gsl_linalg_hessenberg_unpack_accum*(H: ptr gsl_matrix; tau: ptr gsl_vector; U: ptr gsl_matrix): cint {.cdecl, importc: "gsl_linalg_hessenberg_unpack_accum", dynlib: libgsl.}
proc gsl_linalg_hessenberg_set_zero*(H: ptr gsl_matrix): cint {.cdecl, importc: "gsl_linalg_hessenberg_set_zero", dynlib: libgsl.}
proc gsl_linalg_hessenberg_submatrix*(M: ptr gsl_matrix; A: ptr gsl_matrix;  top: csize_t; tau: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_hessenberg_submatrix", dynlib: libgsl.}
proc gsl_linalg_hesstri_decomp*(A: ptr gsl_matrix; B: ptr gsl_matrix; U: ptr gsl_matrix; V: ptr gsl_matrix; work: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_hesstri_decomp", dynlib: libgsl.}
proc gsl_linalg_SV_decomp*(A: ptr gsl_matrix; V: ptr gsl_matrix; S: ptr gsl_vector;  work: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_SV_decomp", dynlib: libgsl.}
proc gsl_linalg_SV_decomp_mod*(A: ptr gsl_matrix; X: ptr gsl_matrix; V: ptr gsl_matrix;   S: ptr gsl_vector; work: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_SV_decomp_mod", dynlib: libgsl.}
proc gsl_linalg_SV_decomp_jacobi*(A: ptr gsl_matrix; Q: ptr gsl_matrix; S: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_SV_decomp_jacobi", dynlib: libgsl.}
proc gsl_linalg_SV_solve*(U: ptr gsl_matrix; Q: ptr gsl_matrix; S: ptr gsl_vector; b: ptr gsl_vector; x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_SV_solve", dynlib: libgsl.}
proc gsl_linalg_SV_leverage*(U: ptr gsl_matrix; h: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_SV_leverage", dynlib: libgsl.}
proc gsl_linalg_LU_decomp*(A: ptr gsl_matrix; p: ptr gsl_permutation; signum: ptr cint): cint {. cdecl, importc: "gsl_linalg_LU_decomp", dynlib: libgsl.}
proc gsl_linalg_LU_solve*(LU: ptr gsl_matrix; p: ptr gsl_permutation; b: ptr gsl_vector; x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_LU_solve", dynlib: libgsl.}
proc gsl_linalg_LU_svx*(LU: ptr gsl_matrix; p: ptr gsl_permutation; x: ptr gsl_vector): cint {. cdecl, importc: "gsl_linalg_LU_svx", dynlib: libgsl.}
proc gsl_linalg_LU_refine*(A: ptr gsl_matrix; LU: ptr gsl_matrix;  p: ptr gsl_permutation; b: ptr gsl_vector;  x: ptr gsl_vector; work: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_LU_refine", dynlib: libgsl.}
proc gsl_linalg_LU_invert*(LU: ptr gsl_matrix; p: ptr gsl_permutation;  inverse: ptr gsl_matrix): cint {.cdecl, importc: "gsl_linalg_LU_invert", dynlib: libgsl.}
proc gsl_linalg_LU_det*(LU: ptr gsl_matrix; signum: cint): cdouble {.cdecl, importc: "gsl_linalg_LU_det", dynlib: libgsl.}
proc gsl_linalg_LU_lndet*(LU: ptr gsl_matrix): cdouble {.cdecl, importc: "gsl_linalg_LU_lndet", dynlib: libgsl.}
proc gsl_linalg_LU_sgndet*(lu: ptr gsl_matrix; signum: cint): cint {.cdecl, importc: "gsl_linalg_LU_sgndet", dynlib: libgsl.}
proc gsl_linalg_complex_LU_decomp*(A: ptr gsl_matrix_complex; p: ptr gsl_permutation; signum: ptr cint): cint {. cdecl, importc: "gsl_linalg_complex_LU_decomp", dynlib: libgsl.}
proc gsl_linalg_complex_LU_solve*(LU: ptr gsl_matrix_complex; p: ptr gsl_permutation; b: ptr gsl_vector_complex; x: ptr gsl_vector_complex): cint {.cdecl, importc: "gsl_linalg_complex_LU_solve", dynlib: libgsl.}
proc gsl_linalg_complex_LU_svx*(LU: ptr gsl_matrix_complex; p: ptr gsl_permutation; x: ptr gsl_vector_complex): cint {.cdecl, importc: "gsl_linalg_complex_LU_svx", dynlib: libgsl.}
proc gsl_linalg_complex_LU_refine*(A: ptr gsl_matrix_complex; LU: ptr gsl_matrix_complex; p: ptr gsl_permutation; b: ptr gsl_vector_complex; x: ptr gsl_vector_complex; work: ptr gsl_vector_complex): cint {.cdecl, importc: "gsl_linalg_complex_LU_refine", dynlib: libgsl.}
proc gsl_linalg_complex_LU_invert*(LU: ptr gsl_matrix_complex; p: ptr gsl_permutation; inverse: ptr gsl_matrix_complex): cint {.cdecl, importc: "gsl_linalg_complex_LU_invert", dynlib: libgsl.}
proc gsl_linalg_complex_LU_det*(LU: ptr gsl_matrix_complex; signum: cint): gsl_complex {. cdecl, importc: "gsl_linalg_complex_LU_det", dynlib: libgsl.}
proc gsl_linalg_complex_LU_lndet*(LU: ptr gsl_matrix_complex): cdouble {.cdecl, importc: "gsl_linalg_complex_LU_lndet", dynlib: libgsl.}
proc gsl_linalg_complex_LU_sgndet*(LU: ptr gsl_matrix_complex; signum: cint): gsl_complex {. cdecl, importc: "gsl_linalg_complex_LU_sgndet", dynlib: libgsl.}
proc gsl_linalg_QR_decomp*(A: ptr gsl_matrix; tau: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_QR_decomp", dynlib: libgsl.}
proc gsl_linalg_QR_solve*(QR: ptr gsl_matrix; tau: ptr gsl_vector; b: ptr gsl_vector; x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_QR_solve", dynlib: libgsl.}
proc gsl_linalg_QR_svx*(QR: ptr gsl_matrix; tau: ptr gsl_vector; x: ptr gsl_vector): cint {. cdecl, importc: "gsl_linalg_QR_svx", dynlib: libgsl.}
proc gsl_linalg_QR_lssolve*(QR: ptr gsl_matrix; tau: ptr gsl_vector; b: ptr gsl_vector;   x: ptr gsl_vector; residual: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_QR_lssolve", dynlib: libgsl.}
proc gsl_linalg_QR_QRsolve*(Q: ptr gsl_matrix; R: ptr gsl_matrix; b: ptr gsl_vector;   x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_QR_QRsolve", dynlib: libgsl.}
proc gsl_linalg_QR_Rsolve*(QR: ptr gsl_matrix; b: ptr gsl_vector; x: ptr gsl_vector): cint {. cdecl, importc: "gsl_linalg_QR_Rsolve", dynlib: libgsl.}
proc gsl_linalg_QR_Rsvx*(QR: ptr gsl_matrix; x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_QR_Rsvx", dynlib: libgsl.}
proc gsl_linalg_QR_update*(Q: ptr gsl_matrix; R: ptr gsl_matrix; w: ptr gsl_vector;  v: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_QR_update", dynlib: libgsl.}
proc gsl_linalg_QR_QTvec*(QR: ptr gsl_matrix; tau: ptr gsl_vector; v: ptr gsl_vector): cint {. cdecl, importc: "gsl_linalg_QR_QTvec", dynlib: libgsl.}
proc gsl_linalg_QR_Qvec*(QR: ptr gsl_matrix; tau: ptr gsl_vector; v: ptr gsl_vector): cint {. cdecl, importc: "gsl_linalg_QR_Qvec", dynlib: libgsl.}
proc gsl_linalg_QR_QTmat*(QR: ptr gsl_matrix; tau: ptr gsl_vector; A: ptr gsl_matrix): cint {. cdecl, importc: "gsl_linalg_QR_QTmat", dynlib: libgsl.}
proc gsl_linalg_QR_matQ*(QR: ptr gsl_matrix; tau: ptr gsl_vector; A: ptr gsl_matrix): cint {. cdecl, importc: "gsl_linalg_QR_matQ", dynlib: libgsl.}
proc gsl_linalg_QR_unpack*(QR: ptr gsl_matrix; tau: ptr gsl_vector; Q: ptr gsl_matrix;  R: ptr gsl_matrix): cint {.cdecl, importc: "gsl_linalg_QR_unpack", dynlib: libgsl.}
proc gsl_linalg_R_solve*(R: ptr gsl_matrix; b: ptr gsl_vector; x: ptr gsl_vector): cint {. cdecl, importc: "gsl_linalg_R_solve", dynlib: libgsl.}
proc gsl_linalg_R_svx*(R: ptr gsl_matrix; x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_R_svx", dynlib: libgsl.}
proc gsl_linalg_QRPT_decomp*(A: ptr gsl_matrix; tau: ptr gsl_vector; p: ptr gsl_permutation; signum: ptr cint; norm: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_QRPT_decomp", dynlib: libgsl.}
proc gsl_linalg_QRPT_decomp2*(A: ptr gsl_matrix; q: ptr gsl_matrix; r: ptr gsl_matrix;  tau: ptr gsl_vector; p: ptr gsl_permutation;  signum: ptr cint; norm: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_QRPT_decomp2", dynlib: libgsl.}
proc gsl_linalg_QRPT_solve*(QR: ptr gsl_matrix; tau: ptr gsl_vector;   p: ptr gsl_permutation; b: ptr gsl_vector;   x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_QRPT_solve", dynlib: libgsl.}
proc gsl_linalg_QRPT_lssolve*(QR: ptr gsl_matrix; tau: ptr gsl_vector;  p: ptr gsl_permutation; b: ptr gsl_vector;  x: ptr gsl_vector; residual: ptr gsl_vector): cint {. cdecl, importc: "gsl_linalg_QRPT_lssolve", dynlib: libgsl.}
proc gsl_linalg_QRPT_lssolve2*(QR: ptr gsl_matrix; tau: ptr gsl_vector;   p: ptr gsl_permutation; b: ptr gsl_vector;   rank: csize_t; x: ptr gsl_vector;   residual: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_QRPT_lssolve2", dynlib: libgsl.}
proc gsl_linalg_QRPT_svx*(QR: ptr gsl_matrix; tau: ptr gsl_vector; p: ptr gsl_permutation; x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_QRPT_svx", dynlib: libgsl.}
proc gsl_linalg_QRPT_QRsolve*(Q: ptr gsl_matrix; R: ptr gsl_matrix;  p: ptr gsl_permutation; b: ptr gsl_vector;  x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_QRPT_QRsolve", dynlib: libgsl.}
proc gsl_linalg_QRPT_Rsolve*(QR: ptr gsl_matrix; p: ptr gsl_permutation; b: ptr gsl_vector; x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_QRPT_Rsolve", dynlib: libgsl.}
proc gsl_linalg_QRPT_Rsvx*(QR: ptr gsl_matrix; p: ptr gsl_permutation;  x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_QRPT_Rsvx", dynlib: libgsl.}
proc gsl_linalg_QRPT_update*(Q: ptr gsl_matrix; R: ptr gsl_matrix; p: ptr gsl_permutation; u: ptr gsl_vector; v: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_QRPT_update", dynlib: libgsl.}
proc gsl_linalg_QRPT_rank*(QR: ptr gsl_matrix; tol: cdouble): csize_t {.cdecl, importc: "gsl_linalg_QRPT_rank", dynlib: libgsl.}
proc gsl_linalg_QRPT_rcond*(QR: ptr gsl_matrix; rcond: ptr cdouble;   work: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_QRPT_rcond", dynlib: libgsl.}
proc gsl_linalg_COD_decomp*(A: ptr gsl_matrix; tau_Q: ptr gsl_vector;   tau_Z: ptr gsl_vector; p: ptr gsl_permutation;   rank: ptr csize_t; work: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_COD_decomp", dynlib: libgsl.}
proc gsl_linalg_COD_decomp_e*(A: ptr gsl_matrix; tau_Q: ptr gsl_vector;  tau_Z: ptr gsl_vector; p: ptr gsl_permutation;  tol: cdouble; rank: ptr csize_t; work: ptr gsl_vector): cint {. cdecl, importc: "gsl_linalg_COD_decomp_e", dynlib: libgsl.}
proc gsl_linalg_COD_lssolve*(QRZT: ptr gsl_matrix; tau_Q: ptr gsl_vector; tau_Z: ptr gsl_vector; perm: ptr gsl_permutation; rank: csize_t; b: ptr gsl_vector; x: ptr gsl_vector; residual: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_COD_lssolve", dynlib: libgsl.}
proc gsl_linalg_COD_lssolve2*(lambda: cdouble; QRZT: ptr gsl_matrix;  tau_Q: ptr gsl_vector; tau_Z: ptr gsl_vector;  perm: ptr gsl_permutation; rank: csize_t;  b: ptr gsl_vector; x: ptr gsl_vector;  residual: ptr gsl_vector; S: ptr gsl_matrix;  work: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_COD_lssolve2", dynlib: libgsl.}
proc gsl_linalg_COD_unpack*(QRZT: ptr gsl_matrix; tau_Q: ptr gsl_vector;   tau_Z: ptr gsl_vector; rank: csize_t; Q: ptr gsl_matrix;   R: ptr gsl_matrix; Z: ptr gsl_matrix): cint {.cdecl, importc: "gsl_linalg_COD_unpack", dynlib: libgsl.}
proc gsl_linalg_COD_matZ*(QRZT: ptr gsl_matrix; tau_Z: ptr gsl_vector; rank: csize_t; A: ptr gsl_matrix; work: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_COD_matZ", dynlib: libgsl.}
proc gsl_linalg_LQ_decomp*(A: ptr gsl_matrix; tau: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_LQ_decomp", dynlib: libgsl.}
proc gsl_linalg_LQ_solve_T*(LQ: ptr gsl_matrix; tau: ptr gsl_vector; b: ptr gsl_vector;   x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_LQ_solve_T", dynlib: libgsl.}
proc gsl_linalg_LQ_svx_T*(LQ: ptr gsl_matrix; tau: ptr gsl_vector; x: ptr gsl_vector): cint {. cdecl, importc: "gsl_linalg_LQ_svx_T", dynlib: libgsl.}
proc gsl_linalg_LQ_lssolve_T*(LQ: ptr gsl_matrix; tau: ptr gsl_vector;  b: ptr gsl_vector; x: ptr gsl_vector;  residual: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_LQ_lssolve_T", dynlib: libgsl.}
proc gsl_linalg_LQ_Lsolve_T*(LQ: ptr gsl_matrix; b: ptr gsl_vector; x: ptr gsl_vector): cint {. cdecl, importc: "gsl_linalg_LQ_Lsolve_T", dynlib: libgsl.}
proc gsl_linalg_LQ_Lsvx_T*(LQ: ptr gsl_matrix; x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_LQ_Lsvx_T", dynlib: libgsl.}
proc gsl_linalg_L_solve_T*(L: ptr gsl_matrix; b: ptr gsl_vector; x: ptr gsl_vector): cint {. cdecl, importc: "gsl_linalg_L_solve_T", dynlib: libgsl.}
proc gsl_linalg_LQ_vecQ*(LQ: ptr gsl_matrix; tau: ptr gsl_vector; v: ptr gsl_vector): cint {. cdecl, importc: "gsl_linalg_LQ_vecQ", dynlib: libgsl.}
proc gsl_linalg_LQ_vecQT*(LQ: ptr gsl_matrix; tau: ptr gsl_vector; v: ptr gsl_vector): cint {. cdecl, importc: "gsl_linalg_LQ_vecQT", dynlib: libgsl.}
proc gsl_linalg_LQ_unpack*(LQ: ptr gsl_matrix; tau: ptr gsl_vector; Q: ptr gsl_matrix;  L: ptr gsl_matrix): cint {.cdecl, importc: "gsl_linalg_LQ_unpack", dynlib: libgsl.}
proc gsl_linalg_LQ_update*(Q: ptr gsl_matrix; R: ptr gsl_matrix; v: ptr gsl_vector;  w: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_LQ_update", dynlib: libgsl.}
proc gsl_linalg_LQ_LQsolve*(Q: ptr gsl_matrix; L: ptr gsl_matrix; b: ptr gsl_vector;   x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_LQ_LQsolve", dynlib: libgsl.}
proc gsl_linalg_PTLQ_decomp*(A: ptr gsl_matrix; tau: ptr gsl_vector; p: ptr gsl_permutation; signum: ptr cint; norm: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_PTLQ_decomp", dynlib: libgsl.}
proc gsl_linalg_PTLQ_decomp2*(A: ptr gsl_matrix; q: ptr gsl_matrix; r: ptr gsl_matrix;  tau: ptr gsl_vector; p: ptr gsl_permutation;  signum: ptr cint; norm: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_PTLQ_decomp2", dynlib: libgsl.}
proc gsl_linalg_PTLQ_solve_T*(QR: ptr gsl_matrix; tau: ptr gsl_vector;  p: ptr gsl_permutation; b: ptr gsl_vector;  x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_PTLQ_solve_T", dynlib: libgsl.}
proc gsl_linalg_PTLQ_svx_T*(LQ: ptr gsl_matrix; tau: ptr gsl_vector;   p: ptr gsl_permutation; x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_PTLQ_svx_T", dynlib: libgsl.}
proc gsl_linalg_PTLQ_LQsolve_T*(Q: ptr gsl_matrix; L: ptr gsl_matrix; p: ptr gsl_permutation; b: ptr gsl_vector; x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_PTLQ_LQsolve_T", dynlib: libgsl.}
proc gsl_linalg_PTLQ_Lsolve_T*(LQ: ptr gsl_matrix; p: ptr gsl_permutation;   b: ptr gsl_vector; x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_PTLQ_Lsolve_T", dynlib: libgsl.}
proc gsl_linalg_PTLQ_Lsvx_T*(LQ: ptr gsl_matrix; p: ptr gsl_permutation; x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_PTLQ_Lsvx_T", dynlib: libgsl.}
proc gsl_linalg_PTLQ_update*(Q: ptr gsl_matrix; L: ptr gsl_matrix; p: ptr gsl_permutation; v: ptr gsl_vector; w: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_PTLQ_update", dynlib: libgsl.}
proc gsl_linalg_cholesky_decomp*(A: ptr gsl_matrix): cint {.cdecl, importc: "gsl_linalg_cholesky_decomp", dynlib: libgsl.}
proc gsl_linalg_cholesky_decomp1*(A: ptr gsl_matrix): cint {.cdecl, importc: "gsl_linalg_cholesky_decomp1", dynlib: libgsl.}
proc gsl_linalg_cholesky_solve*(cholesky: ptr gsl_matrix; b: ptr gsl_vector; x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_cholesky_solve", dynlib: libgsl.}
proc gsl_linalg_cholesky_solve_mat*(cholesky: ptr gsl_matrix; B: ptr gsl_matrix;  X: ptr gsl_matrix): cint {.cdecl, importc: "gsl_linalg_cholesky_solve_mat", dynlib: libgsl.}
proc gsl_linalg_cholesky_svx*(cholesky: ptr gsl_matrix; x: ptr gsl_vector): cint {. cdecl, importc: "gsl_linalg_cholesky_svx", dynlib: libgsl.}
proc gsl_linalg_cholesky_svx_mat*(cholesky: ptr gsl_matrix; X: ptr gsl_matrix): cint {. cdecl, importc: "gsl_linalg_cholesky_svx_mat", dynlib: libgsl.}
proc gsl_linalg_cholesky_invert*(cholesky: ptr gsl_matrix): cint {.cdecl, importc: "gsl_linalg_cholesky_invert", dynlib: libgsl.}
proc gsl_linalg_cholesky_decomp_unit*(A: ptr gsl_matrix; D: ptr gsl_vector): cint {. cdecl, importc: "gsl_linalg_cholesky_decomp_unit", dynlib: libgsl.}
proc gsl_linalg_cholesky_scale*(A: ptr gsl_matrix; S: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_cholesky_scale", dynlib: libgsl.}
proc gsl_linalg_cholesky_scale_apply*(A: ptr gsl_matrix; S: ptr gsl_vector): cint {. cdecl, importc: "gsl_linalg_cholesky_scale_apply", dynlib: libgsl.}
proc gsl_linalg_cholesky_decomp2*(A: ptr gsl_matrix; S: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_cholesky_decomp2", dynlib: libgsl.}
proc gsl_linalg_cholesky_svx2*(LLT: ptr gsl_matrix; S: ptr gsl_vector;   x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_cholesky_svx2", dynlib: libgsl.}
proc gsl_linalg_cholesky_solve2*(LLT: ptr gsl_matrix; S: ptr gsl_vector; b: ptr gsl_vector; x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_cholesky_solve2", dynlib: libgsl.}
proc gsl_linalg_cholesky_rcond*(LLT: ptr gsl_matrix; rcond: ptr cdouble; work: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_cholesky_rcond", dynlib: libgsl.}
proc gsl_linalg_complex_cholesky_decomp*(A: ptr gsl_matrix_complex): cint {.cdecl, importc: "gsl_linalg_complex_cholesky_decomp", dynlib: libgsl.}
proc gsl_linalg_complex_cholesky_solve*(cholesky: ptr gsl_matrix_complex;    b: ptr gsl_vector_complex;    x: ptr gsl_vector_complex): cint {.cdecl, importc: "gsl_linalg_complex_cholesky_solve", dynlib: libgsl.}
proc gsl_linalg_complex_cholesky_svx*(cholesky: ptr gsl_matrix_complex;  x: ptr gsl_vector_complex): cint {.cdecl, importc: "gsl_linalg_complex_cholesky_svx", dynlib: libgsl.}
proc gsl_linalg_complex_cholesky_invert*(cholesky: ptr gsl_matrix_complex): cint {. cdecl, importc: "gsl_linalg_complex_cholesky_invert", dynlib: libgsl.}
proc gsl_linalg_pcholesky_decomp*(A: ptr gsl_matrix; p: ptr gsl_permutation): cint {. cdecl, importc: "gsl_linalg_pcholesky_decomp", dynlib: libgsl.}
proc gsl_linalg_pcholesky_solve*(LDLT: ptr gsl_matrix; p: ptr gsl_permutation; b: ptr gsl_vector; x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_pcholesky_solve", dynlib: libgsl.}
proc gsl_linalg_pcholesky_svx*(LDLT: ptr gsl_matrix; p: ptr gsl_permutation;   x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_pcholesky_svx", dynlib: libgsl.}
proc gsl_linalg_pcholesky_decomp2*(A: ptr gsl_matrix; p: ptr gsl_permutation; S: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_pcholesky_decomp2", dynlib: libgsl.}
proc gsl_linalg_pcholesky_solve2*(LDLT: ptr gsl_matrix; p: ptr gsl_permutation; S: ptr gsl_vector; b: ptr gsl_vector; x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_pcholesky_solve2", dynlib: libgsl.}
proc gsl_linalg_pcholesky_svx2*(LDLT: ptr gsl_matrix; p: ptr gsl_permutation; S: ptr gsl_vector; x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_pcholesky_svx2", dynlib: libgsl.}
proc gsl_linalg_pcholesky_invert*(LDLT: ptr gsl_matrix; p: ptr gsl_permutation; Ainv: ptr gsl_matrix): cint {.cdecl, importc: "gsl_linalg_pcholesky_invert", dynlib: libgsl.}
proc gsl_linalg_pcholesky_rcond*(LDLT: ptr gsl_matrix; p: ptr gsl_permutation; rcond: ptr cdouble; work: ptr gsl_vector): cint {. cdecl, importc: "gsl_linalg_pcholesky_rcond", dynlib: libgsl.}
proc gsl_linalg_mcholesky_decomp*(A: ptr gsl_matrix; p: ptr gsl_permutation; E: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_mcholesky_decomp", dynlib: libgsl.}
proc gsl_linalg_mcholesky_solve*(LDLT: ptr gsl_matrix; p: ptr gsl_permutation; b: ptr gsl_vector; x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_mcholesky_solve", dynlib: libgsl.}
proc gsl_linalg_mcholesky_svx*(LDLT: ptr gsl_matrix; p: ptr gsl_permutation;   x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_mcholesky_svx", dynlib: libgsl.}
proc gsl_linalg_mcholesky_rcond*(LDLT: ptr gsl_matrix; p: ptr gsl_permutation; rcond: ptr cdouble; work: ptr gsl_vector): cint {. cdecl, importc: "gsl_linalg_mcholesky_rcond", dynlib: libgsl.}
proc gsl_linalg_mcholesky_invert*(LDLT: ptr gsl_matrix; p: ptr gsl_permutation; Ainv: ptr gsl_matrix): cint {.cdecl, importc: "gsl_linalg_mcholesky_invert", dynlib: libgsl.}
proc gsl_linalg_symmtd_decomp*(A: ptr gsl_matrix; tau: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_symmtd_decomp", dynlib: libgsl.}
proc gsl_linalg_symmtd_unpack*(A: ptr gsl_matrix; tau: ptr gsl_vector;   Q: ptr gsl_matrix; diag: ptr gsl_vector;   subdiag: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_symmtd_unpack", dynlib: libgsl.}
proc gsl_linalg_symmtd_unpack_T*(A: ptr gsl_matrix; diag: ptr gsl_vector; subdiag: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_symmtd_unpack_T", dynlib: libgsl.}
proc gsl_linalg_hermtd_decomp*(A: ptr gsl_matrix_complex;   tau: ptr gsl_vector_complex): cint {.cdecl, importc: "gsl_linalg_hermtd_decomp", dynlib: libgsl.}
proc gsl_linalg_hermtd_unpack*(A: ptr gsl_matrix_complex;   tau: ptr gsl_vector_complex;   U: ptr gsl_matrix_complex; diag: ptr gsl_vector;   sudiag: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_hermtd_unpack", dynlib: libgsl.}
proc gsl_linalg_hermtd_unpack_T*(A: ptr gsl_matrix_complex; diag: ptr gsl_vector; subdiag: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_hermtd_unpack_T", dynlib: libgsl.}
proc gsl_linalg_HH_solve*(A: ptr gsl_matrix; b: ptr gsl_vector; x: ptr gsl_vector): cint {. cdecl, importc: "gsl_linalg_HH_solve", dynlib: libgsl.}
proc gsl_linalg_HH_svx*(A: ptr gsl_matrix; x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_HH_svx", dynlib: libgsl.}
proc gsl_linalg_solve_symm_tridiag*(diag: ptr gsl_vector; offdiag: ptr gsl_vector;  b: ptr gsl_vector; x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_solve_symm_tridiag", dynlib: libgsl.}
proc gsl_linalg_solve_tridiag*(diag: ptr gsl_vector; abovediag: ptr gsl_vector;   belowdiag: ptr gsl_vector; b: ptr gsl_vector;   x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_solve_tridiag", dynlib: libgsl.}
proc gsl_linalg_solve_symm_cyc_tridiag*(diag: ptr gsl_vector;    offdiag: ptr gsl_vector; b: ptr gsl_vector;    x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_solve_symm_cyc_tridiag", dynlib: libgsl.}
proc gsl_linalg_solve_cyc_tridiag*(diag: ptr gsl_vector; abovediag: ptr gsl_vector; belowdiag: ptr gsl_vector; b: ptr gsl_vector; x: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_solve_cyc_tridiag", dynlib: libgsl.}
proc gsl_linalg_bidiag_decomp*(A: ptr gsl_matrix; tau_U: ptr gsl_vector;   tau_V: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_bidiag_decomp", dynlib: libgsl.}
proc gsl_linalg_bidiag_unpack*(A: ptr gsl_matrix; tau_U: ptr gsl_vector;   U: ptr gsl_matrix; tau_V: ptr gsl_vector;   V: ptr gsl_matrix; diag: ptr gsl_vector;   superdiag: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_bidiag_unpack", dynlib: libgsl.}
proc gsl_linalg_bidiag_unpack2*(A: ptr gsl_matrix; tau_U: ptr gsl_vector; tau_V: ptr gsl_vector; V: ptr gsl_matrix): cint {.cdecl, importc: "gsl_linalg_bidiag_unpack2", dynlib: libgsl.}
proc gsl_linalg_bidiag_unpack_B*(A: ptr gsl_matrix; diag: ptr gsl_vector; superdiag: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_bidiag_unpack_B", dynlib: libgsl.}
proc gsl_linalg_balance_matrix*(A: ptr gsl_matrix; D: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_balance_matrix", dynlib: libgsl.}
proc gsl_linalg_balance_accum*(A: ptr gsl_matrix; D: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_balance_accum", dynlib: libgsl.}
proc gsl_linalg_balance_columns*(A: ptr gsl_matrix; D: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_balance_columns", dynlib: libgsl.}
proc gsl_linalg_tri_upper_rcond*(A: ptr gsl_matrix; rcond: ptr cdouble; work: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_tri_upper_rcond", dynlib: libgsl.}
proc gsl_linalg_tri_lower_rcond*(A: ptr gsl_matrix; rcond: ptr cdouble; work: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_tri_lower_rcond", dynlib: libgsl.}
proc gsl_linalg_invnorm1*(N: csize_t; Ainvx: proc (TransA: CBLAS_TRANSPOSE_t; x: ptr gsl_vector; params: pointer): cint {.cdecl.}; params: pointer; Ainvnorm: ptr cdouble; work: ptr gsl_vector): cint {.cdecl, importc: "gsl_linalg_invnorm1", dynlib: libgsl.}
proc gsl_linalg_tri_upper_invert*(T: ptr gsl_matrix): cint {.cdecl, importc: "gsl_linalg_tri_upper_invert", dynlib: libgsl.}
proc gsl_linalg_tri_lower_invert*(T: ptr gsl_matrix): cint {.cdecl, importc: "gsl_linalg_tri_lower_invert", dynlib: libgsl.}
proc gsl_linalg_tri_upper_unit_invert*(T: ptr gsl_matrix): cint {.cdecl, importc: "gsl_linalg_tri_upper_unit_invert", dynlib: libgsl.}
proc gsl_linalg_tri_lower_unit_invert*(T: ptr gsl_matrix): cint {.cdecl, importc: "gsl_linalg_tri_lower_unit_invert", dynlib: libgsl.}
proc gsl_linalg_givens*(a: cdouble; b: cdouble; c: ptr cdouble; s: ptr cdouble) {.cdecl, importc: "gsl_linalg_givens", dynlib: libgsl.}
proc gsl_linalg_givens_gv*(v: ptr gsl_vector; i: csize_t; j: csize_t; c: cdouble;  s: cdouble) {.cdecl, importc: "gsl_linalg_givens_gv",   dynlib: libgsl.}
proc gsl_splinalg_itersolve_alloc*(T: ptr gsl_splinalg_itersolve_type; n: csize_t; m: csize_t): ptr gsl_splinalg_itersolve {.cdecl, importc: "gsl_splinalg_itersolve_alloc", dynlib: libgsl.}
proc gsl_splinalg_itersolve_free*(w: ptr gsl_splinalg_itersolve) {.cdecl, importc: "gsl_splinalg_itersolve_free", dynlib: libgsl.}
proc gsl_splinalg_itersolve_name*(w: ptr gsl_splinalg_itersolve): cstring {.cdecl, importc: "gsl_splinalg_itersolve_name", dynlib: libgsl.}
proc gsl_splinalg_itersolve_iterate*(A: ptr gsl_spmatrix; b: ptr gsl_vector; tol: cdouble; x: ptr gsl_vector; w: ptr gsl_splinalg_itersolve): cint {.cdecl, importc: "gsl_splinalg_itersolve_iterate", dynlib: libgsl.}
proc gsl_splinalg_itersolve_normr*(w: ptr gsl_splinalg_itersolve): cdouble {.cdecl, importc: "gsl_splinalg_itersolve_normr", dynlib: libgsl.}

var gsl_prec_eps* {.importc: "gsl_prec_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_sqrt_eps* {.importc: "gsl_prec_sqrt_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root3_eps* {.importc: "gsl_prec_root3_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root4_eps* {.importc: "gsl_prec_root4_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root5_eps* {.importc: "gsl_prec_root5_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root6_eps* {.importc: "gsl_prec_root6_eps", dynlib: libgsl.}: ptr cdouble

var gsl_check_range* {.importc: "gsl_check_range", dynlib: libgsl.}: cint

var gsl_splinalg_itersolve_gmres* {.importc: "gsl_splinalg_itersolve_gmres", dynlib: libgsl.}: ptr gsl_splinalg_itersolve_type

