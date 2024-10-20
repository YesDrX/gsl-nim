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
proc gsl_sf_zeta_int_e*(n: cint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_zeta_int_e", dynlib: libgsl.}
proc gsl_sf_zeta_int*(n: cint): cdouble {.cdecl, importc: "gsl_sf_zeta_int",   dynlib: libgsl.}
proc gsl_sf_zeta_e*(s: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_zeta_e", dynlib: libgsl.}
proc gsl_sf_zeta*(s: cdouble): cdouble {.cdecl, importc: "gsl_sf_zeta", dynlib: libgsl.}
proc gsl_sf_zetam1_e*(s: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_zetam1_e", dynlib: libgsl.}
proc gsl_sf_zetam1*(s: cdouble): cdouble {.cdecl, importc: "gsl_sf_zetam1", dynlib: libgsl.}
proc gsl_sf_zetam1_int_e*(s: cint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_zetam1_int_e", dynlib: libgsl.}
proc gsl_sf_zetam1_int*(s: cint): cdouble {.cdecl, importc: "gsl_sf_zetam1_int",  dynlib: libgsl.}
proc gsl_sf_hzeta_e*(s: cdouble; q: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_hzeta_e", dynlib: libgsl.}
proc gsl_sf_hzeta*(s: cdouble; q: cdouble): cdouble {.cdecl, importc: "gsl_sf_hzeta", dynlib: libgsl.}
proc gsl_sf_eta_int_e*(n: cint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_eta_int_e", dynlib: libgsl.}
proc gsl_sf_eta_int*(n: cint): cdouble {.cdecl, importc: "gsl_sf_eta_int",  dynlib: libgsl.}
proc gsl_sf_eta_e*(s: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_eta_e", dynlib: libgsl.}
proc gsl_sf_eta*(s: cdouble): cdouble {.cdecl, importc: "gsl_sf_eta", dynlib: libgsl.}
