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
proc gsl_sf_gegenpoly_1_e*(lambda: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_gegenpoly_1_e", dynlib: libgsl.}
proc gsl_sf_gegenpoly_2_e*(lambda: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_gegenpoly_2_e", dynlib: libgsl.}
proc gsl_sf_gegenpoly_3_e*(lambda: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_gegenpoly_3_e", dynlib: libgsl.}
proc gsl_sf_gegenpoly_1*(lambda: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_gegenpoly_1", dynlib: libgsl.}
proc gsl_sf_gegenpoly_2*(lambda: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_gegenpoly_2", dynlib: libgsl.}
proc gsl_sf_gegenpoly_3*(lambda: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_gegenpoly_3", dynlib: libgsl.}
proc gsl_sf_gegenpoly_n_e*(n: cint; lambda: cdouble; x: cdouble;  result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_gegenpoly_n_e", dynlib: libgsl.}
proc gsl_sf_gegenpoly_n*(n: cint; lambda: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_gegenpoly_n", dynlib: libgsl.}
proc gsl_sf_gegenpoly_array*(nmax: cint; lambda: cdouble; x: cdouble; result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_gegenpoly_array", dynlib: libgsl.}
