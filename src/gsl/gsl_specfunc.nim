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
  gsl_sf_result_struct* {.bycopy.} = object
    val*: cdouble
    err*: cdouble

  gsl_sf_result* = gsl_sf_result_struct
  gsl_sf_result_e10_struct* {.bycopy.} = object
    val*: cdouble
    err*: cdouble
    e10*: cint

  gsl_sf_result_e10* = gsl_sf_result_e10_struct

  gsl_mode_t* = cuint

  gsl_prec_t* = cuint

  gsl_sf_legendre_t* {.size: sizeof(cint).} = enum
    GSL_SF_LEGENDRE_SCHMIDT, GSL_SF_LEGENDRE_SPHARM, GSL_SF_LEGENDRE_FULL, GSL_SF_LEGENDRE_NONE

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

  gsl_eigen_symm_workspace* {.bycopy.} = object
    size*: csize_t
    d*: ptr cdouble
    sd*: ptr cdouble

  gsl_eigen_symmv_workspace* {.bycopy.} = object
    size*: csize_t
    d*: ptr cdouble
    sd*: ptr cdouble
    gc*: ptr cdouble
    gs*: ptr cdouble

  gsl_eigen_herm_workspace* {.bycopy.} = object
    size*: csize_t
    d*: ptr cdouble
    sd*: ptr cdouble
    tau*: ptr cdouble

  gsl_eigen_hermv_workspace* {.bycopy.} = object
    size*: csize_t
    d*: ptr cdouble
    sd*: ptr cdouble
    tau*: ptr cdouble
    gc*: ptr cdouble
    gs*: ptr cdouble

  gsl_eigen_francis_workspace* {.bycopy.} = object
    size*: csize_t
    max_iterations*: csize_t
    n_iter*: csize_t
    n_evals*: csize_t
    compute_t*: cint
    H*: ptr gsl_matrix
    Z*: ptr gsl_matrix

  gsl_eigen_nonsymm_workspace* {.bycopy.} = object
    size*: csize_t
    diag*: ptr gsl_vector
    tau*: ptr gsl_vector
    Z*: ptr gsl_matrix
    do_balance*: cint
    n_evals*: csize_t
    francis_workspace_p*: ptr gsl_eigen_francis_workspace

  gsl_eigen_nonsymmv_workspace* {.bycopy.} = object
    size*: csize_t
    work*: ptr gsl_vector
    work2*: ptr gsl_vector
    work3*: ptr gsl_vector
    Z*: ptr gsl_matrix
    nonsymm_workspace_p*: ptr gsl_eigen_nonsymm_workspace

  gsl_eigen_gensymm_workspace* {.bycopy.} = object
    size*: csize_t
    symm_workspace_p*: ptr gsl_eigen_symm_workspace

  gsl_eigen_gensymmv_workspace* {.bycopy.} = object
    size*: csize_t
    symmv_workspace_p*: ptr gsl_eigen_symmv_workspace

  gsl_eigen_genherm_workspace* {.bycopy.} = object
    size*: csize_t
    herm_workspace_p*: ptr gsl_eigen_herm_workspace

  gsl_eigen_genhermv_workspace* {.bycopy.} = object
    size*: csize_t
    hermv_workspace_p*: ptr gsl_eigen_hermv_workspace

  gsl_eigen_gen_workspace* {.bycopy.} = object
    size*: csize_t
    work*: ptr gsl_vector
    n_evals*: csize_t
    max_iterations*: csize_t
    n_iter*: csize_t
    eshift*: cdouble
    needtop*: cint
    atol*: cdouble
    btol*: cdouble
    ascale*: cdouble
    bscale*: cdouble
    H*: ptr gsl_matrix
    R*: ptr gsl_matrix
    compute_s*: cint
    compute_t*: cint
    Q*: ptr gsl_matrix
    Z*: ptr gsl_matrix

  gsl_eigen_genv_workspace* {.bycopy.} = object
    size*: csize_t
    work1*: ptr gsl_vector
    work2*: ptr gsl_vector
    work3*: ptr gsl_vector
    work4*: ptr gsl_vector
    work5*: ptr gsl_vector
    work6*: ptr gsl_vector
    Q*: ptr gsl_matrix
    Z*: ptr gsl_matrix
    gen_workspace_p*: ptr gsl_eigen_gen_workspace

  gsl_eigen_sort_t* {.size: sizeof(cint).} = enum
    GSL_EIGEN_SORT_VAL_ASC, GSL_EIGEN_SORT_VAL_DESC, GSL_EIGEN_SORT_ABS_ASC, GSL_EIGEN_SORT_ABS_DESC

  gsl_sf_mathieu_workspace* {.bycopy.} = object
    size*: csize_t
    even_order*: csize_t
    odd_order*: csize_t
    extra_values*: cint
    qa*: cdouble
    qb*: cdouble
    aa*: ptr cdouble
    bb*: ptr cdouble
    dd*: ptr cdouble
    ee*: ptr cdouble
    tt*: ptr cdouble
    e2*: ptr cdouble
    zz*: ptr cdouble
    eval*: ptr gsl_vector
    evec*: ptr gsl_matrix
    wmat*: ptr gsl_eigen_symmv_workspace

