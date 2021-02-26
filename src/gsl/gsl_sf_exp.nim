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
  gsl_sf_result_struct* {.bycopy.} = object
    val*: cdouble
    err*: cdouble

  gsl_sf_result* = gsl_sf_result_struct
  gsl_sf_result_e10_struct* {.bycopy.} = object
    val*: cdouble
    err*: cdouble
    e10*: cint

  gsl_sf_result_e10* = gsl_sf_result_e10_struct

  gsl_prec_t* = cuint

proc gsl_sf_result_smash_e*(re: ptr gsl_sf_result_e10; r: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_result_smash_e", dynlib: libgsl.}
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

var gsl_prec_eps* {.importc: "gsl_prec_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_sqrt_eps* {.importc: "gsl_prec_sqrt_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root3_eps* {.importc: "gsl_prec_root3_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root4_eps* {.importc: "gsl_prec_root4_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root5_eps* {.importc: "gsl_prec_root5_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root6_eps* {.importc: "gsl_prec_root6_eps", dynlib: libgsl.}: ptr cdouble

