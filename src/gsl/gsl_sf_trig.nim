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
proc gsl_sf_sin_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_sin_e", dynlib: libgsl.}
proc gsl_sf_sin*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_sin", dynlib: libgsl.}
proc gsl_sf_cos_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_cos_e", dynlib: libgsl.}
proc gsl_sf_cos*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_cos", dynlib: libgsl.}
proc gsl_sf_hypot_e*(x: cdouble; y: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_hypot_e", dynlib: libgsl.}
proc gsl_sf_hypot*(x: cdouble; y: cdouble): cdouble {.cdecl, importc: "gsl_sf_hypot", dynlib: libgsl.}
proc gsl_sf_complex_sin_e*(zr: cdouble; zi: cdouble; szr: ptr gsl_sf_result;  szi: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_complex_sin_e", dynlib: libgsl.}
proc gsl_sf_complex_cos_e*(zr: cdouble; zi: cdouble; czr: ptr gsl_sf_result;  czi: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_complex_cos_e", dynlib: libgsl.}
proc gsl_sf_complex_logsin_e*(zr: cdouble; zi: cdouble; lszr: ptr gsl_sf_result;  lszi: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_complex_logsin_e", dynlib: libgsl.}
proc gsl_sf_sinc_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_sinc_e", dynlib: libgsl.}
proc gsl_sf_sinc*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_sinc", dynlib: libgsl.}
proc gsl_sf_lnsinh_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_lnsinh_e", dynlib: libgsl.}
proc gsl_sf_lnsinh*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_lnsinh", dynlib: libgsl.}
proc gsl_sf_lncosh_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_lncosh_e", dynlib: libgsl.}
proc gsl_sf_lncosh*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_lncosh", dynlib: libgsl.}
proc gsl_sf_polar_to_rect*(r: cdouble; theta: cdouble; x: ptr gsl_sf_result;  y: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_polar_to_rect", dynlib: libgsl.}
proc gsl_sf_rect_to_polar*(x: cdouble; y: cdouble; r: ptr gsl_sf_result;  theta: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_rect_to_polar", dynlib: libgsl.}
proc gsl_sf_sin_err_e*(x: cdouble; dx: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_sin_err_e", dynlib: libgsl.}
proc gsl_sf_cos_err_e*(x: cdouble; dx: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_cos_err_e", dynlib: libgsl.}
proc gsl_sf_angle_restrict_symm_e*(theta: ptr cdouble): cint {.cdecl, importc: "gsl_sf_angle_restrict_symm_e", dynlib: libgsl.}
proc gsl_sf_angle_restrict_symm*(theta: cdouble): cdouble {.cdecl, importc: "gsl_sf_angle_restrict_symm", dynlib: libgsl.}
proc gsl_sf_angle_restrict_pos_e*(theta: ptr cdouble): cint {.cdecl, importc: "gsl_sf_angle_restrict_pos_e", dynlib: libgsl.}
proc gsl_sf_angle_restrict_pos*(theta: cdouble): cdouble {.cdecl, importc: "gsl_sf_angle_restrict_pos", dynlib: libgsl.}
proc gsl_sf_angle_restrict_symm_err_e*(theta: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_angle_restrict_symm_err_e", dynlib: libgsl.}
proc gsl_sf_angle_restrict_pos_err_e*(theta: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_angle_restrict_pos_err_e", dynlib: libgsl.}
