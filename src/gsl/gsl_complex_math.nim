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
  gsl_complex_packed* = ptr cdouble
  gsl_complex_packed_float* = ptr cfloat
  gsl_complex_packed_long_double* = ptr clongdouble
  gsl_const_complex_packed* = ptr cdouble
  gsl_const_complex_packed_float* = ptr cfloat
  gsl_const_complex_packed_long_double* = ptr clongdouble
  gsl_complex_packed_array* = ptr cdouble
  gsl_complex_packed_array_float* = ptr cfloat
  gsl_complex_packed_array_long_double* = ptr clongdouble
  gsl_const_complex_packed_array* = ptr cdouble
  gsl_const_complex_packed_array_float* = ptr cfloat
  gsl_const_complex_packed_array_long_double* = ptr clongdouble
  gsl_complex_packed_ptr* = ptr cdouble
  gsl_complex_packed_float_ptr* = ptr cfloat
  gsl_complex_packed_long_double_ptr* = ptr clongdouble
  gsl_const_complex_packed_ptr* = ptr cdouble
  gsl_const_complex_packed_float_ptr* = ptr cfloat
  gsl_const_complex_packed_long_double_ptr* = ptr clongdouble
  gsl_complex_long_double* {.bycopy.} = object
    dat*: array[2, clongdouble]

  gsl_complex* {.bycopy.} = object
    dat*: array[2, cdouble]

  gsl_complex_float* {.bycopy.} = object
    dat*: array[2, cfloat]

