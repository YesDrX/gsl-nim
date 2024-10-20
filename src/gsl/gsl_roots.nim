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
  gsl_root_fsolver_type* {.bycopy.} = object
    name*: cstring
    size*: csize_t
    set*: proc (state: pointer; f: ptr gsl_function; root: ptr cdouble; x_lower: cdouble; x_upper: cdouble): cint {.cdecl.}
    iterate*: proc (state: pointer; f: ptr gsl_function; root: ptr cdouble; x_lower: ptr cdouble; x_upper: ptr cdouble): cint {.cdecl.}

  gsl_root_fsolver* {.bycopy.} = object
    `type`*: ptr gsl_root_fsolver_type
    function*: ptr gsl_function
    root*: cdouble
    x_lower*: cdouble
    x_upper*: cdouble
    state*: pointer

  gsl_root_fdfsolver_type* {.bycopy.} = object
    name*: cstring
    size*: csize_t
    set*: proc (state: pointer; f: ptr gsl_function_fdf; root: ptr cdouble): cint {.cdecl.}
    iterate*: proc (state: pointer; f: ptr gsl_function_fdf; root: ptr cdouble): cint {.     cdecl.}

  gsl_root_fdfsolver* {.bycopy.} = object
    `type`*: ptr gsl_root_fdfsolver_type
    fdf*: ptr gsl_function_fdf
    root*: cdouble
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
proc gsl_root_fsolver_alloc*(T: ptr gsl_root_fsolver_type): ptr gsl_root_fsolver {. cdecl, importc: "gsl_root_fsolver_alloc", dynlib: libgsl.}
proc gsl_root_fsolver_free*(s: ptr gsl_root_fsolver) {.cdecl, importc: "gsl_root_fsolver_free", dynlib: libgsl.}
proc gsl_root_fsolver_set*(s: ptr gsl_root_fsolver; f: ptr gsl_function;  x_lower: cdouble; x_upper: cdouble): cint {.cdecl, importc: "gsl_root_fsolver_set", dynlib: libgsl.}
proc gsl_root_fsolver_iterate*(s: ptr gsl_root_fsolver): cint {.cdecl, importc: "gsl_root_fsolver_iterate", dynlib: libgsl.}
proc gsl_root_fsolver_name*(s: ptr gsl_root_fsolver): cstring {.cdecl, importc: "gsl_root_fsolver_name", dynlib: libgsl.}
proc gsl_root_fsolver_root*(s: ptr gsl_root_fsolver): cdouble {.cdecl, importc: "gsl_root_fsolver_root", dynlib: libgsl.}
proc gsl_root_fsolver_x_lower*(s: ptr gsl_root_fsolver): cdouble {.cdecl, importc: "gsl_root_fsolver_x_lower", dynlib: libgsl.}
proc gsl_root_fsolver_x_upper*(s: ptr gsl_root_fsolver): cdouble {.cdecl, importc: "gsl_root_fsolver_x_upper", dynlib: libgsl.}
proc gsl_root_fdfsolver_alloc*(T: ptr gsl_root_fdfsolver_type): ptr gsl_root_fdfsolver {. cdecl, importc: "gsl_root_fdfsolver_alloc", dynlib: libgsl.}
proc gsl_root_fdfsolver_set*(s: ptr gsl_root_fdfsolver; fdf: ptr gsl_function_fdf; root: cdouble): cint {.cdecl, importc: "gsl_root_fdfsolver_set", dynlib: libgsl.}
proc gsl_root_fdfsolver_iterate*(s: ptr gsl_root_fdfsolver): cint {.cdecl, importc: "gsl_root_fdfsolver_iterate", dynlib: libgsl.}
proc gsl_root_fdfsolver_free*(s: ptr gsl_root_fdfsolver) {.cdecl, importc: "gsl_root_fdfsolver_free", dynlib: libgsl.}
proc gsl_root_fdfsolver_name*(s: ptr gsl_root_fdfsolver): cstring {.cdecl, importc: "gsl_root_fdfsolver_name", dynlib: libgsl.}
proc gsl_root_fdfsolver_root*(s: ptr gsl_root_fdfsolver): cdouble {.cdecl, importc: "gsl_root_fdfsolver_root", dynlib: libgsl.}
proc gsl_root_test_interval*(x_lower: cdouble; x_upper: cdouble; epsabs: cdouble; epsrel: cdouble): cint {.cdecl, importc: "gsl_root_test_interval", dynlib: libgsl.}
proc gsl_root_test_residual*(f: cdouble; epsabs: cdouble): cint {.cdecl, importc: "gsl_root_test_residual", dynlib: libgsl.}
proc gsl_root_test_delta*(x1: cdouble; x0: cdouble; epsabs: cdouble; epsrel: cdouble): cint {. cdecl, importc: "gsl_root_test_delta", dynlib: libgsl.}

var gsl_prec_eps* {.importc: "gsl_prec_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_sqrt_eps* {.importc: "gsl_prec_sqrt_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root3_eps* {.importc: "gsl_prec_root3_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root4_eps* {.importc: "gsl_prec_root4_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root5_eps* {.importc: "gsl_prec_root5_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root6_eps* {.importc: "gsl_prec_root6_eps", dynlib: libgsl.}: ptr cdouble

var gsl_root_fsolver_bisection* {.importc: "gsl_root_fsolver_bisection",  dynlib: libgsl.}: ptr gsl_root_fsolver_type

var gsl_root_fsolver_brent* {.importc: "gsl_root_fsolver_brent", dynlib: libgsl.}: ptr gsl_root_fsolver_type

var gsl_root_fsolver_falsepos* {.importc: "gsl_root_fsolver_falsepos", dynlib: libgsl.}: ptr gsl_root_fsolver_type

var gsl_root_fdfsolver_newton* {.importc: "gsl_root_fdfsolver_newton", dynlib: libgsl.}: ptr gsl_root_fdfsolver_type

var gsl_root_fdfsolver_secant* {.importc: "gsl_root_fdfsolver_secant", dynlib: libgsl.}: ptr gsl_root_fdfsolver_type

var gsl_root_fdfsolver_steffenson* {.importc: "gsl_root_fdfsolver_steffenson",  dynlib: libgsl.}: ptr gsl_root_fdfsolver_type

