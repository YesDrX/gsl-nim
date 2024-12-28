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
  gsl_histogram2d* {.bycopy.} = object
    nx*: csize_t
    ny*: csize_t
    xrange*: ptr cdouble
    yrange*: ptr cdouble
    bin*: ptr cdouble

  gsl_histogram2d_pdf* {.bycopy.} = object
    nx*: csize_t
    ny*: csize_t
    xrange*: ptr cdouble
    yrange*: ptr cdouble
    sum*: ptr cdouble

proc gsl_histogram2d_alloc*(nx: csize_t; ny: csize_t): ptr gsl_histogram2d {.cdecl, importc: "gsl_histogram2d_alloc", dynlib: libgsl.}
proc gsl_histogram2d_calloc*(nx: csize_t; ny: csize_t): ptr gsl_histogram2d {.cdecl, importc: "gsl_histogram2d_calloc", dynlib: libgsl.}
proc gsl_histogram2d_calloc_uniform*(nx: csize_t; ny: csize_t; xmin: cdouble; xmax: cdouble; ymin: cdouble; ymax: cdouble): ptr gsl_histogram2d {. cdecl, importc: "gsl_histogram2d_calloc_uniform", dynlib: libgsl.}
proc gsl_histogram2d_free*(h: ptr gsl_histogram2d) {.cdecl, importc: "gsl_histogram2d_free", dynlib: libgsl.}
proc gsl_histogram2d_increment*(h: ptr gsl_histogram2d; x: cdouble; y: cdouble): cint {. cdecl, importc: "gsl_histogram2d_increment", dynlib: libgsl.}
proc gsl_histogram2d_accumulate*(h: ptr gsl_histogram2d; x: cdouble; y: cdouble; weight: cdouble): cint {.cdecl, importc: "gsl_histogram2d_accumulate", dynlib: libgsl.}
proc gsl_histogram2d_find*(h: ptr gsl_histogram2d; x: cdouble; y: cdouble;  i: ptr csize_t; j: ptr csize_t): cint {.cdecl, importc: "gsl_histogram2d_find", dynlib: libgsl.}
proc gsl_histogram2d_get*(h: ptr gsl_histogram2d; i: csize_t; j: csize_t): cdouble {. cdecl, importc: "gsl_histogram2d_get", dynlib: libgsl.}
proc gsl_histogram2d_get_xrange*(h: ptr gsl_histogram2d; i: csize_t; xlower: ptr cdouble; xupper: ptr cdouble): cint {. cdecl, importc: "gsl_histogram2d_get_xrange", dynlib: libgsl.}
proc gsl_histogram2d_get_yrange*(h: ptr gsl_histogram2d; j: csize_t; ylower: ptr cdouble; yupper: ptr cdouble): cint {. cdecl, importc: "gsl_histogram2d_get_yrange", dynlib: libgsl.}
proc gsl_histogram2d_xmax*(h: ptr gsl_histogram2d): cdouble {.cdecl, importc: "gsl_histogram2d_xmax", dynlib: libgsl.}
proc gsl_histogram2d_xmin*(h: ptr gsl_histogram2d): cdouble {.cdecl, importc: "gsl_histogram2d_xmin", dynlib: libgsl.}
proc gsl_histogram2d_nx*(h: ptr gsl_histogram2d): csize_t {.cdecl, importc: "gsl_histogram2d_nx", dynlib: libgsl.}
proc gsl_histogram2d_ymax*(h: ptr gsl_histogram2d): cdouble {.cdecl, importc: "gsl_histogram2d_ymax", dynlib: libgsl.}
proc gsl_histogram2d_ymin*(h: ptr gsl_histogram2d): cdouble {.cdecl, importc: "gsl_histogram2d_ymin", dynlib: libgsl.}
proc gsl_histogram2d_ny*(h: ptr gsl_histogram2d): csize_t {.cdecl, importc: "gsl_histogram2d_ny", dynlib: libgsl.}
proc gsl_histogram2d_reset*(h: ptr gsl_histogram2d) {.cdecl, importc: "gsl_histogram2d_reset", dynlib: libgsl.}
proc gsl_histogram2d_calloc_range*(nx: csize_t; ny: csize_t; xrange: ptr cdouble; yrange: ptr cdouble): ptr gsl_histogram2d {.cdecl, importc: "gsl_histogram2d_calloc_range", dynlib: libgsl.}
proc gsl_histogram2d_set_ranges_uniform*(h: ptr gsl_histogram2d; xmin: cdouble; xmax: cdouble; ymin: cdouble; ymax: cdouble): cint {. cdecl, importc: "gsl_histogram2d_set_ranges_uniform", dynlib: libgsl.}
proc gsl_histogram2d_set_ranges*(h: ptr gsl_histogram2d; xrange: ptr cdouble; xsize: csize_t; yrange: ptr cdouble; ysize: csize_t): cint {. cdecl, importc: "gsl_histogram2d_set_ranges", dynlib: libgsl.}
proc gsl_histogram2d_memcpy*(dest: ptr gsl_histogram2d; source: ptr gsl_histogram2d): cint {. cdecl, importc: "gsl_histogram2d_memcpy", dynlib: libgsl.}
proc gsl_histogram2d_clone*(source: ptr gsl_histogram2d): ptr gsl_histogram2d {.cdecl, importc: "gsl_histogram2d_clone", dynlib: libgsl.}
proc gsl_histogram2d_max_val*(h: ptr gsl_histogram2d): cdouble {.cdecl, importc: "gsl_histogram2d_max_val", dynlib: libgsl.}
proc gsl_histogram2d_max_bin*(h: ptr gsl_histogram2d; i: ptr csize_t; j: ptr csize_t) {. cdecl, importc: "gsl_histogram2d_max_bin", dynlib: libgsl.}
proc gsl_histogram2d_min_val*(h: ptr gsl_histogram2d): cdouble {.cdecl, importc: "gsl_histogram2d_min_val", dynlib: libgsl.}
proc gsl_histogram2d_min_bin*(h: ptr gsl_histogram2d; i: ptr csize_t; j: ptr csize_t) {. cdecl, importc: "gsl_histogram2d_min_bin", dynlib: libgsl.}
proc gsl_histogram2d_xmean*(h: ptr gsl_histogram2d): cdouble {.cdecl, importc: "gsl_histogram2d_xmean", dynlib: libgsl.}
proc gsl_histogram2d_ymean*(h: ptr gsl_histogram2d): cdouble {.cdecl, importc: "gsl_histogram2d_ymean", dynlib: libgsl.}
proc gsl_histogram2d_xsigma*(h: ptr gsl_histogram2d): cdouble {.cdecl, importc: "gsl_histogram2d_xsigma", dynlib: libgsl.}
proc gsl_histogram2d_ysigma*(h: ptr gsl_histogram2d): cdouble {.cdecl, importc: "gsl_histogram2d_ysigma", dynlib: libgsl.}
proc gsl_histogram2d_cov*(h: ptr gsl_histogram2d): cdouble {.cdecl, importc: "gsl_histogram2d_cov", dynlib: libgsl.}
proc gsl_histogram2d_sum*(h: ptr gsl_histogram2d): cdouble {.cdecl, importc: "gsl_histogram2d_sum", dynlib: libgsl.}
proc gsl_histogram2d_equal_bins_p*(h1: ptr gsl_histogram2d; h2: ptr gsl_histogram2d): cint {. cdecl, importc: "gsl_histogram2d_equal_bins_p", dynlib: libgsl.}
proc gsl_histogram2d_add*(h1: ptr gsl_histogram2d; h2: ptr gsl_histogram2d): cint {. cdecl, importc: "gsl_histogram2d_add", dynlib: libgsl.}
proc gsl_histogram2d_sub*(h1: ptr gsl_histogram2d; h2: ptr gsl_histogram2d): cint {. cdecl, importc: "gsl_histogram2d_sub", dynlib: libgsl.}
proc gsl_histogram2d_mul*(h1: ptr gsl_histogram2d; h2: ptr gsl_histogram2d): cint {. cdecl, importc: "gsl_histogram2d_mul", dynlib: libgsl.}
proc gsl_histogram2d_div*(h1: ptr gsl_histogram2d; h2: ptr gsl_histogram2d): cint {. cdecl, importc: "gsl_histogram2d_div", dynlib: libgsl.}
proc gsl_histogram2d_scale*(h: ptr gsl_histogram2d; scale: cdouble): cint {.cdecl, importc: "gsl_histogram2d_scale", dynlib: libgsl.}
proc gsl_histogram2d_shift*(h: ptr gsl_histogram2d; shift: cdouble): cint {.cdecl, importc: "gsl_histogram2d_shift", dynlib: libgsl.}
proc gsl_histogram2d_fwrite*(stream: ptr FILE; h: ptr gsl_histogram2d): cint {.cdecl, importc: "gsl_histogram2d_fwrite", dynlib: libgsl.}
proc gsl_histogram2d_fread*(stream: ptr FILE; h: ptr gsl_histogram2d): cint {.cdecl, importc: "gsl_histogram2d_fread", dynlib: libgsl.}
proc gsl_histogram2d_fprintf*(stream: ptr FILE; h: ptr gsl_histogram2d;  range_format: cstring; bin_format: cstring): cint {. cdecl, importc: "gsl_histogram2d_fprintf", dynlib: libgsl.}
proc gsl_histogram2d_fscanf*(stream: ptr FILE; h: ptr gsl_histogram2d): cint {.cdecl, importc: "gsl_histogram2d_fscanf", dynlib: libgsl.}
proc gsl_histogram2d_pdf_alloc*(nx: csize_t; ny: csize_t): ptr gsl_histogram2d_pdf {. cdecl, importc: "gsl_histogram2d_pdf_alloc", dynlib: libgsl.}
proc gsl_histogram2d_pdf_init*(p: ptr gsl_histogram2d_pdf; h: ptr gsl_histogram2d): cint {. cdecl, importc: "gsl_histogram2d_pdf_init", dynlib: libgsl.}
proc gsl_histogram2d_pdf_free*(p: ptr gsl_histogram2d_pdf) {.cdecl, importc: "gsl_histogram2d_pdf_free", dynlib: libgsl.}
proc gsl_histogram2d_pdf_sample*(p: ptr gsl_histogram2d_pdf; r1: cdouble; r2: cdouble; x: ptr cdouble; y: ptr cdouble): cint {.cdecl, importc: "gsl_histogram2d_pdf_sample", dynlib: libgsl.}
