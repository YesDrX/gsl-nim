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
proc gsl_sf_hydrogenicR_1_e*(Z: cdouble; r: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_hydrogenicR_1_e", dynlib: libgsl.}
proc gsl_sf_hydrogenicR_1*(Z: cdouble; r: cdouble): cdouble {.cdecl, importc: "gsl_sf_hydrogenicR_1", dynlib: libgsl.}
proc gsl_sf_hydrogenicR_e*(n: cint; l: cint; Z: cdouble; r: cdouble;  result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_hydrogenicR_e", dynlib: libgsl.}
proc gsl_sf_hydrogenicR*(n: cint; l: cint; Z: cdouble; r: cdouble): cdouble {.cdecl, importc: "gsl_sf_hydrogenicR", dynlib: libgsl.}
proc gsl_sf_coulomb_wave_FG_e*(eta: cdouble; x: cdouble; lam_F: cdouble; k_lam_G: cint;   F: ptr gsl_sf_result; Fp: ptr gsl_sf_result;   G: ptr gsl_sf_result; Gp: ptr gsl_sf_result;   exp_F: ptr cdouble; exp_G: ptr cdouble): cint {.cdecl, importc: "gsl_sf_coulomb_wave_FG_e", dynlib: libgsl.}
proc gsl_sf_coulomb_wave_F_array*(lam_min: cdouble; kmax: cint; eta: cdouble; x: cdouble; fc_array: ptr cdouble; F_exponent: ptr cdouble): cint {.cdecl, importc: "gsl_sf_coulomb_wave_F_array", dynlib: libgsl.}
proc gsl_sf_coulomb_wave_FG_array*(lam_min: cdouble; kmax: cint; eta: cdouble; x: cdouble; fc_array: ptr cdouble; gc_array: ptr cdouble; F_exponent: ptr cdouble; G_exponent: ptr cdouble): cint {.cdecl, importc: "gsl_sf_coulomb_wave_FG_array", dynlib: libgsl.}
proc gsl_sf_coulomb_wave_FGp_array*(lam_min: cdouble; kmax: cint; eta: cdouble;  x: cdouble; fc_array: ptr cdouble;  fcp_array: ptr cdouble; gc_array: ptr cdouble;  gcp_array: ptr cdouble; F_exponent: ptr cdouble;  G_exponent: ptr cdouble): cint {.cdecl, importc: "gsl_sf_coulomb_wave_FGp_array", dynlib: libgsl.}
proc gsl_sf_coulomb_wave_sphF_array*(lam_min: cdouble; kmax: cint; eta: cdouble; x: cdouble; fc_array: ptr cdouble; F_exponent: ptr cdouble): cint {.cdecl, importc: "gsl_sf_coulomb_wave_sphF_array", dynlib: libgsl.}
proc gsl_sf_coulomb_CL_e*(L: cdouble; eta: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_coulomb_CL_e", dynlib: libgsl.}
proc gsl_sf_coulomb_CL_array*(Lmin: cdouble; kmax: cint; eta: cdouble; cl: ptr cdouble): cint {. cdecl, importc: "gsl_sf_coulomb_CL_array", dynlib: libgsl.}
