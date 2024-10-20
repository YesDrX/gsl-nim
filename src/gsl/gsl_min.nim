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
  gsl_min_fminimizer_type* {.bycopy.} = object
    name*: cstring
    size*: csize_t
    set*: proc (state: pointer; f: ptr gsl_function; x_minimum: cdouble; f_minimum: cdouble; x_lower: cdouble; f_lower: cdouble; x_upper: cdouble; f_upper: cdouble): cint {.cdecl.}
    iterate*: proc (state: pointer; f: ptr gsl_function; x_minimum: ptr cdouble; f_minimum: ptr cdouble; x_lower: ptr cdouble; f_lower: ptr cdouble; x_upper: ptr cdouble; f_upper: ptr cdouble): cint {.cdecl.}

  gsl_min_fminimizer* {.bycopy.} = object
    `type`*: ptr gsl_min_fminimizer_type
    function*: ptr gsl_function
    x_minimum*: cdouble
    x_lower*: cdouble
    x_upper*: cdouble
    f_minimum*: cdouble
    f_lower*: cdouble
    f_upper*: cdouble
    state*: pointer

  gsl_min_bracketing_function* = proc (f: ptr gsl_function; x_minimum: ptr cdouble; f_minimum: ptr cdouble; x_lower: ptr cdouble; f_lower: ptr cdouble; x_upper: ptr cdouble; f_upper: ptr cdouble; eval_max: csize_t): cint {.   cdecl.}

proc gsl_min_find_bracket*(f: ptr gsl_function; x_minimum: ptr cdouble;  f_minimum: ptr cdouble; x_lower: ptr cdouble;  f_lower: ptr cdouble; x_upper: ptr cdouble;  f_upper: ptr cdouble; eval_max: csize_t): cint {.cdecl, importc: "gsl_min_find_bracket", dynlib: libgsl.}

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
proc gsl_min_fminimizer_alloc*(T: ptr gsl_min_fminimizer_type): ptr gsl_min_fminimizer {. cdecl, importc: "gsl_min_fminimizer_alloc", dynlib: libgsl.}
proc gsl_min_fminimizer_free*(s: ptr gsl_min_fminimizer) {.cdecl, importc: "gsl_min_fminimizer_free", dynlib: libgsl.}
proc gsl_min_fminimizer_set*(s: ptr gsl_min_fminimizer; f: ptr gsl_function; x_minimum: cdouble; x_lower: cdouble; x_upper: cdouble): cint {. cdecl, importc: "gsl_min_fminimizer_set", dynlib: libgsl.}
proc gsl_min_fminimizer_set_with_values*(s: ptr gsl_min_fminimizer; f: ptr gsl_function; x_minimum: cdouble; f_minimum: cdouble; x_lower: cdouble; f_lower: cdouble; x_upper: cdouble; f_upper: cdouble): cint {.cdecl, importc: "gsl_min_fminimizer_set_with_values", dynlib: libgsl.}
proc gsl_min_fminimizer_iterate*(s: ptr gsl_min_fminimizer): cint {.cdecl, importc: "gsl_min_fminimizer_iterate", dynlib: libgsl.}
proc gsl_min_fminimizer_name*(s: ptr gsl_min_fminimizer): cstring {.cdecl, importc: "gsl_min_fminimizer_name", dynlib: libgsl.}
proc gsl_min_fminimizer_x_minimum*(s: ptr gsl_min_fminimizer): cdouble {.cdecl, importc: "gsl_min_fminimizer_x_minimum", dynlib: libgsl.}
proc gsl_min_fminimizer_x_lower*(s: ptr gsl_min_fminimizer): cdouble {.cdecl, importc: "gsl_min_fminimizer_x_lower", dynlib: libgsl.}
proc gsl_min_fminimizer_x_upper*(s: ptr gsl_min_fminimizer): cdouble {.cdecl, importc: "gsl_min_fminimizer_x_upper", dynlib: libgsl.}
proc gsl_min_fminimizer_f_minimum*(s: ptr gsl_min_fminimizer): cdouble {.cdecl, importc: "gsl_min_fminimizer_f_minimum", dynlib: libgsl.}
proc gsl_min_fminimizer_f_lower*(s: ptr gsl_min_fminimizer): cdouble {.cdecl, importc: "gsl_min_fminimizer_f_lower", dynlib: libgsl.}
proc gsl_min_fminimizer_f_upper*(s: ptr gsl_min_fminimizer): cdouble {.cdecl, importc: "gsl_min_fminimizer_f_upper", dynlib: libgsl.}
proc gsl_min_fminimizer_minimum*(s: ptr gsl_min_fminimizer): cdouble {.cdecl, importc: "gsl_min_fminimizer_minimum", dynlib: libgsl.}
proc gsl_min_test_interval*(x_lower: cdouble; x_upper: cdouble; epsabs: cdouble;   epsrel: cdouble): cint {.cdecl, importc: "gsl_min_test_interval", dynlib: libgsl.}

var gsl_prec_eps* {.importc: "gsl_prec_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_sqrt_eps* {.importc: "gsl_prec_sqrt_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root3_eps* {.importc: "gsl_prec_root3_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root4_eps* {.importc: "gsl_prec_root4_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root5_eps* {.importc: "gsl_prec_root5_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root6_eps* {.importc: "gsl_prec_root6_eps", dynlib: libgsl.}: ptr cdouble

var gsl_min_fminimizer_goldensection* {.importc: "gsl_min_fminimizer_goldensection",   dynlib: libgsl.}: ptr gsl_min_fminimizer_type

var gsl_min_fminimizer_brent* {.importc: "gsl_min_fminimizer_brent", dynlib: libgsl.}: ptr gsl_min_fminimizer_type

var gsl_min_fminimizer_quad_golden* {.importc: "gsl_min_fminimizer_quad_golden", dynlib: libgsl.}: ptr gsl_min_fminimizer_type

