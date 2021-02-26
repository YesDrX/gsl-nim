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
  CBLAS_ORDER* {.size: sizeof(cint).} = enum
    CblasRowMajor = 101, CblasColMajor = 102

  CBLAS_TRANSPOSE* {.size: sizeof(cint).} = enum
    CblasNoTrans = 111, CblasTrans = 112, CblasConjTrans = 113

  CBLAS_UPLO* {.size: sizeof(cint).} = enum
    CblasUpper = 121, CblasLower = 122

  CBLAS_DIAG* {.size: sizeof(cint).} = enum
    CblasNonUnit = 131, CblasUnit = 132

  CBLAS_SIDE* {.size: sizeof(cint).} = enum
    CblasLeft = 141, CblasRight = 142

proc cblas_sdsdot*(N: cint; alpha: cfloat; X: ptr cfloat; incX: cint; Y: ptr cfloat; incY: cint): cfloat {.cdecl, importc: "cblas_sdsdot", dynlib: libgsl.}
proc cblas_dsdot*(N: cint; X: ptr cfloat; incX: cint; Y: ptr cfloat; incY: cint): cdouble {. cdecl, importc: "cblas_dsdot", dynlib: libgsl.}
proc cblas_sdot*(N: cint; X: ptr cfloat; incX: cint; Y: ptr cfloat; incY: cint): cfloat {. cdecl, importc: "cblas_sdot", dynlib: libgsl.}
proc cblas_ddot*(N: cint; X: ptr cdouble; incX: cint; Y: ptr cdouble; incY: cint): cdouble {. cdecl, importc: "cblas_ddot", dynlib: libgsl.}
proc cblas_cdotu_sub*(N: cint; X: pointer; incX: cint; Y: pointer; incY: cint; dotu: pointer) {.cdecl, importc: "cblas_cdotu_sub", dynlib: libgsl.}
proc cblas_cdotc_sub*(N: cint; X: pointer; incX: cint; Y: pointer; incY: cint; dotc: pointer) {.cdecl, importc: "cblas_cdotc_sub", dynlib: libgsl.}
proc cblas_zdotu_sub*(N: cint; X: pointer; incX: cint; Y: pointer; incY: cint; dotu: pointer) {.cdecl, importc: "cblas_zdotu_sub", dynlib: libgsl.}
proc cblas_zdotc_sub*(N: cint; X: pointer; incX: cint; Y: pointer; incY: cint; dotc: pointer) {.cdecl, importc: "cblas_zdotc_sub", dynlib: libgsl.}
proc cblas_snrm2*(N: cint; X: ptr cfloat; incX: cint): cfloat {.cdecl, importc: "cblas_snrm2", dynlib: libgsl.}
proc cblas_sasum*(N: cint; X: ptr cfloat; incX: cint): cfloat {.cdecl, importc: "cblas_sasum", dynlib: libgsl.}
proc cblas_dnrm2*(N: cint; X: ptr cdouble; incX: cint): cdouble {.cdecl, importc: "cblas_dnrm2", dynlib: libgsl.}
proc cblas_dasum*(N: cint; X: ptr cdouble; incX: cint): cdouble {.cdecl, importc: "cblas_dasum", dynlib: libgsl.}
proc cblas_scnrm2*(N: cint; X: pointer; incX: cint): cfloat {.cdecl, importc: "cblas_scnrm2", dynlib: libgsl.}
proc cblas_scasum*(N: cint; X: pointer; incX: cint): cfloat {.cdecl, importc: "cblas_scasum", dynlib: libgsl.}
proc cblas_dznrm2*(N: cint; X: pointer; incX: cint): cdouble {.cdecl, importc: "cblas_dznrm2", dynlib: libgsl.}
proc cblas_dzasum*(N: cint; X: pointer; incX: cint): cdouble {.cdecl, importc: "cblas_dzasum", dynlib: libgsl.}
proc cblas_isamax*(N: cint; X: ptr cfloat; incX: cint): csize_t {.cdecl, importc: "cblas_isamax", dynlib: libgsl.}
proc cblas_idamax*(N: cint; X: ptr cdouble; incX: cint): csize_t {.cdecl, importc: "cblas_idamax", dynlib: libgsl.}
proc cblas_icamax*(N: cint; X: pointer; incX: cint): csize_t {.cdecl, importc: "cblas_icamax", dynlib: libgsl.}
proc cblas_izamax*(N: cint; X: pointer; incX: cint): csize_t {.cdecl, importc: "cblas_izamax", dynlib: libgsl.}
proc cblas_sswap*(N: cint; X: ptr cfloat; incX: cint; Y: ptr cfloat; incY: cint) {.cdecl, importc: "cblas_sswap", dynlib: libgsl.}
proc cblas_scopy*(N: cint; X: ptr cfloat; incX: cint; Y: ptr cfloat; incY: cint) {.cdecl, importc: "cblas_scopy", dynlib: libgsl.}
proc cblas_saxpy*(N: cint; alpha: cfloat; X: ptr cfloat; incX: cint; Y: ptr cfloat; incY: cint) {.cdecl, importc: "cblas_saxpy", dynlib: libgsl.}
proc cblas_dswap*(N: cint; X: ptr cdouble; incX: cint; Y: ptr cdouble; incY: cint) {.cdecl, importc: "cblas_dswap", dynlib: libgsl.}
proc cblas_dcopy*(N: cint; X: ptr cdouble; incX: cint; Y: ptr cdouble; incY: cint) {.cdecl, importc: "cblas_dcopy", dynlib: libgsl.}
proc cblas_daxpy*(N: cint; alpha: cdouble; X: ptr cdouble; incX: cint; Y: ptr cdouble; incY: cint) {.cdecl, importc: "cblas_daxpy", dynlib: libgsl.}
proc cblas_cswap*(N: cint; X: pointer; incX: cint; Y: pointer; incY: cint) {.cdecl, importc: "cblas_cswap", dynlib: libgsl.}
proc cblas_ccopy*(N: cint; X: pointer; incX: cint; Y: pointer; incY: cint) {.cdecl, importc: "cblas_ccopy", dynlib: libgsl.}
proc cblas_caxpy*(N: cint; alpha: pointer; X: pointer; incX: cint; Y: pointer; incY: cint) {. cdecl, importc: "cblas_caxpy", dynlib: libgsl.}
proc cblas_zswap*(N: cint; X: pointer; incX: cint; Y: pointer; incY: cint) {.cdecl, importc: "cblas_zswap", dynlib: libgsl.}
proc cblas_zcopy*(N: cint; X: pointer; incX: cint; Y: pointer; incY: cint) {.cdecl, importc: "cblas_zcopy", dynlib: libgsl.}
proc cblas_zaxpy*(N: cint; alpha: pointer; X: pointer; incX: cint; Y: pointer; incY: cint) {. cdecl, importc: "cblas_zaxpy", dynlib: libgsl.}
proc cblas_srotg*(a: ptr cfloat; b: ptr cfloat; c: ptr cfloat; s: ptr cfloat) {.cdecl, importc: "cblas_srotg", dynlib: libgsl.}
proc cblas_srotmg*(d1: ptr cfloat; d2: ptr cfloat; b1: ptr cfloat; b2: cfloat; P: ptr cfloat) {. cdecl, importc: "cblas_srotmg", dynlib: libgsl.}
proc cblas_srot*(N: cint; X: ptr cfloat; incX: cint; Y: ptr cfloat; incY: cint; c: cfloat; s: cfloat) {.cdecl, importc: "cblas_srot", dynlib: libgsl.}
proc cblas_srotm*(N: cint; X: ptr cfloat; incX: cint; Y: ptr cfloat; incY: cint; P: ptr cfloat) {.cdecl, importc: "cblas_srotm", dynlib: libgsl.}
proc cblas_drotg*(a: ptr cdouble; b: ptr cdouble; c: ptr cdouble; s: ptr cdouble) {.cdecl, importc: "cblas_drotg", dynlib: libgsl.}
proc cblas_drotmg*(d1: ptr cdouble; d2: ptr cdouble; b1: ptr cdouble; b2: cdouble; P: ptr cdouble) {.cdecl, importc: "cblas_drotmg", dynlib: libgsl.}
proc cblas_drot*(N: cint; X: ptr cdouble; incX: cint; Y: ptr cdouble; incY: cint; c: cdouble; s: cdouble) {.cdecl, importc: "cblas_drot", dynlib: libgsl.}
proc cblas_drotm*(N: cint; X: ptr cdouble; incX: cint; Y: ptr cdouble; incY: cint; P: ptr cdouble) {.cdecl, importc: "cblas_drotm", dynlib: libgsl.}
proc cblas_sscal*(N: cint; alpha: cfloat; X: ptr cfloat; incX: cint) {.cdecl, importc: "cblas_sscal", dynlib: libgsl.}
proc cblas_dscal*(N: cint; alpha: cdouble; X: ptr cdouble; incX: cint) {.cdecl, importc: "cblas_dscal", dynlib: libgsl.}
proc cblas_cscal*(N: cint; alpha: pointer; X: pointer; incX: cint) {.cdecl, importc: "cblas_cscal", dynlib: libgsl.}
proc cblas_zscal*(N: cint; alpha: pointer; X: pointer; incX: cint) {.cdecl, importc: "cblas_zscal", dynlib: libgsl.}
proc cblas_csscal*(N: cint; alpha: cfloat; X: pointer; incX: cint) {.cdecl, importc: "cblas_csscal", dynlib: libgsl.}
proc cblas_zdscal*(N: cint; alpha: cdouble; X: pointer; incX: cint) {.cdecl, importc: "cblas_zdscal", dynlib: libgsl.}
proc cblas_sgemv*(order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; M: cint; N: cint; alpha: cfloat; A: ptr cfloat; lda: cint; X: ptr cfloat; incX: cint; beta: cfloat; Y: ptr cfloat; incY: cint) {.cdecl, importc: "cblas_sgemv", dynlib: libgsl.}
proc cblas_sgbmv*(order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; M: cint; N: cint; KL: cint; KU: cint; alpha: cfloat; A: ptr cfloat; lda: cint; X: ptr cfloat; incX: cint; beta: cfloat; Y: ptr cfloat; incY: cint) {. cdecl, importc: "cblas_sgbmv", dynlib: libgsl.}
proc cblas_strmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; A: ptr cfloat; lda: cint; X: ptr cfloat; incX: cint) {.cdecl, importc: "cblas_strmv", dynlib: libgsl.}
proc cblas_stbmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; K: cint; A: ptr cfloat; lda: cint; X: ptr cfloat; incX: cint) {.cdecl, importc: "cblas_stbmv", dynlib: libgsl.}
proc cblas_stpmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; Ap: ptr cfloat; X: ptr cfloat; incX: cint) {. cdecl, importc: "cblas_stpmv", dynlib: libgsl.}
proc cblas_strsv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; A: ptr cfloat; lda: cint; X: ptr cfloat; incX: cint) {.cdecl, importc: "cblas_strsv", dynlib: libgsl.}
proc cblas_stbsv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; K: cint; A: ptr cfloat; lda: cint; X: ptr cfloat; incX: cint) {.cdecl, importc: "cblas_stbsv", dynlib: libgsl.}
proc cblas_stpsv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; Ap: ptr cfloat; X: ptr cfloat; incX: cint) {. cdecl, importc: "cblas_stpsv", dynlib: libgsl.}
proc cblas_dgemv*(order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; M: cint; N: cint; alpha: cdouble; A: ptr cdouble; lda: cint; X: ptr cdouble; incX: cint; beta: cdouble; Y: ptr cdouble; incY: cint) {.cdecl, importc: "cblas_dgemv", dynlib: libgsl.}
proc cblas_dgbmv*(order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; M: cint; N: cint; KL: cint; KU: cint; alpha: cdouble; A: ptr cdouble; lda: cint; X: ptr cdouble; incX: cint; beta: cdouble; Y: ptr cdouble; incY: cint) {. cdecl, importc: "cblas_dgbmv", dynlib: libgsl.}
proc cblas_dtrmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; A: ptr cdouble; lda: cint; X: ptr cdouble; incX: cint) {.cdecl, importc: "cblas_dtrmv", dynlib: libgsl.}
proc cblas_dtbmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; K: cint; A: ptr cdouble; lda: cint; X: ptr cdouble; incX: cint) {.cdecl, importc: "cblas_dtbmv", dynlib: libgsl.}
proc cblas_dtpmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; Ap: ptr cdouble; X: ptr cdouble; incX: cint) {. cdecl, importc: "cblas_dtpmv", dynlib: libgsl.}
proc cblas_dtrsv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; A: ptr cdouble; lda: cint; X: ptr cdouble; incX: cint) {.cdecl, importc: "cblas_dtrsv", dynlib: libgsl.}
proc cblas_dtbsv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; K: cint; A: ptr cdouble; lda: cint; X: ptr cdouble; incX: cint) {.cdecl, importc: "cblas_dtbsv", dynlib: libgsl.}
proc cblas_dtpsv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; Ap: ptr cdouble; X: ptr cdouble; incX: cint) {. cdecl, importc: "cblas_dtpsv", dynlib: libgsl.}
proc cblas_cgemv*(order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; M: cint; N: cint; alpha: pointer; A: pointer; lda: cint; X: pointer; incX: cint; beta: pointer; Y: pointer; incY: cint) {.cdecl, importc: "cblas_cgemv", dynlib: libgsl.}
proc cblas_cgbmv*(order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; M: cint; N: cint; KL: cint; KU: cint; alpha: pointer; A: pointer; lda: cint; X: pointer; incX: cint; beta: pointer; Y: pointer; incY: cint) {.cdecl, importc: "cblas_cgbmv", dynlib: libgsl.}
proc cblas_ctrmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; A: pointer; lda: cint; X: pointer; incX: cint) {. cdecl, importc: "cblas_ctrmv", dynlib: libgsl.}
proc cblas_ctbmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; K: cint; A: pointer; lda: cint; X: pointer; incX: cint) {.cdecl, importc: "cblas_ctbmv", dynlib: libgsl.}
proc cblas_ctpmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; Ap: pointer; X: pointer; incX: cint) {.cdecl, importc: "cblas_ctpmv", dynlib: libgsl.}
proc cblas_ctrsv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; A: pointer; lda: cint; X: pointer; incX: cint) {. cdecl, importc: "cblas_ctrsv", dynlib: libgsl.}
proc cblas_ctbsv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; K: cint; A: pointer; lda: cint; X: pointer; incX: cint) {.cdecl, importc: "cblas_ctbsv", dynlib: libgsl.}
proc cblas_ctpsv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; Ap: pointer; X: pointer; incX: cint) {.cdecl, importc: "cblas_ctpsv", dynlib: libgsl.}
proc cblas_zgemv*(order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; M: cint; N: cint; alpha: pointer; A: pointer; lda: cint; X: pointer; incX: cint; beta: pointer; Y: pointer; incY: cint) {.cdecl, importc: "cblas_zgemv", dynlib: libgsl.}
proc cblas_zgbmv*(order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; M: cint; N: cint; KL: cint; KU: cint; alpha: pointer; A: pointer; lda: cint; X: pointer; incX: cint; beta: pointer; Y: pointer; incY: cint) {.cdecl, importc: "cblas_zgbmv", dynlib: libgsl.}
proc cblas_ztrmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; A: pointer; lda: cint; X: pointer; incX: cint) {. cdecl, importc: "cblas_ztrmv", dynlib: libgsl.}
proc cblas_ztbmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; K: cint; A: pointer; lda: cint; X: pointer; incX: cint) {.cdecl, importc: "cblas_ztbmv", dynlib: libgsl.}
proc cblas_ztpmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; Ap: pointer; X: pointer; incX: cint) {.cdecl, importc: "cblas_ztpmv", dynlib: libgsl.}
proc cblas_ztrsv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; A: pointer; lda: cint; X: pointer; incX: cint) {. cdecl, importc: "cblas_ztrsv", dynlib: libgsl.}
proc cblas_ztbsv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; K: cint; A: pointer; lda: cint; X: pointer; incX: cint) {.cdecl, importc: "cblas_ztbsv", dynlib: libgsl.}
proc cblas_ztpsv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; N: cint; Ap: pointer; X: pointer; incX: cint) {.cdecl, importc: "cblas_ztpsv", dynlib: libgsl.}
proc cblas_ssymv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cfloat; A: ptr cfloat; lda: cint; X: ptr cfloat; incX: cint; beta: cfloat; Y: ptr cfloat; incY: cint) {.cdecl, importc: "cblas_ssymv", dynlib: libgsl.}
proc cblas_ssbmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; K: cint; alpha: cfloat; A: ptr cfloat; lda: cint; X: ptr cfloat; incX: cint; beta: cfloat; Y: ptr cfloat; incY: cint) {.cdecl, importc: "cblas_ssbmv", dynlib: libgsl.}
proc cblas_sspmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cfloat; Ap: ptr cfloat; X: ptr cfloat; incX: cint; beta: cfloat; Y: ptr cfloat; incY: cint) {.cdecl, importc: "cblas_sspmv", dynlib: libgsl.}
proc cblas_sger*(order: CBLAS_ORDER; M: cint; N: cint; alpha: cfloat; X: ptr cfloat; incX: cint; Y: ptr cfloat; incY: cint; A: ptr cfloat; lda: cint) {.cdecl, importc: "cblas_sger", dynlib: libgsl.}
proc cblas_ssyr*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cfloat; X: ptr cfloat; incX: cint; A: ptr cfloat; lda: cint) {.cdecl, importc: "cblas_ssyr", dynlib: libgsl.}
proc cblas_sspr*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cfloat; X: ptr cfloat; incX: cint; Ap: ptr cfloat) {.cdecl, importc: "cblas_sspr", dynlib: libgsl.}
proc cblas_ssyr2*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cfloat; X: ptr cfloat; incX: cint; Y: ptr cfloat; incY: cint; A: ptr cfloat; lda: cint) {.cdecl, importc: "cblas_ssyr2", dynlib: libgsl.}
proc cblas_sspr2*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cfloat; X: ptr cfloat; incX: cint; Y: ptr cfloat; incY: cint; A: ptr cfloat) {. cdecl, importc: "cblas_sspr2", dynlib: libgsl.}
proc cblas_dsymv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cdouble; A: ptr cdouble; lda: cint; X: ptr cdouble; incX: cint; beta: cdouble; Y: ptr cdouble; incY: cint) {.cdecl, importc: "cblas_dsymv", dynlib: libgsl.}
proc cblas_dsbmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; K: cint; alpha: cdouble; A: ptr cdouble; lda: cint; X: ptr cdouble; incX: cint; beta: cdouble; Y: ptr cdouble; incY: cint) {.cdecl, importc: "cblas_dsbmv", dynlib: libgsl.}
proc cblas_dspmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cdouble; Ap: ptr cdouble; X: ptr cdouble; incX: cint; beta: cdouble; Y: ptr cdouble; incY: cint) {.cdecl, importc: "cblas_dspmv", dynlib: libgsl.}
proc cblas_dger*(order: CBLAS_ORDER; M: cint; N: cint; alpha: cdouble; X: ptr cdouble; incX: cint; Y: ptr cdouble; incY: cint; A: ptr cdouble; lda: cint) {.cdecl, importc: "cblas_dger", dynlib: libgsl.}
proc cblas_dsyr*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cdouble; X: ptr cdouble; incX: cint; A: ptr cdouble; lda: cint) {.cdecl, importc: "cblas_dsyr", dynlib: libgsl.}
proc cblas_dspr*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cdouble; X: ptr cdouble; incX: cint; Ap: ptr cdouble) {.cdecl, importc: "cblas_dspr", dynlib: libgsl.}
proc cblas_dsyr2*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cdouble; X: ptr cdouble; incX: cint; Y: ptr cdouble; incY: cint; A: ptr cdouble; lda: cint) {.cdecl, importc: "cblas_dsyr2", dynlib: libgsl.}
proc cblas_dspr2*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cdouble; X: ptr cdouble; incX: cint; Y: ptr cdouble; incY: cint; A: ptr cdouble) {. cdecl, importc: "cblas_dspr2", dynlib: libgsl.}
proc cblas_chemv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: pointer; A: pointer; lda: cint; X: pointer; incX: cint; beta: pointer; Y: pointer; incY: cint) {.cdecl, importc: "cblas_chemv", dynlib: libgsl.}
proc cblas_chbmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; K: cint; alpha: pointer; A: pointer; lda: cint; X: pointer; incX: cint; beta: pointer; Y: pointer; incY: cint) {.cdecl, importc: "cblas_chbmv", dynlib: libgsl.}
proc cblas_chpmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: pointer; Ap: pointer; X: pointer; incX: cint; beta: pointer; Y: pointer; incY: cint) {.cdecl, importc: "cblas_chpmv", dynlib: libgsl.}
proc cblas_cgeru*(order: CBLAS_ORDER; M: cint; N: cint; alpha: pointer; X: pointer; incX: cint; Y: pointer; incY: cint; A: pointer; lda: cint) {.cdecl, importc: "cblas_cgeru", dynlib: libgsl.}
proc cblas_cgerc*(order: CBLAS_ORDER; M: cint; N: cint; alpha: pointer; X: pointer; incX: cint; Y: pointer; incY: cint; A: pointer; lda: cint) {.cdecl, importc: "cblas_cgerc", dynlib: libgsl.}
proc cblas_cher*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cfloat; X: pointer; incX: cint; A: pointer; lda: cint) {.cdecl, importc: "cblas_cher", dynlib: libgsl.}
proc cblas_chpr*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cfloat; X: pointer; incX: cint; A: pointer) {.cdecl, importc: "cblas_chpr", dynlib: libgsl.}
proc cblas_cher2*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: pointer; X: pointer; incX: cint; Y: pointer; incY: cint; A: pointer; lda: cint) {. cdecl, importc: "cblas_cher2", dynlib: libgsl.}
proc cblas_chpr2*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: pointer; X: pointer; incX: cint; Y: pointer; incY: cint; Ap: pointer) {.cdecl, importc: "cblas_chpr2", dynlib: libgsl.}
proc cblas_zhemv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: pointer; A: pointer; lda: cint; X: pointer; incX: cint; beta: pointer; Y: pointer; incY: cint) {.cdecl, importc: "cblas_zhemv", dynlib: libgsl.}
proc cblas_zhbmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; K: cint; alpha: pointer; A: pointer; lda: cint; X: pointer; incX: cint; beta: pointer; Y: pointer; incY: cint) {.cdecl, importc: "cblas_zhbmv", dynlib: libgsl.}
proc cblas_zhpmv*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: pointer; Ap: pointer; X: pointer; incX: cint; beta: pointer; Y: pointer; incY: cint) {.cdecl, importc: "cblas_zhpmv", dynlib: libgsl.}
proc cblas_zgeru*(order: CBLAS_ORDER; M: cint; N: cint; alpha: pointer; X: pointer; incX: cint; Y: pointer; incY: cint; A: pointer; lda: cint) {.cdecl, importc: "cblas_zgeru", dynlib: libgsl.}
proc cblas_zgerc*(order: CBLAS_ORDER; M: cint; N: cint; alpha: pointer; X: pointer; incX: cint; Y: pointer; incY: cint; A: pointer; lda: cint) {.cdecl, importc: "cblas_zgerc", dynlib: libgsl.}
proc cblas_zher*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cdouble; X: pointer; incX: cint; A: pointer; lda: cint) {.cdecl, importc: "cblas_zher", dynlib: libgsl.}
proc cblas_zhpr*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: cdouble; X: pointer; incX: cint; A: pointer) {.cdecl, importc: "cblas_zhpr", dynlib: libgsl.}
proc cblas_zher2*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: pointer; X: pointer; incX: cint; Y: pointer; incY: cint; A: pointer; lda: cint) {. cdecl, importc: "cblas_zher2", dynlib: libgsl.}
proc cblas_zhpr2*(order: CBLAS_ORDER; Uplo: CBLAS_UPLO; N: cint; alpha: pointer; X: pointer; incX: cint; Y: pointer; incY: cint; Ap: pointer) {.cdecl, importc: "cblas_zhpr2", dynlib: libgsl.}
proc cblas_sgemm*(Order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; TransB: CBLAS_TRANSPOSE; M: cint; N: cint; K: cint; alpha: cfloat; A: ptr cfloat; lda: cint; B: ptr cfloat; ldb: cint; beta: cfloat; C: ptr cfloat; ldc: cint) {.cdecl, importc: "cblas_sgemm",  dynlib: libgsl.}
proc cblas_ssymm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; M: cint; N: cint; alpha: cfloat; A: ptr cfloat; lda: cint; B: ptr cfloat; ldb: cint; beta: cfloat; C: ptr cfloat; ldc: cint) {.cdecl, importc: "cblas_ssymm", dynlib: libgsl.}
proc cblas_ssyrk*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: cfloat; A: ptr cfloat; lda: cint; beta: cfloat; C: ptr cfloat; ldc: cint) {.cdecl, importc: "cblas_ssyrk",  dynlib: libgsl.}
proc cblas_ssyr2k*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: cfloat; A: ptr cfloat; lda: cint; B: ptr cfloat; ldb: cint; beta: cfloat; C: ptr cfloat; ldc: cint) {.cdecl, importc: "cblas_ssyr2k", dynlib: libgsl.}
proc cblas_strmm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; M: cint; N: cint; alpha: cfloat; A: ptr cfloat; lda: cint; B: ptr cfloat; ldb: cint) {.cdecl, importc: "cblas_strmm", dynlib: libgsl.}
proc cblas_strsm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; M: cint; N: cint; alpha: cfloat; A: ptr cfloat; lda: cint; B: ptr cfloat; ldb: cint) {.cdecl, importc: "cblas_strsm", dynlib: libgsl.}
proc cblas_dgemm*(Order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; TransB: CBLAS_TRANSPOSE; M: cint; N: cint; K: cint; alpha: cdouble; A: ptr cdouble; lda: cint; B: ptr cdouble; ldb: cint; beta: cdouble; C: ptr cdouble; ldc: cint) {.cdecl, importc: "cblas_dgemm", dynlib: libgsl.}
proc cblas_dsymm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; M: cint; N: cint; alpha: cdouble; A: ptr cdouble; lda: cint; B: ptr cdouble; ldb: cint; beta: cdouble; C: ptr cdouble; ldc: cint) {.cdecl, importc: "cblas_dsymm", dynlib: libgsl.}
proc cblas_dsyrk*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: cdouble; A: ptr cdouble; lda: cint; beta: cdouble; C: ptr cdouble; ldc: cint) {.cdecl, importc: "cblas_dsyrk", dynlib: libgsl.}
proc cblas_dsyr2k*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: cdouble; A: ptr cdouble; lda: cint; B: ptr cdouble; ldb: cint; beta: cdouble; C: ptr cdouble; ldc: cint) {. cdecl, importc: "cblas_dsyr2k", dynlib: libgsl.}
proc cblas_dtrmm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; M: cint; N: cint; alpha: cdouble; A: ptr cdouble; lda: cint; B: ptr cdouble; ldb: cint) {. cdecl, importc: "cblas_dtrmm", dynlib: libgsl.}
proc cblas_dtrsm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; M: cint; N: cint; alpha: cdouble; A: ptr cdouble; lda: cint; B: ptr cdouble; ldb: cint) {. cdecl, importc: "cblas_dtrsm", dynlib: libgsl.}
proc cblas_cgemm*(Order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; TransB: CBLAS_TRANSPOSE; M: cint; N: cint; K: cint; alpha: pointer; A: pointer; lda: cint; B: pointer; ldb: cint; beta: pointer; C: pointer; ldc: cint) {.cdecl, importc: "cblas_cgemm", dynlib: libgsl.}
proc cblas_csymm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; M: cint; N: cint; alpha: pointer; A: pointer; lda: cint; B: pointer; ldb: cint; beta: pointer; C: pointer; ldc: cint) {.cdecl, importc: "cblas_csymm", dynlib: libgsl.}
proc cblas_csyrk*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: pointer; A: pointer; lda: cint; beta: pointer; C: pointer; ldc: cint) {.cdecl, importc: "cblas_csyrk", dynlib: libgsl.}
proc cblas_csyr2k*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: pointer; A: pointer; lda: cint; B: pointer; ldb: cint; beta: pointer; C: pointer; ldc: cint) {.cdecl, importc: "cblas_csyr2k", dynlib: libgsl.}
proc cblas_ctrmm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; M: cint; N: cint; alpha: pointer; A: pointer; lda: cint; B: pointer; ldb: cint) {.cdecl, importc: "cblas_ctrmm", dynlib: libgsl.}
proc cblas_ctrsm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; M: cint; N: cint; alpha: pointer; A: pointer; lda: cint; B: pointer; ldb: cint) {.cdecl, importc: "cblas_ctrsm", dynlib: libgsl.}
proc cblas_zgemm*(Order: CBLAS_ORDER; TransA: CBLAS_TRANSPOSE; TransB: CBLAS_TRANSPOSE; M: cint; N: cint; K: cint; alpha: pointer; A: pointer; lda: cint; B: pointer; ldb: cint; beta: pointer; C: pointer; ldc: cint) {.cdecl, importc: "cblas_zgemm", dynlib: libgsl.}
proc cblas_zsymm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; M: cint; N: cint; alpha: pointer; A: pointer; lda: cint; B: pointer; ldb: cint; beta: pointer; C: pointer; ldc: cint) {.cdecl, importc: "cblas_zsymm", dynlib: libgsl.}
proc cblas_zsyrk*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: pointer; A: pointer; lda: cint; beta: pointer; C: pointer; ldc: cint) {.cdecl, importc: "cblas_zsyrk", dynlib: libgsl.}
proc cblas_zsyr2k*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: pointer; A: pointer; lda: cint; B: pointer; ldb: cint; beta: pointer; C: pointer; ldc: cint) {.cdecl, importc: "cblas_zsyr2k", dynlib: libgsl.}
proc cblas_ztrmm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; M: cint; N: cint; alpha: pointer; A: pointer; lda: cint; B: pointer; ldb: cint) {.cdecl, importc: "cblas_ztrmm", dynlib: libgsl.}
proc cblas_ztrsm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; TransA: CBLAS_TRANSPOSE; Diag: CBLAS_DIAG; M: cint; N: cint; alpha: pointer; A: pointer; lda: cint; B: pointer; ldb: cint) {.cdecl, importc: "cblas_ztrsm", dynlib: libgsl.}
proc cblas_chemm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; M: cint; N: cint; alpha: pointer; A: pointer; lda: cint; B: pointer; ldb: cint; beta: pointer; C: pointer; ldc: cint) {.cdecl, importc: "cblas_chemm", dynlib: libgsl.}
proc cblas_cherk*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: cfloat; A: pointer; lda: cint; beta: cfloat; C: pointer; ldc: cint) {.cdecl, importc: "cblas_cherk", dynlib: libgsl.}
proc cblas_cher2k*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: pointer; A: pointer; lda: cint; B: pointer; ldb: cint; beta: cfloat; C: pointer; ldc: cint) {.cdecl, importc: "cblas_cher2k", dynlib: libgsl.}
proc cblas_zhemm*(Order: CBLAS_ORDER; Side: CBLAS_SIDE; Uplo: CBLAS_UPLO; M: cint; N: cint; alpha: pointer; A: pointer; lda: cint; B: pointer; ldb: cint; beta: pointer; C: pointer; ldc: cint) {.cdecl, importc: "cblas_zhemm", dynlib: libgsl.}
proc cblas_zherk*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: cdouble; A: pointer; lda: cint; beta: cdouble; C: pointer; ldc: cint) {.cdecl, importc: "cblas_zherk", dynlib: libgsl.}
proc cblas_zher2k*(Order: CBLAS_ORDER; Uplo: CBLAS_UPLO; Trans: CBLAS_TRANSPOSE; N: cint; K: cint; alpha: pointer; A: pointer; lda: cint; B: pointer; ldb: cint; beta: cdouble; C: pointer; ldc: cint) {.cdecl, importc: "cblas_zher2k", dynlib: libgsl.}
proc cblas_xerbla*(p: cint; rout: cstring; form: cstring) {.varargs, cdecl, importc: "cblas_xerbla", dynlib: libgsl.}