proc gsl_sf_result_smash_e*(re: ptr gsl_sf_result_e10; r: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_result_smash_e", dynlib: libgsl.}
proc gsl_sf_airy_Ai_e*(x: cdouble; mode: gsl_mode_t; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_airy_Ai_e", dynlib: libgsl.}
proc gsl_sf_airy_Ai*(x: cdouble; mode: gsl_mode_t): cdouble {.cdecl, importc: "gsl_sf_airy_Ai", dynlib: libgsl.}
proc gsl_sf_airy_Bi_e*(x: cdouble; mode: gsl_mode_t; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_airy_Bi_e", dynlib: libgsl.}
proc gsl_sf_airy_Bi*(x: cdouble; mode: gsl_mode_t): cdouble {.cdecl, importc: "gsl_sf_airy_Bi", dynlib: libgsl.}
proc gsl_sf_airy_Ai_scaled_e*(x: cdouble; mode: gsl_mode_t; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_airy_Ai_scaled_e", dynlib: libgsl.}
proc gsl_sf_airy_Ai_scaled*(x: cdouble; mode: gsl_mode_t): cdouble {.cdecl, importc: "gsl_sf_airy_Ai_scaled", dynlib: libgsl.}
proc gsl_sf_airy_Bi_scaled_e*(x: cdouble; mode: gsl_mode_t; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_airy_Bi_scaled_e", dynlib: libgsl.}
proc gsl_sf_airy_Bi_scaled*(x: cdouble; mode: gsl_mode_t): cdouble {.cdecl, importc: "gsl_sf_airy_Bi_scaled", dynlib: libgsl.}
proc gsl_sf_airy_Ai_deriv_e*(x: cdouble; mode: gsl_mode_t; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_airy_Ai_deriv_e", dynlib: libgsl.}
proc gsl_sf_airy_Ai_deriv*(x: cdouble; mode: gsl_mode_t): cdouble {.cdecl, importc: "gsl_sf_airy_Ai_deriv", dynlib: libgsl.}
proc gsl_sf_airy_Bi_deriv_e*(x: cdouble; mode: gsl_mode_t; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_airy_Bi_deriv_e", dynlib: libgsl.}
proc gsl_sf_airy_Bi_deriv*(x: cdouble; mode: gsl_mode_t): cdouble {.cdecl, importc: "gsl_sf_airy_Bi_deriv", dynlib: libgsl.}
proc gsl_sf_airy_Ai_deriv_scaled_e*(x: cdouble; mode: gsl_mode_t;  result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_airy_Ai_deriv_scaled_e", dynlib: libgsl.}
proc gsl_sf_airy_Ai_deriv_scaled*(x: cdouble; mode: gsl_mode_t): cdouble {.cdecl, importc: "gsl_sf_airy_Ai_deriv_scaled", dynlib: libgsl.}
proc gsl_sf_airy_Bi_deriv_scaled_e*(x: cdouble; mode: gsl_mode_t;  result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_airy_Bi_deriv_scaled_e", dynlib: libgsl.}
proc gsl_sf_airy_Bi_deriv_scaled*(x: cdouble; mode: gsl_mode_t): cdouble {.cdecl, importc: "gsl_sf_airy_Bi_deriv_scaled", dynlib: libgsl.}
proc gsl_sf_airy_zero_Ai_e*(s: cuint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_airy_zero_Ai_e", dynlib: libgsl.}
proc gsl_sf_airy_zero_Ai*(s: cuint): cdouble {.cdecl, importc: "gsl_sf_airy_zero_Ai", dynlib: libgsl.}
proc gsl_sf_airy_zero_Bi_e*(s: cuint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_airy_zero_Bi_e", dynlib: libgsl.}
proc gsl_sf_airy_zero_Bi*(s: cuint): cdouble {.cdecl, importc: "gsl_sf_airy_zero_Bi", dynlib: libgsl.}
proc gsl_sf_airy_zero_Ai_deriv_e*(s: cuint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_airy_zero_Ai_deriv_e", dynlib: libgsl.}
proc gsl_sf_airy_zero_Ai_deriv*(s: cuint): cdouble {.cdecl, importc: "gsl_sf_airy_zero_Ai_deriv", dynlib: libgsl.}
proc gsl_sf_airy_zero_Bi_deriv_e*(s: cuint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_airy_zero_Bi_deriv_e", dynlib: libgsl.}
proc gsl_sf_airy_zero_Bi_deriv*(s: cuint): cdouble {.cdecl, importc: "gsl_sf_airy_zero_Bi_deriv", dynlib: libgsl.}
proc gsl_sf_bessel_J0_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_J0_e", dynlib: libgsl.}
proc gsl_sf_bessel_J0*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_J0", dynlib: libgsl.}
proc gsl_sf_bessel_J1_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_J1_e", dynlib: libgsl.}
proc gsl_sf_bessel_J1*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_J1", dynlib: libgsl.}
proc gsl_sf_bessel_Jn_e*(n: cint; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_Jn_e", dynlib: libgsl.}
proc gsl_sf_bessel_Jn*(n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_Jn", dynlib: libgsl.}
proc gsl_sf_bessel_Jn_array*(nmin: cint; nmax: cint; x: cdouble; result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_bessel_Jn_array", dynlib: libgsl.}
proc gsl_sf_bessel_Y0_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_Y0_e", dynlib: libgsl.}
proc gsl_sf_bessel_Y0*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_Y0", dynlib: libgsl.}
proc gsl_sf_bessel_Y1_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_Y1_e", dynlib: libgsl.}
proc gsl_sf_bessel_Y1*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_Y1", dynlib: libgsl.}
proc gsl_sf_bessel_Yn_e*(n: cint; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_Yn_e", dynlib: libgsl.}
proc gsl_sf_bessel_Yn*(n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_Yn", dynlib: libgsl.}
proc gsl_sf_bessel_Yn_array*(nmin: cint; nmax: cint; x: cdouble; result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_bessel_Yn_array", dynlib: libgsl.}
proc gsl_sf_bessel_I0_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_I0_e", dynlib: libgsl.}
proc gsl_sf_bessel_I0*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_I0", dynlib: libgsl.}
proc gsl_sf_bessel_I1_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_I1_e", dynlib: libgsl.}
proc gsl_sf_bessel_I1*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_I1", dynlib: libgsl.}
proc gsl_sf_bessel_In_e*(n: cint; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_In_e", dynlib: libgsl.}
proc gsl_sf_bessel_In*(n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_In", dynlib: libgsl.}
proc gsl_sf_bessel_In_array*(nmin: cint; nmax: cint; x: cdouble; result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_bessel_In_array", dynlib: libgsl.}
proc gsl_sf_bessel_I0_scaled_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_I0_scaled_e", dynlib: libgsl.}
proc gsl_sf_bessel_I0_scaled*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_I0_scaled", dynlib: libgsl.}
proc gsl_sf_bessel_I1_scaled_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_I1_scaled_e", dynlib: libgsl.}
proc gsl_sf_bessel_I1_scaled*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_I1_scaled", dynlib: libgsl.}
proc gsl_sf_bessel_In_scaled_e*(n: cint; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_bessel_In_scaled_e", dynlib: libgsl.}
proc gsl_sf_bessel_In_scaled*(n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_In_scaled", dynlib: libgsl.}
proc gsl_sf_bessel_In_scaled_array*(nmin: cint; nmax: cint; x: cdouble;  result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_bessel_In_scaled_array", dynlib: libgsl.}
proc gsl_sf_bessel_K0_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_K0_e", dynlib: libgsl.}
proc gsl_sf_bessel_K0*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_K0", dynlib: libgsl.}
proc gsl_sf_bessel_K1_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_K1_e", dynlib: libgsl.}
proc gsl_sf_bessel_K1*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_K1", dynlib: libgsl.}
proc gsl_sf_bessel_Kn_e*(n: cint; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_Kn_e", dynlib: libgsl.}
proc gsl_sf_bessel_Kn*(n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_Kn", dynlib: libgsl.}
proc gsl_sf_bessel_Kn_array*(nmin: cint; nmax: cint; x: cdouble; result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_bessel_Kn_array", dynlib: libgsl.}
proc gsl_sf_bessel_K0_scaled_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_K0_scaled_e", dynlib: libgsl.}
proc gsl_sf_bessel_K0_scaled*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_K0_scaled", dynlib: libgsl.}
proc gsl_sf_bessel_K1_scaled_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_K1_scaled_e", dynlib: libgsl.}
proc gsl_sf_bessel_K1_scaled*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_K1_scaled", dynlib: libgsl.}
proc gsl_sf_bessel_Kn_scaled_e*(n: cint; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_bessel_Kn_scaled_e", dynlib: libgsl.}
proc gsl_sf_bessel_Kn_scaled*(n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_Kn_scaled", dynlib: libgsl.}
proc gsl_sf_bessel_Kn_scaled_array*(nmin: cint; nmax: cint; x: cdouble;  result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_bessel_Kn_scaled_array", dynlib: libgsl.}
# proc gsl_sf_bessel_j0_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_j0_e", dynlib: libgsl.}
# proc gsl_sf_bessel_j0*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_j0", dynlib: libgsl.}
# proc gsl_sf_bessel_j1_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_j1_e", dynlib: libgsl.}
# proc gsl_sf_bessel_j1*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_j1", dynlib: libgsl.}
proc gsl_sf_bessel_j2_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_j2_e", dynlib: libgsl.}
proc gsl_sf_bessel_j2*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_j2", dynlib: libgsl.}
proc gsl_sf_bessel_jl_e*(l: cint; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_jl_e", dynlib: libgsl.}
proc gsl_sf_bessel_jl*(l: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_jl", dynlib: libgsl.}
proc gsl_sf_bessel_jl_array*(lmax: cint; x: cdouble; result_array: ptr cdouble): cint {. cdecl, importc: "gsl_sf_bessel_jl_array", dynlib: libgsl.}
proc gsl_sf_bessel_jl_steed_array*(lmax: cint; x: cdouble; jl_x_array: ptr cdouble): cint {. cdecl, importc: "gsl_sf_bessel_jl_steed_array", dynlib: libgsl.}
# proc gsl_sf_bessel_y0_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_y0_e", dynlib: libgsl.}
# proc gsl_sf_bessel_y0*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_y0", dynlib: libgsl.}
# proc gsl_sf_bessel_y1_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_y1_e", dynlib: libgsl.}
# proc gsl_sf_bessel_y1*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_y1", dynlib: libgsl.}
proc gsl_sf_bessel_y2_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_y2_e", dynlib: libgsl.}
proc gsl_sf_bessel_y2*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_y2", dynlib: libgsl.}
proc gsl_sf_bessel_yl_e*(l: cint; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_yl_e", dynlib: libgsl.}
proc gsl_sf_bessel_yl*(l: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_yl", dynlib: libgsl.}
proc gsl_sf_bessel_yl_array*(lmax: cint; x: cdouble; result_array: ptr cdouble): cint {. cdecl, importc: "gsl_sf_bessel_yl_array", dynlib: libgsl.}
# proc gsl_sf_bessel_i0_scaled_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_i0_scaled_e", dynlib: libgsl.}
# proc gsl_sf_bessel_i0_scaled*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_i0_scaled", dynlib: libgsl.}
# proc gsl_sf_bessel_i1_scaled_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_i1_scaled_e", dynlib: libgsl.}
# proc gsl_sf_bessel_i1_scaled*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_i1_scaled", dynlib: libgsl.}
proc gsl_sf_bessel_i2_scaled_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_i2_scaled_e", dynlib: libgsl.}
proc gsl_sf_bessel_i2_scaled*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_i2_scaled", dynlib: libgsl.}
proc gsl_sf_bessel_il_scaled_e*(l: cint; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_bessel_il_scaled_e", dynlib: libgsl.}
proc gsl_sf_bessel_il_scaled*(l: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_il_scaled", dynlib: libgsl.}
proc gsl_sf_bessel_il_scaled_array*(lmax: cint; x: cdouble; result_array: ptr cdouble): cint {. cdecl, importc: "gsl_sf_bessel_il_scaled_array", dynlib: libgsl.}
# proc gsl_sf_bessel_k0_scaled_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_k0_scaled_e", dynlib: libgsl.}
# proc gsl_sf_bessel_k0_scaled*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_k0_scaled", dynlib: libgsl.}
# proc gsl_sf_bessel_k1_scaled_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_k1_scaled_e", dynlib: libgsl.}
# proc gsl_sf_bessel_k1_scaled*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_k1_scaled", dynlib: libgsl.}
proc gsl_sf_bessel_k2_scaled_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_k2_scaled_e", dynlib: libgsl.}
proc gsl_sf_bessel_k2_scaled*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_k2_scaled", dynlib: libgsl.}
proc gsl_sf_bessel_kl_scaled_e*(l: cint; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_bessel_kl_scaled_e", dynlib: libgsl.}
proc gsl_sf_bessel_kl_scaled*(l: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_kl_scaled", dynlib: libgsl.}
proc gsl_sf_bessel_kl_scaled_array*(lmax: cint; x: cdouble; result_array: ptr cdouble): cint {. cdecl, importc: "gsl_sf_bessel_kl_scaled_array", dynlib: libgsl.}
proc gsl_sf_bessel_Jnu_e*(nu: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_bessel_Jnu_e", dynlib: libgsl.}
proc gsl_sf_bessel_Jnu*(nu: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_Jnu", dynlib: libgsl.}
proc gsl_sf_bessel_Ynu_e*(nu: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_bessel_Ynu_e", dynlib: libgsl.}
proc gsl_sf_bessel_Ynu*(nu: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_Ynu", dynlib: libgsl.}
proc gsl_sf_bessel_sequence_Jnu_e*(nu: cdouble; mode: gsl_mode_t; size: csize_t; v: ptr cdouble): cint {.cdecl, importc: "gsl_sf_bessel_sequence_Jnu_e", dynlib: libgsl.}
proc gsl_sf_bessel_Inu_scaled_e*(nu: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_bessel_Inu_scaled_e", dynlib: libgsl.}
proc gsl_sf_bessel_Inu_scaled*(nu: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_Inu_scaled", dynlib: libgsl.}
proc gsl_sf_bessel_Inu_e*(nu: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_bessel_Inu_e", dynlib: libgsl.}
proc gsl_sf_bessel_Inu*(nu: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_Inu", dynlib: libgsl.}
proc gsl_sf_bessel_Knu_scaled_e*(nu: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_bessel_Knu_scaled_e", dynlib: libgsl.}
proc gsl_sf_bessel_Knu_scaled*(nu: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_Knu_scaled", dynlib: libgsl.}
proc gsl_sf_bessel_Knu_scaled_e10_e*(nu: cdouble; x: cdouble; result: ptr gsl_sf_result_e10): cint {.cdecl, importc: "gsl_sf_bessel_Knu_scaled_e10_e", dynlib: libgsl.}
proc gsl_sf_bessel_Knu_e*(nu: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_bessel_Knu_e", dynlib: libgsl.}
proc gsl_sf_bessel_Knu*(nu: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_Knu", dynlib: libgsl.}
proc gsl_sf_bessel_lnKnu_e*(nu: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_bessel_lnKnu_e", dynlib: libgsl.}
proc gsl_sf_bessel_lnKnu*(nu: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_lnKnu", dynlib: libgsl.}
proc gsl_sf_bessel_zero_J0_e*(s: cuint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_zero_J0_e", dynlib: libgsl.}
proc gsl_sf_bessel_zero_J0*(s: cuint): cdouble {.cdecl, importc: "gsl_sf_bessel_zero_J0", dynlib: libgsl.}
proc gsl_sf_bessel_zero_J1_e*(s: cuint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_zero_J1_e", dynlib: libgsl.}
proc gsl_sf_bessel_zero_J1*(s: cuint): cdouble {.cdecl, importc: "gsl_sf_bessel_zero_J1", dynlib: libgsl.}
proc gsl_sf_bessel_zero_Jnu_e*(nu: cdouble; s: cuint; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_bessel_zero_Jnu_e", dynlib: libgsl.}
proc gsl_sf_bessel_zero_Jnu*(nu: cdouble; s: cuint): cdouble {.cdecl, importc: "gsl_sf_bessel_zero_Jnu", dynlib: libgsl.}
proc gsl_sf_clausen_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_clausen_e", dynlib: libgsl.}
proc gsl_sf_clausen*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_clausen",  dynlib: libgsl.}
proc gsl_sf_coupling_3j_e*(two_ja: cint; two_jb: cint; two_jc: cint; two_ma: cint;  two_mb: cint; two_mc: cint; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_coupling_3j_e", dynlib: libgsl.}
proc gsl_sf_coupling_3j*(two_ja: cint; two_jb: cint; two_jc: cint; two_ma: cint;    two_mb: cint; two_mc: cint): cdouble {.cdecl, importc: "gsl_sf_coupling_3j", dynlib: libgsl.}
proc gsl_sf_coupling_6j_e*(two_ja: cint; two_jb: cint; two_jc: cint; two_jd: cint;  two_je: cint; two_jf: cint; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_coupling_6j_e", dynlib: libgsl.}
proc gsl_sf_coupling_6j*(two_ja: cint; two_jb: cint; two_jc: cint; two_jd: cint;    two_je: cint; two_jf: cint): cdouble {.cdecl, importc: "gsl_sf_coupling_6j", dynlib: libgsl.}
proc gsl_sf_coupling_RacahW_e*(two_ja: cint; two_jb: cint; two_jc: cint; two_jd: cint;   two_je: cint; two_jf: cint; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_coupling_RacahW_e", dynlib: libgsl.}
proc gsl_sf_coupling_RacahW*(two_ja: cint; two_jb: cint; two_jc: cint; two_jd: cint; two_je: cint; two_jf: cint): cdouble {.cdecl, importc: "gsl_sf_coupling_RacahW", dynlib: libgsl.}
proc gsl_sf_coupling_9j_e*(two_ja: cint; two_jb: cint; two_jc: cint; two_jd: cint;  two_je: cint; two_jf: cint; two_jg: cint; two_jh: cint;  two_ji: cint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_coupling_9j_e", dynlib: libgsl.}
proc gsl_sf_coupling_9j*(two_ja: cint; two_jb: cint; two_jc: cint; two_jd: cint;    two_je: cint; two_jf: cint; two_jg: cint; two_jh: cint;    two_ji: cint): cdouble {.cdecl, importc: "gsl_sf_coupling_9j", dynlib: libgsl.}
proc gsl_sf_coupling_6j_INCORRECT_e*(two_ja: cint; two_jb: cint; two_jc: cint; two_jd: cint; two_je: cint; two_jf: cint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_coupling_6j_INCORRECT_e", dynlib: libgsl.}
proc gsl_sf_coupling_6j_INCORRECT*(two_ja: cint; two_jb: cint; two_jc: cint; two_jd: cint; two_je: cint; two_jf: cint): cdouble {. cdecl, importc: "gsl_sf_coupling_6j_INCORRECT", dynlib: libgsl.}
proc gsl_sf_hydrogenicR_1_e*(Z: cdouble; r: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_hydrogenicR_1_e", dynlib: libgsl.}
proc gsl_sf_hydrogenicR_1*(Z: cdouble; r: cdouble): cdouble {.cdecl, importc: "gsl_sf_hydrogenicR_1", dynlib: libgsl.}
proc gsl_sf_hydrogenicR_e*(n: cint; l: cint; Z: cdouble; r: cdouble;  result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_hydrogenicR_e", dynlib: libgsl.}
proc gsl_sf_hydrogenicR*(n: cint; l: cint; Z: cdouble; r: cdouble): cdouble {.cdecl, importc: "gsl_sf_hydrogenicR", dynlib: libgsl.}
proc gsl_sf_coulomb_wave_FG_e*(eta: cdouble; x: cdouble; lam_F: cdouble; k_lam_G: cint;   F: ptr gsl_sf_result; Fp: ptr gsl_sf_result;   G: ptr gsl_sf_result; Gp: ptr gsl_sf_result;   exp_F: ptr cdouble; exp_G: ptr cdouble): cint {.cdecl, importc: "gsl_sf_coulomb_wave_FG_e", dynlib: libgsl.}
proc gsl_sf_coulomb_wave_F_array*(lam_min: cdouble; kmax: cint; eta: cdouble; x: cdouble; fc_array: ptr cdouble; F_exponent: ptr cdouble): cint {.cdecl, importc: "gsl_sf_coulomb_wave_F_array", dynlib: libgsl.}
proc gsl_sf_coulomb_wave_FG_array*(lam_min: cdouble; kmax: cint; eta: cdouble; x: cdouble; fc_array: ptr cdouble; gc_array: ptr cdouble; F_exponent: ptr cdouble; G_exponent: ptr cdouble): cint {.cdecl, importc: "gsl_sf_coulomb_wave_FG_array", dynlib: libgsl.}
proc gsl_sf_coulomb_wave_FGp_array*(lam_min: cdouble; kmax: cint; eta: cdouble;  x: cdouble; fc_array: ptr cdouble;  fcp_array: ptr cdouble; gc_array: ptr cdouble;  gcp_array: ptr cdouble; F_exponent: ptr cdouble;  G_exponent: ptr cdouble): cint {.cdecl, importc: "gsl_sf_coulomb_wave_FGp_array", dynlib: libgsl.}
proc gsl_sf_coulomb_wave_sphF_array*(lam_min: cdouble; kmax: cint; eta: cdouble; x: cdouble; fc_array: ptr cdouble; F_exponent: ptr cdouble): cint {.cdecl, importc: "gsl_sf_coulomb_wave_sphF_array", dynlib: libgsl.}
proc gsl_sf_coulomb_CL_e*(L: cdouble; eta: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_coulomb_CL_e", dynlib: libgsl.}
proc gsl_sf_coulomb_CL_array*(Lmin: cdouble; kmax: cint; eta: cdouble; cl: ptr cdouble): cint {. cdecl, importc: "gsl_sf_coulomb_CL_array", dynlib: libgsl.}
proc gsl_sf_dawson_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_dawson_e", dynlib: libgsl.}
proc gsl_sf_dawson*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_dawson", dynlib: libgsl.}
proc gsl_sf_debye_1_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_debye_1_e", dynlib: libgsl.}
proc gsl_sf_debye_1*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_debye_1",  dynlib: libgsl.}
proc gsl_sf_debye_2_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_debye_2_e", dynlib: libgsl.}
proc gsl_sf_debye_2*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_debye_2",  dynlib: libgsl.}
proc gsl_sf_debye_3_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_debye_3_e", dynlib: libgsl.}
proc gsl_sf_debye_3*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_debye_3",  dynlib: libgsl.}
proc gsl_sf_debye_4_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_debye_4_e", dynlib: libgsl.}
proc gsl_sf_debye_4*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_debye_4",  dynlib: libgsl.}
proc gsl_sf_debye_5_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_debye_5_e", dynlib: libgsl.}
proc gsl_sf_debye_5*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_debye_5",  dynlib: libgsl.}
proc gsl_sf_debye_6_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_debye_6_e", dynlib: libgsl.}
proc gsl_sf_debye_6*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_debye_6",  dynlib: libgsl.}
proc gsl_sf_dilog_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_dilog_e", dynlib: libgsl.}
proc gsl_sf_dilog*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_dilog",   dynlib: libgsl.}
proc gsl_sf_complex_dilog_xy_e*(x: cdouble; y: cdouble; result_re: ptr gsl_sf_result; result_im: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_complex_dilog_xy_e", dynlib: libgsl.}
proc gsl_sf_complex_dilog_e*(r: cdouble; theta: cdouble; result_re: ptr gsl_sf_result; result_im: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_complex_dilog_e", dynlib: libgsl.}
proc gsl_sf_complex_spence_xy_e*(x: cdouble; y: cdouble; real_sp: ptr gsl_sf_result; imag_sp: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_complex_spence_xy_e", dynlib: libgsl.}
proc gsl_sf_multiply_e*(x: cdouble; y: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_multiply_e", dynlib: libgsl.}
proc gsl_sf_multiply*(x: cdouble; y: cdouble): cdouble {.cdecl, importc: "gsl_sf_multiply", dynlib: libgsl.}
proc gsl_sf_multiply_err_e*(x: cdouble; dx: cdouble; y: cdouble; dy: cdouble;   result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_multiply_err_e", dynlib: libgsl.}
proc gsl_sf_ellint_Kcomp_e*(k: cdouble; mode: gsl_mode_t; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_ellint_Kcomp_e", dynlib: libgsl.}
proc gsl_sf_ellint_Kcomp*(k: cdouble; mode: gsl_mode_t): cdouble {.cdecl, importc: "gsl_sf_ellint_Kcomp", dynlib: libgsl.}
proc gsl_sf_ellint_Ecomp_e*(k: cdouble; mode: gsl_mode_t; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_ellint_Ecomp_e", dynlib: libgsl.}
proc gsl_sf_ellint_Ecomp*(k: cdouble; mode: gsl_mode_t): cdouble {.cdecl, importc: "gsl_sf_ellint_Ecomp", dynlib: libgsl.}
proc gsl_sf_ellint_Pcomp_e*(k: cdouble; n: cdouble; mode: gsl_mode_t;   result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_ellint_Pcomp_e", dynlib: libgsl.}
proc gsl_sf_ellint_Pcomp*(k: cdouble; n: cdouble; mode: gsl_mode_t): cdouble {.cdecl, importc: "gsl_sf_ellint_Pcomp", dynlib: libgsl.}
proc gsl_sf_ellint_Dcomp_e*(k: cdouble; mode: gsl_mode_t; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_ellint_Dcomp_e", dynlib: libgsl.}
proc gsl_sf_ellint_Dcomp*(k: cdouble; mode: gsl_mode_t): cdouble {.cdecl, importc: "gsl_sf_ellint_Dcomp", dynlib: libgsl.}
proc gsl_sf_ellint_F_e*(phi: cdouble; k: cdouble; mode: gsl_mode_t;   result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_ellint_F_e", dynlib: libgsl.}
proc gsl_sf_ellint_F*(phi: cdouble; k: cdouble; mode: gsl_mode_t): cdouble {.cdecl, importc: "gsl_sf_ellint_F", dynlib: libgsl.}
proc gsl_sf_ellint_E_e*(phi: cdouble; k: cdouble; mode: gsl_mode_t;   result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_ellint_E_e", dynlib: libgsl.}
proc gsl_sf_ellint_E*(phi: cdouble; k: cdouble; mode: gsl_mode_t): cdouble {.cdecl, importc: "gsl_sf_ellint_E", dynlib: libgsl.}
proc gsl_sf_ellint_P_e*(phi: cdouble; k: cdouble; n: cdouble; mode: gsl_mode_t;   result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_ellint_P_e", dynlib: libgsl.}
proc gsl_sf_ellint_P*(phi: cdouble; k: cdouble; n: cdouble; mode: gsl_mode_t): cdouble {. cdecl, importc: "gsl_sf_ellint_P", dynlib: libgsl.}
proc gsl_sf_ellint_D_e*(phi: cdouble; k: cdouble; mode: gsl_mode_t;   result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_ellint_D_e", dynlib: libgsl.}
proc gsl_sf_ellint_D*(phi: cdouble; k: cdouble; mode: gsl_mode_t): cdouble {.cdecl, importc: "gsl_sf_ellint_D", dynlib: libgsl.}
proc gsl_sf_ellint_RC_e*(x: cdouble; y: cdouble; mode: gsl_mode_t;    result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_ellint_RC_e", dynlib: libgsl.}
proc gsl_sf_ellint_RC*(x: cdouble; y: cdouble; mode: gsl_mode_t): cdouble {.cdecl, importc: "gsl_sf_ellint_RC", dynlib: libgsl.}
proc gsl_sf_ellint_RD_e*(x: cdouble; y: cdouble; z: cdouble; mode: gsl_mode_t;    result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_ellint_RD_e", dynlib: libgsl.}
proc gsl_sf_ellint_RD*(x: cdouble; y: cdouble; z: cdouble; mode: gsl_mode_t): cdouble {. cdecl, importc: "gsl_sf_ellint_RD", dynlib: libgsl.}
proc gsl_sf_ellint_RF_e*(x: cdouble; y: cdouble; z: cdouble; mode: gsl_mode_t;    result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_ellint_RF_e", dynlib: libgsl.}
proc gsl_sf_ellint_RF*(x: cdouble; y: cdouble; z: cdouble; mode: gsl_mode_t): cdouble {. cdecl, importc: "gsl_sf_ellint_RF", dynlib: libgsl.}
proc gsl_sf_ellint_RJ_e*(x: cdouble; y: cdouble; z: cdouble; p: cdouble;    mode: gsl_mode_t; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_ellint_RJ_e", dynlib: libgsl.}
proc gsl_sf_ellint_RJ*(x: cdouble; y: cdouble; z: cdouble; p: cdouble; mode: gsl_mode_t): cdouble {. cdecl, importc: "gsl_sf_ellint_RJ", dynlib: libgsl.}
proc gsl_sf_elljac_e*(u: cdouble; m: cdouble; sn: ptr cdouble; cn: ptr cdouble; dn: ptr cdouble): cint {.cdecl, importc: "gsl_sf_elljac_e", dynlib: libgsl.}
proc gsl_sf_erfc_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_erfc_e", dynlib: libgsl.}
proc gsl_sf_erfc*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_erfc", dynlib: libgsl.}
proc gsl_sf_log_erfc_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_log_erfc_e", dynlib: libgsl.}
proc gsl_sf_log_erfc*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_log_erfc", dynlib: libgsl.}
proc gsl_sf_erf_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_erf_e", dynlib: libgsl.}
proc gsl_sf_erf*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_erf", dynlib: libgsl.}
proc gsl_sf_erf_Z_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_erf_Z_e", dynlib: libgsl.}
proc gsl_sf_erf_Q_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_erf_Q_e", dynlib: libgsl.}
proc gsl_sf_erf_Z*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_erf_Z",   dynlib: libgsl.}
proc gsl_sf_erf_Q*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_erf_Q",   dynlib: libgsl.}
proc gsl_sf_hazard_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_hazard_e", dynlib: libgsl.}
proc gsl_sf_hazard*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_hazard", dynlib: libgsl.}
proc gsl_sf_exp_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_exp_e", dynlib: libgsl.}
proc gsl_sf_exp*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_exp", dynlib: libgsl.}
proc gsl_sf_exp_e10_e*(x: cdouble; result: ptr gsl_sf_result_e10): cint {.cdecl, importc: "gsl_sf_exp_e10_e", dynlib: libgsl.}
proc gsl_sf_exp_mult_e*(x: cdouble; y: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_exp_mult_e", dynlib: libgsl.}
proc gsl_sf_exp_mult*(x: cdouble; y: cdouble): cdouble {.cdecl, importc: "gsl_sf_exp_mult", dynlib: libgsl.}
proc gsl_sf_exp_mult_e10_e*(x: cdouble; y: cdouble; result: ptr gsl_sf_result_e10): cint {. cdecl, importc: "gsl_sf_exp_mult_e10_e", dynlib: libgsl.}
proc gsl_sf_expm1_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_expm1_e", dynlib: libgsl.}
proc gsl_sf_expm1*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_expm1",   dynlib: libgsl.}
proc gsl_sf_exprel_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_exprel_e", dynlib: libgsl.}
proc gsl_sf_exprel*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_exprel", dynlib: libgsl.}
proc gsl_sf_exprel_2_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_exprel_2_e", dynlib: libgsl.}
proc gsl_sf_exprel_2*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_exprel_2", dynlib: libgsl.}
proc gsl_sf_exprel_n_e*(n: cint; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_exprel_n_e", dynlib: libgsl.}
proc gsl_sf_exprel_n*(n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_exprel_n", dynlib: libgsl.}
proc gsl_sf_exprel_n_CF_e*(n: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_exprel_n_CF_e", dynlib: libgsl.}
proc gsl_sf_exp_err_e*(x: cdouble; dx: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_exp_err_e", dynlib: libgsl.}
proc gsl_sf_exp_err_e10_e*(x: cdouble; dx: cdouble; result: ptr gsl_sf_result_e10): cint {. cdecl, importc: "gsl_sf_exp_err_e10_e", dynlib: libgsl.}
proc gsl_sf_exp_mult_err_e*(x: cdouble; dx: cdouble; y: cdouble; dy: cdouble;   result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_exp_mult_err_e", dynlib: libgsl.}
proc gsl_sf_exp_mult_err_e10_e*(x: cdouble; dx: cdouble; y: cdouble; dy: cdouble; result: ptr gsl_sf_result_e10): cint {.cdecl, importc: "gsl_sf_exp_mult_err_e10_e", dynlib: libgsl.}
proc gsl_sf_expint_E1_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_expint_E1_e", dynlib: libgsl.}
proc gsl_sf_expint_E1*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_expint_E1", dynlib: libgsl.}
proc gsl_sf_expint_E2_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_expint_E2_e", dynlib: libgsl.}
proc gsl_sf_expint_E2*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_expint_E2", dynlib: libgsl.}
proc gsl_sf_expint_En_e*(n: cint; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_expint_En_e", dynlib: libgsl.}
proc gsl_sf_expint_En*(n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_expint_En", dynlib: libgsl.}
proc gsl_sf_expint_E1_scaled_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_expint_E1_scaled_e", dynlib: libgsl.}
proc gsl_sf_expint_E1_scaled*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_expint_E1_scaled", dynlib: libgsl.}
proc gsl_sf_expint_E2_scaled_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_expint_E2_scaled_e", dynlib: libgsl.}
proc gsl_sf_expint_E2_scaled*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_expint_E2_scaled", dynlib: libgsl.}
proc gsl_sf_expint_En_scaled_e*(n: cint; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_expint_En_scaled_e", dynlib: libgsl.}
proc gsl_sf_expint_En_scaled*(n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_expint_En_scaled", dynlib: libgsl.}
proc gsl_sf_expint_Ei_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_expint_Ei_e", dynlib: libgsl.}
proc gsl_sf_expint_Ei*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_expint_Ei", dynlib: libgsl.}
proc gsl_sf_expint_Ei_scaled_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_expint_Ei_scaled_e", dynlib: libgsl.}
proc gsl_sf_expint_Ei_scaled*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_expint_Ei_scaled", dynlib: libgsl.}
proc gsl_sf_Shi_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_Shi_e", dynlib: libgsl.}
proc gsl_sf_Shi*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_Shi", dynlib: libgsl.}
proc gsl_sf_Chi_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_Chi_e", dynlib: libgsl.}
proc gsl_sf_Chi*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_Chi", dynlib: libgsl.}
proc gsl_sf_expint_3_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_expint_3_e", dynlib: libgsl.}
proc gsl_sf_expint_3*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_expint_3", dynlib: libgsl.}
proc gsl_sf_Si_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_Si_e", dynlib: libgsl.}
proc gsl_sf_Si*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_Si", dynlib: libgsl.}
proc gsl_sf_Ci_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_Ci_e", dynlib: libgsl.}
proc gsl_sf_Ci*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_Ci", dynlib: libgsl.}
proc gsl_sf_atanint_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_atanint_e", dynlib: libgsl.}
proc gsl_sf_atanint*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_atanint",  dynlib: libgsl.}
proc gsl_sf_fermi_dirac_m1_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_fermi_dirac_m1_e", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_m1*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_fermi_dirac_m1", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_0_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_fermi_dirac_0_e", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_0*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_fermi_dirac_0", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_1_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_fermi_dirac_1_e", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_1*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_fermi_dirac_1", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_2_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_fermi_dirac_2_e", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_2*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_fermi_dirac_2", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_int_e*(j: cint; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_fermi_dirac_int_e", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_int*(j: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_fermi_dirac_int", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_mhalf_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_fermi_dirac_mhalf_e", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_mhalf*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_fermi_dirac_mhalf", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_half_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_fermi_dirac_half_e", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_half*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_fermi_dirac_half", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_3half_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_fermi_dirac_3half_e", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_3half*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_fermi_dirac_3half", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_inc_0_e*(x: cdouble; b: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_fermi_dirac_inc_0_e", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_inc_0*(x: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_sf_fermi_dirac_inc_0", dynlib: libgsl.}
proc gsl_sf_lngamma_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_lngamma_e", dynlib: libgsl.}
proc gsl_sf_lngamma*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_lngamma",  dynlib: libgsl.}
proc gsl_sf_lngamma_sgn_e*(x: cdouble; result_lg: ptr gsl_sf_result; sgn: ptr cdouble): cint {. cdecl, importc: "gsl_sf_lngamma_sgn_e", dynlib: libgsl.}
proc gsl_sf_gamma_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_gamma_e", dynlib: libgsl.}
proc gsl_sf_gamma*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_gamma",   dynlib: libgsl.}
proc gsl_sf_gammastar_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_gammastar_e", dynlib: libgsl.}
proc gsl_sf_gammastar*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_gammastar", dynlib: libgsl.}
proc gsl_sf_gammainv_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_gammainv_e", dynlib: libgsl.}
proc gsl_sf_gammainv*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_gammainv", dynlib: libgsl.}
proc gsl_sf_lngamma_complex_e*(zr: cdouble; zi: cdouble; lnr: ptr gsl_sf_result;   arg: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_lngamma_complex_e", dynlib: libgsl.}
proc gsl_sf_taylorcoeff_e*(n: cint; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_taylorcoeff_e", dynlib: libgsl.}
proc gsl_sf_taylorcoeff*(n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_taylorcoeff", dynlib: libgsl.}
proc gsl_sf_fact_e*(n: cuint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_fact_e", dynlib: libgsl.}
proc gsl_sf_fact*(n: cuint): cdouble {.cdecl, importc: "gsl_sf_fact", dynlib: libgsl.}
proc gsl_sf_doublefact_e*(n: cuint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_doublefact_e", dynlib: libgsl.}
proc gsl_sf_doublefact*(n: cuint): cdouble {.cdecl, importc: "gsl_sf_doublefact", dynlib: libgsl.}
proc gsl_sf_lnfact_e*(n: cuint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_lnfact_e", dynlib: libgsl.}
proc gsl_sf_lnfact*(n: cuint): cdouble {.cdecl, importc: "gsl_sf_lnfact",  dynlib: libgsl.}
proc gsl_sf_lndoublefact_e*(n: cuint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_lndoublefact_e", dynlib: libgsl.}
proc gsl_sf_lndoublefact*(n: cuint): cdouble {.cdecl, importc: "gsl_sf_lndoublefact", dynlib: libgsl.}
proc gsl_sf_lnchoose_e*(n: cuint; m: cuint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_lnchoose_e", dynlib: libgsl.}
proc gsl_sf_lnchoose*(n: cuint; m: cuint): cdouble {.cdecl, importc: "gsl_sf_lnchoose", dynlib: libgsl.}
proc gsl_sf_choose_e*(n: cuint; m: cuint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_choose_e", dynlib: libgsl.}
proc gsl_sf_choose*(n: cuint; m: cuint): cdouble {.cdecl, importc: "gsl_sf_choose", dynlib: libgsl.}
proc gsl_sf_lnpoch_e*(a: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_lnpoch_e", dynlib: libgsl.}
proc gsl_sf_lnpoch*(a: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_lnpoch", dynlib: libgsl.}
proc gsl_sf_lnpoch_sgn_e*(a: cdouble; x: cdouble; result: ptr gsl_sf_result; sgn: ptr cdouble): cint {.cdecl, importc: "gsl_sf_lnpoch_sgn_e", dynlib: libgsl.}
proc gsl_sf_poch_e*(a: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_poch_e", dynlib: libgsl.}
proc gsl_sf_poch*(a: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_poch", dynlib: libgsl.}
proc gsl_sf_pochrel_e*(a: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_pochrel_e", dynlib: libgsl.}
proc gsl_sf_pochrel*(a: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_pochrel", dynlib: libgsl.}
proc gsl_sf_gamma_inc_Q_e*(a: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_gamma_inc_Q_e", dynlib: libgsl.}
proc gsl_sf_gamma_inc_Q*(a: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_gamma_inc_Q", dynlib: libgsl.}
proc gsl_sf_gamma_inc_P_e*(a: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_gamma_inc_P_e", dynlib: libgsl.}
proc gsl_sf_gamma_inc_P*(a: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_gamma_inc_P", dynlib: libgsl.}
proc gsl_sf_gamma_inc_e*(a: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_gamma_inc_e", dynlib: libgsl.}
proc gsl_sf_gamma_inc*(a: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_gamma_inc", dynlib: libgsl.}
proc gsl_sf_lnbeta_e*(a: cdouble; b: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_lnbeta_e", dynlib: libgsl.}
proc gsl_sf_lnbeta*(a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_sf_lnbeta", dynlib: libgsl.}
proc gsl_sf_lnbeta_sgn_e*(x: cdouble; y: cdouble; result: ptr gsl_sf_result; sgn: ptr cdouble): cint {.cdecl, importc: "gsl_sf_lnbeta_sgn_e", dynlib: libgsl.}
proc gsl_sf_beta_e*(a: cdouble; b: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_beta_e", dynlib: libgsl.}
proc gsl_sf_beta*(a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_sf_beta", dynlib: libgsl.}
proc gsl_sf_beta_inc_e*(a: cdouble; b: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_beta_inc_e", dynlib: libgsl.}
proc gsl_sf_beta_inc*(a: cdouble; b: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_beta_inc", dynlib: libgsl.}
proc gsl_sf_gegenpoly_1_e*(lambda: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_gegenpoly_1_e", dynlib: libgsl.}
proc gsl_sf_gegenpoly_2_e*(lambda: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_gegenpoly_2_e", dynlib: libgsl.}
proc gsl_sf_gegenpoly_3_e*(lambda: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_gegenpoly_3_e", dynlib: libgsl.}
proc gsl_sf_gegenpoly_1*(lambda: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_gegenpoly_1", dynlib: libgsl.}
proc gsl_sf_gegenpoly_2*(lambda: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_gegenpoly_2", dynlib: libgsl.}
proc gsl_sf_gegenpoly_3*(lambda: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_gegenpoly_3", dynlib: libgsl.}
proc gsl_sf_gegenpoly_n_e*(n: cint; lambda: cdouble; x: cdouble;  result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_gegenpoly_n_e", dynlib: libgsl.}
proc gsl_sf_gegenpoly_n*(n: cint; lambda: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_gegenpoly_n", dynlib: libgsl.}
proc gsl_sf_gegenpoly_array*(nmax: cint; lambda: cdouble; x: cdouble; result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_gegenpoly_array", dynlib: libgsl.}
proc gsl_sf_hermite_prob_e*(n: cint; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_hermite_prob_e", dynlib: libgsl.}
proc gsl_sf_hermite_prob*(n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_hermite_prob", dynlib: libgsl.}
proc gsl_sf_hermite_prob_der_e*(m: cint; n: cint; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_hermite_prob_der_e", dynlib: libgsl.}
proc gsl_sf_hermite_prob_der*(m: cint; n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_hermite_prob_der", dynlib: libgsl.}
proc gsl_sf_hermite_phys_e*(n: cint; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_hermite_phys_e", dynlib: libgsl.}
proc gsl_sf_hermite_phys*(n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_hermite_phys", dynlib: libgsl.}
proc gsl_sf_hermite_phys_der_e*(m: cint; n: cint; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_hermite_phys_der_e", dynlib: libgsl.}
proc gsl_sf_hermite_phys_der*(m: cint; n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_hermite_phys_der", dynlib: libgsl.}
proc gsl_sf_hermite_func_e*(n: cint; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_hermite_func_e", dynlib: libgsl.}
proc gsl_sf_hermite_func*(n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_hermite_func", dynlib: libgsl.}
proc gsl_sf_hermite_prob_array*(nmax: cint; x: cdouble; result_array: ptr cdouble): cint {. cdecl, importc: "gsl_sf_hermite_prob_array", dynlib: libgsl.}
proc gsl_sf_hermite_prob_array_der*(m: cint; nmax: cint; x: cdouble;  result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_hermite_prob_array_der", dynlib: libgsl.}
proc gsl_sf_hermite_prob_der_array*(mmax: cint; n: cint; x: cdouble;  result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_hermite_prob_der_array", dynlib: libgsl.}
proc gsl_sf_hermite_prob_series_e*(n: cint; x: cdouble; a: ptr cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_hermite_prob_series_e", dynlib: libgsl.}
proc gsl_sf_hermite_prob_series*(n: cint; x: cdouble; a: ptr cdouble): cdouble {.cdecl, importc: "gsl_sf_hermite_prob_series", dynlib: libgsl.}
proc gsl_sf_hermite_phys_array*(nmax: cint; x: cdouble; result_array: ptr cdouble): cint {. cdecl, importc: "gsl_sf_hermite_phys_array", dynlib: libgsl.}
proc gsl_sf_hermite_phys_array_der*(m: cint; nmax: cint; x: cdouble;  result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_hermite_phys_array_der", dynlib: libgsl.}
proc gsl_sf_hermite_phys_der_array*(mmax: cint; n: cint; x: cdouble;  result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_hermite_phys_der_array", dynlib: libgsl.}
proc gsl_sf_hermite_phys_series_e*(n: cint; x: cdouble; a: ptr cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_hermite_phys_series_e", dynlib: libgsl.}
proc gsl_sf_hermite_phys_series*(n: cint; x: cdouble; a: ptr cdouble): cdouble {.cdecl, importc: "gsl_sf_hermite_phys_series", dynlib: libgsl.}
proc gsl_sf_hermite_func_array*(nmax: cint; x: cdouble; result_array: ptr cdouble): cint {. cdecl, importc: "gsl_sf_hermite_func_array", dynlib: libgsl.}
proc gsl_sf_hermite_func_series_e*(n: cint; x: cdouble; a: ptr cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_hermite_func_series_e", dynlib: libgsl.}
proc gsl_sf_hermite_func_series*(n: cint; x: cdouble; a: ptr cdouble): cdouble {.cdecl, importc: "gsl_sf_hermite_func_series", dynlib: libgsl.}
proc gsl_sf_hermite_func_der_e*(m: cint; n: cint; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_hermite_func_der_e", dynlib: libgsl.}
proc gsl_sf_hermite_func_der*(m: cint; n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_hermite_func_der", dynlib: libgsl.}
proc gsl_sf_hermite_prob_zero_e*(n: cint; s: cint; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_hermite_prob_zero_e", dynlib: libgsl.}
proc gsl_sf_hermite_prob_zero*(n: cint; s: cint): cdouble {.cdecl, importc: "gsl_sf_hermite_prob_zero", dynlib: libgsl.}
proc gsl_sf_hermite_phys_zero_e*(n: cint; s: cint; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_hermite_phys_zero_e", dynlib: libgsl.}
proc gsl_sf_hermite_phys_zero*(n: cint; s: cint): cdouble {.cdecl, importc: "gsl_sf_hermite_phys_zero", dynlib: libgsl.}
proc gsl_sf_hermite_func_zero_e*(n: cint; s: cint; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_hermite_func_zero_e", dynlib: libgsl.}
proc gsl_sf_hermite_func_zero*(n: cint; s: cint): cdouble {.cdecl, importc: "gsl_sf_hermite_func_zero", dynlib: libgsl.}
proc gsl_sf_hyperg_0F1_e*(c: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_hyperg_0F1_e", dynlib: libgsl.}
proc gsl_sf_hyperg_0F1*(c: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_hyperg_0F1", dynlib: libgsl.}
proc gsl_sf_hyperg_1F1_int_e*(m: cint; n: cint; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_hyperg_1F1_int_e", dynlib: libgsl.}
proc gsl_sf_hyperg_1F1_int*(m: cint; n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_hyperg_1F1_int", dynlib: libgsl.}
proc gsl_sf_hyperg_1F1_e*(a: cdouble; b: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_hyperg_1F1_e", dynlib: libgsl.}
proc gsl_sf_hyperg_1F1*(a: cdouble; b: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_hyperg_1F1", dynlib: libgsl.}
proc gsl_sf_hyperg_U_int_e*(m: cint; n: cint; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_hyperg_U_int_e", dynlib: libgsl.}
proc gsl_sf_hyperg_U_int*(m: cint; n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_hyperg_U_int", dynlib: libgsl.}
proc gsl_sf_hyperg_U_int_e10_e*(m: cint; n: cint; x: cdouble; result: ptr gsl_sf_result_e10): cint {.cdecl, importc: "gsl_sf_hyperg_U_int_e10_e", dynlib: libgsl.}
proc gsl_sf_hyperg_U_e*(a: cdouble; b: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_hyperg_U_e", dynlib: libgsl.}
proc gsl_sf_hyperg_U*(a: cdouble; b: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_hyperg_U", dynlib: libgsl.}
proc gsl_sf_hyperg_U_e10_e*(a: cdouble; b: cdouble; x: cdouble;   result: ptr gsl_sf_result_e10): cint {.cdecl, importc: "gsl_sf_hyperg_U_e10_e", dynlib: libgsl.}
proc gsl_sf_hyperg_2F1_e*(a: cdouble; b: cdouble; c: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_hyperg_2F1_e", dynlib: libgsl.}
proc gsl_sf_hyperg_2F1*(a: cdouble; b: cdouble; c: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_hyperg_2F1", dynlib: libgsl.}
proc gsl_sf_hyperg_2F1_conj_e*(aR: cdouble; aI: cdouble; c: cdouble; x: cdouble;   result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_hyperg_2F1_conj_e", dynlib: libgsl.}
proc gsl_sf_hyperg_2F1_conj*(aR: cdouble; aI: cdouble; c: cdouble; x: cdouble): cdouble {. cdecl, importc: "gsl_sf_hyperg_2F1_conj", dynlib: libgsl.}
proc gsl_sf_hyperg_2F1_renorm_e*(a: cdouble; b: cdouble; c: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_hyperg_2F1_renorm_e", dynlib: libgsl.}
proc gsl_sf_hyperg_2F1_renorm*(a: cdouble; b: cdouble; c: cdouble; x: cdouble): cdouble {. cdecl, importc: "gsl_sf_hyperg_2F1_renorm", dynlib: libgsl.}
proc gsl_sf_hyperg_2F1_conj_renorm_e*(aR: cdouble; aI: cdouble; c: cdouble; x: cdouble;  result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_hyperg_2F1_conj_renorm_e", dynlib: libgsl.}
proc gsl_sf_hyperg_2F1_conj_renorm*(aR: cdouble; aI: cdouble; c: cdouble; x: cdouble): cdouble {. cdecl, importc: "gsl_sf_hyperg_2F1_conj_renorm", dynlib: libgsl.}
proc gsl_sf_hyperg_2F0_e*(a: cdouble; b: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_hyperg_2F0_e", dynlib: libgsl.}
proc gsl_sf_hyperg_2F0*(a: cdouble; b: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_hyperg_2F0", dynlib: libgsl.}
proc gsl_sf_laguerre_1_e*(a: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_laguerre_1_e", dynlib: libgsl.}
proc gsl_sf_laguerre_2_e*(a: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_laguerre_2_e", dynlib: libgsl.}
proc gsl_sf_laguerre_3_e*(a: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_laguerre_3_e", dynlib: libgsl.}
proc gsl_sf_laguerre_1*(a: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_laguerre_1", dynlib: libgsl.}
proc gsl_sf_laguerre_2*(a: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_laguerre_2", dynlib: libgsl.}
proc gsl_sf_laguerre_3*(a: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_laguerre_3", dynlib: libgsl.}
proc gsl_sf_laguerre_n_e*(n: cint; a: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_laguerre_n_e", dynlib: libgsl.}
proc gsl_sf_laguerre_n*(n: cint; a: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_laguerre_n", dynlib: libgsl.}
proc gsl_sf_lambert_W0_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_lambert_W0_e", dynlib: libgsl.}
proc gsl_sf_lambert_W0*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_lambert_W0", dynlib: libgsl.}
proc gsl_sf_lambert_Wm1_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_lambert_Wm1_e", dynlib: libgsl.}
proc gsl_sf_lambert_Wm1*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_lambert_Wm1", dynlib: libgsl.}
proc gsl_sf_legendre_Pl_e*(l: cint; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_legendre_Pl_e", dynlib: libgsl.}
proc gsl_sf_legendre_Pl*(l: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_legendre_Pl", dynlib: libgsl.}
proc gsl_sf_legendre_Pl_array*(lmax: cint; x: cdouble; result_array: ptr cdouble): cint {. cdecl, importc: "gsl_sf_legendre_Pl_array", dynlib: libgsl.}
proc gsl_sf_legendre_Pl_deriv_array*(lmax: cint; x: cdouble; result_array: ptr cdouble; result_deriv_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_legendre_Pl_deriv_array", dynlib: libgsl.}
proc gsl_sf_legendre_P1_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_legendre_P1_e", dynlib: libgsl.}
proc gsl_sf_legendre_P2_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_legendre_P2_e", dynlib: libgsl.}
proc gsl_sf_legendre_P3_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_legendre_P3_e", dynlib: libgsl.}
proc gsl_sf_legendre_P1*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_legendre_P1", dynlib: libgsl.}
proc gsl_sf_legendre_P2*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_legendre_P2", dynlib: libgsl.}
proc gsl_sf_legendre_P3*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_legendre_P3", dynlib: libgsl.}
proc gsl_sf_legendre_Q0_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_legendre_Q0_e", dynlib: libgsl.}
proc gsl_sf_legendre_Q0*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_legendre_Q0", dynlib: libgsl.}
proc gsl_sf_legendre_Q1_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_legendre_Q1_e", dynlib: libgsl.}
proc gsl_sf_legendre_Q1*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_legendre_Q1", dynlib: libgsl.}
proc gsl_sf_legendre_Ql_e*(l: cint; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_legendre_Ql_e", dynlib: libgsl.}
proc gsl_sf_legendre_Ql*(l: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_legendre_Ql", dynlib: libgsl.}
proc gsl_sf_legendre_Plm_e*(l: cint; m: cint; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_legendre_Plm_e", dynlib: libgsl.}
proc gsl_sf_legendre_Plm*(l: cint; m: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_legendre_Plm", dynlib: libgsl.}
proc gsl_sf_legendre_Plm_array*(lmax: cint; m: cint; x: cdouble; result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_legendre_Plm_array", dynlib: libgsl.}
proc gsl_sf_legendre_Plm_deriv_array*(lmax: cint; m: cint; x: cdouble;  result_array: ptr cdouble;  result_deriv_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_legendre_Plm_deriv_array", dynlib: libgsl.}
proc gsl_sf_legendre_sphPlm_e*(l: cint; m: cint; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_legendre_sphPlm_e", dynlib: libgsl.}
proc gsl_sf_legendre_sphPlm*(l: cint; m: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_legendre_sphPlm", dynlib: libgsl.}
proc gsl_sf_legendre_sphPlm_array*(lmax: cint; m: cint; x: cdouble; result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_legendre_sphPlm_array", dynlib: libgsl.}
proc gsl_sf_legendre_sphPlm_deriv_array*(lmax: cint; m: cint; x: cdouble; result_array: ptr cdouble; result_deriv_array: ptr cdouble): cint {. cdecl, importc: "gsl_sf_legendre_sphPlm_deriv_array", dynlib: libgsl.}
proc gsl_sf_legendre_array_size*(lmax: cint; m: cint): cint {.cdecl, importc: "gsl_sf_legendre_array_size", dynlib: libgsl.}
proc gsl_sf_conicalP_half_e*(lambda: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_conicalP_half_e", dynlib: libgsl.}
proc gsl_sf_conicalP_half*(lambda: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_conicalP_half", dynlib: libgsl.}
proc gsl_sf_conicalP_mhalf_e*(lambda: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_conicalP_mhalf_e", dynlib: libgsl.}
proc gsl_sf_conicalP_mhalf*(lambda: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_conicalP_mhalf", dynlib: libgsl.}
proc gsl_sf_conicalP_0_e*(lambda: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_conicalP_0_e", dynlib: libgsl.}
proc gsl_sf_conicalP_0*(lambda: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_conicalP_0", dynlib: libgsl.}
proc gsl_sf_conicalP_1_e*(lambda: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_conicalP_1_e", dynlib: libgsl.}
proc gsl_sf_conicalP_1*(lambda: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_conicalP_1", dynlib: libgsl.}
proc gsl_sf_conicalP_sph_reg_e*(l: cint; lambda: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_conicalP_sph_reg_e", dynlib: libgsl.}
proc gsl_sf_conicalP_sph_reg*(l: cint; lambda: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_conicalP_sph_reg", dynlib: libgsl.}
proc gsl_sf_conicalP_cyl_reg_e*(m: cint; lambda: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_conicalP_cyl_reg_e", dynlib: libgsl.}
proc gsl_sf_conicalP_cyl_reg*(m: cint; lambda: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_conicalP_cyl_reg", dynlib: libgsl.}
proc gsl_sf_legendre_H3d_0_e*(lambda: cdouble; eta: cdouble;  result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_legendre_H3d_0_e", dynlib: libgsl.}
proc gsl_sf_legendre_H3d_0*(lambda: cdouble; eta: cdouble): cdouble {.cdecl, importc: "gsl_sf_legendre_H3d_0", dynlib: libgsl.}
proc gsl_sf_legendre_H3d_1_e*(lambda: cdouble; eta: cdouble;  result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_legendre_H3d_1_e", dynlib: libgsl.}
proc gsl_sf_legendre_H3d_1*(lambda: cdouble; eta: cdouble): cdouble {.cdecl, importc: "gsl_sf_legendre_H3d_1", dynlib: libgsl.}
proc gsl_sf_legendre_H3d_e*(l: cint; lambda: cdouble; eta: cdouble;   result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_legendre_H3d_e", dynlib: libgsl.}
proc gsl_sf_legendre_H3d*(l: cint; lambda: cdouble; eta: cdouble): cdouble {.cdecl, importc: "gsl_sf_legendre_H3d", dynlib: libgsl.}
proc gsl_sf_legendre_H3d_array*(lmax: cint; lambda: cdouble; eta: cdouble; result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_legendre_H3d_array", dynlib: libgsl.}
proc gsl_sf_legendre_array*(norm: gsl_sf_legendre_t; lmax: csize_t; x: cdouble;   result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_legendre_array", dynlib: libgsl.}
proc gsl_sf_legendre_array_e*(norm: gsl_sf_legendre_t; lmax: csize_t; x: cdouble;  csphase: cdouble; result_array: ptr cdouble): cint {. cdecl, importc: "gsl_sf_legendre_array_e", dynlib: libgsl.}
proc gsl_sf_legendre_deriv_array*(norm: gsl_sf_legendre_t; lmax: csize_t; x: cdouble; result_array: ptr cdouble; result_deriv_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_legendre_deriv_array", dynlib: libgsl.}
proc gsl_sf_legendre_deriv_array_e*(norm: gsl_sf_legendre_t; lmax: csize_t;  x: cdouble; csphase: cdouble;  result_array: ptr cdouble;  result_deriv_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_legendre_deriv_array_e", dynlib: libgsl.}
proc gsl_sf_legendre_deriv_alt_array*(norm: gsl_sf_legendre_t; lmax: csize_t;  x: cdouble; result_array: ptr cdouble;  result_deriv_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_legendre_deriv_alt_array", dynlib: libgsl.}
proc gsl_sf_legendre_deriv_alt_array_e*(norm: gsl_sf_legendre_t; lmax: csize_t;    x: cdouble; csphase: cdouble;    result_array: ptr cdouble;    result_deriv_array: ptr cdouble): cint {. cdecl, importc: "gsl_sf_legendre_deriv_alt_array_e", dynlib: libgsl.}
proc gsl_sf_legendre_deriv2_array*(norm: gsl_sf_legendre_t; lmax: csize_t; x: cdouble; result_array: ptr cdouble; result_deriv_array: ptr cdouble; result_deriv2_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_legendre_deriv2_array", dynlib: libgsl.}
proc gsl_sf_legendre_deriv2_array_e*(norm: gsl_sf_legendre_t; lmax: csize_t; x: cdouble; csphase: cdouble; result_array: ptr cdouble; result_deriv_array: ptr cdouble; result_deriv2_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_legendre_deriv2_array_e", dynlib: libgsl.}
proc gsl_sf_legendre_deriv2_alt_array*(norm: gsl_sf_legendre_t; lmax: csize_t;   x: cdouble; result_array: ptr cdouble;   result_deriv_array: ptr cdouble;   result_deriv2_array: ptr cdouble): cint {. cdecl, importc: "gsl_sf_legendre_deriv2_alt_array", dynlib: libgsl.}
proc gsl_sf_legendre_deriv2_alt_array_e*(norm: gsl_sf_legendre_t; lmax: csize_t; x: cdouble; csphase: cdouble; result_array: ptr cdouble; result_deriv_array: ptr cdouble; result_deriv2_array: ptr cdouble): cint {. cdecl, importc: "gsl_sf_legendre_deriv2_alt_array_e", dynlib: libgsl.}
proc gsl_sf_legendre_array_n*(lmax: csize_t): csize_t {.cdecl, importc: "gsl_sf_legendre_array_n", dynlib: libgsl.}
proc gsl_sf_legendre_array_index*(l: csize_t; m: csize_t): csize_t {.cdecl, importc: "gsl_sf_legendre_array_index", dynlib: libgsl.}
proc gsl_sf_legendre_nlm*(lmax: csize_t): csize_t {.cdecl, importc: "gsl_sf_legendre_nlm", dynlib: libgsl.}
proc gsl_sf_log_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_log_e", dynlib: libgsl.}
proc gsl_sf_log*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_log", dynlib: libgsl.}
proc gsl_sf_log_abs_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_log_abs_e", dynlib: libgsl.}
proc gsl_sf_log_abs*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_log_abs",  dynlib: libgsl.}
proc gsl_sf_complex_log_e*(zr: cdouble; zi: cdouble; lnr: ptr gsl_sf_result;  theta: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_complex_log_e", dynlib: libgsl.}
proc gsl_sf_log_1plusx_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_log_1plusx_e", dynlib: libgsl.}
proc gsl_sf_log_1plusx*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_log_1plusx", dynlib: libgsl.}
proc gsl_sf_log_1plusx_mx_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_log_1plusx_mx_e", dynlib: libgsl.}
proc gsl_sf_log_1plusx_mx*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_log_1plusx_mx", dynlib: libgsl.}
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
proc gsl_eigen_symm_alloc*(n: csize_t): ptr gsl_eigen_symm_workspace {.cdecl, importc: "gsl_eigen_symm_alloc", dynlib: libgsl.}
proc gsl_eigen_symm_free*(w: ptr gsl_eigen_symm_workspace) {.cdecl, importc: "gsl_eigen_symm_free", dynlib: libgsl.}
proc gsl_eigen_symm*(A: ptr gsl_matrix; eval: ptr gsl_vector;   w: ptr gsl_eigen_symm_workspace): cint {.cdecl, importc: "gsl_eigen_symm", dynlib: libgsl.}
proc gsl_eigen_symmv_alloc*(n: csize_t): ptr gsl_eigen_symmv_workspace {.cdecl, importc: "gsl_eigen_symmv_alloc", dynlib: libgsl.}
proc gsl_eigen_symmv_free*(w: ptr gsl_eigen_symmv_workspace) {.cdecl, importc: "gsl_eigen_symmv_free", dynlib: libgsl.}
proc gsl_eigen_symmv*(A: ptr gsl_matrix; eval: ptr gsl_vector; evec: ptr gsl_matrix; w: ptr gsl_eigen_symmv_workspace): cint {.cdecl, importc: "gsl_eigen_symmv", dynlib: libgsl.}
proc gsl_eigen_herm_alloc*(n: csize_t): ptr gsl_eigen_herm_workspace {.cdecl, importc: "gsl_eigen_herm_alloc", dynlib: libgsl.}
proc gsl_eigen_herm_free*(w: ptr gsl_eigen_herm_workspace) {.cdecl, importc: "gsl_eigen_herm_free", dynlib: libgsl.}
proc gsl_eigen_herm*(A: ptr gsl_matrix_complex; eval: ptr gsl_vector;   w: ptr gsl_eigen_herm_workspace): cint {.cdecl, importc: "gsl_eigen_herm", dynlib: libgsl.}
proc gsl_eigen_hermv_alloc*(n: csize_t): ptr gsl_eigen_hermv_workspace {.cdecl, importc: "gsl_eigen_hermv_alloc", dynlib: libgsl.}
proc gsl_eigen_hermv_free*(w: ptr gsl_eigen_hermv_workspace) {.cdecl, importc: "gsl_eigen_hermv_free", dynlib: libgsl.}
proc gsl_eigen_hermv*(A: ptr gsl_matrix_complex; eval: ptr gsl_vector; evec: ptr gsl_matrix_complex; w: ptr gsl_eigen_hermv_workspace): cint {. cdecl, importc: "gsl_eigen_hermv", dynlib: libgsl.}
proc gsl_eigen_francis_alloc*(): ptr gsl_eigen_francis_workspace {.cdecl, importc: "gsl_eigen_francis_alloc", dynlib: libgsl.}
proc gsl_eigen_francis_free*(w: ptr gsl_eigen_francis_workspace) {.cdecl, importc: "gsl_eigen_francis_free", dynlib: libgsl.}
proc gsl_eigen_francis_T*(compute_t: cint; w: ptr gsl_eigen_francis_workspace) {. cdecl, importc: "gsl_eigen_francis_T", dynlib: libgsl.}
proc gsl_eigen_francis*(H: ptr gsl_matrix; eval: ptr gsl_vector_complex;   w: ptr gsl_eigen_francis_workspace): cint {.cdecl, importc: "gsl_eigen_francis", dynlib: libgsl.}
proc gsl_eigen_francis_Z*(H: ptr gsl_matrix; eval: ptr gsl_vector_complex; Z: ptr gsl_matrix; w: ptr gsl_eigen_francis_workspace): cint {. cdecl, importc: "gsl_eigen_francis_Z", dynlib: libgsl.}
proc gsl_eigen_nonsymm_alloc*(n: csize_t): ptr gsl_eigen_nonsymm_workspace {.cdecl, importc: "gsl_eigen_nonsymm_alloc", dynlib: libgsl.}
proc gsl_eigen_nonsymm_free*(w: ptr gsl_eigen_nonsymm_workspace) {.cdecl, importc: "gsl_eigen_nonsymm_free", dynlib: libgsl.}
proc gsl_eigen_nonsymm_params*(compute_t: cint; balance: cint;   w: ptr gsl_eigen_nonsymm_workspace) {.cdecl, importc: "gsl_eigen_nonsymm_params", dynlib: libgsl.}
proc gsl_eigen_nonsymm*(A: ptr gsl_matrix; eval: ptr gsl_vector_complex;   w: ptr gsl_eigen_nonsymm_workspace): cint {.cdecl, importc: "gsl_eigen_nonsymm", dynlib: libgsl.}
proc gsl_eigen_nonsymm_Z*(A: ptr gsl_matrix; eval: ptr gsl_vector_complex; Z: ptr gsl_matrix; w: ptr gsl_eigen_nonsymm_workspace): cint {. cdecl, importc: "gsl_eigen_nonsymm_Z", dynlib: libgsl.}
proc gsl_eigen_nonsymmv_alloc*(n: csize_t): ptr gsl_eigen_nonsymmv_workspace {.cdecl, importc: "gsl_eigen_nonsymmv_alloc", dynlib: libgsl.}
proc gsl_eigen_nonsymmv_free*(w: ptr gsl_eigen_nonsymmv_workspace) {.cdecl, importc: "gsl_eigen_nonsymmv_free", dynlib: libgsl.}
proc gsl_eigen_nonsymmv_params*(balance: cint; w: ptr gsl_eigen_nonsymmv_workspace) {. cdecl, importc: "gsl_eigen_nonsymmv_params", dynlib: libgsl.}
proc gsl_eigen_nonsymmv*(A: ptr gsl_matrix; eval: ptr gsl_vector_complex;    evec: ptr gsl_matrix_complex;    w: ptr gsl_eigen_nonsymmv_workspace): cint {.cdecl, importc: "gsl_eigen_nonsymmv", dynlib: libgsl.}
proc gsl_eigen_nonsymmv_Z*(A: ptr gsl_matrix; eval: ptr gsl_vector_complex;  evec: ptr gsl_matrix_complex; Z: ptr gsl_matrix;  w: ptr gsl_eigen_nonsymmv_workspace): cint {.cdecl, importc: "gsl_eigen_nonsymmv_Z", dynlib: libgsl.}
proc gsl_eigen_gensymm_alloc*(n: csize_t): ptr gsl_eigen_gensymm_workspace {.cdecl, importc: "gsl_eigen_gensymm_alloc", dynlib: libgsl.}
proc gsl_eigen_gensymm_free*(w: ptr gsl_eigen_gensymm_workspace) {.cdecl, importc: "gsl_eigen_gensymm_free", dynlib: libgsl.}
proc gsl_eigen_gensymm*(A: ptr gsl_matrix; B: ptr gsl_matrix; eval: ptr gsl_vector;   w: ptr gsl_eigen_gensymm_workspace): cint {.cdecl, importc: "gsl_eigen_gensymm", dynlib: libgsl.}
proc gsl_eigen_gensymm_standardize*(A: ptr gsl_matrix; B: ptr gsl_matrix): cint {.cdecl, importc: "gsl_eigen_gensymm_standardize", dynlib: libgsl.}
proc gsl_eigen_gensymmv_alloc*(n: csize_t): ptr gsl_eigen_gensymmv_workspace {.cdecl, importc: "gsl_eigen_gensymmv_alloc", dynlib: libgsl.}
proc gsl_eigen_gensymmv_free*(w: ptr gsl_eigen_gensymmv_workspace) {.cdecl, importc: "gsl_eigen_gensymmv_free", dynlib: libgsl.}
proc gsl_eigen_gensymmv*(A: ptr gsl_matrix; B: ptr gsl_matrix; eval: ptr gsl_vector;    evec: ptr gsl_matrix; w: ptr gsl_eigen_gensymmv_workspace): cint {. cdecl, importc: "gsl_eigen_gensymmv", dynlib: libgsl.}
proc gsl_eigen_genherm_alloc*(n: csize_t): ptr gsl_eigen_genherm_workspace {.cdecl, importc: "gsl_eigen_genherm_alloc", dynlib: libgsl.}
proc gsl_eigen_genherm_free*(w: ptr gsl_eigen_genherm_workspace) {.cdecl, importc: "gsl_eigen_genherm_free", dynlib: libgsl.}
proc gsl_eigen_genherm*(A: ptr gsl_matrix_complex; B: ptr gsl_matrix_complex;   eval: ptr gsl_vector; w: ptr gsl_eigen_genherm_workspace): cint {. cdecl, importc: "gsl_eigen_genherm", dynlib: libgsl.}
proc gsl_eigen_genherm_standardize*(A: ptr gsl_matrix_complex;  B: ptr gsl_matrix_complex): cint {.cdecl, importc: "gsl_eigen_genherm_standardize", dynlib: libgsl.}
proc gsl_eigen_genhermv_alloc*(n: csize_t): ptr gsl_eigen_genhermv_workspace {.cdecl, importc: "gsl_eigen_genhermv_alloc", dynlib: libgsl.}
proc gsl_eigen_genhermv_free*(w: ptr gsl_eigen_genhermv_workspace) {.cdecl, importc: "gsl_eigen_genhermv_free", dynlib: libgsl.}
proc gsl_eigen_genhermv*(A: ptr gsl_matrix_complex; B: ptr gsl_matrix_complex;    eval: ptr gsl_vector; evec: ptr gsl_matrix_complex;    w: ptr gsl_eigen_genhermv_workspace): cint {.cdecl, importc: "gsl_eigen_genhermv", dynlib: libgsl.}
proc gsl_eigen_gen_alloc*(n: csize_t): ptr gsl_eigen_gen_workspace {.cdecl, importc: "gsl_eigen_gen_alloc", dynlib: libgsl.}
proc gsl_eigen_gen_free*(w: ptr gsl_eigen_gen_workspace) {.cdecl, importc: "gsl_eigen_gen_free", dynlib: libgsl.}
proc gsl_eigen_gen_params*(compute_s: cint; compute_t: cint; balance: cint;  w: ptr gsl_eigen_gen_workspace) {.cdecl, importc: "gsl_eigen_gen_params", dynlib: libgsl.}
proc gsl_eigen_gen*(A: ptr gsl_matrix; B: ptr gsl_matrix;  alpha: ptr gsl_vector_complex; beta: ptr gsl_vector;  w: ptr gsl_eigen_gen_workspace): cint {.cdecl, importc: "gsl_eigen_gen", dynlib: libgsl.}
proc gsl_eigen_gen_QZ*(A: ptr gsl_matrix; B: ptr gsl_matrix;  alpha: ptr gsl_vector_complex; beta: ptr gsl_vector;  Q: ptr gsl_matrix; Z: ptr gsl_matrix;  w: ptr gsl_eigen_gen_workspace): cint {.cdecl, importc: "gsl_eigen_gen_QZ", dynlib: libgsl.}
proc gsl_eigen_genv_alloc*(n: csize_t): ptr gsl_eigen_genv_workspace {.cdecl, importc: "gsl_eigen_genv_alloc", dynlib: libgsl.}
proc gsl_eigen_genv_free*(w: ptr gsl_eigen_genv_workspace) {.cdecl, importc: "gsl_eigen_genv_free", dynlib: libgsl.}
proc gsl_eigen_genv*(A: ptr gsl_matrix; B: ptr gsl_matrix;   alpha: ptr gsl_vector_complex; beta: ptr gsl_vector;   evec: ptr gsl_matrix_complex; w: ptr gsl_eigen_genv_workspace): cint {. cdecl, importc: "gsl_eigen_genv", dynlib: libgsl.}
proc gsl_eigen_genv_QZ*(A: ptr gsl_matrix; B: ptr gsl_matrix;   alpha: ptr gsl_vector_complex; beta: ptr gsl_vector;   evec: ptr gsl_matrix_complex; Q: ptr gsl_matrix;   Z: ptr gsl_matrix; w: ptr gsl_eigen_genv_workspace): cint {. cdecl, importc: "gsl_eigen_genv_QZ", dynlib: libgsl.}
proc gsl_eigen_symmv_sort*(eval: ptr gsl_vector; evec: ptr gsl_matrix;  sort_type: gsl_eigen_sort_t): cint {.cdecl, importc: "gsl_eigen_symmv_sort", dynlib: libgsl.}
proc gsl_eigen_hermv_sort*(eval: ptr gsl_vector; evec: ptr gsl_matrix_complex;  sort_type: gsl_eigen_sort_t): cint {.cdecl, importc: "gsl_eigen_hermv_sort", dynlib: libgsl.}
proc gsl_eigen_nonsymmv_sort*(eval: ptr gsl_vector_complex;  evec: ptr gsl_matrix_complex;  sort_type: gsl_eigen_sort_t): cint {.cdecl, importc: "gsl_eigen_nonsymmv_sort", dynlib: libgsl.}
proc gsl_eigen_gensymmv_sort*(eval: ptr gsl_vector; evec: ptr gsl_matrix;  sort_type: gsl_eigen_sort_t): cint {.cdecl, importc: "gsl_eigen_gensymmv_sort", dynlib: libgsl.}
proc gsl_eigen_genhermv_sort*(eval: ptr gsl_vector; evec: ptr gsl_matrix_complex;  sort_type: gsl_eigen_sort_t): cint {.cdecl, importc: "gsl_eigen_genhermv_sort", dynlib: libgsl.}
proc gsl_eigen_genv_sort*(alpha: ptr gsl_vector_complex; beta: ptr gsl_vector; evec: ptr gsl_matrix_complex; sort_type: gsl_eigen_sort_t): cint {. cdecl, importc: "gsl_eigen_genv_sort", dynlib: libgsl.}
proc gsl_schur_gen_eigvals*(A: ptr gsl_matrix; B: ptr gsl_matrix; wr1: ptr cdouble;   wr2: ptr cdouble; wi: ptr cdouble; scale1: ptr cdouble;   scale2: ptr cdouble): cint {.cdecl, importc: "gsl_schur_gen_eigvals", dynlib: libgsl.}
proc gsl_schur_solve_equation*(ca: cdouble; A: ptr gsl_matrix; z: cdouble; d1: cdouble;   d2: cdouble; b: ptr gsl_vector; x: ptr gsl_vector;   s: ptr cdouble; xnorm: ptr cdouble; smin: cdouble): cint {. cdecl, importc: "gsl_schur_solve_equation", dynlib: libgsl.}
proc gsl_schur_solve_equation_z*(ca: cdouble; A: ptr gsl_matrix; z: ptr gsl_complex; d1: cdouble; d2: cdouble; b: ptr gsl_vector_complex; x: ptr gsl_vector_complex; s: ptr cdouble; xnorm: ptr cdouble; smin: cdouble): cint {.cdecl, importc: "gsl_schur_solve_equation_z", dynlib: libgsl.}
proc gsl_eigen_jacobi*(matrix: ptr gsl_matrix; eval: ptr gsl_vector;  evec: ptr gsl_matrix; max_rot: cuint; nrot: ptr cuint): cint {. cdecl, importc: "gsl_eigen_jacobi", dynlib: libgsl.}
proc gsl_eigen_invert_jacobi*(matrix: ptr gsl_matrix; ainv: ptr gsl_matrix;  max_rot: cuint): cint {.cdecl, importc: "gsl_eigen_invert_jacobi", dynlib: libgsl.}
proc gsl_sf_mathieu_a_array*(order_min: cint; order_max: cint; qq: cdouble; work: ptr gsl_sf_mathieu_workspace; result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_mathieu_a_array", dynlib: libgsl.}
proc gsl_sf_mathieu_b_array*(order_min: cint; order_max: cint; qq: cdouble; work: ptr gsl_sf_mathieu_workspace; result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_mathieu_b_array", dynlib: libgsl.}
proc gsl_sf_mathieu_a_e*(order: cint; qq: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_mathieu_a_e", dynlib: libgsl.}
proc gsl_sf_mathieu_a*(order: cint; qq: cdouble): cdouble {.cdecl, importc: "gsl_sf_mathieu_a", dynlib: libgsl.}
proc gsl_sf_mathieu_b_e*(order: cint; qq: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_mathieu_b_e", dynlib: libgsl.}
proc gsl_sf_mathieu_b*(order: cint; qq: cdouble): cdouble {.cdecl, importc: "gsl_sf_mathieu_b", dynlib: libgsl.}
proc gsl_sf_mathieu_a_coeff*(order: cint; qq: cdouble; aa: cdouble; coeff: ptr cdouble): cint {. cdecl, importc: "gsl_sf_mathieu_a_coeff", dynlib: libgsl.}
proc gsl_sf_mathieu_b_coeff*(order: cint; qq: cdouble; aa: cdouble; coeff: ptr cdouble): cint {. cdecl, importc: "gsl_sf_mathieu_b_coeff", dynlib: libgsl.}
proc gsl_sf_mathieu_alloc*(nn: csize_t; qq: cdouble): ptr gsl_sf_mathieu_workspace {. cdecl, importc: "gsl_sf_mathieu_alloc", dynlib: libgsl.}
proc gsl_sf_mathieu_free*(workspace: ptr gsl_sf_mathieu_workspace) {.cdecl, importc: "gsl_sf_mathieu_free", dynlib: libgsl.}
proc gsl_sf_mathieu_ce_e*(order: cint; qq: cdouble; zz: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_mathieu_ce_e", dynlib: libgsl.}
proc gsl_sf_mathieu_ce*(order: cint; qq: cdouble; zz: cdouble): cdouble {.cdecl, importc: "gsl_sf_mathieu_ce", dynlib: libgsl.}
proc gsl_sf_mathieu_se_e*(order: cint; qq: cdouble; zz: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_mathieu_se_e", dynlib: libgsl.}
proc gsl_sf_mathieu_se*(order: cint; qq: cdouble; zz: cdouble): cdouble {.cdecl, importc: "gsl_sf_mathieu_se", dynlib: libgsl.}
proc gsl_sf_mathieu_ce_array*(nmin: cint; nmax: cint; qq: cdouble; zz: cdouble;  work: ptr gsl_sf_mathieu_workspace;  result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_mathieu_ce_array", dynlib: libgsl.}
proc gsl_sf_mathieu_se_array*(nmin: cint; nmax: cint; qq: cdouble; zz: cdouble;  work: ptr gsl_sf_mathieu_workspace;  result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_mathieu_se_array", dynlib: libgsl.}
proc gsl_sf_mathieu_Mc_e*(kind: cint; order: cint; qq: cdouble; zz: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_mathieu_Mc_e", dynlib: libgsl.}
proc gsl_sf_mathieu_Mc*(kind: cint; order: cint; qq: cdouble; zz: cdouble): cdouble {. cdecl, importc: "gsl_sf_mathieu_Mc", dynlib: libgsl.}
proc gsl_sf_mathieu_Ms_e*(kind: cint; order: cint; qq: cdouble; zz: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_mathieu_Ms_e", dynlib: libgsl.}
proc gsl_sf_mathieu_Ms*(kind: cint; order: cint; qq: cdouble; zz: cdouble): cdouble {. cdecl, importc: "gsl_sf_mathieu_Ms", dynlib: libgsl.}
proc gsl_sf_mathieu_Mc_array*(kind: cint; nmin: cint; nmax: cint; qq: cdouble;  zz: cdouble; work: ptr gsl_sf_mathieu_workspace;  result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_mathieu_Mc_array", dynlib: libgsl.}
proc gsl_sf_mathieu_Ms_array*(kind: cint; nmin: cint; nmax: cint; qq: cdouble;  zz: cdouble; work: ptr gsl_sf_mathieu_workspace;  result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_mathieu_Ms_array", dynlib: libgsl.}
proc gsl_sf_pow_int_e*(x: cdouble; n: cint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_pow_int_e", dynlib: libgsl.}
proc gsl_sf_pow_int*(x: cdouble; n: cint): cdouble {.cdecl, importc: "gsl_sf_pow_int", dynlib: libgsl.}
proc gsl_sf_psi_int_e*(n: cint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_psi_int_e", dynlib: libgsl.}
proc gsl_sf_psi_int*(n: cint): cdouble {.cdecl, importc: "gsl_sf_psi_int",  dynlib: libgsl.}
proc gsl_sf_psi_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_psi_e", dynlib: libgsl.}
proc gsl_sf_psi*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_psi", dynlib: libgsl.}
proc gsl_sf_psi_1piy_e*(y: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_psi_1piy_e", dynlib: libgsl.}
proc gsl_sf_psi_1piy*(y: cdouble): cdouble {.cdecl, importc: "gsl_sf_psi_1piy", dynlib: libgsl.}
proc gsl_sf_complex_psi_e*(x: cdouble; y: cdouble; result_re: ptr gsl_sf_result;  result_im: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_complex_psi_e", dynlib: libgsl.}
proc gsl_sf_psi_1_int_e*(n: cint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_psi_1_int_e", dynlib: libgsl.}
proc gsl_sf_psi_1_int*(n: cint): cdouble {.cdecl, importc: "gsl_sf_psi_1_int", dynlib: libgsl.}
proc gsl_sf_psi_1_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_psi_1_e", dynlib: libgsl.}
proc gsl_sf_psi_1*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_psi_1",   dynlib: libgsl.}
proc gsl_sf_psi_n_e*(n: cint; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_psi_n_e", dynlib: libgsl.}
proc gsl_sf_psi_n*(n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_psi_n", dynlib: libgsl.}
proc gsl_sf_sin_pi_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_sin_pi_e", dynlib: libgsl.}
proc gsl_sf_sin_pi*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_sin_pi", dynlib: libgsl.}
proc gsl_sf_cos_pi_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_cos_pi_e", dynlib: libgsl.}
proc gsl_sf_cos_pi*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_cos_pi", dynlib: libgsl.}
proc gsl_sf_synchrotron_1_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_synchrotron_1_e", dynlib: libgsl.}
proc gsl_sf_synchrotron_1*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_synchrotron_1", dynlib: libgsl.}
proc gsl_sf_synchrotron_2_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_synchrotron_2_e", dynlib: libgsl.}
proc gsl_sf_synchrotron_2*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_synchrotron_2", dynlib: libgsl.}
proc gsl_sf_transport_2_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_transport_2_e", dynlib: libgsl.}
proc gsl_sf_transport_2*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_transport_2", dynlib: libgsl.}
proc gsl_sf_transport_3_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_transport_3_e", dynlib: libgsl.}
proc gsl_sf_transport_3*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_transport_3", dynlib: libgsl.}
proc gsl_sf_transport_4_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_transport_4_e", dynlib: libgsl.}
proc gsl_sf_transport_4*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_transport_4", dynlib: libgsl.}
proc gsl_sf_transport_5_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_transport_5_e", dynlib: libgsl.}
proc gsl_sf_transport_5*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_transport_5", dynlib: libgsl.}
proc gsl_sf_sin_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_sin_e", dynlib: libgsl.}
proc gsl_sf_sin*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_sin", dynlib: libgsl.}
proc gsl_sf_cos_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_cos_e", dynlib: libgsl.}
proc gsl_sf_cos*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_cos", dynlib: libgsl.}
proc gsl_sf_hypot_e*(x: cdouble; y: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_hypot_e", dynlib: libgsl.}
proc gsl_sf_hypot*(x: cdouble; y: cdouble): cdouble {.cdecl, importc: "gsl_sf_hypot", dynlib: libgsl.}
proc gsl_sf_complex_sin_e*(zr: cdouble; zi: cdouble; szr: ptr gsl_sf_result;  szi: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_complex_sin_e", dynlib: libgsl.}
proc gsl_sf_complex_cos_e*(zr: cdouble; zi: cdouble; czr: ptr gsl_sf_result;  czi: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_complex_cos_e", dynlib: libgsl.}
proc gsl_sf_complex_logsin_e*(zr: cdouble; zi: cdouble; lszr: ptr gsl_sf_result;  lszi: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_complex_logsin_e", dynlib: libgsl.}
proc gsl_sf_sinc_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_sinc_e", dynlib: libgsl.}
proc gsl_sf_sinc*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_sinc", dynlib: libgsl.}
proc gsl_sf_lnsinh_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_lnsinh_e", dynlib: libgsl.}
proc gsl_sf_lnsinh*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_lnsinh", dynlib: libgsl.}
proc gsl_sf_lncosh_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_lncosh_e", dynlib: libgsl.}
proc gsl_sf_lncosh*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_lncosh", dynlib: libgsl.}
proc gsl_sf_polar_to_rect*(r: cdouble; theta: cdouble; x: ptr gsl_sf_result;  y: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_polar_to_rect", dynlib: libgsl.}
proc gsl_sf_rect_to_polar*(x: cdouble; y: cdouble; r: ptr gsl_sf_result;  theta: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_rect_to_polar", dynlib: libgsl.}
proc gsl_sf_sin_err_e*(x: cdouble; dx: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_sin_err_e", dynlib: libgsl.}
proc gsl_sf_cos_err_e*(x: cdouble; dx: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_cos_err_e", dynlib: libgsl.}
proc gsl_sf_angle_restrict_symm_e*(theta: ptr cdouble): cint {.cdecl, importc: "gsl_sf_angle_restrict_symm_e", dynlib: libgsl.}
proc gsl_sf_angle_restrict_symm*(theta: cdouble): cdouble {.cdecl, importc: "gsl_sf_angle_restrict_symm", dynlib: libgsl.}
proc gsl_sf_angle_restrict_pos_e*(theta: ptr cdouble): cint {.cdecl, importc: "gsl_sf_angle_restrict_pos_e", dynlib: libgsl.}
proc gsl_sf_angle_restrict_pos*(theta: cdouble): cdouble {.cdecl, importc: "gsl_sf_angle_restrict_pos", dynlib: libgsl.}
proc gsl_sf_angle_restrict_symm_err_e*(theta: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_angle_restrict_symm_err_e", dynlib: libgsl.}
proc gsl_sf_angle_restrict_pos_err_e*(theta: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_angle_restrict_pos_err_e", dynlib: libgsl.}
proc gsl_sf_zeta_int_e*(n: cint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_zeta_int_e", dynlib: libgsl.}
proc gsl_sf_zeta_int*(n: cint): cdouble {.cdecl, importc: "gsl_sf_zeta_int",   dynlib: libgsl.}
proc gsl_sf_zeta_e*(s: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_zeta_e", dynlib: libgsl.}
proc gsl_sf_zeta*(s: cdouble): cdouble {.cdecl, importc: "gsl_sf_zeta", dynlib: libgsl.}
proc gsl_sf_zetam1_e*(s: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_zetam1_e", dynlib: libgsl.}
proc gsl_sf_zetam1*(s: cdouble): cdouble {.cdecl, importc: "gsl_sf_zetam1", dynlib: libgsl.}
proc gsl_sf_zetam1_int_e*(s: cint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_zetam1_int_e", dynlib: libgsl.}
proc gsl_sf_zetam1_int*(s: cint): cdouble {.cdecl, importc: "gsl_sf_zetam1_int",  dynlib: libgsl.}
proc gsl_sf_hzeta_e*(s: cdouble; q: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_hzeta_e", dynlib: libgsl.}
proc gsl_sf_hzeta*(s: cdouble; q: cdouble): cdouble {.cdecl, importc: "gsl_sf_hzeta", dynlib: libgsl.}
proc gsl_sf_eta_int_e*(n: cint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_eta_int_e", dynlib: libgsl.}
proc gsl_sf_eta_int*(n: cint): cdouble {.cdecl, importc: "gsl_sf_eta_int",  dynlib: libgsl.}
proc gsl_sf_eta_e*(s: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_eta_e", dynlib: libgsl.}
proc gsl_sf_eta*(s: cdouble): cdouble {.cdecl, importc: "gsl_sf_eta", dynlib: libgsl.}

var gsl_prec_eps* {.importc: "gsl_prec_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_sqrt_eps* {.importc: "gsl_prec_sqrt_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root3_eps* {.importc: "gsl_prec_root3_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root4_eps* {.importc: "gsl_prec_root4_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root5_eps* {.importc: "gsl_prec_root5_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root6_eps* {.importc: "gsl_prec_root6_eps", dynlib: libgsl.}: ptr cdouble

var gsl_check_range* {.importc: "gsl_check_range", dynlib: libgsl.}: cint

