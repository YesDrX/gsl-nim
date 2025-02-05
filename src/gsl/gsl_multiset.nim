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

  gsl_multiset_struct* {.bycopy.} = object
    n*: csize_t
    k*: csize_t
    data*: ptr csize_t

  gsl_multiset* = gsl_multiset_struct

proc gsl_error*(reason: cstring; file: cstring; line: cint; gsl_errno: cint) {.cdecl, importc: "gsl_error", dynlib: libgsl.}
proc gsl_stream_printf*(label: cstring; file: cstring; line: cint; reason: cstring) {. cdecl, importc: "gsl_stream_printf", dynlib: libgsl.}
proc gsl_strerror*(gsl_errno: cint): cstring {.cdecl, importc: "gsl_strerror", dynlib: libgsl.}
proc gsl_set_error_handler*(new_handler: ptr gsl_error_handler_t): ptr gsl_error_handler_t {. cdecl, importc: "gsl_set_error_handler", dynlib: libgsl.}
proc gsl_set_error_handler_off*(): ptr gsl_error_handler_t {.cdecl, importc: "gsl_set_error_handler_off", dynlib: libgsl.}
proc gsl_set_stream_handler*(new_handler: ptr gsl_stream_handler_t): ptr gsl_stream_handler_t {. cdecl, importc: "gsl_set_stream_handler", dynlib: libgsl.}
proc gsl_set_stream*(new_stream: ptr FILE): ptr FILE {.cdecl, importc: "gsl_set_stream", dynlib: libgsl.}
proc gsl_multiset_alloc*(n: csize_t; k: csize_t): ptr gsl_multiset {.cdecl, importc: "gsl_multiset_alloc", dynlib: libgsl.}
proc gsl_multiset_calloc*(n: csize_t; k: csize_t): ptr gsl_multiset {.cdecl, importc: "gsl_multiset_calloc", dynlib: libgsl.}
proc gsl_multiset_init_first*(c: ptr gsl_multiset) {.cdecl, importc: "gsl_multiset_init_first", dynlib: libgsl.}
proc gsl_multiset_init_last*(c: ptr gsl_multiset) {.cdecl, importc: "gsl_multiset_init_last", dynlib: libgsl.}
proc gsl_multiset_free*(c: ptr gsl_multiset) {.cdecl, importc: "gsl_multiset_free", dynlib: libgsl.}
proc gsl_multiset_memcpy*(dest: ptr gsl_multiset; src: ptr gsl_multiset): cint {.cdecl, importc: "gsl_multiset_memcpy", dynlib: libgsl.}
proc gsl_multiset_fread*(stream: ptr FILE; c: ptr gsl_multiset): cint {.cdecl, importc: "gsl_multiset_fread", dynlib: libgsl.}
proc gsl_multiset_fwrite*(stream: ptr FILE; c: ptr gsl_multiset): cint {.cdecl, importc: "gsl_multiset_fwrite", dynlib: libgsl.}
proc gsl_multiset_fscanf*(stream: ptr FILE; c: ptr gsl_multiset): cint {.cdecl, importc: "gsl_multiset_fscanf", dynlib: libgsl.}
proc gsl_multiset_fprintf*(stream: ptr FILE; c: ptr gsl_multiset; format: cstring): cint {. cdecl, importc: "gsl_multiset_fprintf", dynlib: libgsl.}
proc gsl_multiset_n*(c: ptr gsl_multiset): csize_t {.cdecl, importc: "gsl_multiset_n", dynlib: libgsl.}
proc gsl_multiset_k*(c: ptr gsl_multiset): csize_t {.cdecl, importc: "gsl_multiset_k", dynlib: libgsl.}
proc gsl_multiset_data*(c: ptr gsl_multiset): ptr csize_t {.cdecl, importc: "gsl_multiset_data", dynlib: libgsl.}
proc gsl_multiset_valid*(c: ptr gsl_multiset): cint {.cdecl, importc: "gsl_multiset_valid", dynlib: libgsl.}
proc gsl_multiset_next*(c: ptr gsl_multiset): cint {.cdecl, importc: "gsl_multiset_next", dynlib: libgsl.}
proc gsl_multiset_prev*(c: ptr gsl_multiset): cint {.cdecl, importc: "gsl_multiset_prev", dynlib: libgsl.}
proc gsl_multiset_get*(c: ptr gsl_multiset; i: csize_t): csize_t {.cdecl, importc: "gsl_multiset_get", dynlib: libgsl.}

var gsl_check_range* {.importc: "gsl_check_range", dynlib: libgsl.}: cint

