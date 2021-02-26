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

  gsl_qrng_type* {.bycopy.} = object
    name*: cstring
    max_dimension*: cuint
    state_size*: proc (dimension: cuint): csize_t {.cdecl.}
    init_state*: proc (state: pointer; dimension: cuint): cint {.cdecl.}
    get*: proc (state: pointer; dimension: cuint; x: ptr cdouble): cint {.cdecl.}

  gsl_qrng* {.bycopy.} = object
    `type`*: ptr gsl_qrng_type
    dimension*: cuint
    state_size*: csize_t
    state*: pointer

proc gsl_error*(reason: cstring; file: cstring; line: cint; gsl_errno: cint) {.cdecl, importc: "gsl_error", dynlib: libgsl.}
proc gsl_stream_printf*(label: cstring; file: cstring; line: cint; reason: cstring) {. cdecl, importc: "gsl_stream_printf", dynlib: libgsl.}
proc gsl_strerror*(gsl_errno: cint): cstring {.cdecl, importc: "gsl_strerror", dynlib: libgsl.}
proc gsl_set_error_handler*(new_handler: ptr gsl_error_handler_t): ptr gsl_error_handler_t {. cdecl, importc: "gsl_set_error_handler", dynlib: libgsl.}
proc gsl_set_error_handler_off*(): ptr gsl_error_handler_t {.cdecl, importc: "gsl_set_error_handler_off", dynlib: libgsl.}
proc gsl_set_stream_handler*(new_handler: ptr gsl_stream_handler_t): ptr gsl_stream_handler_t {. cdecl, importc: "gsl_set_stream_handler", dynlib: libgsl.}
proc gsl_set_stream*(new_stream: ptr FILE): ptr FILE {.cdecl, importc: "gsl_set_stream", dynlib: libgsl.}
proc gsl_qrng_alloc*(T: ptr gsl_qrng_type; dimension: cuint): ptr gsl_qrng {.cdecl, importc: "gsl_qrng_alloc", dynlib: libgsl.}
proc gsl_qrng_memcpy*(dest: ptr gsl_qrng; src: ptr gsl_qrng): cint {.cdecl, importc: "gsl_qrng_memcpy", dynlib: libgsl.}
proc gsl_qrng_clone*(q: ptr gsl_qrng): ptr gsl_qrng {.cdecl, importc: "gsl_qrng_clone", dynlib: libgsl.}
proc gsl_qrng_free*(q: ptr gsl_qrng) {.cdecl, importc: "gsl_qrng_free", dynlib: libgsl.}
proc gsl_qrng_init*(q: ptr gsl_qrng) {.cdecl, importc: "gsl_qrng_init", dynlib: libgsl.}
proc gsl_qrng_name*(q: ptr gsl_qrng): cstring {.cdecl, importc: "gsl_qrng_name", dynlib: libgsl.}
proc gsl_qrng_size*(q: ptr gsl_qrng): csize_t {.cdecl, importc: "gsl_qrng_size", dynlib: libgsl.}
proc gsl_qrng_state*(q: ptr gsl_qrng): pointer {.cdecl, importc: "gsl_qrng_state", dynlib: libgsl.}
proc gsl_qrng_get*(q: ptr gsl_qrng; x: ptr cdouble): cint {.cdecl, importc: "gsl_qrng_get", dynlib: libgsl.}

var gsl_qrng_niederreiter_2* {.importc: "gsl_qrng_niederreiter_2", dynlib: libgsl.}: ptr gsl_qrng_type

var gsl_qrng_sobol* {.importc: "gsl_qrng_sobol", dynlib: libgsl.}: ptr gsl_qrng_type

var gsl_qrng_halton* {.importc: "gsl_qrng_halton", dynlib: libgsl.}: ptr gsl_qrng_type

var gsl_qrng_reversehalton* {.importc: "gsl_qrng_reversehalton", dynlib: libgsl.}: ptr gsl_qrng_type

