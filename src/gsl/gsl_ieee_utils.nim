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

const
  GSL_IEEE_TYPE_NAN* = 1
  GSL_IEEE_TYPE_INF* = 2
  GSL_IEEE_TYPE_NORMAL* = 3
  GSL_IEEE_TYPE_DENORMAL* = 4
  GSL_IEEE_TYPE_ZERO* = 5

const
  GSL_IEEE_SINGLE_PRECISION* = 1
  GSL_IEEE_DOUBLE_PRECISION* = 2
  GSL_IEEE_EXTENDED_PRECISION* = 3

const
  GSL_IEEE_ROUND_TO_NEAREST* = 1
  GSL_IEEE_ROUND_DOWN* = 2
  GSL_IEEE_ROUND_UP* = 3
  GSL_IEEE_ROUND_TO_ZERO* = 4

const
  GSL_IEEE_MASK_INVALID* = 1
  GSL_IEEE_MASK_DENORMALIZED* = 2
  GSL_IEEE_MASK_DIVISION_BY_ZERO* = 4
  GSL_IEEE_MASK_OVERFLOW* = 8
  GSL_IEEE_MASK_UNDERFLOW* = 16
  GSL_IEEE_MASK_ALL* = 31
  GSL_IEEE_TRAP_INEXACT* = 32

type
  gsl_ieee_float_rep* {.bycopy.} = object
    sign*: cint
    mantissa*: array[24, char]
    exponent*: cint
    `type`*: cint

  gsl_ieee_double_rep* {.bycopy.} = object
    sign*: cint
    mantissa*: array[53, char]
    exponent*: cint
    `type`*: cint

proc gsl_ieee_printf_float*(x: ptr cfloat) {.cdecl, importc: "gsl_ieee_printf_float", dynlib: libgsl.}
proc gsl_ieee_printf_double*(x: ptr cdouble) {.cdecl, importc: "gsl_ieee_printf_double", dynlib: libgsl.}
proc gsl_ieee_fprintf_float*(stream: ptr FILE; x: ptr cfloat) {.cdecl, importc: "gsl_ieee_fprintf_float", dynlib: libgsl.}
proc gsl_ieee_fprintf_double*(stream: ptr FILE; x: ptr cdouble) {.cdecl, importc: "gsl_ieee_fprintf_double", dynlib: libgsl.}
proc gsl_ieee_float_to_rep*(x: ptr cfloat; r: ptr gsl_ieee_float_rep) {.cdecl, importc: "gsl_ieee_float_to_rep", dynlib: libgsl.}
proc gsl_ieee_double_to_rep*(x: ptr cdouble; r: ptr gsl_ieee_double_rep) {.cdecl, importc: "gsl_ieee_double_to_rep", dynlib: libgsl.}
proc gsl_ieee_env_setup*() {.cdecl, importc: "gsl_ieee_env_setup", dynlib: libgsl.}
proc gsl_ieee_read_mode_string*(description: cstring; precision: ptr cint; rounding: ptr cint; exception_mask: ptr cint): cint {. cdecl, importc: "gsl_ieee_read_mode_string", dynlib: libgsl.}
proc gsl_ieee_set_mode*(precision: cint; rounding: cint; exception_mask: cint): cint {. cdecl, importc: "gsl_ieee_set_mode", dynlib: libgsl.}
