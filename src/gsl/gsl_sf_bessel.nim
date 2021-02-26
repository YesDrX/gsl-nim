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
  gsl_prec_t* = cuint

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
proc gsl_sf_bessel_J0_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_J0_e", dynlib: libgsl.}
proc gsl_sf_bessel_J0*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_J0", dynlib: libgsl.}
proc gsl_sf_bessel_J1_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_J1_e", dynlib: libgsl.}
proc gsl_sf_bessel_J1*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_J1", dynlib: libgsl.}
proc gsl_sf_bessel_Jn_e*(n: cint; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_Jn_e", dynlib: libgsl.}
proc gsl_sf_bessel_Jn*(n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_Jn", dynlib: libgsl.}
proc gsl_sf_bessel_Jn_array*(nmin: cint; nmax: cint; x: cdouble; result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_bessel_Jn_array", dynlib: libgsl.}
proc gsl_sf_bessel_Y0_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_Y0_e", dynlib: libgsl.}
proc gsl_sf_bessel_Y0*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_Y0", dynlib: libgsl.}
proc gsl_sf_bessel_Y1_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_Y1_e", dynlib: libgsl.}
proc gsl_sf_bessel_Y1*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_Y1", dynlib: libgsl.}
proc gsl_sf_bessel_Yn_e*(n: cint; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_Yn_e", dynlib: libgsl.}
proc gsl_sf_bessel_Yn*(n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_Yn", dynlib: libgsl.}
proc gsl_sf_bessel_Yn_array*(nmin: cint; nmax: cint; x: cdouble; result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_bessel_Yn_array", dynlib: libgsl.}
proc gsl_sf_bessel_I0_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_I0_e", dynlib: libgsl.}
proc gsl_sf_bessel_I0*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_I0", dynlib: libgsl.}
proc gsl_sf_bessel_I1_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_I1_e", dynlib: libgsl.}
proc gsl_sf_bessel_I1*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_I1", dynlib: libgsl.}
proc gsl_sf_bessel_In_e*(n: cint; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_In_e", dynlib: libgsl.}
proc gsl_sf_bessel_In*(n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_In", dynlib: libgsl.}
proc gsl_sf_bessel_In_array*(nmin: cint; nmax: cint; x: cdouble; result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_bessel_In_array", dynlib: libgsl.}
proc gsl_sf_bessel_I0_scaled_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_I0_scaled_e", dynlib: libgsl.}
proc gsl_sf_bessel_I0_scaled*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_I0_scaled", dynlib: libgsl.}
proc gsl_sf_bessel_I1_scaled_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_I1_scaled_e", dynlib: libgsl.}
proc gsl_sf_bessel_I1_scaled*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_I1_scaled", dynlib: libgsl.}
proc gsl_sf_bessel_In_scaled_e*(n: cint; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_bessel_In_scaled_e", dynlib: libgsl.}
proc gsl_sf_bessel_In_scaled*(n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_In_scaled", dynlib: libgsl.}
proc gsl_sf_bessel_In_scaled_array*(nmin: cint; nmax: cint; x: cdouble;  result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_bessel_In_scaled_array", dynlib: libgsl.}
proc gsl_sf_bessel_K0_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_K0_e", dynlib: libgsl.}
proc gsl_sf_bessel_K0*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_K0", dynlib: libgsl.}
proc gsl_sf_bessel_K1_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_K1_e", dynlib: libgsl.}
proc gsl_sf_bessel_K1*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_K1", dynlib: libgsl.}
proc gsl_sf_bessel_Kn_e*(n: cint; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_Kn_e", dynlib: libgsl.}
proc gsl_sf_bessel_Kn*(n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_Kn", dynlib: libgsl.}
proc gsl_sf_bessel_Kn_array*(nmin: cint; nmax: cint; x: cdouble; result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_bessel_Kn_array", dynlib: libgsl.}
proc gsl_sf_bessel_K0_scaled_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_K0_scaled_e", dynlib: libgsl.}
proc gsl_sf_bessel_K0_scaled*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_K0_scaled", dynlib: libgsl.}
proc gsl_sf_bessel_K1_scaled_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_K1_scaled_e", dynlib: libgsl.}
proc gsl_sf_bessel_K1_scaled*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_K1_scaled", dynlib: libgsl.}
proc gsl_sf_bessel_Kn_scaled_e*(n: cint; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_bessel_Kn_scaled_e", dynlib: libgsl.}
proc gsl_sf_bessel_Kn_scaled*(n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_Kn_scaled", dynlib: libgsl.}
proc gsl_sf_bessel_Kn_scaled_array*(nmin: cint; nmax: cint; x: cdouble;  result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_bessel_Kn_scaled_array", dynlib: libgsl.}
# proc gsl_sf_bessel_j0_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_j0_e", dynlib: libgsl.}
# proc gsl_sf_bessel_j0*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_j0", dynlib: libgsl.}
# proc gsl_sf_bessel_j1_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_j1_e", dynlib: libgsl.}
# proc gsl_sf_bessel_j1*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_j1", dynlib: libgsl.}
proc gsl_sf_bessel_j2_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_j2_e", dynlib: libgsl.}
proc gsl_sf_bessel_j2*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_j2", dynlib: libgsl.}
proc gsl_sf_bessel_jl_e*(l: cint; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_jl_e", dynlib: libgsl.}
proc gsl_sf_bessel_jl*(l: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_jl", dynlib: libgsl.}
proc gsl_sf_bessel_jl_array*(lmax: cint; x: cdouble; result_array: ptr cdouble): cint {. cdecl, importc: "gsl_sf_bessel_jl_array", dynlib: libgsl.}
proc gsl_sf_bessel_jl_steed_array*(lmax: cint; x: cdouble; jl_x_array: ptr cdouble): cint {. cdecl, importc: "gsl_sf_bessel_jl_steed_array", dynlib: libgsl.}
# proc gsl_sf_bessel_y0_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_y0_e", dynlib: libgsl.}
# proc gsl_sf_bessel_y0*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_y0", dynlib: libgsl.}
# proc gsl_sf_bessel_y1_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_y1_e", dynlib: libgsl.}
# proc gsl_sf_bessel_y1*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_y1", dynlib: libgsl.}
proc gsl_sf_bessel_y2_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_y2_e", dynlib: libgsl.}
proc gsl_sf_bessel_y2*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_y2", dynlib: libgsl.}
proc gsl_sf_bessel_yl_e*(l: cint; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_yl_e", dynlib: libgsl.}
proc gsl_sf_bessel_yl*(l: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_yl", dynlib: libgsl.}
proc gsl_sf_bessel_yl_array*(lmax: cint; x: cdouble; result_array: ptr cdouble): cint {. cdecl, importc: "gsl_sf_bessel_yl_array", dynlib: libgsl.}
# proc gsl_sf_bessel_i0_scaled_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_i0_scaled_e", dynlib: libgsl.}
# proc gsl_sf_bessel_i0_scaled*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_i0_scaled", dynlib: libgsl.}
# proc gsl_sf_bessel_i1_scaled_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_i1_scaled_e", dynlib: libgsl.}
# proc gsl_sf_bessel_i1_scaled*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_i1_scaled", dynlib: libgsl.}
proc gsl_sf_bessel_i2_scaled_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_i2_scaled_e", dynlib: libgsl.}
proc gsl_sf_bessel_i2_scaled*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_i2_scaled", dynlib: libgsl.}
proc gsl_sf_bessel_il_scaled_e*(l: cint; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_bessel_il_scaled_e", dynlib: libgsl.}
proc gsl_sf_bessel_il_scaled*(l: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_il_scaled", dynlib: libgsl.}
proc gsl_sf_bessel_il_scaled_array*(lmax: cint; x: cdouble; result_array: ptr cdouble): cint {. cdecl, importc: "gsl_sf_bessel_il_scaled_array", dynlib: libgsl.}
# proc gsl_sf_bessel_k0_scaled_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_k0_scaled_e", dynlib: libgsl.}
# proc gsl_sf_bessel_k0_scaled*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_k0_scaled", dynlib: libgsl.}
# proc gsl_sf_bessel_k1_scaled_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_k1_scaled_e", dynlib: libgsl.}
# proc gsl_sf_bessel_k1_scaled*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_k1_scaled", dynlib: libgsl.}
proc gsl_sf_bessel_k2_scaled_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_k2_scaled_e", dynlib: libgsl.}
proc gsl_sf_bessel_k2_scaled*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_k2_scaled", dynlib: libgsl.}
proc gsl_sf_bessel_kl_scaled_e*(l: cint; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_bessel_kl_scaled_e", dynlib: libgsl.}
proc gsl_sf_bessel_kl_scaled*(l: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_kl_scaled", dynlib: libgsl.}
proc gsl_sf_bessel_kl_scaled_array*(lmax: cint; x: cdouble; result_array: ptr cdouble): cint {. cdecl, importc: "gsl_sf_bessel_kl_scaled_array", dynlib: libgsl.}
proc gsl_sf_bessel_Jnu_e*(nu: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_bessel_Jnu_e", dynlib: libgsl.}
proc gsl_sf_bessel_Jnu*(nu: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_Jnu", dynlib: libgsl.}
proc gsl_sf_bessel_Ynu_e*(nu: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_bessel_Ynu_e", dynlib: libgsl.}
proc gsl_sf_bessel_Ynu*(nu: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_Ynu", dynlib: libgsl.}
proc gsl_sf_bessel_sequence_Jnu_e*(nu: cdouble; mode: gsl_mode_t; size: csize_t; v: ptr cdouble): cint {.cdecl, importc: "gsl_sf_bessel_sequence_Jnu_e", dynlib: libgsl.}
proc gsl_sf_bessel_Inu_scaled_e*(nu: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_bessel_Inu_scaled_e", dynlib: libgsl.}
proc gsl_sf_bessel_Inu_scaled*(nu: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_Inu_scaled", dynlib: libgsl.}
proc gsl_sf_bessel_Inu_e*(nu: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_bessel_Inu_e", dynlib: libgsl.}
proc gsl_sf_bessel_Inu*(nu: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_Inu", dynlib: libgsl.}
proc gsl_sf_bessel_Knu_scaled_e*(nu: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_bessel_Knu_scaled_e", dynlib: libgsl.}
proc gsl_sf_bessel_Knu_scaled*(nu: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_Knu_scaled", dynlib: libgsl.}
proc gsl_sf_bessel_Knu_scaled_e10_e*(nu: cdouble; x: cdouble; result: ptr gsl_sf_result_e10): cint {.cdecl, importc: "gsl_sf_bessel_Knu_scaled_e10_e", dynlib: libgsl.}
proc gsl_sf_bessel_Knu_e*(nu: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_bessel_Knu_e", dynlib: libgsl.}
proc gsl_sf_bessel_Knu*(nu: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_Knu", dynlib: libgsl.}
proc gsl_sf_bessel_lnKnu_e*(nu: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_bessel_lnKnu_e", dynlib: libgsl.}
proc gsl_sf_bessel_lnKnu*(nu: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_bessel_lnKnu", dynlib: libgsl.}
proc gsl_sf_bessel_zero_J0_e*(s: cuint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_zero_J0_e", dynlib: libgsl.}
proc gsl_sf_bessel_zero_J0*(s: cuint): cdouble {.cdecl, importc: "gsl_sf_bessel_zero_J0", dynlib: libgsl.}
proc gsl_sf_bessel_zero_J1_e*(s: cuint; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_bessel_zero_J1_e", dynlib: libgsl.}
proc gsl_sf_bessel_zero_J1*(s: cuint): cdouble {.cdecl, importc: "gsl_sf_bessel_zero_J1", dynlib: libgsl.}
proc gsl_sf_bessel_zero_Jnu_e*(nu: cdouble; s: cuint; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_bessel_zero_Jnu_e", dynlib: libgsl.}
proc gsl_sf_bessel_zero_Jnu*(nu: cdouble; s: cuint): cdouble {.cdecl, importc: "gsl_sf_bessel_zero_Jnu", dynlib: libgsl.}

var gsl_prec_eps* {.importc: "gsl_prec_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_sqrt_eps* {.importc: "gsl_prec_sqrt_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root3_eps* {.importc: "gsl_prec_root3_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root4_eps* {.importc: "gsl_prec_root4_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root5_eps* {.importc: "gsl_prec_root5_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root6_eps* {.importc: "gsl_prec_root6_eps", dynlib: libgsl.}: ptr cdouble

