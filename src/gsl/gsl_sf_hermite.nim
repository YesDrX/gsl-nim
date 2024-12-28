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
proc gsl_sf_hermite_prob_e*(n: cint; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_hermite_prob_e", dynlib: libgsl.}
proc gsl_sf_hermite_prob*(n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_hermite_prob", dynlib: libgsl.}
proc gsl_sf_hermite_prob_der_e*(m: cint; n: cint; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_hermite_prob_der_e", dynlib: libgsl.}
proc gsl_sf_hermite_prob_der*(m: cint; n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_hermite_prob_der", dynlib: libgsl.}
proc gsl_sf_hermite_phys_e*(n: cint; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_hermite_phys_e", dynlib: libgsl.}
proc gsl_sf_hermite_phys*(n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_hermite_phys", dynlib: libgsl.}
proc gsl_sf_hermite_phys_der_e*(m: cint; n: cint; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_hermite_phys_der_e", dynlib: libgsl.}
proc gsl_sf_hermite_phys_der*(m: cint; n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_hermite_phys_der", dynlib: libgsl.}
proc gsl_sf_hermite_func_e*(n: cint; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_hermite_func_e", dynlib: libgsl.}
proc gsl_sf_hermite_func*(n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_hermite_func", dynlib: libgsl.}
proc gsl_sf_hermite_prob_array*(nmax: cint; x: cdouble; result_array: ptr cdouble): cint {. cdecl, importc: "gsl_sf_hermite_prob_array", dynlib: libgsl.}
proc gsl_sf_hermite_prob_array_der*(m: cint; nmax: cint; x: cdouble;  result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_hermite_prob_array_der", dynlib: libgsl.}
proc gsl_sf_hermite_prob_der_array*(mmax: cint; n: cint; x: cdouble;  result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_hermite_prob_der_array", dynlib: libgsl.}
proc gsl_sf_hermite_prob_series_e*(n: cint; x: cdouble; a: ptr cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_hermite_prob_series_e", dynlib: libgsl.}
proc gsl_sf_hermite_prob_series*(n: cint; x: cdouble; a: ptr cdouble): cdouble {.cdecl, importc: "gsl_sf_hermite_prob_series", dynlib: libgsl.}
proc gsl_sf_hermite_phys_array*(nmax: cint; x: cdouble; result_array: ptr cdouble): cint {. cdecl, importc: "gsl_sf_hermite_phys_array", dynlib: libgsl.}
proc gsl_sf_hermite_phys_array_der*(m: cint; nmax: cint; x: cdouble;  result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_hermite_phys_array_der", dynlib: libgsl.}
proc gsl_sf_hermite_phys_der_array*(mmax: cint; n: cint; x: cdouble;  result_array: ptr cdouble): cint {.cdecl, importc: "gsl_sf_hermite_phys_der_array", dynlib: libgsl.}
proc gsl_sf_hermite_phys_series_e*(n: cint; x: cdouble; a: ptr cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_hermite_phys_series_e", dynlib: libgsl.}
proc gsl_sf_hermite_phys_series*(n: cint; x: cdouble; a: ptr cdouble): cdouble {.cdecl, importc: "gsl_sf_hermite_phys_series", dynlib: libgsl.}
proc gsl_sf_hermite_func_array*(nmax: cint; x: cdouble; result_array: ptr cdouble): cint {. cdecl, importc: "gsl_sf_hermite_func_array", dynlib: libgsl.}
proc gsl_sf_hermite_func_series_e*(n: cint; x: cdouble; a: ptr cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_hermite_func_series_e", dynlib: libgsl.}
proc gsl_sf_hermite_func_series*(n: cint; x: cdouble; a: ptr cdouble): cdouble {.cdecl, importc: "gsl_sf_hermite_func_series", dynlib: libgsl.}
proc gsl_sf_hermite_func_der_e*(m: cint; n: cint; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_hermite_func_der_e", dynlib: libgsl.}
proc gsl_sf_hermite_func_der*(m: cint; n: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_hermite_func_der", dynlib: libgsl.}
proc gsl_sf_hermite_prob_zero_e*(n: cint; s: cint; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_hermite_prob_zero_e", dynlib: libgsl.}
proc gsl_sf_hermite_prob_zero*(n: cint; s: cint): cdouble {.cdecl, importc: "gsl_sf_hermite_prob_zero", dynlib: libgsl.}
proc gsl_sf_hermite_phys_zero_e*(n: cint; s: cint; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_hermite_phys_zero_e", dynlib: libgsl.}
proc gsl_sf_hermite_phys_zero*(n: cint; s: cint): cdouble {.cdecl, importc: "gsl_sf_hermite_phys_zero", dynlib: libgsl.}
proc gsl_sf_hermite_func_zero_e*(n: cint; s: cint; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_hermite_func_zero_e", dynlib: libgsl.}
proc gsl_sf_hermite_func_zero*(n: cint; s: cint): cdouble {.cdecl, importc: "gsl_sf_hermite_func_zero", dynlib: libgsl.}
