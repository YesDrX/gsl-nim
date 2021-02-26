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

  gsl_permutation_struct* {.bycopy.} = object
    size*: csize_t
    data*: ptr csize_t

  gsl_permutation* = gsl_permutation_struct

proc gsl_error*(reason: cstring; file: cstring; line: cint; gsl_errno: cint) {.cdecl, importc: "gsl_error", dynlib: libgsl.}
proc gsl_stream_printf*(label: cstring; file: cstring; line: cint; reason: cstring) {. cdecl, importc: "gsl_stream_printf", dynlib: libgsl.}
proc gsl_strerror*(gsl_errno: cint): cstring {.cdecl, importc: "gsl_strerror", dynlib: libgsl.}
proc gsl_set_error_handler*(new_handler: ptr gsl_error_handler_t): ptr gsl_error_handler_t {. cdecl, importc: "gsl_set_error_handler", dynlib: libgsl.}
proc gsl_set_error_handler_off*(): ptr gsl_error_handler_t {.cdecl, importc: "gsl_set_error_handler_off", dynlib: libgsl.}
proc gsl_set_stream_handler*(new_handler: ptr gsl_stream_handler_t): ptr gsl_stream_handler_t {. cdecl, importc: "gsl_set_stream_handler", dynlib: libgsl.}
proc gsl_set_stream*(new_stream: ptr FILE): ptr FILE {.cdecl, importc: "gsl_set_stream", dynlib: libgsl.}
proc gsl_permutation_alloc*(n: csize_t): ptr gsl_permutation {.cdecl, importc: "gsl_permutation_alloc", dynlib: libgsl.}
proc gsl_permutation_calloc*(n: csize_t): ptr gsl_permutation {.cdecl, importc: "gsl_permutation_calloc", dynlib: libgsl.}
proc gsl_permutation_init*(p: ptr gsl_permutation) {.cdecl, importc: "gsl_permutation_init", dynlib: libgsl.}
proc gsl_permutation_free*(p: ptr gsl_permutation) {.cdecl, importc: "gsl_permutation_free", dynlib: libgsl.}
proc gsl_permutation_memcpy*(dest: ptr gsl_permutation; src: ptr gsl_permutation): cint {. cdecl, importc: "gsl_permutation_memcpy", dynlib: libgsl.}
proc gsl_permutation_fread*(stream: ptr FILE; p: ptr gsl_permutation): cint {.cdecl, importc: "gsl_permutation_fread", dynlib: libgsl.}
proc gsl_permutation_fwrite*(stream: ptr FILE; p: ptr gsl_permutation): cint {.cdecl, importc: "gsl_permutation_fwrite", dynlib: libgsl.}
proc gsl_permutation_fscanf*(stream: ptr FILE; p: ptr gsl_permutation): cint {.cdecl, importc: "gsl_permutation_fscanf", dynlib: libgsl.}
proc gsl_permutation_fprintf*(stream: ptr FILE; p: ptr gsl_permutation; format: cstring): cint {. cdecl, importc: "gsl_permutation_fprintf", dynlib: libgsl.}
proc gsl_permutation_size*(p: ptr gsl_permutation): csize_t {.cdecl, importc: "gsl_permutation_size", dynlib: libgsl.}
proc gsl_permutation_data*(p: ptr gsl_permutation): ptr csize_t {.cdecl, importc: "gsl_permutation_data", dynlib: libgsl.}
proc gsl_permutation_swap*(p: ptr gsl_permutation; i: csize_t; j: csize_t): cint {.cdecl, importc: "gsl_permutation_swap", dynlib: libgsl.}
proc gsl_permutation_valid*(p: ptr gsl_permutation): cint {.cdecl, importc: "gsl_permutation_valid", dynlib: libgsl.}
proc gsl_permutation_reverse*(p: ptr gsl_permutation) {.cdecl, importc: "gsl_permutation_reverse", dynlib: libgsl.}
proc gsl_permutation_inverse*(inv: ptr gsl_permutation; p: ptr gsl_permutation): cint {. cdecl, importc: "gsl_permutation_inverse", dynlib: libgsl.}
proc gsl_permutation_next*(p: ptr gsl_permutation): cint {.cdecl, importc: "gsl_permutation_next", dynlib: libgsl.}
proc gsl_permutation_prev*(p: ptr gsl_permutation): cint {.cdecl, importc: "gsl_permutation_prev", dynlib: libgsl.}
proc gsl_permutation_mul*(p: ptr gsl_permutation; pa: ptr gsl_permutation; pb: ptr gsl_permutation): cint {.cdecl, importc: "gsl_permutation_mul", dynlib: libgsl.}
proc gsl_permutation_linear_to_canonical*(q: ptr gsl_permutation; p: ptr gsl_permutation): cint {.cdecl,  importc: "gsl_permutation_linear_to_canonical",  dynlib: libgsl.}
proc gsl_permutation_canonical_to_linear*(p: ptr gsl_permutation; q: ptr gsl_permutation): cint {.cdecl,  importc: "gsl_permutation_canonical_to_linear",  dynlib: libgsl.}
proc gsl_permutation_inversions*(p: ptr gsl_permutation): csize_t {.cdecl, importc: "gsl_permutation_inversions", dynlib: libgsl.}
proc gsl_permutation_linear_cycles*(p: ptr gsl_permutation): csize_t {.cdecl, importc: "gsl_permutation_linear_cycles", dynlib: libgsl.}
proc gsl_permutation_canonical_cycles*(q: ptr gsl_permutation): csize_t {.cdecl, importc: "gsl_permutation_canonical_cycles", dynlib: libgsl.}
proc gsl_permutation_get*(p: ptr gsl_permutation; i: csize_t): csize_t {.cdecl, importc: "gsl_permutation_get", dynlib: libgsl.}
proc gsl_sort_long_double*(data: ptr clongdouble; stride: csize_t; n: csize_t) {.cdecl, importc: "gsl_sort_long_double", dynlib: libgsl.}
proc gsl_sort2_long_double*(data1: ptr clongdouble; stride1: csize_t;   data2: ptr clongdouble; stride2: csize_t; n: csize_t) {. cdecl, importc: "gsl_sort2_long_double", dynlib: libgsl.}
proc gsl_sort_long_double_index*(p: ptr csize_t; data: ptr clongdouble; stride: csize_t; n: csize_t) {.cdecl, importc: "gsl_sort_long_double_index", dynlib: libgsl.}
proc gsl_sort_long_double_smallest*(dest: ptr clongdouble; k: csize_t;  src: ptr clongdouble; stride: csize_t; n: csize_t): cint {. cdecl, importc: "gsl_sort_long_double_smallest", dynlib: libgsl.}
proc gsl_sort_long_double_smallest_index*(p: ptr csize_t; k: csize_t; src: ptr clongdouble; stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_long_double_smallest_index", dynlib: libgsl.}
proc gsl_sort_long_double_largest*(dest: ptr clongdouble; k: csize_t; src: ptr clongdouble; stride: csize_t; n: csize_t): cint {. cdecl, importc: "gsl_sort_long_double_largest", dynlib: libgsl.}
proc gsl_sort_long_double_largest_index*(p: ptr csize_t; k: csize_t; src: ptr clongdouble; stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_long_double_largest_index", dynlib: libgsl.}
proc gsl_sort*(data: ptr cdouble; stride: csize_t; n: csize_t) {.cdecl, importc: "gsl_sort", dynlib: libgsl.}
proc gsl_sort2*(data1: ptr cdouble; stride1: csize_t; data2: ptr cdouble; stride2: csize_t; n: csize_t) {.cdecl, importc: "gsl_sort2", dynlib: libgsl.}
proc gsl_sort_index*(p: ptr csize_t; data: ptr cdouble; stride: csize_t; n: csize_t) {. cdecl, importc: "gsl_sort_index", dynlib: libgsl.}
proc gsl_sort_smallest*(dest: ptr cdouble; k: csize_t; src: ptr cdouble; stride: csize_t;   n: csize_t): cint {.cdecl, importc: "gsl_sort_smallest",  dynlib: libgsl.}
proc gsl_sort_smallest_index*(p: ptr csize_t; k: csize_t; src: ptr cdouble;  stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_smallest_index", dynlib: libgsl.}
proc gsl_sort_largest*(dest: ptr cdouble; k: csize_t; src: ptr cdouble; stride: csize_t;  n: csize_t): cint {.cdecl, importc: "gsl_sort_largest", dynlib: libgsl.}
proc gsl_sort_largest_index*(p: ptr csize_t; k: csize_t; src: ptr cdouble; stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_largest_index", dynlib: libgsl.}
proc gsl_sort_float*(data: ptr cfloat; stride: csize_t; n: csize_t) {.cdecl, importc: "gsl_sort_float", dynlib: libgsl.}
proc gsl_sort2_float*(data1: ptr cfloat; stride1: csize_t; data2: ptr cfloat; stride2: csize_t; n: csize_t) {.cdecl, importc: "gsl_sort2_float", dynlib: libgsl.}
proc gsl_sort_float_index*(p: ptr csize_t; data: ptr cfloat; stride: csize_t; n: csize_t) {. cdecl, importc: "gsl_sort_float_index", dynlib: libgsl.}
proc gsl_sort_float_smallest*(dest: ptr cfloat; k: csize_t; src: ptr cfloat;  stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_float_smallest", dynlib: libgsl.}
proc gsl_sort_float_smallest_index*(p: ptr csize_t; k: csize_t; src: ptr cfloat;  stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_float_smallest_index", dynlib: libgsl.}
proc gsl_sort_float_largest*(dest: ptr cfloat; k: csize_t; src: ptr cfloat; stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_float_largest", dynlib: libgsl.}
proc gsl_sort_float_largest_index*(p: ptr csize_t; k: csize_t; src: ptr cfloat; stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_float_largest_index", dynlib: libgsl.}
proc gsl_sort_ulong*(data: ptr culong; stride: csize_t; n: csize_t) {.cdecl, importc: "gsl_sort_ulong", dynlib: libgsl.}
proc gsl_sort2_ulong*(data1: ptr culong; stride1: csize_t; data2: ptr culong; stride2: csize_t; n: csize_t) {.cdecl, importc: "gsl_sort2_ulong", dynlib: libgsl.}
proc gsl_sort_ulong_index*(p: ptr csize_t; data: ptr culong; stride: csize_t; n: csize_t) {. cdecl, importc: "gsl_sort_ulong_index", dynlib: libgsl.}
proc gsl_sort_ulong_smallest*(dest: ptr culong; k: csize_t; src: ptr culong;  stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_ulong_smallest", dynlib: libgsl.}
proc gsl_sort_ulong_smallest_index*(p: ptr csize_t; k: csize_t; src: ptr culong;  stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_ulong_smallest_index", dynlib: libgsl.}
proc gsl_sort_ulong_largest*(dest: ptr culong; k: csize_t; src: ptr culong; stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_ulong_largest", dynlib: libgsl.}
proc gsl_sort_ulong_largest_index*(p: ptr csize_t; k: csize_t; src: ptr culong; stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_ulong_largest_index", dynlib: libgsl.}
proc gsl_sort_long*(data: ptr clong; stride: csize_t; n: csize_t) {.cdecl, importc: "gsl_sort_long", dynlib: libgsl.}
proc gsl_sort2_long*(data1: ptr clong; stride1: csize_t; data2: ptr clong;   stride2: csize_t; n: csize_t) {.cdecl, importc: "gsl_sort2_long", dynlib: libgsl.}
proc gsl_sort_long_index*(p: ptr csize_t; data: ptr clong; stride: csize_t; n: csize_t) {. cdecl, importc: "gsl_sort_long_index", dynlib: libgsl.}
proc gsl_sort_long_smallest*(dest: ptr clong; k: csize_t; src: ptr clong; stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_long_smallest", dynlib: libgsl.}
proc gsl_sort_long_smallest_index*(p: ptr csize_t; k: csize_t; src: ptr clong; stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_long_smallest_index", dynlib: libgsl.}
proc gsl_sort_long_largest*(dest: ptr clong; k: csize_t; src: ptr clong; stride: csize_t;   n: csize_t): cint {.cdecl, importc: "gsl_sort_long_largest", dynlib: libgsl.}
proc gsl_sort_long_largest_index*(p: ptr csize_t; k: csize_t; src: ptr clong; stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_long_largest_index", dynlib: libgsl.}
proc gsl_sort_uint*(data: ptr cuint; stride: csize_t; n: csize_t) {.cdecl, importc: "gsl_sort_uint", dynlib: libgsl.}
proc gsl_sort2_uint*(data1: ptr cuint; stride1: csize_t; data2: ptr cuint;   stride2: csize_t; n: csize_t) {.cdecl, importc: "gsl_sort2_uint", dynlib: libgsl.}
proc gsl_sort_uint_index*(p: ptr csize_t; data: ptr cuint; stride: csize_t; n: csize_t) {. cdecl, importc: "gsl_sort_uint_index", dynlib: libgsl.}
proc gsl_sort_uint_smallest*(dest: ptr cuint; k: csize_t; src: ptr cuint; stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_uint_smallest", dynlib: libgsl.}
proc gsl_sort_uint_smallest_index*(p: ptr csize_t; k: csize_t; src: ptr cuint; stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_uint_smallest_index", dynlib: libgsl.}
proc gsl_sort_uint_largest*(dest: ptr cuint; k: csize_t; src: ptr cuint; stride: csize_t;   n: csize_t): cint {.cdecl, importc: "gsl_sort_uint_largest", dynlib: libgsl.}
proc gsl_sort_uint_largest_index*(p: ptr csize_t; k: csize_t; src: ptr cuint; stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_uint_largest_index", dynlib: libgsl.}
proc gsl_sort_int*(data: ptr cint; stride: csize_t; n: csize_t) {.cdecl, importc: "gsl_sort_int", dynlib: libgsl.}
proc gsl_sort2_int*(data1: ptr cint; stride1: csize_t; data2: ptr cint; stride2: csize_t;  n: csize_t) {.cdecl, importc: "gsl_sort2_int", dynlib: libgsl.}
proc gsl_sort_int_index*(p: ptr csize_t; data: ptr cint; stride: csize_t; n: csize_t) {. cdecl, importc: "gsl_sort_int_index", dynlib: libgsl.}
proc gsl_sort_int_smallest*(dest: ptr cint; k: csize_t; src: ptr cint; stride: csize_t;   n: csize_t): cint {.cdecl, importc: "gsl_sort_int_smallest", dynlib: libgsl.}
proc gsl_sort_int_smallest_index*(p: ptr csize_t; k: csize_t; src: ptr cint; stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_int_smallest_index", dynlib: libgsl.}
proc gsl_sort_int_largest*(dest: ptr cint; k: csize_t; src: ptr cint; stride: csize_t;  n: csize_t): cint {.cdecl, importc: "gsl_sort_int_largest", dynlib: libgsl.}
proc gsl_sort_int_largest_index*(p: ptr csize_t; k: csize_t; src: ptr cint; stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_int_largest_index", dynlib: libgsl.}
proc gsl_sort_ushort*(data: ptr cushort; stride: csize_t; n: csize_t) {.cdecl, importc: "gsl_sort_ushort", dynlib: libgsl.}
proc gsl_sort2_ushort*(data1: ptr cushort; stride1: csize_t; data2: ptr cushort;  stride2: csize_t; n: csize_t) {.cdecl, importc: "gsl_sort2_ushort", dynlib: libgsl.}
proc gsl_sort_ushort_index*(p: ptr csize_t; data: ptr cushort; stride: csize_t;   n: csize_t) {.cdecl, importc: "gsl_sort_ushort_index", dynlib: libgsl.}
proc gsl_sort_ushort_smallest*(dest: ptr cushort; k: csize_t; src: ptr cushort;   stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_ushort_smallest", dynlib: libgsl.}
proc gsl_sort_ushort_smallest_index*(p: ptr csize_t; k: csize_t; src: ptr cushort; stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_ushort_smallest_index", dynlib: libgsl.}
proc gsl_sort_ushort_largest*(dest: ptr cushort; k: csize_t; src: ptr cushort;  stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_ushort_largest", dynlib: libgsl.}
proc gsl_sort_ushort_largest_index*(p: ptr csize_t; k: csize_t; src: ptr cushort;  stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_ushort_largest_index", dynlib: libgsl.}
proc gsl_sort_short*(data: ptr cshort; stride: csize_t; n: csize_t) {.cdecl, importc: "gsl_sort_short", dynlib: libgsl.}
proc gsl_sort2_short*(data1: ptr cshort; stride1: csize_t; data2: ptr cshort; stride2: csize_t; n: csize_t) {.cdecl, importc: "gsl_sort2_short", dynlib: libgsl.}
proc gsl_sort_short_index*(p: ptr csize_t; data: ptr cshort; stride: csize_t; n: csize_t) {. cdecl, importc: "gsl_sort_short_index", dynlib: libgsl.}
proc gsl_sort_short_smallest*(dest: ptr cshort; k: csize_t; src: ptr cshort;  stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_short_smallest", dynlib: libgsl.}
proc gsl_sort_short_smallest_index*(p: ptr csize_t; k: csize_t; src: ptr cshort;  stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_short_smallest_index", dynlib: libgsl.}
proc gsl_sort_short_largest*(dest: ptr cshort; k: csize_t; src: ptr cshort; stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_short_largest", dynlib: libgsl.}
proc gsl_sort_short_largest_index*(p: ptr csize_t; k: csize_t; src: ptr cshort; stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_short_largest_index", dynlib: libgsl.}
proc gsl_sort_uchar*(data: ptr cuchar; stride: csize_t; n: csize_t) {.cdecl, importc: "gsl_sort_uchar", dynlib: libgsl.}
proc gsl_sort2_uchar*(data1: ptr cuchar; stride1: csize_t; data2: ptr cuchar; stride2: csize_t; n: csize_t) {.cdecl, importc: "gsl_sort2_uchar", dynlib: libgsl.}
proc gsl_sort_uchar_index*(p: ptr csize_t; data: ptr cuchar; stride: csize_t; n: csize_t) {. cdecl, importc: "gsl_sort_uchar_index", dynlib: libgsl.}
proc gsl_sort_uchar_smallest*(dest: ptr cuchar; k: csize_t; src: ptr cuchar;  stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_uchar_smallest", dynlib: libgsl.}
proc gsl_sort_uchar_smallest_index*(p: ptr csize_t; k: csize_t; src: ptr cuchar;  stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_uchar_smallest_index", dynlib: libgsl.}
proc gsl_sort_uchar_largest*(dest: ptr cuchar; k: csize_t; src: ptr cuchar; stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_uchar_largest", dynlib: libgsl.}
proc gsl_sort_uchar_largest_index*(p: ptr csize_t; k: csize_t; src: ptr cuchar; stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_uchar_largest_index", dynlib: libgsl.}
proc gsl_sort_char*(data: cstring; stride: csize_t; n: csize_t) {.cdecl, importc: "gsl_sort_char", dynlib: libgsl.}
proc gsl_sort2_char*(data1: cstring; stride1: csize_t; data2: cstring;   stride2: csize_t; n: csize_t) {.cdecl, importc: "gsl_sort2_char", dynlib: libgsl.}
proc gsl_sort_char_index*(p: ptr csize_t; data: cstring; stride: csize_t; n: csize_t) {. cdecl, importc: "gsl_sort_char_index", dynlib: libgsl.}
proc gsl_sort_char_smallest*(dest: cstring; k: csize_t; src: cstring; stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_char_smallest", dynlib: libgsl.}
proc gsl_sort_char_smallest_index*(p: ptr csize_t; k: csize_t; src: cstring; stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_char_smallest_index", dynlib: libgsl.}
proc gsl_sort_char_largest*(dest: cstring; k: csize_t; src: cstring; stride: csize_t;   n: csize_t): cint {.cdecl, importc: "gsl_sort_char_largest", dynlib: libgsl.}
proc gsl_sort_char_largest_index*(p: ptr csize_t; k: csize_t; src: cstring; stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_sort_char_largest_index", dynlib: libgsl.}

var gsl_check_range* {.importc: "gsl_check_range", dynlib: libgsl.}: cint

