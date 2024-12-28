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

  gsl_sf_legendre_t* {.size: sizeof(cint).} = enum
    GSL_SF_LEGENDRE_SCHMIDT, GSL_SF_LEGENDRE_SPHARM, GSL_SF_LEGENDRE_FULL, GSL_SF_LEGENDRE_NONE

proc gsl_sf_result_smash_e*(re: ptr gsl_sf_result_e10; r: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_result_smash_e", dynlib: libgsl.}
proc gsl_sf_legendre_Pl_e*(l: cint; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_legendre_Pl_e", dynlib: libgsl.}
proc gsl_sf_legendre_Pl*(l: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_legendre_Pl", dynlib: libgsl.}
proc gsl_sf_legendre_Pl_array*(lmax: cint; x: cdouble; result_array: ptr cdouble): cint {. cdecl, importc: "gsl_sf_legendre_Pl_array", dynlib: libgsl.}
proc gsl_sf_legendre_Pl_deriv_array*(lmax: cint; x: cdouble; result_array: ptr cdouble; result_deriv_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_legendre_Pl_deriv_array", dynlib: libgsl.}
proc gsl_sf_legendre_P1_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_legendre_P1_e", dynlib: libgsl.}
proc gsl_sf_legendre_P2_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_legendre_P2_e", dynlib: libgsl.}
proc gsl_sf_legendre_P3_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_legendre_P3_e", dynlib: libgsl.}
proc gsl_sf_legendre_P1*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_legendre_P1", dynlib: libgsl.}
proc gsl_sf_legendre_P2*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_legendre_P2", dynlib: libgsl.}
proc gsl_sf_legendre_P3*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_legendre_P3", dynlib: libgsl.}
proc gsl_sf_legendre_Q0_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_legendre_Q0_e", dynlib: libgsl.}
proc gsl_sf_legendre_Q0*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_legendre_Q0", dynlib: libgsl.}
proc gsl_sf_legendre_Q1_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_legendre_Q1_e", dynlib: libgsl.}
proc gsl_sf_legendre_Q1*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_legendre_Q1", dynlib: libgsl.}
proc gsl_sf_legendre_Ql_e*(l: cint; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_legendre_Ql_e", dynlib: libgsl.}
proc gsl_sf_legendre_Ql*(l: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_legendre_Ql", dynlib: libgsl.}
proc gsl_sf_legendre_Plm_e*(l: cint; m: cint; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_legendre_Plm_e", dynlib: libgsl.}
proc gsl_sf_legendre_Plm*(l: cint; m: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_legendre_Plm", dynlib: libgsl.}
proc gsl_sf_legendre_Plm_array*(lmax: cint; m: cint; x: cdouble; result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_legendre_Plm_array", dynlib: libgsl.}
proc gsl_sf_legendre_Plm_deriv_array*(lmax: cint; m: cint; x: cdouble;  result_array: ptr cdouble;  result_deriv_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_legendre_Plm_deriv_array", dynlib: libgsl.}
proc gsl_sf_legendre_sphPlm_e*(l: cint; m: cint; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_legendre_sphPlm_e", dynlib: libgsl.}
proc gsl_sf_legendre_sphPlm*(l: cint; m: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_legendre_sphPlm", dynlib: libgsl.}
proc gsl_sf_legendre_sphPlm_array*(lmax: cint; m: cint; x: cdouble; result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_legendre_sphPlm_array", dynlib: libgsl.}
proc gsl_sf_legendre_sphPlm_deriv_array*(lmax: cint; m: cint; x: cdouble; result_array: ptr cdouble; result_deriv_array: ptr cdouble): cint {. cdecl, importc: "gsl_sf_legendre_sphPlm_deriv_array", dynlib: libgsl.}
proc gsl_sf_legendre_array_size*(lmax: cint; m: cint): cint {.cdecl, importc: "gsl_sf_legendre_array_size", dynlib: libgsl.}
proc gsl_sf_conicalP_half_e*(lambda: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_conicalP_half_e", dynlib: libgsl.}
proc gsl_sf_conicalP_half*(lambda: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_conicalP_half", dynlib: libgsl.}
proc gsl_sf_conicalP_mhalf_e*(lambda: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_conicalP_mhalf_e", dynlib: libgsl.}
proc gsl_sf_conicalP_mhalf*(lambda: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_conicalP_mhalf", dynlib: libgsl.}
proc gsl_sf_conicalP_0_e*(lambda: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_conicalP_0_e", dynlib: libgsl.}
proc gsl_sf_conicalP_0*(lambda: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_conicalP_0", dynlib: libgsl.}
proc gsl_sf_conicalP_1_e*(lambda: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_conicalP_1_e", dynlib: libgsl.}
proc gsl_sf_conicalP_1*(lambda: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_conicalP_1", dynlib: libgsl.}
proc gsl_sf_conicalP_sph_reg_e*(l: cint; lambda: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_conicalP_sph_reg_e", dynlib: libgsl.}
proc gsl_sf_conicalP_sph_reg*(l: cint; lambda: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_conicalP_sph_reg", dynlib: libgsl.}
proc gsl_sf_conicalP_cyl_reg_e*(m: cint; lambda: cdouble; x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_conicalP_cyl_reg_e", dynlib: libgsl.}
proc gsl_sf_conicalP_cyl_reg*(m: cint; lambda: cdouble; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_conicalP_cyl_reg", dynlib: libgsl.}
proc gsl_sf_legendre_H3d_0_e*(lambda: cdouble; eta: cdouble;  result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_legendre_H3d_0_e", dynlib: libgsl.}
proc gsl_sf_legendre_H3d_0*(lambda: cdouble; eta: cdouble): cdouble {.cdecl, importc: "gsl_sf_legendre_H3d_0", dynlib: libgsl.}
proc gsl_sf_legendre_H3d_1_e*(lambda: cdouble; eta: cdouble;  result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_legendre_H3d_1_e", dynlib: libgsl.}
proc gsl_sf_legendre_H3d_1*(lambda: cdouble; eta: cdouble): cdouble {.cdecl, importc: "gsl_sf_legendre_H3d_1", dynlib: libgsl.}
proc gsl_sf_legendre_H3d_e*(l: cint; lambda: cdouble; eta: cdouble;   result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_legendre_H3d_e", dynlib: libgsl.}
proc gsl_sf_legendre_H3d*(l: cint; lambda: cdouble; eta: cdouble): cdouble {.cdecl, importc: "gsl_sf_legendre_H3d", dynlib: libgsl.}
proc gsl_sf_legendre_H3d_array*(lmax: cint; lambda: cdouble; eta: cdouble; result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_legendre_H3d_array", dynlib: libgsl.}
proc gsl_sf_legendre_array*(norm: gsl_sf_legendre_t; lmax: csize_t; x: cdouble;   result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_legendre_array", dynlib: libgsl.}
proc gsl_sf_legendre_array_e*(norm: gsl_sf_legendre_t; lmax: csize_t; x: cdouble;  csphase: cdouble; result_array: ptr cdouble): cint {. cdecl, importc: "gsl_sf_legendre_array_e", dynlib: libgsl.}
proc gsl_sf_legendre_deriv_array*(norm: gsl_sf_legendre_t; lmax: csize_t; x: cdouble; result_array: ptr cdouble; result_deriv_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_legendre_deriv_array", dynlib: libgsl.}
proc gsl_sf_legendre_deriv_array_e*(norm: gsl_sf_legendre_t; lmax: csize_t;  x: cdouble; csphase: cdouble;  result_array: ptr cdouble;  result_deriv_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_legendre_deriv_array_e", dynlib: libgsl.}
proc gsl_sf_legendre_deriv_alt_array*(norm: gsl_sf_legendre_t; lmax: csize_t;  x: cdouble; result_array: ptr cdouble;  result_deriv_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_legendre_deriv_alt_array", dynlib: libgsl.}
proc gsl_sf_legendre_deriv_alt_array_e*(norm: gsl_sf_legendre_t; lmax: csize_t;    x: cdouble; csphase: cdouble;    result_array: ptr cdouble;    result_deriv_array: ptr cdouble): cint {. cdecl, importc: "gsl_sf_legendre_deriv_alt_array_e", dynlib: libgsl.}
proc gsl_sf_legendre_deriv2_array*(norm: gsl_sf_legendre_t; lmax: csize_t; x: cdouble; result_array: ptr cdouble; result_deriv_array: ptr cdouble; result_deriv2_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_legendre_deriv2_array", dynlib: libgsl.}
proc gsl_sf_legendre_deriv2_array_e*(norm: gsl_sf_legendre_t; lmax: csize_t; x: cdouble; csphase: cdouble; result_array: ptr cdouble; result_deriv_array: ptr cdouble; result_deriv2_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_legendre_deriv2_array_e", dynlib: libgsl.}
proc gsl_sf_legendre_deriv2_alt_array*(norm: gsl_sf_legendre_t; lmax: csize_t;   x: cdouble; result_array: ptr cdouble;   result_deriv_array: ptr cdouble;   result_deriv2_array: ptr cdouble): cint {. cdecl, importc: "gsl_sf_legendre_deriv2_alt_array", dynlib: libgsl.}
proc gsl_sf_legendre_deriv2_alt_array_e*(norm: gsl_sf_legendre_t; lmax: csize_t; x: cdouble; csphase: cdouble; result_array: ptr cdouble; result_deriv_array: ptr cdouble; result_deriv2_array: ptr cdouble): cint {. cdecl, importc: "gsl_sf_legendre_deriv2_alt_array_e", dynlib: libgsl.}
proc gsl_sf_legendre_array_n*(lmax: csize_t): csize_t {.cdecl, importc: "gsl_sf_legendre_array_n", dynlib: libgsl.}
proc gsl_sf_legendre_array_index*(l: csize_t; m: csize_t): csize_t {.cdecl, importc: "gsl_sf_legendre_array_index", dynlib: libgsl.}
proc gsl_sf_legendre_nlm*(lmax: csize_t): csize_t {.cdecl, importc: "gsl_sf_legendre_nlm", dynlib: libgsl.}
