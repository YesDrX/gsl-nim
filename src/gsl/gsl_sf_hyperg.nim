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
proc gsl_sf_hyperg_0F1_e*(c: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_hyperg_0F1_e", dynlib: libgsl.}
proc gsl_sf_hyperg_0F1*(c: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_hyperg_0F1", dynlib: libgsl.}
proc gsl_sf_hyperg_1F1_int_e*(m: cint; n: cint; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_hyperg_1F1_int_e", dynlib: libgsl.}
proc gsl_sf_hyperg_1F1_int*(m: cint; n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_hyperg_1F1_int", dynlib: libgsl.}
proc gsl_sf_hyperg_1F1_e*(a: cdouble; b: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_hyperg_1F1_e", dynlib: libgsl.}
proc gsl_sf_hyperg_1F1*(a: cdouble; b: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_hyperg_1F1", dynlib: libgsl.}
proc gsl_sf_hyperg_U_int_e*(m: cint; n: cint; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_hyperg_U_int_e", dynlib: libgsl.}
proc gsl_sf_hyperg_U_int*(m: cint; n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_hyperg_U_int", dynlib: libgsl.}
proc gsl_sf_hyperg_U_int_e10_e*(m: cint; n: cint; x: cdouble; result: ptr gsl_sf_result_e10): cint {.cdecl, importc: "gsl_sf_hyperg_U_int_e10_e", dynlib: libgsl.}
proc gsl_sf_hyperg_U_e*(a: cdouble; b: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_hyperg_U_e", dynlib: libgsl.}
proc gsl_sf_hyperg_U*(a: cdouble; b: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_hyperg_U", dynlib: libgsl.}
proc gsl_sf_hyperg_U_e10_e*(a: cdouble; b: cdouble; x: cdouble;   result: ptr gsl_sf_result_e10): cint {.cdecl, importc: "gsl_sf_hyperg_U_e10_e", dynlib: libgsl.}
proc gsl_sf_hyperg_2F1_e*(a: cdouble; b: cdouble; c: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_hyperg_2F1_e", dynlib: libgsl.}
proc gsl_sf_hyperg_2F1*(a: cdouble; b: cdouble; c: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_hyperg_2F1", dynlib: libgsl.}
proc gsl_sf_hyperg_2F1_conj_e*(aR: cdouble; aI: cdouble; c: cdouble; x: cdouble;   result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_hyperg_2F1_conj_e", dynlib: libgsl.}
proc gsl_sf_hyperg_2F1_conj*(aR: cdouble; aI: cdouble; c: cdouble; x: cdouble): cdouble {. cdecl, importc: "gsl_sf_hyperg_2F1_conj", dynlib: libgsl.}
proc gsl_sf_hyperg_2F1_renorm_e*(a: cdouble; b: cdouble; c: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_hyperg_2F1_renorm_e", dynlib: libgsl.}
proc gsl_sf_hyperg_2F1_renorm*(a: cdouble; b: cdouble; c: cdouble; x: cdouble): cdouble {. cdecl, importc: "gsl_sf_hyperg_2F1_renorm", dynlib: libgsl.}
proc gsl_sf_hyperg_2F1_conj_renorm_e*(aR: cdouble; aI: cdouble; c: cdouble; x: cdouble;  result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_hyperg_2F1_conj_renorm_e", dynlib: libgsl.}
proc gsl_sf_hyperg_2F1_conj_renorm*(aR: cdouble; aI: cdouble; c: cdouble; x: cdouble): cdouble {. cdecl, importc: "gsl_sf_hyperg_2F1_conj_renorm", dynlib: libgsl.}
proc gsl_sf_hyperg_2F0_e*(a: cdouble; b: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_hyperg_2F0_e", dynlib: libgsl.}
proc gsl_sf_hyperg_2F0*(a: cdouble; b: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_hyperg_2F0", dynlib: libgsl.}
