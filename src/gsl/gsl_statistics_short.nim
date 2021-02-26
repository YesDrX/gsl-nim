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

proc gsl_stats_short_mean*(data: ptr cshort; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_short_mean", dynlib: libgsl.}
proc gsl_stats_short_variance*(data: ptr cshort; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_short_variance", dynlib: libgsl.}
proc gsl_stats_short_sd*(data: ptr cshort; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_short_sd", dynlib: libgsl.}
proc gsl_stats_short_variance_with_fixed_mean*(data: ptr cshort; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_short_variance_with_fixed_mean",  dynlib: libgsl.}
proc gsl_stats_short_sd_with_fixed_mean*(data: ptr cshort; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_short_sd_with_fixed_mean", dynlib: libgsl.}
proc gsl_stats_short_tss*(data: ptr cshort; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_short_tss", dynlib: libgsl.}
proc gsl_stats_short_tss_m*(data: ptr cshort; stride: csize_t; n: csize_t; mean: cdouble): cdouble {. cdecl, importc: "gsl_stats_short_tss_m", dynlib: libgsl.}
proc gsl_stats_short_absdev*(data: ptr cshort; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_short_absdev", dynlib: libgsl.}
proc gsl_stats_short_skew*(data: ptr cshort; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_short_skew", dynlib: libgsl.}
proc gsl_stats_short_kurtosis*(data: ptr cshort; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_short_kurtosis", dynlib: libgsl.}
proc gsl_stats_short_lag1_autocorrelation*(data: ptr cshort; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_short_lag1_autocorrelation", dynlib: libgsl.}
proc gsl_stats_short_covariance*(data1: ptr cshort; stride1: csize_t; data2: ptr cshort; stride2: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_short_covariance", dynlib: libgsl.}
proc gsl_stats_short_correlation*(data1: ptr cshort; stride1: csize_t; data2: ptr cshort; stride2: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_short_correlation", dynlib: libgsl.}
proc gsl_stats_short_spearman*(data1: ptr cshort; stride1: csize_t; data2: ptr cshort;   stride2: csize_t; n: csize_t; work: ptr cdouble): cdouble {. cdecl, importc: "gsl_stats_short_spearman", dynlib: libgsl.}
proc gsl_stats_short_variance_m*(data: ptr cshort; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_short_variance_m", dynlib: libgsl.}
proc gsl_stats_short_sd_m*(data: ptr cshort; stride: csize_t; n: csize_t; mean: cdouble): cdouble {. cdecl, importc: "gsl_stats_short_sd_m", dynlib: libgsl.}
proc gsl_stats_short_absdev_m*(data: ptr cshort; stride: csize_t; n: csize_t;   mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_short_absdev_m", dynlib: libgsl.}
proc gsl_stats_short_skew_m_sd*(data: ptr cshort; stride: csize_t; n: csize_t; mean: cdouble; sd: cdouble): cdouble {.cdecl, importc: "gsl_stats_short_skew_m_sd", dynlib: libgsl.}
proc gsl_stats_short_kurtosis_m_sd*(data: ptr cshort; stride: csize_t; n: csize_t;  mean: cdouble; sd: cdouble): cdouble {.cdecl, importc: "gsl_stats_short_kurtosis_m_sd", dynlib: libgsl.}
proc gsl_stats_short_lag1_autocorrelation_m*(data: ptr cshort; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_short_lag1_autocorrelation_m",  dynlib: libgsl.}
proc gsl_stats_short_covariance_m*(data1: ptr cshort; stride1: csize_t; data2: ptr cshort; stride2: csize_t; n: csize_t; mean1: cdouble; mean2: cdouble): cdouble {.cdecl, importc: "gsl_stats_short_covariance_m", dynlib: libgsl.}
proc gsl_stats_short_pvariance*(data1: ptr cshort; stride1: csize_t; n1: csize_t; data2: ptr cshort; stride2: csize_t; n2: csize_t): cdouble {. cdecl, importc: "gsl_stats_short_pvariance", dynlib: libgsl.}
proc gsl_stats_short_ttest*(data1: ptr cshort; stride1: csize_t; n1: csize_t;   data2: ptr cshort; stride2: csize_t; n2: csize_t): cdouble {. cdecl, importc: "gsl_stats_short_ttest", dynlib: libgsl.}
proc gsl_stats_short_max*(data: ptr cshort; stride: csize_t; n: csize_t): cshort {.cdecl, importc: "gsl_stats_short_max", dynlib: libgsl.}
proc gsl_stats_short_min*(data: ptr cshort; stride: csize_t; n: csize_t): cshort {.cdecl, importc: "gsl_stats_short_min", dynlib: libgsl.}
proc gsl_stats_short_minmax*(min: ptr cshort; max: ptr cshort; data: ptr cshort; stride: csize_t; n: csize_t) {.cdecl, importc: "gsl_stats_short_minmax", dynlib: libgsl.}
proc gsl_stats_short_max_index*(data: ptr cshort; stride: csize_t; n: csize_t): csize_t {. cdecl, importc: "gsl_stats_short_max_index", dynlib: libgsl.}
proc gsl_stats_short_min_index*(data: ptr cshort; stride: csize_t; n: csize_t): csize_t {. cdecl, importc: "gsl_stats_short_min_index", dynlib: libgsl.}
proc gsl_stats_short_minmax_index*(min_index: ptr csize_t; max_index: ptr csize_t; data: ptr cshort; stride: csize_t; n: csize_t) {. cdecl, importc: "gsl_stats_short_minmax_index", dynlib: libgsl.}
proc gsl_stats_short_select*(data: ptr cshort; stride: csize_t; n: csize_t; k: csize_t): cshort {. cdecl, importc: "gsl_stats_short_select", dynlib: libgsl.}
proc gsl_stats_short_median_from_sorted_data*(sorted_data: ptr cshort; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_short_median_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_short_median*(sorted_data: ptr cshort; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_short_median", dynlib: libgsl.}
proc gsl_stats_short_quantile_from_sorted_data*(sorted_data: ptr cshort; stride: csize_t; n: csize_t; f: cdouble): cdouble {.cdecl, importc: "gsl_stats_short_quantile_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_short_trmean_from_sorted_data*(trim: cdouble; sorted_data: ptr cshort; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_short_trmean_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_short_gastwirth_from_sorted_data*(sorted_data: ptr cshort; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_short_gastwirth_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_short_mad0*(data: ptr cshort; stride: csize_t; n: csize_t;  work: ptr cdouble): cdouble {.cdecl, importc: "gsl_stats_short_mad0", dynlib: libgsl.}
proc gsl_stats_short_mad*(data: ptr cshort; stride: csize_t; n: csize_t; work: ptr cdouble): cdouble {.cdecl, importc: "gsl_stats_short_mad", dynlib: libgsl.}
proc gsl_stats_short_Sn0_from_sorted_data*(sorted_data: ptr cshort; stride: csize_t; n: csize_t; work: ptr cshort): cshort {.cdecl, importc: "gsl_stats_short_Sn0_from_sorted_data",   dynlib: libgsl.}
proc gsl_stats_short_Sn_from_sorted_data*(sorted_data: ptr cshort; stride: csize_t; n: csize_t; work: ptr cshort): cdouble {.cdecl, importc: "gsl_stats_short_Sn_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_short_Qn0_from_sorted_data*(sorted_data: ptr cshort; stride: csize_t; n: csize_t; work: ptr cshort; work_int: ptr cint): cshort {.cdecl, importc: "gsl_stats_short_Qn0_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_short_Qn_from_sorted_data*(sorted_data: ptr cshort; stride: csize_t; n: csize_t; work: ptr cshort; work_int: ptr cint): cdouble {.cdecl, importc: "gsl_stats_short_Qn_from_sorted_data", dynlib: libgsl.}
