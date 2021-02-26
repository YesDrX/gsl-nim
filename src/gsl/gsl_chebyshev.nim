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
  gsl_mode_t* = cuint
  gsl_cheb_series_struct* {.bycopy.} = object
    c*: ptr cdouble
    order*: csize_t
    a*: cdouble
    b*: cdouble
    order_sp*: csize_t
    f*: ptr cdouble

  gsl_cheb_series* = gsl_cheb_series_struct

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
proc gsl_cheb_alloc*(order: csize_t): ptr gsl_cheb_series {.cdecl, importc: "gsl_cheb_alloc", dynlib: libgsl.}
proc gsl_cheb_free*(cs: ptr gsl_cheb_series) {.cdecl, importc: "gsl_cheb_free", dynlib: libgsl.}
proc gsl_cheb_init*(cs: ptr gsl_cheb_series; `func`: ptr gsl_function; a: cdouble;  b: cdouble): cint {.cdecl, importc: "gsl_cheb_init", dynlib: libgsl.}
proc gsl_cheb_order*(cs: ptr gsl_cheb_series): csize_t {.cdecl, importc: "gsl_cheb_order", dynlib: libgsl.}
proc gsl_cheb_size*(cs: ptr gsl_cheb_series): csize_t {.cdecl, importc: "gsl_cheb_size", dynlib: libgsl.}
proc gsl_cheb_coeffs*(cs: ptr gsl_cheb_series): ptr cdouble {.cdecl, importc: "gsl_cheb_coeffs", dynlib: libgsl.}
proc gsl_cheb_eval*(cs: ptr gsl_cheb_series; x: cdouble): cdouble {.cdecl, importc: "gsl_cheb_eval", dynlib: libgsl.}
proc gsl_cheb_eval_err*(cs: ptr gsl_cheb_series; x: cdouble; result: ptr cdouble;   abserr: ptr cdouble): cint {.cdecl, importc: "gsl_cheb_eval_err", dynlib: libgsl.}
proc gsl_cheb_eval_n*(cs: ptr gsl_cheb_series; order: csize_t; x: cdouble): cdouble {. cdecl, importc: "gsl_cheb_eval_n", dynlib: libgsl.}
proc gsl_cheb_eval_n_err*(cs: ptr gsl_cheb_series; order: csize_t; x: cdouble; result: ptr cdouble; abserr: ptr cdouble): cint {.cdecl, importc: "gsl_cheb_eval_n_err", dynlib: libgsl.}
proc gsl_cheb_eval_mode*(cs: ptr gsl_cheb_series; x: cdouble; mode: gsl_mode_t): cdouble {. cdecl, importc: "gsl_cheb_eval_mode", dynlib: libgsl.}
proc gsl_cheb_eval_mode_e*(cs: ptr gsl_cheb_series; x: cdouble; mode: gsl_mode_t;  result: ptr cdouble; abserr: ptr cdouble): cint {.cdecl, importc: "gsl_cheb_eval_mode_e", dynlib: libgsl.}
proc gsl_cheb_calc_deriv*(deriv: ptr gsl_cheb_series; cs: ptr gsl_cheb_series): cint {. cdecl, importc: "gsl_cheb_calc_deriv", dynlib: libgsl.}
proc gsl_cheb_calc_integ*(integ: ptr gsl_cheb_series; cs: ptr gsl_cheb_series): cint {. cdecl, importc: "gsl_cheb_calc_integ", dynlib: libgsl.}

var gsl_prec_eps* {.importc: "gsl_prec_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_sqrt_eps* {.importc: "gsl_prec_sqrt_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root3_eps* {.importc: "gsl_prec_root3_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root4_eps* {.importc: "gsl_prec_root4_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root5_eps* {.importc: "gsl_prec_root5_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root6_eps* {.importc: "gsl_prec_root6_eps", dynlib: libgsl.}: ptr cdouble

