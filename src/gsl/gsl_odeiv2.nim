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
  gsl_odeiv2_system* {.bycopy.} = object
    function*: proc (t: cdouble; y: ptr cdouble; dydt: ptr cdouble; params: pointer): cint {.     cdecl.}
    jacobian*: proc (t: cdouble; y: ptr cdouble; dfdy: ptr cdouble; dfdt: ptr cdouble;  params: pointer): cint {.cdecl.}
    dimension*: csize_t
    params*: pointer

  gsl_odeiv2_step* = gsl_odeiv2_step_struct
  gsl_odeiv2_control* = gsl_odeiv2_control_struct
  gsl_odeiv2_evolve* = gsl_odeiv2_evolve_struct
  gsl_odeiv2_driver* = gsl_odeiv2_driver_struct
  gsl_odeiv2_step_type* {.bycopy.} = object
    name*: cstring
    can_use_dydt_in*: cint
    gives_exact_dydt_out*: cint
    alloc*: proc (dim: csize_t): pointer {.cdecl.}
    apply*: proc (state: pointer; dim: csize_t; t: cdouble; h: cdouble; y: ptr cdouble; yerr: ptr cdouble; dydt_in: ptr cdouble; dydt_out: ptr cdouble; dydt: ptr gsl_odeiv2_system): cint {.cdecl.}
    set_driver*: proc (state: pointer; d: ptr gsl_odeiv2_driver): cint {.cdecl.}
    reset*: proc (state: pointer; dim: csize_t): cint {.cdecl.}
    order*: proc (state: pointer): cuint {.cdecl.}
    free*: proc (state: pointer) {.cdecl.}

  gsl_odeiv2_step_struct* {.bycopy.} = object
    `type`*: ptr gsl_odeiv2_step_type
    dimension*: csize_t
    state*: pointer

  gsl_odeiv2_control_type* {.bycopy.} = object
    name*: cstring
    alloc*: proc (): pointer {.cdecl.}
    init*: proc (state: pointer; eps_abs: cdouble; eps_rel: cdouble; a_y: cdouble; a_dydt: cdouble): cint {.cdecl.}
    hadjust*: proc (state: pointer; dim: csize_t; ord: cuint; y: ptr cdouble; yerr: ptr cdouble; yp: ptr cdouble; h: ptr cdouble): cint {.cdecl.}
    errlevel*: proc (state: pointer; y: cdouble; dydt: cdouble; h: cdouble; ind: csize_t;  errlev: ptr cdouble): cint {.cdecl.}
    set_driver*: proc (state: pointer; d: ptr gsl_odeiv2_driver): cint {.cdecl.}
    free*: proc (state: pointer) {.cdecl.}

  gsl_odeiv2_control_struct* {.bycopy.} = object
    `type`*: ptr gsl_odeiv2_control_type
    state*: pointer

  gsl_odeiv2_evolve_struct* {.bycopy.} = object
    dimension*: csize_t
    y0*: ptr cdouble
    yerr*: ptr cdouble
    dydt_in*: ptr cdouble
    dydt_out*: ptr cdouble
    last_step*: cdouble
    count*: culong
    failed_steps*: culong
    driver*: ptr gsl_odeiv2_driver

  gsl_odeiv2_driver_struct* {.bycopy.} = object
    sys*: ptr gsl_odeiv2_system
    s*: ptr gsl_odeiv2_step
    c*: ptr gsl_odeiv2_control
    e*: ptr gsl_odeiv2_evolve
    h*: cdouble
    hmin*: cdouble
    hmax*: cdouble
    n*: culong
    nmax*: culong

