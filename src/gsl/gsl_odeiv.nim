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
  gsl_odeiv_system* {.bycopy.} = object
    function*: proc (t: cdouble; y: ptr cdouble; dydt: ptr cdouble; params: pointer): cint {.     cdecl.}
    jacobian*: proc (t: cdouble; y: ptr cdouble; dfdy: ptr cdouble; dfdt: ptr cdouble;  params: pointer): cint {.cdecl.}
    dimension*: csize_t
    params*: pointer

  gsl_odeiv_step_type* {.bycopy.} = object
    name*: cstring
    can_use_dydt_in*: cint
    gives_exact_dydt_out*: cint
    alloc*: proc (dim: csize_t): pointer {.cdecl.}
    apply*: proc (state: pointer; dim: csize_t; t: cdouble; h: cdouble; y: ptr cdouble; yerr: ptr cdouble; dydt_in: ptr cdouble; dydt_out: ptr cdouble; dydt: ptr gsl_odeiv_system): cint {.cdecl.}
    reset*: proc (state: pointer; dim: csize_t): cint {.cdecl.}
    order*: proc (state: pointer): cuint {.cdecl.}
    free*: proc (state: pointer) {.cdecl.}

  gsl_odeiv_step* {.bycopy.} = object
    `type`*: ptr gsl_odeiv_step_type
    dimension*: csize_t
    state*: pointer

  gsl_odeiv_control_type* {.bycopy.} = object
    name*: cstring
    alloc*: proc (): pointer {.cdecl.}
    init*: proc (state: pointer; eps_abs: cdouble; eps_rel: cdouble; a_y: cdouble; a_dydt: cdouble): cint {.cdecl.}
    hadjust*: proc (state: pointer; dim: csize_t; ord: cuint; y: ptr cdouble; yerr: ptr cdouble; yp: ptr cdouble; h: ptr cdouble): cint {.cdecl.}
    free*: proc (state: pointer) {.cdecl.}

  gsl_odeiv_control* {.bycopy.} = object
    `type`*: ptr gsl_odeiv_control_type
    state*: pointer

  gsl_odeiv_evolve* {.bycopy.} = object
    dimension*: csize_t
    y0*: ptr cdouble
    yerr*: ptr cdouble
    dydt_in*: ptr cdouble
    dydt_out*: ptr cdouble
    last_step*: cdouble
    count*: culong
    failed_steps*: culong

