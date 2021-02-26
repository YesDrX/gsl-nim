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
proc gsl_sf_log_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_log_e", dynlib: libgsl.}
proc gsl_sf_log*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_log", dynlib: libgsl.}
proc gsl_sf_log_abs_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_log_abs_e", dynlib: libgsl.}
proc gsl_sf_log_abs*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_log_abs",  dynlib: libgsl.}
proc gsl_sf_complex_log_e*(zr: cdouble; zi: cdouble; lnr: ptr gsl_sf_result;  theta: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_complex_log_e", dynlib: libgsl.}
proc gsl_sf_log_1plusx_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_log_1plusx_e", dynlib: libgsl.}
proc gsl_sf_log_1plusx*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_log_1plusx", dynlib: libgsl.}
proc gsl_sf_log_1plusx_mx_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_log_1plusx_mx_e", dynlib: libgsl.}
proc gsl_sf_log_1plusx_mx*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_log_1plusx_mx", dynlib: libgsl.}
