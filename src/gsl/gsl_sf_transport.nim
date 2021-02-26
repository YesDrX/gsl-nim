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
proc gsl_sf_transport_2_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_transport_2_e", dynlib: libgsl.}
proc gsl_sf_transport_2*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_transport_2", dynlib: libgsl.}
proc gsl_sf_transport_3_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_transport_3_e", dynlib: libgsl.}
proc gsl_sf_transport_3*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_transport_3", dynlib: libgsl.}
proc gsl_sf_transport_4_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_transport_4_e", dynlib: libgsl.}
proc gsl_sf_transport_4*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_transport_4", dynlib: libgsl.}
proc gsl_sf_transport_5_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_transport_5_e", dynlib: libgsl.}
proc gsl_sf_transport_5*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_transport_5", dynlib: libgsl.}
