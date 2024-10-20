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
  GSL_SUCCESS* = 0
  GSL_FAILURE* = -1
  GSL_CONTINUE* = -2
  GSL_EDOM* = 1
  GSL_ERANGE* = 2
  GSL_EFAULT* = 3
  GSL_EINVAL* = 4
  GSL_EFAILED* = 5
  GSL_EFACTOR* = 6
  GSL_ESANITY* = 7
  GSL_ENOMEM* = 8
  GSL_EBADFUNC* = 9
  GSL_ERUNAWAY* = 10
  GSL_EMAXITER* = 11
  GSL_EZERODIV* = 12
  GSL_EBADTOL* = 13
  GSL_ETOL* = 14
  GSL_EUNDRFLW* = 15
  GSL_EOVRFLW* = 16
  GSL_ELOSS* = 17
  GSL_EROUND* = 18
  GSL_EBADLEN* = 19
  GSL_ENOTSQR* = 20
  GSL_ESING* = 21
  GSL_EDIVERGE* = 22
  GSL_EUNSUP* = 23
  GSL_EUNIMPL* = 24
  GSL_ECACHE* = 25
  GSL_ETABLE* = 26
  GSL_ENOPROG* = 27
  GSL_ENOPROGJ* = 28
  GSL_ETOLF* = 29
  GSL_ETOLX* = 30
  GSL_ETOLG* = 31
  GSL_EOF* = 32

type
  gsl_error_handler_t* = proc (reason: cstring; file: cstring; line: cint; gsl_errno: cint): void {.cdecl.}
  gsl_stream_handler_t* = proc (label: cstring; file: cstring; line: cint;  reason: cstring): void {.cdecl.}

  gsl_wavelet_direction* {.size: sizeof(cint).} = enum
    gsl_wavelet_backward = -1, gsl_wavelet_forward = 1
  gsl_wavelet_type* {.bycopy.} = object
    name*: cstring
    init*: proc (h1: ptr ptr cdouble; g1: ptr ptr cdouble; h2: ptr ptr cdouble; g2: ptr ptr cdouble; nc: ptr csize_t; offset: ptr csize_t; member: csize_t): cint {.     cdecl.}

  gsl_wavelet* {.bycopy.} = object
    `type`*: ptr gsl_wavelet_type
    h1*: ptr cdouble
    g1*: ptr cdouble
    h2*: ptr cdouble
    g2*: ptr cdouble
    nc*: csize_t
    offset*: csize_t

  gsl_wavelet_workspace* {.bycopy.} = object
    scratch*: ptr cdouble
    n*: csize_t

proc gsl_error*(reason: cstring; file: cstring; line: cint; gsl_errno: cint) {.cdecl, importc: "gsl_error", dynlib: libgsl.}
proc gsl_stream_printf*(label: cstring; file: cstring; line: cint; reason: cstring) {. cdecl, importc: "gsl_stream_printf", dynlib: libgsl.}
proc gsl_strerror*(gsl_errno: cint): cstring {.cdecl, importc: "gsl_strerror", dynlib: libgsl.}
proc gsl_set_error_handler*(new_handler: ptr gsl_error_handler_t): ptr gsl_error_handler_t {. cdecl, importc: "gsl_set_error_handler", dynlib: libgsl.}
proc gsl_set_error_handler_off*(): ptr gsl_error_handler_t {.cdecl, importc: "gsl_set_error_handler_off", dynlib: libgsl.}
proc gsl_set_stream_handler*(new_handler: ptr gsl_stream_handler_t): ptr gsl_stream_handler_t {. cdecl, importc: "gsl_set_stream_handler", dynlib: libgsl.}
proc gsl_set_stream*(new_stream: ptr FILE): ptr FILE {.cdecl, importc: "gsl_set_stream", dynlib: libgsl.}
proc gsl_wavelet_alloc*(T: ptr gsl_wavelet_type; k: csize_t): ptr gsl_wavelet {.cdecl, importc: "gsl_wavelet_alloc", dynlib: libgsl.}
proc gsl_wavelet_free*(w: ptr gsl_wavelet) {.cdecl, importc: "gsl_wavelet_free", dynlib: libgsl.}
proc gsl_wavelet_name*(w: ptr gsl_wavelet): cstring {.cdecl, importc: "gsl_wavelet_name", dynlib: libgsl.}
proc gsl_wavelet_workspace_alloc*(n: csize_t): ptr gsl_wavelet_workspace {.cdecl, importc: "gsl_wavelet_workspace_alloc", dynlib: libgsl.}
proc gsl_wavelet_workspace_free*(work: ptr gsl_wavelet_workspace) {.cdecl, importc: "gsl_wavelet_workspace_free", dynlib: libgsl.}
proc gsl_wavelet_transform*(w: ptr gsl_wavelet; data: ptr cdouble; stride: csize_t;   n: csize_t; dir: gsl_wavelet_direction;   work: ptr gsl_wavelet_workspace): cint {.cdecl, importc: "gsl_wavelet_transform", dynlib: libgsl.}
proc gsl_wavelet_transform_forward*(w: ptr gsl_wavelet; data: ptr cdouble;  stride: csize_t; n: csize_t;  work: ptr gsl_wavelet_workspace): cint {.cdecl, importc: "gsl_wavelet_transform_forward", dynlib: libgsl.}
proc gsl_wavelet_transform_inverse*(w: ptr gsl_wavelet; data: ptr cdouble;  stride: csize_t; n: csize_t;  work: ptr gsl_wavelet_workspace): cint {.cdecl, importc: "gsl_wavelet_transform_inverse", dynlib: libgsl.}

var gsl_wavelet_daubechies* {.importc: "gsl_wavelet_daubechies", dynlib: libgsl.}: ptr gsl_wavelet_type

var gsl_wavelet_daubechies_centered* {.importc: "gsl_wavelet_daubechies_centered",  dynlib: libgsl.}: ptr gsl_wavelet_type

var gsl_wavelet_haar* {.importc: "gsl_wavelet_haar", dynlib: libgsl.}: ptr gsl_wavelet_type

var gsl_wavelet_haar_centered* {.importc: "gsl_wavelet_haar_centered", dynlib: libgsl.}: ptr gsl_wavelet_type

var gsl_wavelet_bspline* {.importc: "gsl_wavelet_bspline", dynlib: libgsl.}: ptr gsl_wavelet_type

var gsl_wavelet_bspline_centered* {.importc: "gsl_wavelet_bspline_centered", dynlib: libgsl.}: ptr gsl_wavelet_type

