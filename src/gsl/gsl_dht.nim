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
  gsl_dht_struct* {.bycopy.} = object
    size*: csize_t
    nu*: cdouble
    xmax*: cdouble
    kmax*: cdouble
    j*: ptr cdouble
    Jjj*: ptr cdouble
    J2*: ptr cdouble

  gsl_dht* = gsl_dht_struct

proc gsl_dht_alloc*(size: csize_t): ptr gsl_dht {.cdecl, importc: "gsl_dht_alloc", dynlib: libgsl.}
proc gsl_dht_new*(size: csize_t; nu: cdouble; xmax: cdouble): ptr gsl_dht {.cdecl, importc: "gsl_dht_new", dynlib: libgsl.}
proc gsl_dht_init*(t: ptr gsl_dht; nu: cdouble; xmax: cdouble): cint {.cdecl, importc: "gsl_dht_init", dynlib: libgsl.}
proc gsl_dht_x_sample*(t: ptr gsl_dht; n: cint): cdouble {.cdecl, importc: "gsl_dht_x_sample", dynlib: libgsl.}
proc gsl_dht_k_sample*(t: ptr gsl_dht; n: cint): cdouble {.cdecl, importc: "gsl_dht_k_sample", dynlib: libgsl.}
proc gsl_dht_free*(t: ptr gsl_dht) {.cdecl, importc: "gsl_dht_free", dynlib: libgsl.}
proc gsl_dht_apply*(t: ptr gsl_dht; f_in: ptr cdouble; f_out: ptr cdouble): cint {.cdecl, importc: "gsl_dht_apply", dynlib: libgsl.}
