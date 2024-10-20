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
  gsl_interp_accel* {.bycopy.} = object
    cache*: csize_t
    miss_count*: csize_t
    hit_count*: csize_t

  gsl_interp_type* {.bycopy.} = object
    name*: cstring
    min_size*: cuint
    alloc*: proc (size: csize_t): pointer {.cdecl.}
    init*: proc (a1: pointer; xa: ptr cdouble; ya: ptr cdouble; size: csize_t): cint {.cdecl.}
    eval*: proc (a1: pointer; xa: ptr cdouble; ya: ptr cdouble; size: csize_t; x: cdouble; a6: ptr gsl_interp_accel; y: ptr cdouble): cint {.cdecl.}
    eval_deriv*: proc (a1: pointer; xa: ptr cdouble; ya: ptr cdouble; size: csize_t; x: cdouble; a6: ptr gsl_interp_accel; y_p: ptr cdouble): cint {.     cdecl.}
    eval_deriv2*: proc (a1: pointer; xa: ptr cdouble; ya: ptr cdouble; size: csize_t;  x: cdouble; a6: ptr gsl_interp_accel; y_pp: ptr cdouble): cint {.     cdecl.}
    eval_integ*: proc (a1: pointer; xa: ptr cdouble; ya: ptr cdouble; size: csize_t; a5: ptr gsl_interp_accel; a: cdouble; b: cdouble; result: ptr cdouble): cint {.cdecl.}
    free*: proc (a1: pointer) {.cdecl.}

  gsl_interp* {.bycopy.} = object
    `type`*: ptr gsl_interp_type
    xmin*: cdouble
    xmax*: cdouble
    size*: csize_t
    state*: pointer

  gsl_spline* {.bycopy.} = object
    interp*: ptr gsl_interp
    x*: ptr cdouble
    y*: ptr cdouble
    size*: csize_t

