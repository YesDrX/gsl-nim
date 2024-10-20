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

  gsl_fft_direction* {.size: sizeof(cint).} = enum
    gsl_fft_forward = -1, gsl_fft_backward = +1

  gsl_fft_complex_wavetable* {.bycopy.} = object
    n*: csize_t
    nf*: csize_t
    factor*: array[64, csize_t]
    twiddle*: array[64, ptr gsl_complex]
    trig*: ptr gsl_complex

  gsl_fft_complex_workspace* {.bycopy.} = object
    n*: csize_t
    scratch*: ptr cdouble

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
proc gsl_fft_complex_radix2_forward*(data: gsl_complex_packed_array; stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_fft_complex_radix2_forward", dynlib: libgsl.}
proc gsl_fft_complex_radix2_backward*(data: gsl_complex_packed_array;  stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_fft_complex_radix2_backward", dynlib: libgsl.}
proc gsl_fft_complex_radix2_inverse*(data: gsl_complex_packed_array; stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_fft_complex_radix2_inverse", dynlib: libgsl.}
proc gsl_fft_complex_radix2_transform*(data: gsl_complex_packed_array;   stride: csize_t; n: csize_t;   sign: gsl_fft_direction): cint {.cdecl, importc: "gsl_fft_complex_radix2_transform", dynlib: libgsl.}
proc gsl_fft_complex_radix2_dif_forward*(data: gsl_complex_packed_array; stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_fft_complex_radix2_dif_forward", dynlib: libgsl.}
proc gsl_fft_complex_radix2_dif_backward*(data: gsl_complex_packed_array; stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_fft_complex_radix2_dif_backward", dynlib: libgsl.}
proc gsl_fft_complex_radix2_dif_inverse*(data: gsl_complex_packed_array; stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_fft_complex_radix2_dif_inverse", dynlib: libgsl.}
proc gsl_fft_complex_radix2_dif_transform*(data: gsl_complex_packed_array; stride: csize_t; n: csize_t; sign: gsl_fft_direction): cint {.cdecl, importc: "gsl_fft_complex_radix2_dif_transform", dynlib: libgsl.}
proc gsl_fft_complex_wavetable_alloc*(n: csize_t): ptr gsl_fft_complex_wavetable {. cdecl, importc: "gsl_fft_complex_wavetable_alloc", dynlib: libgsl.}
proc gsl_fft_complex_wavetable_free*(wavetable: ptr gsl_fft_complex_wavetable) {. cdecl, importc: "gsl_fft_complex_wavetable_free", dynlib: libgsl.}
proc gsl_fft_complex_workspace_alloc*(n: csize_t): ptr gsl_fft_complex_workspace {. cdecl, importc: "gsl_fft_complex_workspace_alloc", dynlib: libgsl.}
proc gsl_fft_complex_workspace_free*(workspace: ptr gsl_fft_complex_workspace) {. cdecl, importc: "gsl_fft_complex_workspace_free", dynlib: libgsl.}
proc gsl_fft_complex_memcpy*(dest: ptr gsl_fft_complex_wavetable; src: ptr gsl_fft_complex_wavetable): cint {.cdecl, importc: "gsl_fft_complex_memcpy", dynlib: libgsl.}
proc gsl_fft_complex_forward*(data: gsl_complex_packed_array; stride: csize_t;  n: csize_t; wavetable: ptr gsl_fft_complex_wavetable;  work: ptr gsl_fft_complex_workspace): cint {.cdecl, importc: "gsl_fft_complex_forward", dynlib: libgsl.}
proc gsl_fft_complex_backward*(data: gsl_complex_packed_array; stride: csize_t;   n: csize_t;   wavetable: ptr gsl_fft_complex_wavetable;   work: ptr gsl_fft_complex_workspace): cint {.cdecl, importc: "gsl_fft_complex_backward", dynlib: libgsl.}
proc gsl_fft_complex_inverse*(data: gsl_complex_packed_array; stride: csize_t;  n: csize_t; wavetable: ptr gsl_fft_complex_wavetable;  work: ptr gsl_fft_complex_workspace): cint {.cdecl, importc: "gsl_fft_complex_inverse", dynlib: libgsl.}
proc gsl_fft_complex_transform*(data: gsl_complex_packed_array; stride: csize_t; n: csize_t; wavetable: ptr gsl_fft_complex_wavetable; work: ptr gsl_fft_complex_workspace; sign: gsl_fft_direction): cint {.cdecl, importc: "gsl_fft_complex_transform", dynlib: libgsl.}

var gsl_prec_eps* {.importc: "gsl_prec_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_sqrt_eps* {.importc: "gsl_prec_sqrt_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root3_eps* {.importc: "gsl_prec_root3_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root4_eps* {.importc: "gsl_prec_root4_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root5_eps* {.importc: "gsl_prec_root5_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root6_eps* {.importc: "gsl_prec_root6_eps", dynlib: libgsl.}: ptr cdouble

