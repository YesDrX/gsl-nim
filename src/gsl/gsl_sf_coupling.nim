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
proc gsl_sf_coupling_3j_e*(two_ja: cint; two_jb: cint; two_jc: cint; two_ma: cint;  two_mb: cint; two_mc: cint; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_coupling_3j_e", dynlib: libgsl.}
proc gsl_sf_coupling_3j*(two_ja: cint; two_jb: cint; two_jc: cint; two_ma: cint;    two_mb: cint; two_mc: cint): cdouble {.cdecl, importc: "gsl_sf_coupling_3j", dynlib: libgsl.}
proc gsl_sf_coupling_6j_e*(two_ja: cint; two_jb: cint; two_jc: cint; two_jd: cint;  two_je: cint; two_jf: cint; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_coupling_6j_e", dynlib: libgsl.}
proc gsl_sf_coupling_6j*(two_ja: cint; two_jb: cint; two_jc: cint; two_jd: cint;    two_je: cint; two_jf: cint): cdouble {.cdecl, importc: "gsl_sf_coupling_6j", dynlib: libgsl.}
proc gsl_sf_coupling_RacahW_e*(two_ja: cint; two_jb: cint; two_jc: cint; two_jd: cint;   two_je: cint; two_jf: cint; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_coupling_RacahW_e", dynlib: libgsl.}
proc gsl_sf_coupling_RacahW*(two_ja: cint; two_jb: cint; two_jc: cint; two_jd: cint; two_je: cint; two_jf: cint): cdouble {.cdecl, importc: "gsl_sf_coupling_RacahW", dynlib: libgsl.}
proc gsl_sf_coupling_9j_e*(two_ja: cint; two_jb: cint; two_jc: cint; two_jd: cint;  two_je: cint; two_jf: cint; two_jg: cint; two_jh: cint;  two_ji: cint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_coupling_9j_e", dynlib: libgsl.}
proc gsl_sf_coupling_9j*(two_ja: cint; two_jb: cint; two_jc: cint; two_jd: cint;    two_je: cint; two_jf: cint; two_jg: cint; two_jh: cint;    two_ji: cint): cdouble {.cdecl, importc: "gsl_sf_coupling_9j", dynlib: libgsl.}
proc gsl_sf_coupling_6j_INCORRECT_e*(two_ja: cint; two_jb: cint; two_jc: cint; two_jd: cint; two_je: cint; two_jf: cint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_coupling_6j_INCORRECT_e", dynlib: libgsl.}
proc gsl_sf_coupling_6j_INCORRECT*(two_ja: cint; two_jb: cint; two_jc: cint; two_jd: cint; two_je: cint; two_jf: cint): cdouble {. cdecl, importc: "gsl_sf_coupling_6j_INCORRECT", dynlib: libgsl.}
