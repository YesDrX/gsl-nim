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
  gsl_mode_t* = cuint
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
proc gsl_sf_ellint_Kcomp_e*(k: cdouble; mode: gsl_mode_t; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_ellint_Kcomp_e", dynlib: libgsl.}
proc gsl_sf_ellint_Kcomp*(k: cdouble; mode: gsl_mode_t): cdouble {.cdecl, importc: "gsl_sf_ellint_Kcomp", dynlib: libgsl.}
proc gsl_sf_ellint_Ecomp_e*(k: cdouble; mode: gsl_mode_t; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_ellint_Ecomp_e", dynlib: libgsl.}
proc gsl_sf_ellint_Ecomp*(k: cdouble; mode: gsl_mode_t): cdouble {.cdecl, importc: "gsl_sf_ellint_Ecomp", dynlib: libgsl.}
proc gsl_sf_ellint_Pcomp_e*(k: cdouble; n: cdouble; mode: gsl_mode_t;   result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_ellint_Pcomp_e", dynlib: libgsl.}
proc gsl_sf_ellint_Pcomp*(k: cdouble; n: cdouble; mode: gsl_mode_t): cdouble {.cdecl, importc: "gsl_sf_ellint_Pcomp", dynlib: libgsl.}
proc gsl_sf_ellint_Dcomp_e*(k: cdouble; mode: gsl_mode_t; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_ellint_Dcomp_e", dynlib: libgsl.}
proc gsl_sf_ellint_Dcomp*(k: cdouble; mode: gsl_mode_t): cdouble {.cdecl, importc: "gsl_sf_ellint_Dcomp", dynlib: libgsl.}
proc gsl_sf_ellint_F_e*(phi: cdouble; k: cdouble; mode: gsl_mode_t;   result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_ellint_F_e", dynlib: libgsl.}
proc gsl_sf_ellint_F*(phi: cdouble; k: cdouble; mode: gsl_mode_t): cdouble {.cdecl, importc: "gsl_sf_ellint_F", dynlib: libgsl.}
proc gsl_sf_ellint_E_e*(phi: cdouble; k: cdouble; mode: gsl_mode_t;   result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_ellint_E_e", dynlib: libgsl.}
proc gsl_sf_ellint_E*(phi: cdouble; k: cdouble; mode: gsl_mode_t): cdouble {.cdecl, importc: "gsl_sf_ellint_E", dynlib: libgsl.}
proc gsl_sf_ellint_P_e*(phi: cdouble; k: cdouble; n: cdouble; mode: gsl_mode_t;   result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_ellint_P_e", dynlib: libgsl.}
proc gsl_sf_ellint_P*(phi: cdouble; k: cdouble; n: cdouble; mode: gsl_mode_t): cdouble {. cdecl, importc: "gsl_sf_ellint_P", dynlib: libgsl.}
proc gsl_sf_ellint_D_e*(phi: cdouble; k: cdouble; mode: gsl_mode_t;   result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_ellint_D_e", dynlib: libgsl.}
proc gsl_sf_ellint_D*(phi: cdouble; k: cdouble; mode: gsl_mode_t): cdouble {.cdecl, importc: "gsl_sf_ellint_D", dynlib: libgsl.}
proc gsl_sf_ellint_RC_e*(x: cdouble; y: cdouble; mode: gsl_mode_t;    result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_ellint_RC_e", dynlib: libgsl.}
proc gsl_sf_ellint_RC*(x: cdouble; y: cdouble; mode: gsl_mode_t): cdouble {.cdecl, importc: "gsl_sf_ellint_RC", dynlib: libgsl.}
proc gsl_sf_ellint_RD_e*(x: cdouble; y: cdouble; z: cdouble; mode: gsl_mode_t;    result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_ellint_RD_e", dynlib: libgsl.}
proc gsl_sf_ellint_RD*(x: cdouble; y: cdouble; z: cdouble; mode: gsl_mode_t): cdouble {. cdecl, importc: "gsl_sf_ellint_RD", dynlib: libgsl.}
proc gsl_sf_ellint_RF_e*(x: cdouble; y: cdouble; z: cdouble; mode: gsl_mode_t;    result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_ellint_RF_e", dynlib: libgsl.}
proc gsl_sf_ellint_RF*(x: cdouble; y: cdouble; z: cdouble; mode: gsl_mode_t): cdouble {. cdecl, importc: "gsl_sf_ellint_RF", dynlib: libgsl.}
proc gsl_sf_ellint_RJ_e*(x: cdouble; y: cdouble; z: cdouble; p: cdouble;    mode: gsl_mode_t; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_ellint_RJ_e", dynlib: libgsl.}
proc gsl_sf_ellint_RJ*(x: cdouble; y: cdouble; z: cdouble; p: cdouble; mode: gsl_mode_t): cdouble {. cdecl, importc: "gsl_sf_ellint_RJ", dynlib: libgsl.}
