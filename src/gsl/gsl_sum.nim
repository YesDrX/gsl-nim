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
  gsl_sum_levin_u_workspace* {.bycopy.} = object
    size*: csize_t
    i*: csize_t
    terms_used*: csize_t
    sum_plain*: cdouble
    q_num*: ptr cdouble
    q_den*: ptr cdouble
    dq_num*: ptr cdouble
    dq_den*: ptr cdouble
    dsum*: ptr cdouble

  gsl_sum_levin_utrunc_workspace* {.bycopy.} = object
    size*: csize_t
    i*: csize_t
    terms_used*: csize_t
    sum_plain*: cdouble
    q_num*: ptr cdouble
    q_den*: ptr cdouble
    dsum*: ptr cdouble

proc gsl_sum_levin_u_alloc*(n: csize_t): ptr gsl_sum_levin_u_workspace {.cdecl, importc: "gsl_sum_levin_u_alloc", dynlib: libgsl.}
proc gsl_sum_levin_u_free*(w: ptr gsl_sum_levin_u_workspace) {.cdecl, importc: "gsl_sum_levin_u_free", dynlib: libgsl.}
proc gsl_sum_levin_u_accel*(array: ptr cdouble; n: csize_t;   w: ptr gsl_sum_levin_u_workspace;   sum_accel: ptr cdouble; abserr: ptr cdouble): cint {.cdecl, importc: "gsl_sum_levin_u_accel", dynlib: libgsl.}
proc gsl_sum_levin_u_minmax*(array: ptr cdouble; n: csize_t; min_terms: csize_t; max_terms: csize_t; w: ptr gsl_sum_levin_u_workspace; sum_accel: ptr cdouble; abserr: ptr cdouble): cint {.cdecl, importc: "gsl_sum_levin_u_minmax", dynlib: libgsl.}
proc gsl_sum_levin_u_step*(term: cdouble; n: csize_t; nmax: csize_t;  w: ptr gsl_sum_levin_u_workspace; sum_accel: ptr cdouble): cint {. cdecl, importc: "gsl_sum_levin_u_step", dynlib: libgsl.}
proc gsl_sum_levin_utrunc_alloc*(n: csize_t): ptr gsl_sum_levin_utrunc_workspace {. cdecl, importc: "gsl_sum_levin_utrunc_alloc", dynlib: libgsl.}
proc gsl_sum_levin_utrunc_free*(w: ptr gsl_sum_levin_utrunc_workspace) {.cdecl, importc: "gsl_sum_levin_utrunc_free", dynlib: libgsl.}
proc gsl_sum_levin_utrunc_accel*(array: ptr cdouble; n: csize_t; w: ptr gsl_sum_levin_utrunc_workspace; sum_accel: ptr cdouble; abserr_trunc: ptr cdouble): cint {. cdecl, importc: "gsl_sum_levin_utrunc_accel", dynlib: libgsl.}
proc gsl_sum_levin_utrunc_minmax*(array: ptr cdouble; n: csize_t; min_terms: csize_t; max_terms: csize_t; w: ptr gsl_sum_levin_utrunc_workspace; sum_accel: ptr cdouble; abserr_trunc: ptr cdouble): cint {. cdecl, importc: "gsl_sum_levin_utrunc_minmax", dynlib: libgsl.}
proc gsl_sum_levin_utrunc_step*(term: cdouble; n: csize_t; w: ptr gsl_sum_levin_utrunc_workspace; sum_accel: ptr cdouble): cint {.cdecl, importc: "gsl_sum_levin_utrunc_step", dynlib: libgsl.}
