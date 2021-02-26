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
proc gsl_sf_psi_int_e*(n: cint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_psi_int_e", dynlib: libgsl.}
proc gsl_sf_psi_int*(n: cint): cdouble {.cdecl, importc: "gsl_sf_psi_int",  dynlib: libgsl.}
proc gsl_sf_psi_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_psi_e", dynlib: libgsl.}
proc gsl_sf_psi*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_psi", dynlib: libgsl.}
proc gsl_sf_psi_1piy_e*(y: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_psi_1piy_e", dynlib: libgsl.}
proc gsl_sf_psi_1piy*(y: cdouble): cdouble {.cdecl, importc: "gsl_sf_psi_1piy", dynlib: libgsl.}
proc gsl_sf_complex_psi_e*(x: cdouble; y: cdouble; result_re: ptr gsl_sf_result;  result_im: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_complex_psi_e", dynlib: libgsl.}
proc gsl_sf_psi_1_int_e*(n: cint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_psi_1_int_e", dynlib: libgsl.}
proc gsl_sf_psi_1_int*(n: cint): cdouble {.cdecl, importc: "gsl_sf_psi_1_int", dynlib: libgsl.}
proc gsl_sf_psi_1_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_psi_1_e", dynlib: libgsl.}
proc gsl_sf_psi_1*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_psi_1",   dynlib: libgsl.}
proc gsl_sf_psi_n_e*(n: cint; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_psi_n_e", dynlib: libgsl.}
proc gsl_sf_psi_n*(n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_psi_n", dynlib: libgsl.}
