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
  gsl_histogram* {.bycopy.} = object
    n*: csize_t
    range*: ptr cdouble
    bin*: ptr cdouble

  gsl_histogram_pdf* {.bycopy.} = object
    n*: csize_t
    range*: ptr cdouble
    sum*: ptr cdouble

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
