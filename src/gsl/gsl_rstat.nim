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
  gsl_rstat_quantile_workspace* {.bycopy.} = object
    p*: cdouble
    q*: array[5, cdouble]
    npos*: array[5, cint]
    np*: array[5, cdouble]
    dnp*: array[5, cdouble]
    n*: csize_t

  gsl_rstat_workspace* {.bycopy.} = object
    min*: cdouble
    max*: cdouble
    mean*: cdouble
    M2*: cdouble
    M3*: cdouble
    M4*: cdouble
    n*: csize_t
    median_workspace_p*: ptr gsl_rstat_quantile_workspace

proc gsl_rstat_quantile_alloc*(p: cdouble): ptr gsl_rstat_quantile_workspace {.cdecl, importc: "gsl_rstat_quantile_alloc", dynlib: libgsl.}
proc gsl_rstat_quantile_free*(w: ptr gsl_rstat_quantile_workspace) {.cdecl, importc: "gsl_rstat_quantile_free", dynlib: libgsl.}
proc gsl_rstat_quantile_reset*(w: ptr gsl_rstat_quantile_workspace): cint {.cdecl, importc: "gsl_rstat_quantile_reset", dynlib: libgsl.}
proc gsl_rstat_quantile_add*(x: cdouble; w: ptr gsl_rstat_quantile_workspace): cint {. cdecl, importc: "gsl_rstat_quantile_add", dynlib: libgsl.}
proc gsl_rstat_quantile_get*(w: ptr gsl_rstat_quantile_workspace): cdouble {.cdecl, importc: "gsl_rstat_quantile_get", dynlib: libgsl.}
proc gsl_rstat_alloc*(): ptr gsl_rstat_workspace {.cdecl, importc: "gsl_rstat_alloc", dynlib: libgsl.}
proc gsl_rstat_free*(w: ptr gsl_rstat_workspace) {.cdecl, importc: "gsl_rstat_free", dynlib: libgsl.}
proc gsl_rstat_n*(w: ptr gsl_rstat_workspace): csize_t {.cdecl, importc: "gsl_rstat_n", dynlib: libgsl.}
proc gsl_rstat_add*(x: cdouble; w: ptr gsl_rstat_workspace): cint {.cdecl, importc: "gsl_rstat_add", dynlib: libgsl.}
proc gsl_rstat_min*(w: ptr gsl_rstat_workspace): cdouble {.cdecl, importc: "gsl_rstat_min", dynlib: libgsl.}
proc gsl_rstat_max*(w: ptr gsl_rstat_workspace): cdouble {.cdecl, importc: "gsl_rstat_max", dynlib: libgsl.}
proc gsl_rstat_mean*(w: ptr gsl_rstat_workspace): cdouble {.cdecl, importc: "gsl_rstat_mean", dynlib: libgsl.}
proc gsl_rstat_variance*(w: ptr gsl_rstat_workspace): cdouble {.cdecl, importc: "gsl_rstat_variance", dynlib: libgsl.}
proc gsl_rstat_sd*(w: ptr gsl_rstat_workspace): cdouble {.cdecl, importc: "gsl_rstat_sd", dynlib: libgsl.}
proc gsl_rstat_rms*(w: ptr gsl_rstat_workspace): cdouble {.cdecl, importc: "gsl_rstat_rms", dynlib: libgsl.}
proc gsl_rstat_sd_mean*(w: ptr gsl_rstat_workspace): cdouble {.cdecl, importc: "gsl_rstat_sd_mean", dynlib: libgsl.}
proc gsl_rstat_median*(w: ptr gsl_rstat_workspace): cdouble {.cdecl, importc: "gsl_rstat_median", dynlib: libgsl.}
proc gsl_rstat_skew*(w: ptr gsl_rstat_workspace): cdouble {.cdecl, importc: "gsl_rstat_skew", dynlib: libgsl.}
proc gsl_rstat_kurtosis*(w: ptr gsl_rstat_workspace): cdouble {.cdecl, importc: "gsl_rstat_kurtosis", dynlib: libgsl.}
proc gsl_rstat_reset*(w: ptr gsl_rstat_workspace): cint {.cdecl, importc: "gsl_rstat_reset", dynlib: libgsl.}
