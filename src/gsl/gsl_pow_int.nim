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

proc gsl_pow_2*(x: cdouble): cdouble {.cdecl, importc: "gsl_pow_2", dynlib: libgsl.}
proc gsl_pow_3*(x: cdouble): cdouble {.cdecl, importc: "gsl_pow_3", dynlib: libgsl.}
proc gsl_pow_4*(x: cdouble): cdouble {.cdecl, importc: "gsl_pow_4", dynlib: libgsl.}
proc gsl_pow_5*(x: cdouble): cdouble {.cdecl, importc: "gsl_pow_5", dynlib: libgsl.}
proc gsl_pow_6*(x: cdouble): cdouble {.cdecl, importc: "gsl_pow_6", dynlib: libgsl.}
proc gsl_pow_7*(x: cdouble): cdouble {.cdecl, importc: "gsl_pow_7", dynlib: libgsl.}
proc gsl_pow_8*(x: cdouble): cdouble {.cdecl, importc: "gsl_pow_8", dynlib: libgsl.}
proc gsl_pow_9*(x: cdouble): cdouble {.cdecl, importc: "gsl_pow_9", dynlib: libgsl.}
proc gsl_pow_int*(x: cdouble; n: cint): cdouble {.cdecl, importc: "gsl_pow_int", dynlib: libgsl.}
proc gsl_pow_uint*(x: cdouble; n: cuint): cdouble {.cdecl, importc: "gsl_pow_uint", dynlib: libgsl.}
