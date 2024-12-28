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
proc gsl_sf_multiply_e*(x: cdouble; y: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_multiply_e", dynlib: libgsl.}
proc gsl_sf_multiply*(x: cdouble; y: cdouble): cdouble {.cdecl, importc: "gsl_sf_multiply", dynlib: libgsl.}
proc gsl_sf_multiply_err_e*(x: cdouble; dx: cdouble; y: cdouble; dy: cdouble;   result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_multiply_err_e", dynlib: libgsl.}
