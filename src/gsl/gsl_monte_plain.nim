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
  gsl_monte_function_struct* {.bycopy.} = object
    f*: proc (x_array: ptr cdouble; dim: csize_t; params: pointer): cdouble {.cdecl.}
    dim*: csize_t
    params*: pointer

  gsl_monte_function* = gsl_monte_function_struct

  gsl_error_handler_t* = proc (reason: cstring; file: cstring; line: cint; gsl_errno: cint): void {.cdecl.}
  gsl_stream_handler_t* = proc (label: cstring; file: cstring; line: cint;  reason: cstring): void {.cdecl.}

  gsl_rng_type* {.bycopy.} = object
    name*: cstring
    max*: culong
    min*: culong
    size*: csize_t
    set*: proc (state: pointer; seed: culong) {.cdecl.}
    get*: proc (state: pointer): culong {.cdecl.}
    get_double*: proc (state: pointer): cdouble {.cdecl.}

  gsl_rng* {.bycopy.} = object
    `type`*: ptr gsl_rng_type
    state*: pointer

  gsl_monte_plain_state* {.bycopy.} = object
    dim*: csize_t
    x*: ptr cdouble

proc gsl_error*(reason: cstring; file: cstring; line: cint; gsl_errno: cint) {.cdecl, importc: "gsl_error", dynlib: libgsl.}
proc gsl_stream_printf*(label: cstring; file: cstring; line: cint; reason: cstring) {. cdecl, importc: "gsl_stream_printf", dynlib: libgsl.}
proc gsl_strerror*(gsl_errno: cint): cstring {.cdecl, importc: "gsl_strerror", dynlib: libgsl.}
proc gsl_set_error_handler*(new_handler: ptr gsl_error_handler_t): ptr gsl_error_handler_t {. cdecl, importc: "gsl_set_error_handler", dynlib: libgsl.}
proc gsl_set_error_handler_off*(): ptr gsl_error_handler_t {.cdecl, importc: "gsl_set_error_handler_off", dynlib: libgsl.}
proc gsl_set_stream_handler*(new_handler: ptr gsl_stream_handler_t): ptr gsl_stream_handler_t {. cdecl, importc: "gsl_set_stream_handler", dynlib: libgsl.}
proc gsl_set_stream*(new_stream: ptr FILE): ptr FILE {.cdecl, importc: "gsl_set_stream", dynlib: libgsl.}
proc gsl_rng_types_setup*(): ptr ptr gsl_rng_type {.cdecl, importc: "gsl_rng_types_setup", dynlib: libgsl.}
proc gsl_rng_alloc*(T: ptr gsl_rng_type): ptr gsl_rng {.cdecl, importc: "gsl_rng_alloc", dynlib: libgsl.}
proc gsl_rng_memcpy*(dest: ptr gsl_rng; src: ptr gsl_rng): cint {.cdecl, importc: "gsl_rng_memcpy", dynlib: libgsl.}
proc gsl_rng_clone*(r: ptr gsl_rng): ptr gsl_rng {.cdecl, importc: "gsl_rng_clone", dynlib: libgsl.}
proc gsl_rng_free*(r: ptr gsl_rng) {.cdecl, importc: "gsl_rng_free", dynlib: libgsl.}
proc gsl_rng_set*(r: ptr gsl_rng; seed: culong) {.cdecl, importc: "gsl_rng_set", dynlib: libgsl.}
proc gsl_rng_max*(r: ptr gsl_rng): culong {.cdecl, importc: "gsl_rng_max", dynlib: libgsl.}
proc gsl_rng_min*(r: ptr gsl_rng): culong {.cdecl, importc: "gsl_rng_min", dynlib: libgsl.}
proc gsl_rng_name*(r: ptr gsl_rng): cstring {.cdecl, importc: "gsl_rng_name", dynlib: libgsl.}
proc gsl_rng_fread*(stream: ptr FILE; r: ptr gsl_rng): cint {.cdecl, importc: "gsl_rng_fread", dynlib: libgsl.}
proc gsl_rng_fwrite*(stream: ptr FILE; r: ptr gsl_rng): cint {.cdecl, importc: "gsl_rng_fwrite", dynlib: libgsl.}
proc gsl_rng_size*(r: ptr gsl_rng): csize_t {.cdecl, importc: "gsl_rng_size", dynlib: libgsl.}
proc gsl_rng_state*(r: ptr gsl_rng): pointer {.cdecl, importc: "gsl_rng_state", dynlib: libgsl.}
proc gsl_rng_print_state*(r: ptr gsl_rng) {.cdecl, importc: "gsl_rng_print_state",  dynlib: libgsl.}
proc gsl_rng_env_setup*(): ptr gsl_rng_type {.cdecl, importc: "gsl_rng_env_setup", dynlib: libgsl.}
proc gsl_rng_get*(r: ptr gsl_rng): culong {.cdecl, importc: "gsl_rng_get", dynlib: libgsl.}
proc gsl_rng_uniform*(r: ptr gsl_rng): cdouble {.cdecl, importc: "gsl_rng_uniform", dynlib: libgsl.}
proc gsl_rng_uniform_pos*(r: ptr gsl_rng): cdouble {.cdecl, importc: "gsl_rng_uniform_pos", dynlib: libgsl.}
proc gsl_rng_uniform_int*(r: ptr gsl_rng; n: culong): culong {.cdecl, importc: "gsl_rng_uniform_int", dynlib: libgsl.}
proc gsl_monte_plain_integrate*(f: ptr gsl_monte_function; xl: ptr cdouble; xu: ptr cdouble; dim: csize_t; calls: csize_t; r: ptr gsl_rng; state: ptr gsl_monte_plain_state; result: ptr cdouble; abserr: ptr cdouble): cint {.cdecl, importc: "gsl_monte_plain_integrate", dynlib: libgsl.}
proc gsl_monte_plain_alloc*(dim: csize_t): ptr gsl_monte_plain_state {.cdecl, importc: "gsl_monte_plain_alloc", dynlib: libgsl.}
proc gsl_monte_plain_init*(state: ptr gsl_monte_plain_state): cint {.cdecl, importc: "gsl_monte_plain_init", dynlib: libgsl.}
proc gsl_monte_plain_free*(state: ptr gsl_monte_plain_state) {.cdecl, importc: "gsl_monte_plain_free", dynlib: libgsl.}

