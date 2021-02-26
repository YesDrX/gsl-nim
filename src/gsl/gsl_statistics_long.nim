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

proc gsl_stats_long_mean*(data: ptr clong; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_long_mean", dynlib: libgsl.}
proc gsl_stats_long_variance*(data: ptr clong; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_long_variance", dynlib: libgsl.}
proc gsl_stats_long_sd*(data: ptr clong; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_long_sd", dynlib: libgsl.}
proc gsl_stats_long_variance_with_fixed_mean*(data: ptr clong; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_long_variance_with_fixed_mean",  dynlib: libgsl.}
proc gsl_stats_long_sd_with_fixed_mean*(data: ptr clong; stride: csize_t; n: csize_t;    mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_long_sd_with_fixed_mean", dynlib: libgsl.}
proc gsl_stats_long_tss*(data: ptr clong; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_long_tss", dynlib: libgsl.}
proc gsl_stats_long_tss_m*(data: ptr clong; stride: csize_t; n: csize_t; mean: cdouble): cdouble {. cdecl, importc: "gsl_stats_long_tss_m", dynlib: libgsl.}
proc gsl_stats_long_absdev*(data: ptr clong; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_long_absdev", dynlib: libgsl.}
proc gsl_stats_long_skew*(data: ptr clong; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_long_skew", dynlib: libgsl.}
proc gsl_stats_long_kurtosis*(data: ptr clong; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_long_kurtosis", dynlib: libgsl.}
proc gsl_stats_long_lag1_autocorrelation*(data: ptr clong; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_long_lag1_autocorrelation", dynlib: libgsl.}
proc gsl_stats_long_covariance*(data1: ptr clong; stride1: csize_t; data2: ptr clong; stride2: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_long_covariance", dynlib: libgsl.}
proc gsl_stats_long_correlation*(data1: ptr clong; stride1: csize_t; data2: ptr clong; stride2: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_long_correlation", dynlib: libgsl.}
proc gsl_stats_long_spearman*(data1: ptr clong; stride1: csize_t; data2: ptr clong;  stride2: csize_t; n: csize_t; work: ptr cdouble): cdouble {. cdecl, importc: "gsl_stats_long_spearman", dynlib: libgsl.}
proc gsl_stats_long_variance_m*(data: ptr clong; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_long_variance_m", dynlib: libgsl.}
proc gsl_stats_long_sd_m*(data: ptr clong; stride: csize_t; n: csize_t; mean: cdouble): cdouble {. cdecl, importc: "gsl_stats_long_sd_m", dynlib: libgsl.}
proc gsl_stats_long_absdev_m*(data: ptr clong; stride: csize_t; n: csize_t;  mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_long_absdev_m", dynlib: libgsl.}
proc gsl_stats_long_skew_m_sd*(data: ptr clong; stride: csize_t; n: csize_t;   mean: cdouble; sd: cdouble): cdouble {.cdecl, importc: "gsl_stats_long_skew_m_sd", dynlib: libgsl.}
proc gsl_stats_long_kurtosis_m_sd*(data: ptr clong; stride: csize_t; n: csize_t; mean: cdouble; sd: cdouble): cdouble {.cdecl, importc: "gsl_stats_long_kurtosis_m_sd", dynlib: libgsl.}
proc gsl_stats_long_lag1_autocorrelation_m*(data: ptr clong; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_long_lag1_autocorrelation_m",  dynlib: libgsl.}
proc gsl_stats_long_covariance_m*(data1: ptr clong; stride1: csize_t; data2: ptr clong; stride2: csize_t; n: csize_t; mean1: cdouble; mean2: cdouble): cdouble {.cdecl, importc: "gsl_stats_long_covariance_m", dynlib: libgsl.}
proc gsl_stats_long_pvariance*(data1: ptr clong; stride1: csize_t; n1: csize_t;   data2: ptr clong; stride2: csize_t; n2: csize_t): cdouble {. cdecl, importc: "gsl_stats_long_pvariance", dynlib: libgsl.}
proc gsl_stats_long_ttest*(data1: ptr clong; stride1: csize_t; n1: csize_t;  data2: ptr clong; stride2: csize_t; n2: csize_t): cdouble {. cdecl, importc: "gsl_stats_long_ttest", dynlib: libgsl.}
proc gsl_stats_long_max*(data: ptr clong; stride: csize_t; n: csize_t): clong {.cdecl, importc: "gsl_stats_long_max", dynlib: libgsl.}
proc gsl_stats_long_min*(data: ptr clong; stride: csize_t; n: csize_t): clong {.cdecl, importc: "gsl_stats_long_min", dynlib: libgsl.}
proc gsl_stats_long_minmax*(min: ptr clong; max: ptr clong; data: ptr clong;   stride: csize_t; n: csize_t) {.cdecl, importc: "gsl_stats_long_minmax", dynlib: libgsl.}
proc gsl_stats_long_max_index*(data: ptr clong; stride: csize_t; n: csize_t): csize_t {. cdecl, importc: "gsl_stats_long_max_index", dynlib: libgsl.}
proc gsl_stats_long_min_index*(data: ptr clong; stride: csize_t; n: csize_t): csize_t {. cdecl, importc: "gsl_stats_long_min_index", dynlib: libgsl.}
proc gsl_stats_long_minmax_index*(min_index: ptr csize_t; max_index: ptr csize_t; data: ptr clong; stride: csize_t; n: csize_t) {.cdecl, importc: "gsl_stats_long_minmax_index", dynlib: libgsl.}
proc gsl_stats_long_select*(data: ptr clong; stride: csize_t; n: csize_t; k: csize_t): clong {. cdecl, importc: "gsl_stats_long_select", dynlib: libgsl.}
proc gsl_stats_long_median_from_sorted_data*(sorted_data: ptr clong; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_long_median_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_long_median*(sorted_data: ptr clong; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_long_median", dynlib: libgsl.}
proc gsl_stats_long_quantile_from_sorted_data*(sorted_data: ptr clong; stride: csize_t; n: csize_t; f: cdouble): cdouble {.cdecl, importc: "gsl_stats_long_quantile_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_long_trmean_from_sorted_data*(trim: cdouble; sorted_data: ptr clong; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_long_trmean_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_long_gastwirth_from_sorted_data*(sorted_data: ptr clong; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_long_gastwirth_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_long_mad0*(data: ptr clong; stride: csize_t; n: csize_t; work: ptr cdouble): cdouble {.cdecl, importc: "gsl_stats_long_mad0", dynlib: libgsl.}
proc gsl_stats_long_mad*(data: ptr clong; stride: csize_t; n: csize_t; work: ptr cdouble): cdouble {. cdecl, importc: "gsl_stats_long_mad", dynlib: libgsl.}
proc gsl_stats_long_Sn0_from_sorted_data*(sorted_data: ptr clong; stride: csize_t; n: csize_t; work: ptr clong): clong {.cdecl, importc: "gsl_stats_long_Sn0_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_long_Sn_from_sorted_data*(sorted_data: ptr clong; stride: csize_t; n: csize_t; work: ptr clong): cdouble {.cdecl, importc: "gsl_stats_long_Sn_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_long_Qn0_from_sorted_data*(sorted_data: ptr clong; stride: csize_t; n: csize_t; work: ptr clong; work_int: ptr cint): clong {.cdecl, importc: "gsl_stats_long_Qn0_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_long_Qn_from_sorted_data*(sorted_data: ptr clong; stride: csize_t; n: csize_t; work: ptr clong; work_int: ptr cint): cdouble {.cdecl, importc: "gsl_stats_long_Qn_from_sorted_data", dynlib: libgsl.}