proc gsl_odeiv2_step_alloc*(T: ptr gsl_odeiv2_step_type; dim: csize_t): ptr gsl_odeiv2_step {. cdecl, importc: "gsl_odeiv2_step_alloc", dynlib: libgsl.}
proc gsl_odeiv2_step_reset*(s: ptr gsl_odeiv2_step): cint {.cdecl, importc: "gsl_odeiv2_step_reset", dynlib: libgsl.}
proc gsl_odeiv2_step_free*(s: ptr gsl_odeiv2_step) {.cdecl, importc: "gsl_odeiv2_step_free", dynlib: libgsl.}
proc gsl_odeiv2_step_name*(s: ptr gsl_odeiv2_step): cstring {.cdecl, importc: "gsl_odeiv2_step_name", dynlib: libgsl.}
proc gsl_odeiv2_step_order*(s: ptr gsl_odeiv2_step): cuint {.cdecl, importc: "gsl_odeiv2_step_order", dynlib: libgsl.}
proc gsl_odeiv2_step_apply*(s: ptr gsl_odeiv2_step; t: cdouble; h: cdouble;   y: ptr cdouble; yerr: ptr cdouble; dydt_in: ptr cdouble;   dydt_out: ptr cdouble; dydt: ptr gsl_odeiv2_system): cint {. cdecl, importc: "gsl_odeiv2_step_apply", dynlib: libgsl.}
proc gsl_odeiv2_step_set_driver*(s: ptr gsl_odeiv2_step; d: ptr gsl_odeiv2_driver): cint {. cdecl, importc: "gsl_odeiv2_step_set_driver", dynlib: libgsl.}
proc gsl_odeiv2_control_alloc*(T: ptr gsl_odeiv2_control_type): ptr gsl_odeiv2_control {. cdecl, importc: "gsl_odeiv2_control_alloc", dynlib: libgsl.}
proc gsl_odeiv2_control_init*(c: ptr gsl_odeiv2_control; eps_abs: cdouble;  eps_rel: cdouble; a_y: cdouble; a_dydt: cdouble): cint {. cdecl, importc: "gsl_odeiv2_control_init", dynlib: libgsl.}
proc gsl_odeiv2_control_free*(c: ptr gsl_odeiv2_control) {.cdecl, importc: "gsl_odeiv2_control_free", dynlib: libgsl.}
proc gsl_odeiv2_control_hadjust*(c: ptr gsl_odeiv2_control; s: ptr gsl_odeiv2_step; y: ptr cdouble; yerr: ptr cdouble; dydt: ptr cdouble; h: ptr cdouble): cint {.cdecl, importc: "gsl_odeiv2_control_hadjust", dynlib: libgsl.}
proc gsl_odeiv2_control_name*(c: ptr gsl_odeiv2_control): cstring {.cdecl, importc: "gsl_odeiv2_control_name", dynlib: libgsl.}
proc gsl_odeiv2_control_errlevel*(c: ptr gsl_odeiv2_control; y: cdouble; dydt: cdouble; h: cdouble; ind: csize_t; errlev: ptr cdouble): cint {.cdecl, importc: "gsl_odeiv2_control_errlevel", dynlib: libgsl.}
proc gsl_odeiv2_control_set_driver*(c: ptr gsl_odeiv2_control;  d: ptr gsl_odeiv2_driver): cint {.cdecl, importc: "gsl_odeiv2_control_set_driver", dynlib: libgsl.}
proc gsl_odeiv2_control_standard_new*(eps_abs: cdouble; eps_rel: cdouble;  a_y: cdouble; a_dydt: cdouble): ptr gsl_odeiv2_control {. cdecl, importc: "gsl_odeiv2_control_standard_new", dynlib: libgsl.}
proc gsl_odeiv2_control_y_new*(eps_abs: cdouble; eps_rel: cdouble): ptr gsl_odeiv2_control {. cdecl, importc: "gsl_odeiv2_control_y_new", dynlib: libgsl.}
proc gsl_odeiv2_control_yp_new*(eps_abs: cdouble; eps_rel: cdouble): ptr gsl_odeiv2_control {. cdecl, importc: "gsl_odeiv2_control_yp_new", dynlib: libgsl.}
proc gsl_odeiv2_control_scaled_new*(eps_abs: cdouble; eps_rel: cdouble; a_y: cdouble;  a_dydt: cdouble; scale_abs: ptr cdouble;  dim: csize_t): ptr gsl_odeiv2_control {.cdecl, importc: "gsl_odeiv2_control_scaled_new", dynlib: libgsl.}
proc gsl_odeiv2_evolve_alloc*(dim: csize_t): ptr gsl_odeiv2_evolve {.cdecl, importc: "gsl_odeiv2_evolve_alloc", dynlib: libgsl.}
proc gsl_odeiv2_evolve_apply*(e: ptr gsl_odeiv2_evolve; con: ptr gsl_odeiv2_control;  step: ptr gsl_odeiv2_step;  dydt: ptr gsl_odeiv2_system; t: ptr cdouble; t1: cdouble;  h: ptr cdouble; y: ptr cdouble): cint {.cdecl, importc: "gsl_odeiv2_evolve_apply", dynlib: libgsl.}
proc gsl_odeiv2_evolve_apply_fixed_step*(e: ptr gsl_odeiv2_evolve; con: ptr gsl_odeiv2_control; step: ptr gsl_odeiv2_step; dydt: ptr gsl_odeiv2_system; t: ptr cdouble; h0: cdouble; y: ptr cdouble): cint {. cdecl, importc: "gsl_odeiv2_evolve_apply_fixed_step", dynlib: libgsl.}
proc gsl_odeiv2_evolve_reset*(e: ptr gsl_odeiv2_evolve): cint {.cdecl, importc: "gsl_odeiv2_evolve_reset", dynlib: libgsl.}
proc gsl_odeiv2_evolve_free*(e: ptr gsl_odeiv2_evolve) {.cdecl, importc: "gsl_odeiv2_evolve_free", dynlib: libgsl.}
proc gsl_odeiv2_evolve_set_driver*(e: ptr gsl_odeiv2_evolve; d: ptr gsl_odeiv2_driver): cint {.cdecl, importc: "gsl_odeiv2_evolve_set_driver", dynlib: libgsl.}
proc gsl_odeiv2_driver_alloc_y_new*(sys: ptr gsl_odeiv2_system;  T: ptr gsl_odeiv2_step_type; hstart: cdouble;  epsabs: cdouble; epsrel: cdouble): ptr gsl_odeiv2_driver {. cdecl, importc: "gsl_odeiv2_driver_alloc_y_new", dynlib: libgsl.}
proc gsl_odeiv2_driver_alloc_yp_new*(sys: ptr gsl_odeiv2_system; T: ptr gsl_odeiv2_step_type; hstart: cdouble; epsabs: cdouble; epsrel: cdouble): ptr gsl_odeiv2_driver {. cdecl, importc: "gsl_odeiv2_driver_alloc_yp_new", dynlib: libgsl.}
proc gsl_odeiv2_driver_alloc_scaled_new*(sys: ptr gsl_odeiv2_system; T: ptr gsl_odeiv2_step_type; hstart: cdouble; epsabs: cdouble; epsrel: cdouble; a_y: cdouble; a_dydt: cdouble; scale_abs: ptr cdouble): ptr gsl_odeiv2_driver {. cdecl, importc: "gsl_odeiv2_driver_alloc_scaled_new", dynlib: libgsl.}
proc gsl_odeiv2_driver_alloc_standard_new*(sys: ptr gsl_odeiv2_system; T: ptr gsl_odeiv2_step_type; hstart: cdouble; epsabs: cdouble; epsrel: cdouble; a_y: cdouble; a_dydt: cdouble): ptr gsl_odeiv2_driver {.cdecl, importc: "gsl_odeiv2_driver_alloc_standard_new", dynlib: libgsl.}
proc gsl_odeiv2_driver_set_hmin*(d: ptr gsl_odeiv2_driver; hmin: cdouble): cint {. cdecl, importc: "gsl_odeiv2_driver_set_hmin", dynlib: libgsl.}
proc gsl_odeiv2_driver_set_hmax*(d: ptr gsl_odeiv2_driver; hmax: cdouble): cint {. cdecl, importc: "gsl_odeiv2_driver_set_hmax", dynlib: libgsl.}
proc gsl_odeiv2_driver_set_nmax*(d: ptr gsl_odeiv2_driver; nmax: culong): cint {.cdecl, importc: "gsl_odeiv2_driver_set_nmax", dynlib: libgsl.}
proc gsl_odeiv2_driver_apply*(d: ptr gsl_odeiv2_driver; t: ptr cdouble; t1: cdouble;  y: ptr cdouble): cint {.cdecl, importc: "gsl_odeiv2_driver_apply", dynlib: libgsl.}
proc gsl_odeiv2_driver_apply_fixed_step*(d: ptr gsl_odeiv2_driver; t: ptr cdouble; h: cdouble; n: culong; y: ptr cdouble): cint {. cdecl, importc: "gsl_odeiv2_driver_apply_fixed_step", dynlib: libgsl.}
proc gsl_odeiv2_driver_reset*(d: ptr gsl_odeiv2_driver): cint {.cdecl, importc: "gsl_odeiv2_driver_reset", dynlib: libgsl.}
proc gsl_odeiv2_driver_reset_hstart*(d: ptr gsl_odeiv2_driver; hstart: cdouble): cint {. cdecl, importc: "gsl_odeiv2_driver_reset_hstart", dynlib: libgsl.}
proc gsl_odeiv2_driver_free*(state: ptr gsl_odeiv2_driver) {.cdecl, importc: "gsl_odeiv2_driver_free", dynlib: libgsl.}

