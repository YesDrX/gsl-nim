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
proc gsl_sf_expint_E1_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_expint_E1_e", dynlib: libgsl.}
proc gsl_sf_expint_E1*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_expint_E1", dynlib: libgsl.}
proc gsl_sf_expint_E2_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_expint_E2_e", dynlib: libgsl.}
proc gsl_sf_expint_E2*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_expint_E2", dynlib: libgsl.}
proc gsl_sf_expint_En_e*(n: cint; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_expint_En_e", dynlib: libgsl.}
proc gsl_sf_expint_En*(n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_expint_En", dynlib: libgsl.}
proc gsl_sf_expint_E1_scaled_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_expint_E1_scaled_e", dynlib: libgsl.}
proc gsl_sf_expint_E1_scaled*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_expint_E1_scaled", dynlib: libgsl.}
proc gsl_sf_expint_E2_scaled_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_expint_E2_scaled_e", dynlib: libgsl.}
proc gsl_sf_expint_E2_scaled*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_expint_E2_scaled", dynlib: libgsl.}
proc gsl_sf_expint_En_scaled_e*(n: cint; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_expint_En_scaled_e", dynlib: libgsl.}
proc gsl_sf_expint_En_scaled*(n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_expint_En_scaled", dynlib: libgsl.}
proc gsl_sf_expint_Ei_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_expint_Ei_e", dynlib: libgsl.}
proc gsl_sf_expint_Ei*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_expint_Ei", dynlib: libgsl.}
proc gsl_sf_expint_Ei_scaled_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_expint_Ei_scaled_e", dynlib: libgsl.}
proc gsl_sf_expint_Ei_scaled*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_expint_Ei_scaled", dynlib: libgsl.}
proc gsl_sf_Shi_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_Shi_e", dynlib: libgsl.}
proc gsl_sf_Shi*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_Shi", dynlib: libgsl.}
proc gsl_sf_Chi_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_Chi_e", dynlib: libgsl.}
proc gsl_sf_Chi*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_Chi", dynlib: libgsl.}
proc gsl_sf_expint_3_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_expint_3_e", dynlib: libgsl.}
proc gsl_sf_expint_3*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_expint_3", dynlib: libgsl.}
proc gsl_sf_Si_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_Si_e", dynlib: libgsl.}
proc gsl_sf_Si*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_Si", dynlib: libgsl.}
proc gsl_sf_Ci_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_Ci_e", dynlib: libgsl.}
proc gsl_sf_Ci*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_Ci", dynlib: libgsl.}
proc gsl_sf_atanint_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_atanint_e", dynlib: libgsl.}
proc gsl_sf_atanint*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_atanint",  dynlib: libgsl.}
