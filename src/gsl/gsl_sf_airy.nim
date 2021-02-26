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
proc gsl_sf_airy_Ai_e*(x: cdouble; mode: gsl_mode_t; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_airy_Ai_e", dynlib: libgsl.}
proc gsl_sf_airy_Ai*(x: cdouble; mode: gsl_mode_t): cdouble {.cdecl, importc: "gsl_sf_airy_Ai", dynlib: libgsl.}
proc gsl_sf_airy_Bi_e*(x: cdouble; mode: gsl_mode_t; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_airy_Bi_e", dynlib: libgsl.}
proc gsl_sf_airy_Bi*(x: cdouble; mode: gsl_mode_t): cdouble {.cdecl, importc: "gsl_sf_airy_Bi", dynlib: libgsl.}
proc gsl_sf_airy_Ai_scaled_e*(x: cdouble; mode: gsl_mode_t; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_airy_Ai_scaled_e", dynlib: libgsl.}
proc gsl_sf_airy_Ai_scaled*(x: cdouble; mode: gsl_mode_t): cdouble {.cdecl, importc: "gsl_sf_airy_Ai_scaled", dynlib: libgsl.}
proc gsl_sf_airy_Bi_scaled_e*(x: cdouble; mode: gsl_mode_t; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_airy_Bi_scaled_e", dynlib: libgsl.}
proc gsl_sf_airy_Bi_scaled*(x: cdouble; mode: gsl_mode_t): cdouble {.cdecl, importc: "gsl_sf_airy_Bi_scaled", dynlib: libgsl.}
proc gsl_sf_airy_Ai_deriv_e*(x: cdouble; mode: gsl_mode_t; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_airy_Ai_deriv_e", dynlib: libgsl.}
proc gsl_sf_airy_Ai_deriv*(x: cdouble; mode: gsl_mode_t): cdouble {.cdecl, importc: "gsl_sf_airy_Ai_deriv", dynlib: libgsl.}
proc gsl_sf_airy_Bi_deriv_e*(x: cdouble; mode: gsl_mode_t; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_airy_Bi_deriv_e", dynlib: libgsl.}
proc gsl_sf_airy_Bi_deriv*(x: cdouble; mode: gsl_mode_t): cdouble {.cdecl, importc: "gsl_sf_airy_Bi_deriv", dynlib: libgsl.}
proc gsl_sf_airy_Ai_deriv_scaled_e*(x: cdouble; mode: gsl_mode_t;  result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_airy_Ai_deriv_scaled_e", dynlib: libgsl.}
proc gsl_sf_airy_Ai_deriv_scaled*(x: cdouble; mode: gsl_mode_t): cdouble {.cdecl, importc: "gsl_sf_airy_Ai_deriv_scaled", dynlib: libgsl.}
proc gsl_sf_airy_Bi_deriv_scaled_e*(x: cdouble; mode: gsl_mode_t;  result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_airy_Bi_deriv_scaled_e", dynlib: libgsl.}
proc gsl_sf_airy_Bi_deriv_scaled*(x: cdouble; mode: gsl_mode_t): cdouble {.cdecl, importc: "gsl_sf_airy_Bi_deriv_scaled", dynlib: libgsl.}
proc gsl_sf_airy_zero_Ai_e*(s: cuint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_airy_zero_Ai_e", dynlib: libgsl.}
proc gsl_sf_airy_zero_Ai*(s: cuint): cdouble {.cdecl, importc: "gsl_sf_airy_zero_Ai", dynlib: libgsl.}
proc gsl_sf_airy_zero_Bi_e*(s: cuint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_airy_zero_Bi_e", dynlib: libgsl.}
proc gsl_sf_airy_zero_Bi*(s: cuint): cdouble {.cdecl, importc: "gsl_sf_airy_zero_Bi", dynlib: libgsl.}
proc gsl_sf_airy_zero_Ai_deriv_e*(s: cuint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_airy_zero_Ai_deriv_e", dynlib: libgsl.}
proc gsl_sf_airy_zero_Ai_deriv*(s: cuint): cdouble {.cdecl, importc: "gsl_sf_airy_zero_Ai_deriv", dynlib: libgsl.}
proc gsl_sf_airy_zero_Bi_deriv_e*(s: cuint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_airy_zero_Bi_deriv_e", dynlib: libgsl.}
proc gsl_sf_airy_zero_Bi_deriv*(s: cuint): cdouble {.cdecl, importc: "gsl_sf_airy_zero_Bi_deriv", dynlib: libgsl.}
