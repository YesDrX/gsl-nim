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
proc gsl_sf_erfc_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_erfc_e", dynlib: libgsl.}
proc gsl_sf_erfc*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_erfc", dynlib: libgsl.}
proc gsl_sf_log_erfc_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_log_erfc_e", dynlib: libgsl.}
proc gsl_sf_log_erfc*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_log_erfc", dynlib: libgsl.}
proc gsl_sf_erf_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_erf_e", dynlib: libgsl.}
proc gsl_sf_erf*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_erf", dynlib: libgsl.}
proc gsl_sf_erf_Z_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_erf_Z_e", dynlib: libgsl.}
proc gsl_sf_erf_Q_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_erf_Q_e", dynlib: libgsl.}
proc gsl_sf_erf_Z*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_erf_Z",   dynlib: libgsl.}
proc gsl_sf_erf_Q*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_erf_Q",   dynlib: libgsl.}
proc gsl_sf_hazard_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_hazard_e", dynlib: libgsl.}
proc gsl_sf_hazard*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_hazard", dynlib: libgsl.}
