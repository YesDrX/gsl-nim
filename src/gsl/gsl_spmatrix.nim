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

  INNER_C_UNION_gsl_spmatrix_expanded_2438* {.bycopy.} = object {.union.}
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
    ano_gsl_spmatrix_expanded_2441*: INNER_C_UNION_gsl_spmatrix_expanded_2438
    sptype*: csize_t

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

var gsl_prec_eps* {.importc: "gsl_prec_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_sqrt_eps* {.importc: "gsl_prec_sqrt_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root3_eps* {.importc: "gsl_prec_root3_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root4_eps* {.importc: "gsl_prec_root4_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root5_eps* {.importc: "gsl_prec_root5_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root6_eps* {.importc: "gsl_prec_root6_eps", dynlib: libgsl.}: ptr cdouble

var gsl_check_range* {.importc: "gsl_check_range", dynlib: libgsl.}: cint