var gsl_rng_borosh13* {.importc: "gsl_rng_borosh13", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_coveyou* {.importc: "gsl_rng_coveyou", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_cmrg* {.importc: "gsl_rng_cmrg", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_fishman18* {.importc: "gsl_rng_fishman18", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_fishman20* {.importc: "gsl_rng_fishman20", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_fishman2x* {.importc: "gsl_rng_fishman2x", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_gfsr4* {.importc: "gsl_rng_gfsr4", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_knuthran* {.importc: "gsl_rng_knuthran", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_knuthran2* {.importc: "gsl_rng_knuthran2", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_knuthran2002* {.importc: "gsl_rng_knuthran2002", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_lecuyer21* {.importc: "gsl_rng_lecuyer21", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_minstd* {.importc: "gsl_rng_minstd", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_mrg* {.importc: "gsl_rng_mrg", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_mt19937* {.importc: "gsl_rng_mt19937", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_mt19937_1999* {.importc: "gsl_rng_mt19937_1999", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_mt19937_1998* {.importc: "gsl_rng_mt19937_1998", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_r250* {.importc: "gsl_rng_r250", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_ran0* {.importc: "gsl_rng_ran0", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_ran1* {.importc: "gsl_rng_ran1", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_ran2* {.importc: "gsl_rng_ran2", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_ran3* {.importc: "gsl_rng_ran3", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_rand* {.importc: "gsl_rng_rand", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_rand48* {.importc: "gsl_rng_rand48", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_random128_bsd* {.importc: "gsl_rng_random128_bsd", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_random128_glibc2* {.importc: "gsl_rng_random128_glibc2", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_random128_libc5* {.importc: "gsl_rng_random128_libc5", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_random256_bsd* {.importc: "gsl_rng_random256_bsd", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_random256_glibc2* {.importc: "gsl_rng_random256_glibc2", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_random256_libc5* {.importc: "gsl_rng_random256_libc5", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_random32_bsd* {.importc: "gsl_rng_random32_bsd", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_random32_glibc2* {.importc: "gsl_rng_random32_glibc2", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_random32_libc5* {.importc: "gsl_rng_random32_libc5", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_random64_bsd* {.importc: "gsl_rng_random64_bsd", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_random64_glibc2* {.importc: "gsl_rng_random64_glibc2", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_random64_libc5* {.importc: "gsl_rng_random64_libc5", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_random8_bsd* {.importc: "gsl_rng_random8_bsd", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_random8_glibc2* {.importc: "gsl_rng_random8_glibc2", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_random8_libc5* {.importc: "gsl_rng_random8_libc5", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_random_bsd* {.importc: "gsl_rng_random_bsd", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_random_glibc2* {.importc: "gsl_rng_random_glibc2", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_random_libc5* {.importc: "gsl_rng_random_libc5", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_randu* {.importc: "gsl_rng_randu", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_ranf* {.importc: "gsl_rng_ranf", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_ranlux* {.importc: "gsl_rng_ranlux", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_ranlux389* {.importc: "gsl_rng_ranlux389", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_ranlxd1* {.importc: "gsl_rng_ranlxd1", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_ranlxd2* {.importc: "gsl_rng_ranlxd2", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_ranlxs0* {.importc: "gsl_rng_ranlxs0", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_ranlxs1* {.importc: "gsl_rng_ranlxs1", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_ranlxs2* {.importc: "gsl_rng_ranlxs2", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_ranmar* {.importc: "gsl_rng_ranmar", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_slatec* {.importc: "gsl_rng_slatec", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_taus* {.importc: "gsl_rng_taus", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_taus2* {.importc: "gsl_rng_taus2", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_taus113* {.importc: "gsl_rng_taus113", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_transputer* {.importc: "gsl_rng_transputer", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_tt800* {.importc: "gsl_rng_tt800", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_uni* {.importc: "gsl_rng_uni", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_uni32* {.importc: "gsl_rng_uni32", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_vax* {.importc: "gsl_rng_vax", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_waterman14* {.importc: "gsl_rng_waterman14", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_zuf* {.importc: "gsl_rng_zuf", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_default* {.importc: "gsl_rng_default", dynlib: libgsl.}: ptr gsl_rng_type

var gsl_rng_default_seed* {.importc: "gsl_rng_default_seed", dynlib: libgsl.}: culong

