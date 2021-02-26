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

proc gsl_stats_ushort_mean*(data: ptr cushort; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_ushort_mean", dynlib: libgsl.}
proc gsl_stats_ushort_variance*(data: ptr cushort; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_ushort_variance", dynlib: libgsl.}
proc gsl_stats_ushort_sd*(data: ptr cushort; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_ushort_sd", dynlib: libgsl.}
proc gsl_stats_ushort_variance_with_fixed_mean*(data: ptr cushort; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_ushort_variance_with_fixed_mean",  dynlib: libgsl.}
proc gsl_stats_ushort_sd_with_fixed_mean*(data: ptr cushort; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_ushort_sd_with_fixed_mean",  dynlib: libgsl.}
proc gsl_stats_ushort_tss*(data: ptr cushort; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_ushort_tss", dynlib: libgsl.}
proc gsl_stats_ushort_tss_m*(data: ptr cushort; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_ushort_tss_m", dynlib: libgsl.}
proc gsl_stats_ushort_absdev*(data: ptr cushort; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_ushort_absdev", dynlib: libgsl.}
proc gsl_stats_ushort_skew*(data: ptr cushort; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_ushort_skew", dynlib: libgsl.}
proc gsl_stats_ushort_kurtosis*(data: ptr cushort; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_ushort_kurtosis", dynlib: libgsl.}
proc gsl_stats_ushort_lag1_autocorrelation*(data: ptr cushort; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_ushort_lag1_autocorrelation", dynlib: libgsl.}
proc gsl_stats_ushort_covariance*(data1: ptr cushort; stride1: csize_t; data2: ptr cushort; stride2: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_ushort_covariance", dynlib: libgsl.}
proc gsl_stats_ushort_correlation*(data1: ptr cushort; stride1: csize_t; data2: ptr cushort; stride2: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_ushort_correlation", dynlib: libgsl.}
proc gsl_stats_ushort_spearman*(data1: ptr cushort; stride1: csize_t; data2: ptr cushort; stride2: csize_t; n: csize_t; work: ptr cdouble): cdouble {.cdecl, importc: "gsl_stats_ushort_spearman", dynlib: libgsl.}
proc gsl_stats_ushort_variance_m*(data: ptr cushort; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_ushort_variance_m", dynlib: libgsl.}
proc gsl_stats_ushort_sd_m*(data: ptr cushort; stride: csize_t; n: csize_t;   mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_ushort_sd_m", dynlib: libgsl.}
proc gsl_stats_ushort_absdev_m*(data: ptr cushort; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_ushort_absdev_m", dynlib: libgsl.}
proc gsl_stats_ushort_skew_m_sd*(data: ptr cushort; stride: csize_t; n: csize_t; mean: cdouble; sd: cdouble): cdouble {.cdecl, importc: "gsl_stats_ushort_skew_m_sd", dynlib: libgsl.}
proc gsl_stats_ushort_kurtosis_m_sd*(data: ptr cushort; stride: csize_t; n: csize_t; mean: cdouble; sd: cdouble): cdouble {.cdecl, importc: "gsl_stats_ushort_kurtosis_m_sd", dynlib: libgsl.}
proc gsl_stats_ushort_lag1_autocorrelation_m*(data: ptr cushort; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_ushort_lag1_autocorrelation_m",  dynlib: libgsl.}
proc gsl_stats_ushort_covariance_m*(data1: ptr cushort; stride1: csize_t;  data2: ptr cushort; stride2: csize_t; n: csize_t;  mean1: cdouble; mean2: cdouble): cdouble {.cdecl, importc: "gsl_stats_ushort_covariance_m", dynlib: libgsl.}
proc gsl_stats_ushort_pvariance*(data1: ptr cushort; stride1: csize_t; n1: csize_t; data2: ptr cushort; stride2: csize_t; n2: csize_t): cdouble {. cdecl, importc: "gsl_stats_ushort_pvariance", dynlib: libgsl.}
proc gsl_stats_ushort_ttest*(data1: ptr cushort; stride1: csize_t; n1: csize_t; data2: ptr cushort; stride2: csize_t; n2: csize_t): cdouble {. cdecl, importc: "gsl_stats_ushort_ttest", dynlib: libgsl.}
proc gsl_stats_ushort_max*(data: ptr cushort; stride: csize_t; n: csize_t): cushort {. cdecl, importc: "gsl_stats_ushort_max", dynlib: libgsl.}
proc gsl_stats_ushort_min*(data: ptr cushort; stride: csize_t; n: csize_t): cushort {. cdecl, importc: "gsl_stats_ushort_min", dynlib: libgsl.}
proc gsl_stats_ushort_minmax*(min: ptr cushort; max: ptr cushort; data: ptr cushort;  stride: csize_t; n: csize_t) {.cdecl, importc: "gsl_stats_ushort_minmax", dynlib: libgsl.}
proc gsl_stats_ushort_max_index*(data: ptr cushort; stride: csize_t; n: csize_t): csize_t {. cdecl, importc: "gsl_stats_ushort_max_index", dynlib: libgsl.}
proc gsl_stats_ushort_min_index*(data: ptr cushort; stride: csize_t; n: csize_t): csize_t {. cdecl, importc: "gsl_stats_ushort_min_index", dynlib: libgsl.}
proc gsl_stats_ushort_minmax_index*(min_index: ptr csize_t; max_index: ptr csize_t;  data: ptr cushort; stride: csize_t; n: csize_t) {. cdecl, importc: "gsl_stats_ushort_minmax_index", dynlib: libgsl.}
proc gsl_stats_ushort_select*(data: ptr cushort; stride: csize_t; n: csize_t; k: csize_t): cushort {. cdecl, importc: "gsl_stats_ushort_select", dynlib: libgsl.}
proc gsl_stats_ushort_median_from_sorted_data*(sorted_data: ptr cushort; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_ushort_median_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_ushort_median*(sorted_data: ptr cushort; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_ushort_median", dynlib: libgsl.}
proc gsl_stats_ushort_quantile_from_sorted_data*(sorted_data: ptr cushort; stride: csize_t; n: csize_t; f: cdouble): cdouble {.cdecl, importc: "gsl_stats_ushort_quantile_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_ushort_trmean_from_sorted_data*(trim: cdouble; sorted_data: ptr cushort; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_ushort_trmean_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_ushort_gastwirth_from_sorted_data*(sorted_data: ptr cushort; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_ushort_gastwirth_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_ushort_mad0*(data: ptr cushort; stride: csize_t; n: csize_t;   work: ptr cdouble): cdouble {.cdecl, importc: "gsl_stats_ushort_mad0", dynlib: libgsl.}
proc gsl_stats_ushort_mad*(data: ptr cushort; stride: csize_t; n: csize_t;  work: ptr cdouble): cdouble {.cdecl, importc: "gsl_stats_ushort_mad", dynlib: libgsl.}
proc gsl_stats_ushort_Sn0_from_sorted_data*(sorted_data: ptr cushort; stride: csize_t; n: csize_t; work: ptr cushort): cushort {.cdecl, importc: "gsl_stats_ushort_Sn0_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_ushort_Sn_from_sorted_data*(sorted_data: ptr cushort; stride: csize_t; n: csize_t; work: ptr cushort): cdouble {.cdecl, importc: "gsl_stats_ushort_Sn_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_ushort_Qn0_from_sorted_data*(sorted_data: ptr cushort; stride: csize_t; n: csize_t; work: ptr cushort; work_int: ptr cint): cushort {.cdecl, importc: "gsl_stats_ushort_Qn0_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_ushort_Qn_from_sorted_data*(sorted_data: ptr cushort; stride: csize_t; n: csize_t; work: ptr cushort; work_int: ptr cint): cdouble {.cdecl, importc: "gsl_stats_ushort_Qn_from_sorted_data", dynlib: libgsl.}
