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
proc gsl_sf_laguerre_1_e*(a: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_laguerre_1_e", dynlib: libgsl.}
proc gsl_sf_laguerre_2_e*(a: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_laguerre_2_e", dynlib: libgsl.}
proc gsl_sf_laguerre_3_e*(a: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_laguerre_3_e", dynlib: libgsl.}
proc gsl_sf_laguerre_1*(a: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_laguerre_1", dynlib: libgsl.}
proc gsl_sf_laguerre_2*(a: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_laguerre_2", dynlib: libgsl.}
proc gsl_sf_laguerre_3*(a: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_laguerre_3", dynlib: libgsl.}
proc gsl_sf_laguerre_n_e*(n: cint; a: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_laguerre_n_e", dynlib: libgsl.}
proc gsl_sf_laguerre_n*(n: cint; a: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_laguerre_n", dynlib: libgsl.}
