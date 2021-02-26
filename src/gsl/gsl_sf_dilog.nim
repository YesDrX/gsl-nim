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

proc gsl_sf_result_smash_e*(re: ptr gsl_sf_result_e10; r: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_result_smash_e", dynlib: libgsl.}
proc gsl_sf_dilog_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_dilog_e", dynlib: libgsl.}
proc gsl_sf_dilog*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_dilog",   dynlib: libgsl.}
proc gsl_sf_complex_dilog_xy_e*(x: cdouble; y: cdouble; result_re: ptr gsl_sf_result; result_im: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_complex_dilog_xy_e", dynlib: libgsl.}
proc gsl_sf_complex_dilog_e*(r: cdouble; theta: cdouble; result_re: ptr gsl_sf_result; result_im: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_complex_dilog_e", dynlib: libgsl.}
proc gsl_sf_complex_spence_xy_e*(x: cdouble; y: cdouble; real_sp: ptr gsl_sf_result; imag_sp: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_complex_spence_xy_e", dynlib: libgsl.}