proc gsl_interp_accel_alloc*(): ptr gsl_interp_accel {.cdecl, importc: "gsl_interp_accel_alloc", dynlib: libgsl.}
proc gsl_interp_accel_reset*(a: ptr gsl_interp_accel): cint {.cdecl, importc: "gsl_interp_accel_reset", dynlib: libgsl.}
proc gsl_interp_accel_free*(a: ptr gsl_interp_accel) {.cdecl, importc: "gsl_interp_accel_free", dynlib: libgsl.}
proc gsl_interp_alloc*(T: ptr gsl_interp_type; n: csize_t): ptr gsl_interp {.cdecl, importc: "gsl_interp_alloc", dynlib: libgsl.}
proc gsl_interp_init*(obj: ptr gsl_interp; xa: ptr cdouble; ya: ptr cdouble; size: csize_t): cint {. cdecl, importc: "gsl_interp_init", dynlib: libgsl.}
proc gsl_interp_name*(interp: ptr gsl_interp): cstring {.cdecl, importc: "gsl_interp_name", dynlib: libgsl.}
proc gsl_interp_min_size*(interp: ptr gsl_interp): cuint {.cdecl, importc: "gsl_interp_min_size", dynlib: libgsl.}
proc gsl_interp_type_min_size*(T: ptr gsl_interp_type): cuint {.cdecl, importc: "gsl_interp_type_min_size", dynlib: libgsl.}
proc gsl_interp_eval_e*(obj: ptr gsl_interp; xa: ptr cdouble; ya: ptr cdouble; x: cdouble;   a: ptr gsl_interp_accel; y: ptr cdouble): cint {.cdecl, importc: "gsl_interp_eval_e", dynlib: libgsl.}
proc gsl_interp_eval*(obj: ptr gsl_interp; xa: ptr cdouble; ya: ptr cdouble; x: cdouble; a: ptr gsl_interp_accel): cdouble {.cdecl, importc: "gsl_interp_eval", dynlib: libgsl.}
proc gsl_interp_eval_deriv_e*(obj: ptr gsl_interp; xa: ptr cdouble; ya: ptr cdouble;  x: cdouble; a: ptr gsl_interp_accel; d: ptr cdouble): cint {. cdecl, importc: "gsl_interp_eval_deriv_e", dynlib: libgsl.}
proc gsl_interp_eval_deriv*(obj: ptr gsl_interp; xa: ptr cdouble; ya: ptr cdouble;   x: cdouble; a: ptr gsl_interp_accel): cdouble {.cdecl, importc: "gsl_interp_eval_deriv", dynlib: libgsl.}
proc gsl_interp_eval_deriv2_e*(obj: ptr gsl_interp; xa: ptr cdouble; ya: ptr cdouble;   x: cdouble; a: ptr gsl_interp_accel; d2: ptr cdouble): cint {. cdecl, importc: "gsl_interp_eval_deriv2_e", dynlib: libgsl.}
proc gsl_interp_eval_deriv2*(obj: ptr gsl_interp; xa: ptr cdouble; ya: ptr cdouble; x: cdouble; a: ptr gsl_interp_accel): cdouble {.cdecl, importc: "gsl_interp_eval_deriv2", dynlib: libgsl.}
proc gsl_interp_eval_integ_e*(obj: ptr gsl_interp; xa: ptr cdouble; ya: ptr cdouble;  a: cdouble; b: cdouble; acc: ptr gsl_interp_accel;  result: ptr cdouble): cint {.cdecl, importc: "gsl_interp_eval_integ_e", dynlib: libgsl.}
proc gsl_interp_eval_integ*(obj: ptr gsl_interp; xa: ptr cdouble; ya: ptr cdouble;   a: cdouble; b: cdouble; acc: ptr gsl_interp_accel): cdouble {. cdecl, importc: "gsl_interp_eval_integ", dynlib: libgsl.}
proc gsl_interp_free*(interp: ptr gsl_interp) {.cdecl, importc: "gsl_interp_free", dynlib: libgsl.}
proc gsl_interp_bsearch*(x_array: ptr cdouble; x: cdouble; index_lo: csize_t;    index_hi: csize_t): csize_t {.cdecl, importc: "gsl_interp_bsearch", dynlib: libgsl.}
proc gsl_interp_accel_find*(a: ptr gsl_interp_accel; x_array: ptr cdouble;   size: csize_t; x: cdouble): csize_t {.cdecl, importc: "gsl_interp_accel_find", dynlib: libgsl.}
proc gsl_spline_alloc*(T: ptr gsl_interp_type; size: csize_t): ptr gsl_spline {.cdecl, importc: "gsl_spline_alloc", dynlib: libgsl.}
proc gsl_spline_init*(spline: ptr gsl_spline; xa: ptr cdouble; ya: ptr cdouble; size: csize_t): cint {.cdecl, importc: "gsl_spline_init", dynlib: libgsl.}
proc gsl_spline_name*(spline: ptr gsl_spline): cstring {.cdecl, importc: "gsl_spline_name", dynlib: libgsl.}
proc gsl_spline_min_size*(spline: ptr gsl_spline): cuint {.cdecl, importc: "gsl_spline_min_size", dynlib: libgsl.}
proc gsl_spline_eval_e*(spline: ptr gsl_spline; x: cdouble; a: ptr gsl_interp_accel;   y: ptr cdouble): cint {.cdecl, importc: "gsl_spline_eval_e", dynlib: libgsl.}
proc gsl_spline_eval*(spline: ptr gsl_spline; x: cdouble; a: ptr gsl_interp_accel): cdouble {. cdecl, importc: "gsl_spline_eval", dynlib: libgsl.}
proc gsl_spline_eval_deriv_e*(spline: ptr gsl_spline; x: cdouble;  a: ptr gsl_interp_accel; y: ptr cdouble): cint {.cdecl, importc: "gsl_spline_eval_deriv_e", dynlib: libgsl.}
proc gsl_spline_eval_deriv*(spline: ptr gsl_spline; x: cdouble;   a: ptr gsl_interp_accel): cdouble {.cdecl, importc: "gsl_spline_eval_deriv", dynlib: libgsl.}
proc gsl_spline_eval_deriv2_e*(spline: ptr gsl_spline; x: cdouble;   a: ptr gsl_interp_accel; y: ptr cdouble): cint {.cdecl, importc: "gsl_spline_eval_deriv2_e", dynlib: libgsl.}
proc gsl_spline_eval_deriv2*(spline: ptr gsl_spline; x: cdouble; a: ptr gsl_interp_accel): cdouble {.cdecl, importc: "gsl_spline_eval_deriv2", dynlib: libgsl.}
proc gsl_spline_eval_integ_e*(spline: ptr gsl_spline; a: cdouble; b: cdouble;  acc: ptr gsl_interp_accel; y: ptr cdouble): cint {.cdecl, importc: "gsl_spline_eval_integ_e", dynlib: libgsl.}
proc gsl_spline_eval_integ*(spline: ptr gsl_spline; a: cdouble; b: cdouble;   acc: ptr gsl_interp_accel): cdouble {.cdecl, importc: "gsl_spline_eval_integ", dynlib: libgsl.}
proc gsl_spline_free*(spline: ptr gsl_spline) {.cdecl, importc: "gsl_spline_free", dynlib: libgsl.}

var gsl_interp_linear* {.importc: "gsl_interp_linear", dynlib: libgsl.}: ptr gsl_interp_type

var gsl_interp_polynomial* {.importc: "gsl_interp_polynomial", dynlib: libgsl.}: ptr gsl_interp_type

var gsl_interp_cspline* {.importc: "gsl_interp_cspline", dynlib: libgsl.}: ptr gsl_interp_type

var gsl_interp_cspline_periodic* {.importc: "gsl_interp_cspline_periodic",   dynlib: libgsl.}: ptr gsl_interp_type

var gsl_interp_akima* {.importc: "gsl_interp_akima", dynlib: libgsl.}: ptr gsl_interp_type

var gsl_interp_akima_periodic* {.importc: "gsl_interp_akima_periodic", dynlib: libgsl.}: ptr gsl_interp_type

var gsl_interp_steffen* {.importc: "gsl_interp_steffen", dynlib: libgsl.}: ptr gsl_interp_type