var gsl_odeiv2_step_rk2* {.importc: "gsl_odeiv2_step_rk2", dynlib: libgsl.}: ptr gsl_odeiv2_step_type

var gsl_odeiv2_step_rk4* {.importc: "gsl_odeiv2_step_rk4", dynlib: libgsl.}: ptr gsl_odeiv2_step_type

var gsl_odeiv2_step_rkf45* {.importc: "gsl_odeiv2_step_rkf45", dynlib: libgsl.}: ptr gsl_odeiv2_step_type

var gsl_odeiv2_step_rkck* {.importc: "gsl_odeiv2_step_rkck", dynlib: libgsl.}: ptr gsl_odeiv2_step_type

var gsl_odeiv2_step_rk8pd* {.importc: "gsl_odeiv2_step_rk8pd", dynlib: libgsl.}: ptr gsl_odeiv2_step_type

var gsl_odeiv2_step_rk2imp* {.importc: "gsl_odeiv2_step_rk2imp", dynlib: libgsl.}: ptr gsl_odeiv2_step_type

var gsl_odeiv2_step_rk4imp* {.importc: "gsl_odeiv2_step_rk4imp", dynlib: libgsl.}: ptr gsl_odeiv2_step_type

var gsl_odeiv2_step_bsimp* {.importc: "gsl_odeiv2_step_bsimp", dynlib: libgsl.}: ptr gsl_odeiv2_step_type

var gsl_odeiv2_step_rk1imp* {.importc: "gsl_odeiv2_step_rk1imp", dynlib: libgsl.}: ptr gsl_odeiv2_step_type

var gsl_odeiv2_step_msadams* {.importc: "gsl_odeiv2_step_msadams", dynlib: libgsl.}: ptr gsl_odeiv2_step_type

var gsl_odeiv2_step_msbdf* {.importc: "gsl_odeiv2_step_msbdf", dynlib: libgsl.}: ptr gsl_odeiv2_step_type

