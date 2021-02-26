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
proc gsl_sf_lngamma_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_lngamma_e", dynlib: libgsl.}
proc gsl_sf_lngamma*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_lngamma",  dynlib: libgsl.}
proc gsl_sf_lngamma_sgn_e*(x: cdouble; result_lg: ptr gsl_sf_result; sgn: ptr cdouble): cint {. cdecl, importc: "gsl_sf_lngamma_sgn_e", dynlib: libgsl.}
proc gsl_sf_gamma_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_gamma_e", dynlib: libgsl.}
proc gsl_sf_gamma*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_gamma",   dynlib: libgsl.}
proc gsl_sf_gammastar_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_gammastar_e", dynlib: libgsl.}
proc gsl_sf_gammastar*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_gammastar", dynlib: libgsl.}
proc gsl_sf_gammainv_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_gammainv_e", dynlib: libgsl.}
proc gsl_sf_gammainv*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_gammainv", dynlib: libgsl.}
proc gsl_sf_lngamma_complex_e*(zr: cdouble; zi: cdouble; lnr: ptr gsl_sf_result;   arg: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_lngamma_complex_e", dynlib: libgsl.}
proc gsl_sf_taylorcoeff_e*(n: cint; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_taylorcoeff_e", dynlib: libgsl.}
proc gsl_sf_taylorcoeff*(n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_taylorcoeff", dynlib: libgsl.}
proc gsl_sf_fact_e*(n: cuint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_fact_e", dynlib: libgsl.}
proc gsl_sf_fact*(n: cuint): cdouble {.cdecl, importc: "gsl_sf_fact", dynlib: libgsl.}
proc gsl_sf_doublefact_e*(n: cuint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_doublefact_e", dynlib: libgsl.}
proc gsl_sf_doublefact*(n: cuint): cdouble {.cdecl, importc: "gsl_sf_doublefact", dynlib: libgsl.}
proc gsl_sf_lnfact_e*(n: cuint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_lnfact_e", dynlib: libgsl.}
proc gsl_sf_lnfact*(n: cuint): cdouble {.cdecl, importc: "gsl_sf_lnfact",  dynlib: libgsl.}
proc gsl_sf_lndoublefact_e*(n: cuint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_lndoublefact_e", dynlib: libgsl.}
proc gsl_sf_lndoublefact*(n: cuint): cdouble {.cdecl, importc: "gsl_sf_lndoublefact", dynlib: libgsl.}
proc gsl_sf_lnchoose_e*(n: cuint; m: cuint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_lnchoose_e", dynlib: libgsl.}
proc gsl_sf_lnchoose*(n: cuint; m: cuint): cdouble {.cdecl, importc: "gsl_sf_lnchoose", dynlib: libgsl.}
proc gsl_sf_choose_e*(n: cuint; m: cuint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_choose_e", dynlib: libgsl.}
proc gsl_sf_choose*(n: cuint; m: cuint): cdouble {.cdecl, importc: "gsl_sf_choose", dynlib: libgsl.}
proc gsl_sf_lnpoch_e*(a: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_lnpoch_e", dynlib: libgsl.}
proc gsl_sf_lnpoch*(a: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_lnpoch", dynlib: libgsl.}
proc gsl_sf_lnpoch_sgn_e*(a: cdouble; x: cdouble; result: ptr gsl_sf_result; sgn: ptr cdouble): cint {.cdecl, importc: "gsl_sf_lnpoch_sgn_e", dynlib: libgsl.}
proc gsl_sf_poch_e*(a: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_poch_e", dynlib: libgsl.}
proc gsl_sf_poch*(a: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_poch", dynlib: libgsl.}
proc gsl_sf_pochrel_e*(a: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_pochrel_e", dynlib: libgsl.}
proc gsl_sf_pochrel*(a: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_pochrel", dynlib: libgsl.}
proc gsl_sf_gamma_inc_Q_e*(a: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_gamma_inc_Q_e", dynlib: libgsl.}
proc gsl_sf_gamma_inc_Q*(a: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_gamma_inc_Q", dynlib: libgsl.}
proc gsl_sf_gamma_inc_P_e*(a: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_gamma_inc_P_e", dynlib: libgsl.}
proc gsl_sf_gamma_inc_P*(a: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_gamma_inc_P", dynlib: libgsl.}
proc gsl_sf_gamma_inc_e*(a: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_gamma_inc_e", dynlib: libgsl.}
proc gsl_sf_gamma_inc*(a: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_gamma_inc", dynlib: libgsl.}
proc gsl_sf_lnbeta_e*(a: cdouble; b: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_lnbeta_e", dynlib: libgsl.}
proc gsl_sf_lnbeta*(a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_sf_lnbeta", dynlib: libgsl.}
proc gsl_sf_lnbeta_sgn_e*(x: cdouble; y: cdouble; result: ptr gsl_sf_result; sgn: ptr cdouble): cint {.cdecl, importc: "gsl_sf_lnbeta_sgn_e", dynlib: libgsl.}
proc gsl_sf_beta_e*(a: cdouble; b: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_beta_e", dynlib: libgsl.}
proc gsl_sf_beta*(a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_sf_beta", dynlib: libgsl.}
proc gsl_sf_beta_inc_e*(a: cdouble; b: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_beta_inc_e", dynlib: libgsl.}
proc gsl_sf_beta_inc*(a: cdouble; b: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_beta_inc", dynlib: libgsl.}