proc gsl_complex_polar*(r: cdouble; theta: cdouble): gsl_complex {.cdecl, importc: "gsl_complex_polar", dynlib: libgsl.}
proc gsl_complex_rect*(x: cdouble; y: cdouble): gsl_complex {.cdecl, importc: "gsl_complex_rect", dynlib: libgsl.}
proc gsl_complex_arg*(z: gsl_complex): cdouble {.cdecl, importc: "gsl_complex_arg", dynlib: libgsl.}
proc gsl_complex_abs*(z: gsl_complex): cdouble {.cdecl, importc: "gsl_complex_abs", dynlib: libgsl.}
proc gsl_complex_abs2*(z: gsl_complex): cdouble {.cdecl, importc: "gsl_complex_abs2", dynlib: libgsl.}
proc gsl_complex_logabs*(z: gsl_complex): cdouble {.cdecl, importc: "gsl_complex_logabs", dynlib: libgsl.}
proc gsl_complex_add*(a: gsl_complex; b: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_add", dynlib: libgsl.}
proc gsl_complex_sub*(a: gsl_complex; b: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_sub", dynlib: libgsl.}
proc gsl_complex_mul*(a: gsl_complex; b: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_mul", dynlib: libgsl.}
proc gsl_complex_div*(a: gsl_complex; b: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_div", dynlib: libgsl.}
proc gsl_complex_add_real*(a: gsl_complex; x: cdouble): gsl_complex {.cdecl, importc: "gsl_complex_add_real", dynlib: libgsl.}
proc gsl_complex_sub_real*(a: gsl_complex; x: cdouble): gsl_complex {.cdecl, importc: "gsl_complex_sub_real", dynlib: libgsl.}
proc gsl_complex_mul_real*(a: gsl_complex; x: cdouble): gsl_complex {.cdecl, importc: "gsl_complex_mul_real", dynlib: libgsl.}
proc gsl_complex_div_real*(a: gsl_complex; x: cdouble): gsl_complex {.cdecl, importc: "gsl_complex_div_real", dynlib: libgsl.}
proc gsl_complex_add_imag*(a: gsl_complex; y: cdouble): gsl_complex {.cdecl, importc: "gsl_complex_add_imag", dynlib: libgsl.}
proc gsl_complex_sub_imag*(a: gsl_complex; y: cdouble): gsl_complex {.cdecl, importc: "gsl_complex_sub_imag", dynlib: libgsl.}
proc gsl_complex_mul_imag*(a: gsl_complex; y: cdouble): gsl_complex {.cdecl, importc: "gsl_complex_mul_imag", dynlib: libgsl.}
proc gsl_complex_div_imag*(a: gsl_complex; y: cdouble): gsl_complex {.cdecl, importc: "gsl_complex_div_imag", dynlib: libgsl.}
proc gsl_complex_conjugate*(z: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_conjugate", dynlib: libgsl.}
proc gsl_complex_inverse*(a: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_inverse", dynlib: libgsl.}
proc gsl_complex_negative*(a: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_negative", dynlib: libgsl.}
proc gsl_complex_sqrt*(z: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_sqrt", dynlib: libgsl.}
proc gsl_complex_sqrt_real*(x: cdouble): gsl_complex {.cdecl, importc: "gsl_complex_sqrt_real", dynlib: libgsl.}
proc gsl_complex_pow*(a: gsl_complex; b: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_pow", dynlib: libgsl.}
proc gsl_complex_pow_real*(a: gsl_complex; b: cdouble): gsl_complex {.cdecl, importc: "gsl_complex_pow_real", dynlib: libgsl.}
proc gsl_complex_exp*(a: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_exp", dynlib: libgsl.}
proc gsl_complex_log*(a: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_log", dynlib: libgsl.}
proc gsl_complex_log10*(a: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_log10", dynlib: libgsl.}
proc gsl_complex_log_b*(a: gsl_complex; b: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_log_b", dynlib: libgsl.}
proc gsl_complex_sin*(a: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_sin", dynlib: libgsl.}
proc gsl_complex_cos*(a: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_cos", dynlib: libgsl.}
proc gsl_complex_sec*(a: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_sec", dynlib: libgsl.}
proc gsl_complex_csc*(a: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_csc", dynlib: libgsl.}
proc gsl_complex_tan*(a: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_tan", dynlib: libgsl.}
proc gsl_complex_cot*(a: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_cot", dynlib: libgsl.}
proc gsl_complex_arcsin*(a: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_arcsin", dynlib: libgsl.}
proc gsl_complex_arcsin_real*(a: cdouble): gsl_complex {.cdecl, importc: "gsl_complex_arcsin_real", dynlib: libgsl.}
proc gsl_complex_arccos*(a: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_arccos", dynlib: libgsl.}
proc gsl_complex_arccos_real*(a: cdouble): gsl_complex {.cdecl, importc: "gsl_complex_arccos_real", dynlib: libgsl.}
proc gsl_complex_arcsec*(a: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_arcsec", dynlib: libgsl.}
proc gsl_complex_arcsec_real*(a: cdouble): gsl_complex {.cdecl, importc: "gsl_complex_arcsec_real", dynlib: libgsl.}
proc gsl_complex_arccsc*(a: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_arccsc", dynlib: libgsl.}
proc gsl_complex_arccsc_real*(a: cdouble): gsl_complex {.cdecl, importc: "gsl_complex_arccsc_real", dynlib: libgsl.}
proc gsl_complex_arctan*(a: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_arctan", dynlib: libgsl.}
proc gsl_complex_arccot*(a: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_arccot", dynlib: libgsl.}
proc gsl_complex_sinh*(a: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_sinh", dynlib: libgsl.}
proc gsl_complex_cosh*(a: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_cosh", dynlib: libgsl.}
proc gsl_complex_sech*(a: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_sech", dynlib: libgsl.}
proc gsl_complex_csch*(a: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_csch", dynlib: libgsl.}
proc gsl_complex_tanh*(a: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_tanh", dynlib: libgsl.}
proc gsl_complex_coth*(a: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_coth", dynlib: libgsl.}
proc gsl_complex_arcsinh*(a: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_arcsinh", dynlib: libgsl.}
proc gsl_complex_arccosh*(a: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_arccosh", dynlib: libgsl.}
proc gsl_complex_arccosh_real*(a: cdouble): gsl_complex {.cdecl, importc: "gsl_complex_arccosh_real", dynlib: libgsl.}
proc gsl_complex_arcsech*(a: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_arcsech", dynlib: libgsl.}
proc gsl_complex_arccsch*(a: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_arccsch", dynlib: libgsl.}
proc gsl_complex_arctanh*(a: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_arctanh", dynlib: libgsl.}
proc gsl_complex_arctanh_real*(a: cdouble): gsl_complex {.cdecl, importc: "gsl_complex_arctanh_real", dynlib: libgsl.}
proc gsl_complex_arccoth*(a: gsl_complex): gsl_complex {.cdecl, importc: "gsl_complex_arccoth", dynlib: libgsl.}