proc gsl_odeiv_step_alloc*(T: ptr gsl_odeiv_step_type; dim: csize_t): ptr gsl_odeiv_step {. cdecl, importc: "gsl_odeiv_step_alloc", dynlib: libgsl.}
proc gsl_odeiv_step_reset*(s: ptr gsl_odeiv_step): cint {.cdecl, importc: "gsl_odeiv_step_reset", dynlib: libgsl.}
proc gsl_odeiv_step_free*(s: ptr gsl_odeiv_step) {.cdecl, importc: "gsl_odeiv_step_free", dynlib: libgsl.}
proc gsl_odeiv_step_name*(s: ptr gsl_odeiv_step): cstring {.cdecl, importc: "gsl_odeiv_step_name", dynlib: libgsl.}
proc gsl_odeiv_step_order*(s: ptr gsl_odeiv_step): cuint {.cdecl, importc: "gsl_odeiv_step_order", dynlib: libgsl.}
proc gsl_odeiv_step_apply*(s: ptr gsl_odeiv_step; t: cdouble; h: cdouble;  y: ptr cdouble; yerr: ptr cdouble; dydt_in: ptr cdouble;  dydt_out: ptr cdouble; dydt: ptr gsl_odeiv_system): cint {. cdecl, importc: "gsl_odeiv_step_apply", dynlib: libgsl.}
proc gsl_odeiv_control_alloc*(T: ptr gsl_odeiv_control_type): ptr gsl_odeiv_control {. cdecl, importc: "gsl_odeiv_control_alloc", dynlib: libgsl.}
proc gsl_odeiv_control_init*(c: ptr gsl_odeiv_control; eps_abs: cdouble; eps_rel: cdouble; a_y: cdouble; a_dydt: cdouble): cint {. cdecl, importc: "gsl_odeiv_control_init", dynlib: libgsl.}
proc gsl_odeiv_control_free*(c: ptr gsl_odeiv_control) {.cdecl, importc: "gsl_odeiv_control_free", dynlib: libgsl.}
proc gsl_odeiv_control_hadjust*(c: ptr gsl_odeiv_control; s: ptr gsl_odeiv_step; y: ptr cdouble; yerr: ptr cdouble; dydt: ptr cdouble; h: ptr cdouble): cint {.cdecl, importc: "gsl_odeiv_control_hadjust", dynlib: libgsl.}
proc gsl_odeiv_control_name*(c: ptr gsl_odeiv_control): cstring {.cdecl, importc: "gsl_odeiv_control_name", dynlib: libgsl.}
proc gsl_odeiv_control_standard_new*(eps_abs: cdouble; eps_rel: cdouble; a_y: cdouble; a_dydt: cdouble): ptr gsl_odeiv_control {. cdecl, importc: "gsl_odeiv_control_standard_new", dynlib: libgsl.}
proc gsl_odeiv_control_y_new*(eps_abs: cdouble; eps_rel: cdouble): ptr gsl_odeiv_control {. cdecl, importc: "gsl_odeiv_control_y_new", dynlib: libgsl.}
proc gsl_odeiv_control_yp_new*(eps_abs: cdouble; eps_rel: cdouble): ptr gsl_odeiv_control {. cdecl, importc: "gsl_odeiv_control_yp_new", dynlib: libgsl.}
proc gsl_odeiv_control_scaled_new*(eps_abs: cdouble; eps_rel: cdouble; a_y: cdouble; a_dydt: cdouble; scale_abs: ptr cdouble; dim: csize_t): ptr gsl_odeiv_control {.cdecl, importc: "gsl_odeiv_control_scaled_new", dynlib: libgsl.}
proc gsl_odeiv_evolve_alloc*(dim: csize_t): ptr gsl_odeiv_evolve {.cdecl, importc: "gsl_odeiv_evolve_alloc", dynlib: libgsl.}
proc gsl_odeiv_evolve_apply*(e: ptr gsl_odeiv_evolve; con: ptr gsl_odeiv_control; step: ptr gsl_odeiv_step; dydt: ptr gsl_odeiv_system; t: ptr cdouble; t1: cdouble; h: ptr cdouble; y: ptr cdouble): cint {. cdecl, importc: "gsl_odeiv_evolve_apply", dynlib: libgsl.}
proc gsl_odeiv_evolve_reset*(e: ptr gsl_odeiv_evolve): cint {.cdecl, importc: "gsl_odeiv_evolve_reset", dynlib: libgsl.}
proc gsl_odeiv_evolve_free*(e: ptr gsl_odeiv_evolve) {.cdecl, importc: "gsl_odeiv_evolve_free", dynlib: libgsl.}

var gsl_odeiv_step_rk2* {.importc: "gsl_odeiv_step_rk2", dynlib: libgsl.}: ptr gsl_odeiv_step_type

var gsl_odeiv_step_rk4* {.importc: "gsl_odeiv_step_rk4", dynlib: libgsl.}: ptr gsl_odeiv_step_type

var gsl_odeiv_step_rkf45* {.importc: "gsl_odeiv_step_rkf45", dynlib: libgsl.}: ptr gsl_odeiv_step_type

var gsl_odeiv_step_rkck* {.importc: "gsl_odeiv_step_rkck", dynlib: libgsl.}: ptr gsl_odeiv_step_type

var gsl_odeiv_step_rk8pd* {.importc: "gsl_odeiv_step_rk8pd", dynlib: libgsl.}: ptr gsl_odeiv_step_type

var gsl_odeiv_step_rk2imp* {.importc: "gsl_odeiv_step_rk2imp", dynlib: libgsl.}: ptr gsl_odeiv_step_type

var gsl_odeiv_step_rk2simp* {.importc: "gsl_odeiv_step_rk2simp", dynlib: libgsl.}: ptr gsl_odeiv_step_type

var gsl_odeiv_step_rk4imp* {.importc: "gsl_odeiv_step_rk4imp", dynlib: libgsl.}: ptr gsl_odeiv_step_type

var gsl_odeiv_step_bsimp* {.importc: "gsl_odeiv_step_bsimp", dynlib: libgsl.}: ptr gsl_odeiv_step_type

var gsl_odeiv_step_gear1* {.importc: "gsl_odeiv_step_gear1", dynlib: libgsl.}: ptr gsl_odeiv_step_type

var gsl_odeiv_step_gear2* {.importc: "gsl_odeiv_step_gear2", dynlib: libgsl.}: ptr gsl_odeiv_step_type

