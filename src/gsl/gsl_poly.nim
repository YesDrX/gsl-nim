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

  gsl_poly_complex_workspace* {.bycopy.} = object
    nc*: csize_t
    matrix*: ptr cdouble

proc gsl_poly_eval*(c: ptr cdouble; len: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_poly_eval", dynlib: libgsl.}
proc gsl_poly_complex_eval*(c: ptr cdouble; len: cint; z: gsl_complex): gsl_complex {. cdecl, importc: "gsl_poly_complex_eval", dynlib: libgsl.}
proc gsl_complex_poly_complex_eval*(c: ptr gsl_complex; len: cint; z: gsl_complex): gsl_complex {. cdecl, importc: "gsl_complex_poly_complex_eval", dynlib: libgsl.}
proc gsl_poly_eval_derivs*(c: ptr cdouble; lenc: csize_t; x: cdouble; res: ptr cdouble;  lenres: csize_t): cint {.cdecl, importc: "gsl_poly_eval_derivs", dynlib: libgsl.}
proc gsl_poly_dd_init*(dd: ptr cdouble; x: ptr cdouble; y: ptr cdouble; size: csize_t): cint {. cdecl, importc: "gsl_poly_dd_init", dynlib: libgsl.}
proc gsl_poly_dd_eval*(dd: ptr cdouble; xa: ptr cdouble; size: csize_t; x: cdouble): cdouble {. cdecl, importc: "gsl_poly_dd_eval", dynlib: libgsl.}
proc gsl_poly_dd_taylor*(c: ptr cdouble; xp: cdouble; dd: ptr cdouble; x: ptr cdouble;    size: csize_t; w: ptr cdouble): cint {.cdecl, importc: "gsl_poly_dd_taylor", dynlib: libgsl.}
proc gsl_poly_dd_hermite_init*(dd: ptr cdouble; z: ptr cdouble; xa: ptr cdouble;   ya: ptr cdouble; dya: ptr cdouble; size: csize_t): cint {. cdecl, importc: "gsl_poly_dd_hermite_init", dynlib: libgsl.}
proc gsl_poly_solve_quadratic*(a: cdouble; b: cdouble; c: cdouble; x0: ptr cdouble;   x1: ptr cdouble): cint {.cdecl, importc: "gsl_poly_solve_quadratic", dynlib: libgsl.}
proc gsl_poly_complex_solve_quadratic*(a: cdouble; b: cdouble; c: cdouble;   z0: ptr gsl_complex; z1: ptr gsl_complex): cint {. cdecl, importc: "gsl_poly_complex_solve_quadratic", dynlib: libgsl.}
proc gsl_poly_solve_cubic*(a: cdouble; b: cdouble; c: cdouble; x0: ptr cdouble;  x1: ptr cdouble; x2: ptr cdouble): cint {.cdecl, importc: "gsl_poly_solve_cubic", dynlib: libgsl.}
proc gsl_poly_complex_solve_cubic*(a: cdouble; b: cdouble; c: cdouble; z0: ptr gsl_complex; z1: ptr gsl_complex; z2: ptr gsl_complex): cint {.cdecl, importc: "gsl_poly_complex_solve_cubic", dynlib: libgsl.}
proc gsl_poly_complex_workspace_alloc*(n: csize_t): ptr gsl_poly_complex_workspace {. cdecl, importc: "gsl_poly_complex_workspace_alloc", dynlib: libgsl.}
proc gsl_poly_complex_workspace_free*(w: ptr gsl_poly_complex_workspace) {.cdecl, importc: "gsl_poly_complex_workspace_free", dynlib: libgsl.}
proc gsl_poly_complex_solve*(a: ptr cdouble; n: csize_t; w: ptr gsl_poly_complex_workspace; z: gsl_complex_packed_ptr): cint {.cdecl, importc: "gsl_poly_complex_solve", dynlib: libgsl.}
