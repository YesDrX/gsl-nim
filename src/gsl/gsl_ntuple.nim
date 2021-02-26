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

  gsl_histogram* {.bycopy.} = object
    n*: csize_t
    range*: ptr cdouble
    bin*: ptr cdouble

  gsl_histogram_pdf* {.bycopy.} = object
    n*: csize_t
    range*: ptr cdouble
    sum*: ptr cdouble

  gsl_ntuple* {.bycopy.} = object
    file*: ptr FILE
    ntuple_data*: pointer
    size*: csize_t

  gsl_ntuple_select_fn* {.bycopy.} = object
    function*: proc (ntuple_data: pointer; params: pointer): cint {.cdecl.}
    params*: pointer

  gsl_ntuple_value_fn* {.bycopy.} = object
    function*: proc (ntuple_data: pointer; params: pointer): cdouble {.cdecl.}
    params*: pointer

proc gsl_error*(reason: cstring; file: cstring; line: cint; gsl_errno: cint) {.cdecl, importc: "gsl_error", dynlib: libgsl.}
proc gsl_stream_printf*(label: cstring; file: cstring; line: cint; reason: cstring) {. cdecl, importc: "gsl_stream_printf", dynlib: libgsl.}
proc gsl_strerror*(gsl_errno: cint): cstring {.cdecl, importc: "gsl_strerror", dynlib: libgsl.}
proc gsl_set_error_handler*(new_handler: ptr gsl_error_handler_t): ptr gsl_error_handler_t {. cdecl, importc: "gsl_set_error_handler", dynlib: libgsl.}
proc gsl_set_error_handler_off*(): ptr gsl_error_handler_t {.cdecl, importc: "gsl_set_error_handler_off", dynlib: libgsl.}
proc gsl_set_stream_handler*(new_handler: ptr gsl_stream_handler_t): ptr gsl_stream_handler_t {. cdecl, importc: "gsl_set_stream_handler", dynlib: libgsl.}
proc gsl_set_stream*(new_stream: ptr FILE): ptr FILE {.cdecl, importc: "gsl_set_stream", dynlib: libgsl.}
proc gsl_histogram_alloc*(n: csize_t): ptr gsl_histogram {.cdecl, importc: "gsl_histogram_alloc", dynlib: libgsl.}
proc gsl_histogram_calloc*(n: csize_t): ptr gsl_histogram {.cdecl, importc: "gsl_histogram_calloc", dynlib: libgsl.}
proc gsl_histogram_calloc_uniform*(n: csize_t; xmin: cdouble; xmax: cdouble): ptr gsl_histogram {. cdecl, importc: "gsl_histogram_calloc_uniform", dynlib: libgsl.}
proc gsl_histogram_free*(h: ptr gsl_histogram) {.cdecl, importc: "gsl_histogram_free", dynlib: libgsl.}
proc gsl_histogram_increment*(h: ptr gsl_histogram; x: cdouble): cint {.cdecl, importc: "gsl_histogram_increment", dynlib: libgsl.}
proc gsl_histogram_accumulate*(h: ptr gsl_histogram; x: cdouble; weight: cdouble): cint {. cdecl, importc: "gsl_histogram_accumulate", dynlib: libgsl.}
proc gsl_histogram_find*(h: ptr gsl_histogram; x: cdouble; i: ptr csize_t): cint {.cdecl, importc: "gsl_histogram_find", dynlib: libgsl.}
proc gsl_histogram_get*(h: ptr gsl_histogram; i: csize_t): cdouble {.cdecl, importc: "gsl_histogram_get", dynlib: libgsl.}
proc gsl_histogram_get_range*(h: ptr gsl_histogram; i: csize_t; lower: ptr cdouble;  upper: ptr cdouble): cint {.cdecl, importc: "gsl_histogram_get_range", dynlib: libgsl.}
proc gsl_histogram_max*(h: ptr gsl_histogram): cdouble {.cdecl, importc: "gsl_histogram_max", dynlib: libgsl.}
proc gsl_histogram_min*(h: ptr gsl_histogram): cdouble {.cdecl, importc: "gsl_histogram_min", dynlib: libgsl.}
proc gsl_histogram_bins*(h: ptr gsl_histogram): csize_t {.cdecl, importc: "gsl_histogram_bins", dynlib: libgsl.}
proc gsl_histogram_reset*(h: ptr gsl_histogram) {.cdecl, importc: "gsl_histogram_reset", dynlib: libgsl.}
proc gsl_histogram_calloc_range*(n: csize_t; range: ptr cdouble): ptr gsl_histogram {. cdecl, importc: "gsl_histogram_calloc_range", dynlib: libgsl.}
proc gsl_histogram_set_ranges*(h: ptr gsl_histogram; range: ptr cdouble; size: csize_t): cint {. cdecl, importc: "gsl_histogram_set_ranges", dynlib: libgsl.}
proc gsl_histogram_set_ranges_uniform*(h: ptr gsl_histogram; xmin: cdouble;   xmax: cdouble): cint {.cdecl, importc: "gsl_histogram_set_ranges_uniform", dynlib: libgsl.}
proc gsl_histogram_memcpy*(dest: ptr gsl_histogram; source: ptr gsl_histogram): cint {. cdecl, importc: "gsl_histogram_memcpy", dynlib: libgsl.}
proc gsl_histogram_clone*(source: ptr gsl_histogram): ptr gsl_histogram {.cdecl, importc: "gsl_histogram_clone", dynlib: libgsl.}
proc gsl_histogram_max_val*(h: ptr gsl_histogram): cdouble {.cdecl, importc: "gsl_histogram_max_val", dynlib: libgsl.}
proc gsl_histogram_max_bin*(h: ptr gsl_histogram): csize_t {.cdecl, importc: "gsl_histogram_max_bin", dynlib: libgsl.}
proc gsl_histogram_min_val*(h: ptr gsl_histogram): cdouble {.cdecl, importc: "gsl_histogram_min_val", dynlib: libgsl.}
proc gsl_histogram_min_bin*(h: ptr gsl_histogram): csize_t {.cdecl, importc: "gsl_histogram_min_bin", dynlib: libgsl.}
proc gsl_histogram_equal_bins_p*(h1: ptr gsl_histogram; h2: ptr gsl_histogram): cint {. cdecl, importc: "gsl_histogram_equal_bins_p", dynlib: libgsl.}
proc gsl_histogram_add*(h1: ptr gsl_histogram; h2: ptr gsl_histogram): cint {.cdecl, importc: "gsl_histogram_add", dynlib: libgsl.}
proc gsl_histogram_sub*(h1: ptr gsl_histogram; h2: ptr gsl_histogram): cint {.cdecl, importc: "gsl_histogram_sub", dynlib: libgsl.}
proc gsl_histogram_mul*(h1: ptr gsl_histogram; h2: ptr gsl_histogram): cint {.cdecl, importc: "gsl_histogram_mul", dynlib: libgsl.}
proc gsl_histogram_div*(h1: ptr gsl_histogram; h2: ptr gsl_histogram): cint {.cdecl, importc: "gsl_histogram_div", dynlib: libgsl.}
proc gsl_histogram_scale*(h: ptr gsl_histogram; scale: cdouble): cint {.cdecl, importc: "gsl_histogram_scale", dynlib: libgsl.}
proc gsl_histogram_shift*(h: ptr gsl_histogram; shift: cdouble): cint {.cdecl, importc: "gsl_histogram_shift", dynlib: libgsl.}
proc gsl_histogram_sigma*(h: ptr gsl_histogram): cdouble {.cdecl, importc: "gsl_histogram_sigma", dynlib: libgsl.}
proc gsl_histogram_mean*(h: ptr gsl_histogram): cdouble {.cdecl, importc: "gsl_histogram_mean", dynlib: libgsl.}
proc gsl_histogram_sum*(h: ptr gsl_histogram): cdouble {.cdecl, importc: "gsl_histogram_sum", dynlib: libgsl.}
proc gsl_histogram_fwrite*(stream: ptr FILE; h: ptr gsl_histogram): cint {.cdecl, importc: "gsl_histogram_fwrite", dynlib: libgsl.}
proc gsl_histogram_fread*(stream: ptr FILE; h: ptr gsl_histogram): cint {.cdecl, importc: "gsl_histogram_fread", dynlib: libgsl.}
proc gsl_histogram_fprintf*(stream: ptr FILE; h: ptr gsl_histogram;   range_format: cstring; bin_format: cstring): cint {.cdecl, importc: "gsl_histogram_fprintf", dynlib: libgsl.}
proc gsl_histogram_fscanf*(stream: ptr FILE; h: ptr gsl_histogram): cint {.cdecl, importc: "gsl_histogram_fscanf", dynlib: libgsl.}
proc gsl_histogram_pdf_alloc*(n: csize_t): ptr gsl_histogram_pdf {.cdecl, importc: "gsl_histogram_pdf_alloc", dynlib: libgsl.}
proc gsl_histogram_pdf_init*(p: ptr gsl_histogram_pdf; h: ptr gsl_histogram): cint {. cdecl, importc: "gsl_histogram_pdf_init", dynlib: libgsl.}
proc gsl_histogram_pdf_free*(p: ptr gsl_histogram_pdf) {.cdecl, importc: "gsl_histogram_pdf_free", dynlib: libgsl.}
proc gsl_histogram_pdf_sample*(p: ptr gsl_histogram_pdf; r: cdouble): cdouble {.cdecl, importc: "gsl_histogram_pdf_sample", dynlib: libgsl.}
proc gsl_ntuple_open*(filename: cstring; ntuple_data: pointer; size: csize_t): ptr gsl_ntuple {. cdecl, importc: "gsl_ntuple_open", dynlib: libgsl.}
proc gsl_ntuple_create*(filename: cstring; ntuple_data: pointer; size: csize_t): ptr gsl_ntuple {. cdecl, importc: "gsl_ntuple_create", dynlib: libgsl.}
proc gsl_ntuple_write*(ntuple: ptr gsl_ntuple): cint {.cdecl, importc: "gsl_ntuple_write", dynlib: libgsl.}
proc gsl_ntuple_read*(ntuple: ptr gsl_ntuple): cint {.cdecl, importc: "gsl_ntuple_read", dynlib: libgsl.}
proc gsl_ntuple_bookdata*(ntuple: ptr gsl_ntuple): cint {.cdecl, importc: "gsl_ntuple_bookdata", dynlib: libgsl.}
proc gsl_ntuple_project*(h: ptr gsl_histogram; ntuple: ptr gsl_ntuple;    value_func: ptr gsl_ntuple_value_fn;    select_func: ptr gsl_ntuple_select_fn): cint {.cdecl, importc: "gsl_ntuple_project", dynlib: libgsl.}
proc gsl_ntuple_close*(ntuple: ptr gsl_ntuple): cint {.cdecl, importc: "gsl_ntuple_close", dynlib: libgsl.}
