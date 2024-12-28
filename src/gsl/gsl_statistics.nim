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

proc gsl_stats_long_double_mean*(data: ptr clongdouble; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_long_double_mean", dynlib: libgsl.}
proc gsl_stats_long_double_variance*(data: ptr clongdouble; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_long_double_variance", dynlib: libgsl.}
proc gsl_stats_long_double_sd*(data: ptr clongdouble; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_long_double_sd", dynlib: libgsl.}
proc gsl_stats_long_double_variance_with_fixed_mean*(data: ptr clongdouble; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_long_double_variance_with_fixed_mean", dynlib: libgsl.}
proc gsl_stats_long_double_sd_with_fixed_mean*(data: ptr clongdouble; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_long_double_sd_with_fixed_mean", dynlib: libgsl.}
proc gsl_stats_long_double_tss*(data: ptr clongdouble; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_long_double_tss", dynlib: libgsl.}
proc gsl_stats_long_double_tss_m*(data: ptr clongdouble; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_long_double_tss_m", dynlib: libgsl.}
proc gsl_stats_long_double_absdev*(data: ptr clongdouble; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_long_double_absdev", dynlib: libgsl.}
proc gsl_stats_long_double_skew*(data: ptr clongdouble; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_long_double_skew", dynlib: libgsl.}
proc gsl_stats_long_double_kurtosis*(data: ptr clongdouble; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_long_double_kurtosis", dynlib: libgsl.}
proc gsl_stats_long_double_lag1_autocorrelation*(data: ptr clongdouble; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_long_double_lag1_autocorrelation", dynlib: libgsl.}
proc gsl_stats_long_double_covariance*(data1: ptr clongdouble; stride1: csize_t;   data2: ptr clongdouble; stride2: csize_t;   n: csize_t): cdouble {.cdecl, importc: "gsl_stats_long_double_covariance", dynlib: libgsl.}
proc gsl_stats_long_double_correlation*(data1: ptr clongdouble; stride1: csize_t;    data2: ptr clongdouble; stride2: csize_t;    n: csize_t): cdouble {.cdecl, importc: "gsl_stats_long_double_correlation", dynlib: libgsl.}
proc gsl_stats_long_double_spearman*(data1: ptr clongdouble; stride1: csize_t; data2: ptr clongdouble; stride2: csize_t; n: csize_t; work: ptr cdouble): cdouble {.cdecl, importc: "gsl_stats_long_double_spearman", dynlib: libgsl.}
proc gsl_stats_long_double_variance_m*(data: ptr clongdouble; stride: csize_t;   n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_long_double_variance_m", dynlib: libgsl.}
proc gsl_stats_long_double_sd_m*(data: ptr clongdouble; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_long_double_sd_m", dynlib: libgsl.}
proc gsl_stats_long_double_absdev_m*(data: ptr clongdouble; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_long_double_absdev_m", dynlib: libgsl.}
proc gsl_stats_long_double_skew_m_sd*(data: ptr clongdouble; stride: csize_t;  n: csize_t; mean: cdouble; sd: cdouble): cdouble {. cdecl, importc: "gsl_stats_long_double_skew_m_sd", dynlib: libgsl.}
proc gsl_stats_long_double_kurtosis_m_sd*(data: ptr clongdouble; stride: csize_t; n: csize_t; mean: cdouble; sd: cdouble): cdouble {.cdecl, importc: "gsl_stats_long_double_kurtosis_m_sd", dynlib: libgsl.}
proc gsl_stats_long_double_lag1_autocorrelation_m*(data: ptr clongdouble; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_long_double_lag1_autocorrelation_m", dynlib: libgsl.}
proc gsl_stats_long_double_covariance_m*(data1: ptr clongdouble; stride1: csize_t; data2: ptr clongdouble; stride2: csize_t; n: csize_t; mean1: cdouble; mean2: cdouble): cdouble {. cdecl, importc: "gsl_stats_long_double_covariance_m", dynlib: libgsl.}
proc gsl_stats_long_double_wmean*(w: ptr clongdouble; wstride: csize_t; data: ptr clongdouble; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_long_double_wmean", dynlib: libgsl.}
proc gsl_stats_long_double_wvariance*(w: ptr clongdouble; wstride: csize_t;  data: ptr clongdouble; stride: csize_t;  n: csize_t): cdouble {.cdecl, importc: "gsl_stats_long_double_wvariance", dynlib: libgsl.}
proc gsl_stats_long_double_wsd*(w: ptr clongdouble; wstride: csize_t; data: ptr clongdouble; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_long_double_wsd", dynlib: libgsl.}
proc gsl_stats_long_double_wvariance_with_fixed_mean*(w: ptr clongdouble; wstride: csize_t; data: ptr clongdouble; stride: csize_t; n: csize_t; mean: cdouble): cdouble {. cdecl, importc: "gsl_stats_long_double_wvariance_with_fixed_mean", dynlib: libgsl.}
proc gsl_stats_long_double_wsd_with_fixed_mean*(w: ptr clongdouble; wstride: csize_t; data: ptr clongdouble; stride: csize_t; n: csize_t; mean: cdouble): cdouble {. cdecl, importc: "gsl_stats_long_double_wsd_with_fixed_mean", dynlib: libgsl.}
proc gsl_stats_long_double_wtss*(w: ptr clongdouble; wstride: csize_t; data: ptr clongdouble; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_long_double_wtss", dynlib: libgsl.}
proc gsl_stats_long_double_wtss_m*(w: ptr clongdouble; wstride: csize_t; data: ptr clongdouble; stride: csize_t; n: csize_t; wmean: cdouble): cdouble {.cdecl, importc: "gsl_stats_long_double_wtss_m", dynlib: libgsl.}
proc gsl_stats_long_double_wabsdev*(w: ptr clongdouble; wstride: csize_t;  data: ptr clongdouble; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_long_double_wabsdev", dynlib: libgsl.}
proc gsl_stats_long_double_wskew*(w: ptr clongdouble; wstride: csize_t; data: ptr clongdouble; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_long_double_wskew", dynlib: libgsl.}
proc gsl_stats_long_double_wkurtosis*(w: ptr clongdouble; wstride: csize_t;  data: ptr clongdouble; stride: csize_t;  n: csize_t): cdouble {.cdecl, importc: "gsl_stats_long_double_wkurtosis", dynlib: libgsl.}
proc gsl_stats_long_double_wvariance_m*(w: ptr clongdouble; wstride: csize_t;    data: ptr clongdouble; stride: csize_t;    n: csize_t; wmean: cdouble): cdouble {.cdecl, importc: "gsl_stats_long_double_wvariance_m", dynlib: libgsl.}
proc gsl_stats_long_double_wsd_m*(w: ptr clongdouble; wstride: csize_t; data: ptr clongdouble; stride: csize_t; n: csize_t; wmean: cdouble): cdouble {.cdecl, importc: "gsl_stats_long_double_wsd_m", dynlib: libgsl.}
proc gsl_stats_long_double_wabsdev_m*(w: ptr clongdouble; wstride: csize_t;  data: ptr clongdouble; stride: csize_t;  n: csize_t; wmean: cdouble): cdouble {.cdecl, importc: "gsl_stats_long_double_wabsdev_m", dynlib: libgsl.}
proc gsl_stats_long_double_wskew_m_sd*(w: ptr clongdouble; wstride: csize_t;   data: ptr clongdouble; stride: csize_t;   n: csize_t; wmean: cdouble; wsd: cdouble): cdouble {. cdecl, importc: "gsl_stats_long_double_wskew_m_sd", dynlib: libgsl.}
proc gsl_stats_long_double_wkurtosis_m_sd*(w: ptr clongdouble; wstride: csize_t; data: ptr clongdouble; stride: csize_t; n: csize_t; wmean: cdouble; wsd: cdouble): cdouble {. cdecl, importc: "gsl_stats_long_double_wkurtosis_m_sd", dynlib: libgsl.}
proc gsl_stats_long_double_pvariance*(data1: ptr clongdouble; stride1: csize_t;  n1: csize_t; data2: ptr clongdouble;  stride2: csize_t; n2: csize_t): cdouble {.cdecl, importc: "gsl_stats_long_double_pvariance", dynlib: libgsl.}
proc gsl_stats_long_double_ttest*(data1: ptr clongdouble; stride1: csize_t; n1: csize_t; data2: ptr clongdouble; stride2: csize_t; n2: csize_t): cdouble {.cdecl, importc: "gsl_stats_long_double_ttest", dynlib: libgsl.}
proc gsl_stats_long_double_max*(data: ptr clongdouble; stride: csize_t; n: csize_t): clongdouble {. cdecl, importc: "gsl_stats_long_double_max", dynlib: libgsl.}
proc gsl_stats_long_double_min*(data: ptr clongdouble; stride: csize_t; n: csize_t): clongdouble {. cdecl, importc: "gsl_stats_long_double_min", dynlib: libgsl.}
proc gsl_stats_long_double_minmax*(min: ptr clongdouble; max: ptr clongdouble; data: ptr clongdouble; stride: csize_t; n: csize_t) {. cdecl, importc: "gsl_stats_long_double_minmax", dynlib: libgsl.}
proc gsl_stats_long_double_max_index*(data: ptr clongdouble; stride: csize_t;  n: csize_t): csize_t {.cdecl, importc: "gsl_stats_long_double_max_index", dynlib: libgsl.}
proc gsl_stats_long_double_min_index*(data: ptr clongdouble; stride: csize_t;  n: csize_t): csize_t {.cdecl, importc: "gsl_stats_long_double_min_index", dynlib: libgsl.}
proc gsl_stats_long_double_minmax_index*(min_index: ptr csize_t; max_index: ptr csize_t; data: ptr clongdouble; stride: csize_t; n: csize_t) {.cdecl, importc: "gsl_stats_long_double_minmax_index", dynlib: libgsl.}
proc gsl_stats_long_double_select*(data: ptr clongdouble; stride: csize_t; n: csize_t; k: csize_t): clongdouble {.cdecl, importc: "gsl_stats_long_double_select", dynlib: libgsl.}
proc gsl_stats_long_double_median_from_sorted_data*(sorted_data: ptr clongdouble; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_long_double_median_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_long_double_median*(sorted_data: ptr clongdouble; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_long_double_median", dynlib: libgsl.}
proc gsl_stats_long_double_quantile_from_sorted_data*(sorted_data: ptr clongdouble; stride: csize_t; n: csize_t; f: cdouble): cdouble {. cdecl, importc: "gsl_stats_long_double_quantile_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_long_double_trmean_from_sorted_data*(trim: cdouble; sorted_data: ptr clongdouble; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_long_double_trmean_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_long_double_gastwirth_from_sorted_data*(sorted_data: ptr clongdouble; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_long_double_gastwirth_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_long_double_mad0*(data: ptr clongdouble; stride: csize_t; n: csize_t; work: ptr cdouble): cdouble {.cdecl, importc: "gsl_stats_long_double_mad0", dynlib: libgsl.}
proc gsl_stats_long_double_mad*(data: ptr clongdouble; stride: csize_t; n: csize_t; work: ptr cdouble): cdouble {.cdecl, importc: "gsl_stats_long_double_mad", dynlib: libgsl.}
proc gsl_stats_long_double_Sn0_from_sorted_data*(sorted_data: ptr clongdouble; stride: csize_t; n: csize_t; work: ptr clongdouble): clongdouble {.cdecl, importc: "gsl_stats_long_double_Sn0_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_long_double_Sn_from_sorted_data*(sorted_data: ptr clongdouble; stride: csize_t; n: csize_t; work: ptr clongdouble): cdouble {.cdecl, importc: "gsl_stats_long_double_Sn_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_long_double_Qn0_from_sorted_data*(sorted_data: ptr clongdouble; stride: csize_t; n: csize_t; work: ptr clongdouble; work_int: ptr cint): clongdouble {. cdecl, importc: "gsl_stats_long_double_Qn0_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_long_double_Qn_from_sorted_data*(sorted_data: ptr clongdouble; stride: csize_t; n: csize_t; work: ptr clongdouble; work_int: ptr cint): cdouble {. cdecl, importc: "gsl_stats_long_double_Qn_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_mean*(data: ptr cdouble; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_mean", dynlib: libgsl.}
proc gsl_stats_variance*(data: ptr cdouble; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_variance", dynlib: libgsl.}
proc gsl_stats_sd*(data: ptr cdouble; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_sd", dynlib: libgsl.}
proc gsl_stats_variance_with_fixed_mean*(data: ptr cdouble; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_variance_with_fixed_mean", dynlib: libgsl.}
proc gsl_stats_sd_with_fixed_mean*(data: ptr cdouble; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_sd_with_fixed_mean", dynlib: libgsl.}
proc gsl_stats_tss*(data: ptr cdouble; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_tss", dynlib: libgsl.}
proc gsl_stats_tss_m*(data: ptr cdouble; stride: csize_t; n: csize_t; mean: cdouble): cdouble {. cdecl, importc: "gsl_stats_tss_m", dynlib: libgsl.}
proc gsl_stats_absdev*(data: ptr cdouble; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_absdev", dynlib: libgsl.}
proc gsl_stats_skew*(data: ptr cdouble; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_skew", dynlib: libgsl.}
proc gsl_stats_kurtosis*(data: ptr cdouble; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_kurtosis", dynlib: libgsl.}
proc gsl_stats_lag1_autocorrelation*(data: ptr cdouble; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_lag1_autocorrelation", dynlib: libgsl.}
proc gsl_stats_covariance*(data1: ptr cdouble; stride1: csize_t; data2: ptr cdouble;  stride2: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_covariance", dynlib: libgsl.}
proc gsl_stats_correlation*(data1: ptr cdouble; stride1: csize_t; data2: ptr cdouble;   stride2: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_correlation", dynlib: libgsl.}
proc gsl_stats_spearman*(data1: ptr cdouble; stride1: csize_t; data2: ptr cdouble;    stride2: csize_t; n: csize_t; work: ptr cdouble): cdouble {. cdecl, importc: "gsl_stats_spearman", dynlib: libgsl.}
proc gsl_stats_variance_m*(data: ptr cdouble; stride: csize_t; n: csize_t; mean: cdouble): cdouble {. cdecl, importc: "gsl_stats_variance_m", dynlib: libgsl.}
proc gsl_stats_sd_m*(data: ptr cdouble; stride: csize_t; n: csize_t; mean: cdouble): cdouble {. cdecl, importc: "gsl_stats_sd_m", dynlib: libgsl.}
proc gsl_stats_absdev_m*(data: ptr cdouble; stride: csize_t; n: csize_t; mean: cdouble): cdouble {. cdecl, importc: "gsl_stats_absdev_m", dynlib: libgsl.}
proc gsl_stats_skew_m_sd*(data: ptr cdouble; stride: csize_t; n: csize_t; mean: cdouble; sd: cdouble): cdouble {.cdecl, importc: "gsl_stats_skew_m_sd", dynlib: libgsl.}
proc gsl_stats_kurtosis_m_sd*(data: ptr cdouble; stride: csize_t; n: csize_t;  mean: cdouble; sd: cdouble): cdouble {.cdecl, importc: "gsl_stats_kurtosis_m_sd", dynlib: libgsl.}
proc gsl_stats_lag1_autocorrelation_m*(data: ptr cdouble; stride: csize_t; n: csize_t;   mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_lag1_autocorrelation_m", dynlib: libgsl.}
proc gsl_stats_covariance_m*(data1: ptr cdouble; stride1: csize_t; data2: ptr cdouble; stride2: csize_t; n: csize_t; mean1: cdouble; mean2: cdouble): cdouble {.cdecl, importc: "gsl_stats_covariance_m", dynlib: libgsl.}
proc gsl_stats_wmean*(w: ptr cdouble; wstride: csize_t; data: ptr cdouble; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_wmean", dynlib: libgsl.}
proc gsl_stats_wvariance*(w: ptr cdouble; wstride: csize_t; data: ptr cdouble; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_wvariance", dynlib: libgsl.}
proc gsl_stats_wsd*(w: ptr cdouble; wstride: csize_t; data: ptr cdouble; stride: csize_t;  n: csize_t): cdouble {.cdecl, importc: "gsl_stats_wsd", dynlib: libgsl.}
proc gsl_stats_wvariance_with_fixed_mean*(w: ptr cdouble; wstride: csize_t; data: ptr cdouble; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_wvariance_with_fixed_mean", dynlib: libgsl.}
proc gsl_stats_wsd_with_fixed_mean*(w: ptr cdouble; wstride: csize_t;  data: ptr cdouble; stride: csize_t; n: csize_t;  mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_wsd_with_fixed_mean", dynlib: libgsl.}
proc gsl_stats_wtss*(w: ptr cdouble; wstride: csize_t; data: ptr cdouble;   stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_wtss", dynlib: libgsl.}
proc gsl_stats_wtss_m*(w: ptr cdouble; wstride: csize_t; data: ptr cdouble;  stride: csize_t; n: csize_t; wmean: cdouble): cdouble {.cdecl, importc: "gsl_stats_wtss_m", dynlib: libgsl.}
proc gsl_stats_wabsdev*(w: ptr cdouble; wstride: csize_t; data: ptr cdouble;   stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_wabsdev", dynlib: libgsl.}
proc gsl_stats_wskew*(w: ptr cdouble; wstride: csize_t; data: ptr cdouble; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_wskew", dynlib: libgsl.}
proc gsl_stats_wkurtosis*(w: ptr cdouble; wstride: csize_t; data: ptr cdouble; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_wkurtosis", dynlib: libgsl.}
proc gsl_stats_wvariance_m*(w: ptr cdouble; wstride: csize_t; data: ptr cdouble;   stride: csize_t; n: csize_t; wmean: cdouble): cdouble {. cdecl, importc: "gsl_stats_wvariance_m", dynlib: libgsl.}
proc gsl_stats_wsd_m*(w: ptr cdouble; wstride: csize_t; data: ptr cdouble; stride: csize_t; n: csize_t; wmean: cdouble): cdouble {.cdecl, importc: "gsl_stats_wsd_m", dynlib: libgsl.}
proc gsl_stats_wabsdev_m*(w: ptr cdouble; wstride: csize_t; data: ptr cdouble; stride: csize_t; n: csize_t; wmean: cdouble): cdouble {.cdecl, importc: "gsl_stats_wabsdev_m", dynlib: libgsl.}
proc gsl_stats_wskew_m_sd*(w: ptr cdouble; wstride: csize_t; data: ptr cdouble;  stride: csize_t; n: csize_t; wmean: cdouble; wsd: cdouble): cdouble {. cdecl, importc: "gsl_stats_wskew_m_sd", dynlib: libgsl.}
proc gsl_stats_wkurtosis_m_sd*(w: ptr cdouble; wstride: csize_t; data: ptr cdouble;   stride: csize_t; n: csize_t; wmean: cdouble;   wsd: cdouble): cdouble {.cdecl, importc: "gsl_stats_wkurtosis_m_sd", dynlib: libgsl.}
proc gsl_stats_pvariance*(data1: ptr cdouble; stride1: csize_t; n1: csize_t; data2: ptr cdouble; stride2: csize_t; n2: csize_t): cdouble {. cdecl, importc: "gsl_stats_pvariance", dynlib: libgsl.}
proc gsl_stats_ttest*(data1: ptr cdouble; stride1: csize_t; n1: csize_t; data2: ptr cdouble; stride2: csize_t; n2: csize_t): cdouble {. cdecl, importc: "gsl_stats_ttest", dynlib: libgsl.}
proc gsl_stats_max*(data: ptr cdouble; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_max", dynlib: libgsl.}
proc gsl_stats_min*(data: ptr cdouble; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_min", dynlib: libgsl.}
proc gsl_stats_minmax*(min: ptr cdouble; max: ptr cdouble; data: ptr cdouble;  stride: csize_t; n: csize_t) {.cdecl, importc: "gsl_stats_minmax", dynlib: libgsl.}
proc gsl_stats_max_index*(data: ptr cdouble; stride: csize_t; n: csize_t): csize_t {. cdecl, importc: "gsl_stats_max_index", dynlib: libgsl.}
proc gsl_stats_min_index*(data: ptr cdouble; stride: csize_t; n: csize_t): csize_t {. cdecl, importc: "gsl_stats_min_index", dynlib: libgsl.}
proc gsl_stats_minmax_index*(min_index: ptr csize_t; max_index: ptr csize_t; data: ptr cdouble; stride: csize_t; n: csize_t) {.cdecl, importc: "gsl_stats_minmax_index", dynlib: libgsl.}
proc gsl_stats_select*(data: ptr cdouble; stride: csize_t; n: csize_t; k: csize_t): cdouble {. cdecl, importc: "gsl_stats_select", dynlib: libgsl.}
proc gsl_stats_median_from_sorted_data*(sorted_data: ptr cdouble; stride: csize_t;    n: csize_t): cdouble {.cdecl, importc: "gsl_stats_median_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_median*(sorted_data: ptr cdouble; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_median", dynlib: libgsl.}
proc gsl_stats_quantile_from_sorted_data*(sorted_data: ptr cdouble; stride: csize_t; n: csize_t; f: cdouble): cdouble {.cdecl, importc: "gsl_stats_quantile_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_trmean_from_sorted_data*(trim: cdouble; sorted_data: ptr cdouble;    stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_trmean_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_gastwirth_from_sorted_data*(sorted_data: ptr cdouble; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_gastwirth_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_mad0*(data: ptr cdouble; stride: csize_t; n: csize_t; work: ptr cdouble): cdouble {. cdecl, importc: "gsl_stats_mad0", dynlib: libgsl.}
proc gsl_stats_mad*(data: ptr cdouble; stride: csize_t; n: csize_t; work: ptr cdouble): cdouble {. cdecl, importc: "gsl_stats_mad", dynlib: libgsl.}
proc gsl_stats_Sn0_from_sorted_data*(sorted_data: ptr cdouble; stride: csize_t; n: csize_t; work: ptr cdouble): cdouble {.cdecl, importc: "gsl_stats_Sn0_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_Sn_from_sorted_data*(sorted_data: ptr cdouble; stride: csize_t;  n: csize_t; work: ptr cdouble): cdouble {.cdecl, importc: "gsl_stats_Sn_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_Qn0_from_sorted_data*(sorted_data: ptr cdouble; stride: csize_t; n: csize_t; work: ptr cdouble; work_int: ptr cint): cdouble {. cdecl, importc: "gsl_stats_Qn0_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_Qn_from_sorted_data*(sorted_data: ptr cdouble; stride: csize_t;  n: csize_t; work: ptr cdouble; work_int: ptr cint): cdouble {. cdecl, importc: "gsl_stats_Qn_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_float_mean*(data: ptr cfloat; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_float_mean", dynlib: libgsl.}
proc gsl_stats_float_variance*(data: ptr cfloat; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_float_variance", dynlib: libgsl.}
proc gsl_stats_float_sd*(data: ptr cfloat; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_float_sd", dynlib: libgsl.}
proc gsl_stats_float_variance_with_fixed_mean*(data: ptr cfloat; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_float_variance_with_fixed_mean",  dynlib: libgsl.}
proc gsl_stats_float_sd_with_fixed_mean*(data: ptr cfloat; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_float_sd_with_fixed_mean", dynlib: libgsl.}
proc gsl_stats_float_tss*(data: ptr cfloat; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_float_tss", dynlib: libgsl.}
proc gsl_stats_float_tss_m*(data: ptr cfloat; stride: csize_t; n: csize_t; mean: cdouble): cdouble {. cdecl, importc: "gsl_stats_float_tss_m", dynlib: libgsl.}
proc gsl_stats_float_absdev*(data: ptr cfloat; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_float_absdev", dynlib: libgsl.}
proc gsl_stats_float_skew*(data: ptr cfloat; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_float_skew", dynlib: libgsl.}
proc gsl_stats_float_kurtosis*(data: ptr cfloat; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_float_kurtosis", dynlib: libgsl.}
proc gsl_stats_float_lag1_autocorrelation*(data: ptr cfloat; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_float_lag1_autocorrelation", dynlib: libgsl.}
proc gsl_stats_float_covariance*(data1: ptr cfloat; stride1: csize_t; data2: ptr cfloat; stride2: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_float_covariance", dynlib: libgsl.}
proc gsl_stats_float_correlation*(data1: ptr cfloat; stride1: csize_t; data2: ptr cfloat; stride2: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_float_correlation", dynlib: libgsl.}
proc gsl_stats_float_spearman*(data1: ptr cfloat; stride1: csize_t; data2: ptr cfloat;   stride2: csize_t; n: csize_t; work: ptr cdouble): cdouble {. cdecl, importc: "gsl_stats_float_spearman", dynlib: libgsl.}
proc gsl_stats_float_variance_m*(data: ptr cfloat; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_float_variance_m", dynlib: libgsl.}
proc gsl_stats_float_sd_m*(data: ptr cfloat; stride: csize_t; n: csize_t; mean: cdouble): cdouble {. cdecl, importc: "gsl_stats_float_sd_m", dynlib: libgsl.}
proc gsl_stats_float_absdev_m*(data: ptr cfloat; stride: csize_t; n: csize_t;   mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_float_absdev_m", dynlib: libgsl.}
proc gsl_stats_float_skew_m_sd*(data: ptr cfloat; stride: csize_t; n: csize_t; mean: cdouble; sd: cdouble): cdouble {.cdecl, importc: "gsl_stats_float_skew_m_sd", dynlib: libgsl.}
proc gsl_stats_float_kurtosis_m_sd*(data: ptr cfloat; stride: csize_t; n: csize_t;  mean: cdouble; sd: cdouble): cdouble {.cdecl, importc: "gsl_stats_float_kurtosis_m_sd", dynlib: libgsl.}
proc gsl_stats_float_lag1_autocorrelation_m*(data: ptr cfloat; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_float_lag1_autocorrelation_m",  dynlib: libgsl.}
proc gsl_stats_float_covariance_m*(data1: ptr cfloat; stride1: csize_t; data2: ptr cfloat; stride2: csize_t; n: csize_t; mean1: cdouble; mean2: cdouble): cdouble {.cdecl, importc: "gsl_stats_float_covariance_m", dynlib: libgsl.}
proc gsl_stats_float_wmean*(w: ptr cfloat; wstride: csize_t; data: ptr cfloat;   stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_float_wmean", dynlib: libgsl.}
proc gsl_stats_float_wvariance*(w: ptr cfloat; wstride: csize_t; data: ptr cfloat; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_float_wvariance", dynlib: libgsl.}
proc gsl_stats_float_wsd*(w: ptr cfloat; wstride: csize_t; data: ptr cfloat; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_float_wsd", dynlib: libgsl.}
proc gsl_stats_float_wvariance_with_fixed_mean*(w: ptr cfloat; wstride: csize_t; data: ptr cfloat; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_float_wvariance_with_fixed_mean", dynlib: libgsl.}
proc gsl_stats_float_wsd_with_fixed_mean*(w: ptr cfloat; wstride: csize_t; data: ptr cfloat; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_float_wsd_with_fixed_mean", dynlib: libgsl.}
proc gsl_stats_float_wtss*(w: ptr cfloat; wstride: csize_t; data: ptr cfloat;  stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_float_wtss", dynlib: libgsl.}
proc gsl_stats_float_wtss_m*(w: ptr cfloat; wstride: csize_t; data: ptr cfloat; stride: csize_t; n: csize_t; wmean: cdouble): cdouble {. cdecl, importc: "gsl_stats_float_wtss_m", dynlib: libgsl.}
proc gsl_stats_float_wabsdev*(w: ptr cfloat; wstride: csize_t; data: ptr cfloat;  stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_float_wabsdev", dynlib: libgsl.}
proc gsl_stats_float_wskew*(w: ptr cfloat; wstride: csize_t; data: ptr cfloat;   stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_float_wskew", dynlib: libgsl.}
proc gsl_stats_float_wkurtosis*(w: ptr cfloat; wstride: csize_t; data: ptr cfloat; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_float_wkurtosis", dynlib: libgsl.}
proc gsl_stats_float_wvariance_m*(w: ptr cfloat; wstride: csize_t; data: ptr cfloat; stride: csize_t; n: csize_t; wmean: cdouble): cdouble {. cdecl, importc: "gsl_stats_float_wvariance_m", dynlib: libgsl.}
proc gsl_stats_float_wsd_m*(w: ptr cfloat; wstride: csize_t; data: ptr cfloat;   stride: csize_t; n: csize_t; wmean: cdouble): cdouble {. cdecl, importc: "gsl_stats_float_wsd_m", dynlib: libgsl.}
proc gsl_stats_float_wabsdev_m*(w: ptr cfloat; wstride: csize_t; data: ptr cfloat; stride: csize_t; n: csize_t; wmean: cdouble): cdouble {. cdecl, importc: "gsl_stats_float_wabsdev_m", dynlib: libgsl.}
proc gsl_stats_float_wskew_m_sd*(w: ptr cfloat; wstride: csize_t; data: ptr cfloat; stride: csize_t; n: csize_t; wmean: cdouble; wsd: cdouble): cdouble {.cdecl, importc: "gsl_stats_float_wskew_m_sd", dynlib: libgsl.}
proc gsl_stats_float_wkurtosis_m_sd*(w: ptr cfloat; wstride: csize_t; data: ptr cfloat; stride: csize_t; n: csize_t; wmean: cdouble; wsd: cdouble): cdouble {.cdecl, importc: "gsl_stats_float_wkurtosis_m_sd", dynlib: libgsl.}
proc gsl_stats_float_pvariance*(data1: ptr cfloat; stride1: csize_t; n1: csize_t; data2: ptr cfloat; stride2: csize_t; n2: csize_t): cdouble {. cdecl, importc: "gsl_stats_float_pvariance", dynlib: libgsl.}
proc gsl_stats_float_ttest*(data1: ptr cfloat; stride1: csize_t; n1: csize_t;   data2: ptr cfloat; stride2: csize_t; n2: csize_t): cdouble {. cdecl, importc: "gsl_stats_float_ttest", dynlib: libgsl.}
proc gsl_stats_float_max*(data: ptr cfloat; stride: csize_t; n: csize_t): cfloat {.cdecl, importc: "gsl_stats_float_max", dynlib: libgsl.}
proc gsl_stats_float_min*(data: ptr cfloat; stride: csize_t; n: csize_t): cfloat {.cdecl, importc: "gsl_stats_float_min", dynlib: libgsl.}
proc gsl_stats_float_minmax*(min: ptr cfloat; max: ptr cfloat; data: ptr cfloat; stride: csize_t; n: csize_t) {.cdecl, importc: "gsl_stats_float_minmax", dynlib: libgsl.}
proc gsl_stats_float_max_index*(data: ptr cfloat; stride: csize_t; n: csize_t): csize_t {. cdecl, importc: "gsl_stats_float_max_index", dynlib: libgsl.}
proc gsl_stats_float_min_index*(data: ptr cfloat; stride: csize_t; n: csize_t): csize_t {. cdecl, importc: "gsl_stats_float_min_index", dynlib: libgsl.}
proc gsl_stats_float_minmax_index*(min_index: ptr csize_t; max_index: ptr csize_t; data: ptr cfloat; stride: csize_t; n: csize_t) {. cdecl, importc: "gsl_stats_float_minmax_index", dynlib: libgsl.}
proc gsl_stats_float_select*(data: ptr cfloat; stride: csize_t; n: csize_t; k: csize_t): cfloat {. cdecl, importc: "gsl_stats_float_select", dynlib: libgsl.}
proc gsl_stats_float_median_from_sorted_data*(sorted_data: ptr cfloat; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_float_median_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_float_median*(sorted_data: ptr cfloat; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_float_median", dynlib: libgsl.}
proc gsl_stats_float_quantile_from_sorted_data*(sorted_data: ptr cfloat; stride: csize_t; n: csize_t; f: cdouble): cdouble {.cdecl, importc: "gsl_stats_float_quantile_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_float_trmean_from_sorted_data*(trim: cdouble; sorted_data: ptr cfloat; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_float_trmean_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_float_gastwirth_from_sorted_data*(sorted_data: ptr cfloat; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_float_gastwirth_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_float_mad0*(data: ptr cfloat; stride: csize_t; n: csize_t;  work: ptr cdouble): cdouble {.cdecl, importc: "gsl_stats_float_mad0", dynlib: libgsl.}
proc gsl_stats_float_mad*(data: ptr cfloat; stride: csize_t; n: csize_t; work: ptr cdouble): cdouble {.cdecl, importc: "gsl_stats_float_mad", dynlib: libgsl.}
proc gsl_stats_float_Sn0_from_sorted_data*(sorted_data: ptr cfloat; stride: csize_t; n: csize_t; work: ptr cfloat): cfloat {.cdecl, importc: "gsl_stats_float_Sn0_from_sorted_data",   dynlib: libgsl.}
proc gsl_stats_float_Sn_from_sorted_data*(sorted_data: ptr cfloat; stride: csize_t; n: csize_t; work: ptr cfloat): cdouble {.cdecl, importc: "gsl_stats_float_Sn_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_float_Qn0_from_sorted_data*(sorted_data: ptr cfloat; stride: csize_t; n: csize_t; work: ptr cfloat; work_int: ptr cint): cfloat {.cdecl, importc: "gsl_stats_float_Qn0_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_float_Qn_from_sorted_data*(sorted_data: ptr cfloat; stride: csize_t; n: csize_t; work: ptr cfloat; work_int: ptr cint): cdouble {.cdecl, importc: "gsl_stats_float_Qn_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_ulong_mean*(data: ptr culong; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_ulong_mean", dynlib: libgsl.}
proc gsl_stats_ulong_variance*(data: ptr culong; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_ulong_variance", dynlib: libgsl.}
proc gsl_stats_ulong_sd*(data: ptr culong; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_ulong_sd", dynlib: libgsl.}
proc gsl_stats_ulong_variance_with_fixed_mean*(data: ptr culong; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_ulong_variance_with_fixed_mean",  dynlib: libgsl.}
proc gsl_stats_ulong_sd_with_fixed_mean*(data: ptr culong; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_ulong_sd_with_fixed_mean", dynlib: libgsl.}
proc gsl_stats_ulong_tss*(data: ptr culong; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_ulong_tss", dynlib: libgsl.}
proc gsl_stats_ulong_tss_m*(data: ptr culong; stride: csize_t; n: csize_t; mean: cdouble): cdouble {. cdecl, importc: "gsl_stats_ulong_tss_m", dynlib: libgsl.}
proc gsl_stats_ulong_absdev*(data: ptr culong; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_ulong_absdev", dynlib: libgsl.}
proc gsl_stats_ulong_skew*(data: ptr culong; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_ulong_skew", dynlib: libgsl.}
proc gsl_stats_ulong_kurtosis*(data: ptr culong; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_ulong_kurtosis", dynlib: libgsl.}
proc gsl_stats_ulong_lag1_autocorrelation*(data: ptr culong; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_ulong_lag1_autocorrelation", dynlib: libgsl.}
proc gsl_stats_ulong_covariance*(data1: ptr culong; stride1: csize_t; data2: ptr culong; stride2: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_ulong_covariance", dynlib: libgsl.}
proc gsl_stats_ulong_correlation*(data1: ptr culong; stride1: csize_t; data2: ptr culong; stride2: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_ulong_correlation", dynlib: libgsl.}
proc gsl_stats_ulong_spearman*(data1: ptr culong; stride1: csize_t; data2: ptr culong;   stride2: csize_t; n: csize_t; work: ptr cdouble): cdouble {. cdecl, importc: "gsl_stats_ulong_spearman", dynlib: libgsl.}
proc gsl_stats_ulong_variance_m*(data: ptr culong; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_ulong_variance_m", dynlib: libgsl.}
proc gsl_stats_ulong_sd_m*(data: ptr culong; stride: csize_t; n: csize_t; mean: cdouble): cdouble {. cdecl, importc: "gsl_stats_ulong_sd_m", dynlib: libgsl.}
proc gsl_stats_ulong_absdev_m*(data: ptr culong; stride: csize_t; n: csize_t;   mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_ulong_absdev_m", dynlib: libgsl.}
proc gsl_stats_ulong_skew_m_sd*(data: ptr culong; stride: csize_t; n: csize_t; mean: cdouble; sd: cdouble): cdouble {.cdecl, importc: "gsl_stats_ulong_skew_m_sd", dynlib: libgsl.}
proc gsl_stats_ulong_kurtosis_m_sd*(data: ptr culong; stride: csize_t; n: csize_t;  mean: cdouble; sd: cdouble): cdouble {.cdecl, importc: "gsl_stats_ulong_kurtosis_m_sd", dynlib: libgsl.}
proc gsl_stats_ulong_lag1_autocorrelation_m*(data: ptr culong; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_ulong_lag1_autocorrelation_m",  dynlib: libgsl.}
proc gsl_stats_ulong_covariance_m*(data1: ptr culong; stride1: csize_t; data2: ptr culong; stride2: csize_t; n: csize_t; mean1: cdouble; mean2: cdouble): cdouble {.cdecl, importc: "gsl_stats_ulong_covariance_m", dynlib: libgsl.}
proc gsl_stats_ulong_pvariance*(data1: ptr culong; stride1: csize_t; n1: csize_t; data2: ptr culong; stride2: csize_t; n2: csize_t): cdouble {. cdecl, importc: "gsl_stats_ulong_pvariance", dynlib: libgsl.}
proc gsl_stats_ulong_ttest*(data1: ptr culong; stride1: csize_t; n1: csize_t;   data2: ptr culong; stride2: csize_t; n2: csize_t): cdouble {. cdecl, importc: "gsl_stats_ulong_ttest", dynlib: libgsl.}
proc gsl_stats_ulong_max*(data: ptr culong; stride: csize_t; n: csize_t): culong {.cdecl, importc: "gsl_stats_ulong_max", dynlib: libgsl.}
proc gsl_stats_ulong_min*(data: ptr culong; stride: csize_t; n: csize_t): culong {.cdecl, importc: "gsl_stats_ulong_min", dynlib: libgsl.}
proc gsl_stats_ulong_minmax*(min: ptr culong; max: ptr culong; data: ptr culong; stride: csize_t; n: csize_t) {.cdecl, importc: "gsl_stats_ulong_minmax", dynlib: libgsl.}
proc gsl_stats_ulong_max_index*(data: ptr culong; stride: csize_t; n: csize_t): csize_t {. cdecl, importc: "gsl_stats_ulong_max_index", dynlib: libgsl.}
proc gsl_stats_ulong_min_index*(data: ptr culong; stride: csize_t; n: csize_t): csize_t {. cdecl, importc: "gsl_stats_ulong_min_index", dynlib: libgsl.}
proc gsl_stats_ulong_minmax_index*(min_index: ptr csize_t; max_index: ptr csize_t; data: ptr culong; stride: csize_t; n: csize_t) {. cdecl, importc: "gsl_stats_ulong_minmax_index", dynlib: libgsl.}
proc gsl_stats_ulong_select*(data: ptr culong; stride: csize_t; n: csize_t; k: csize_t): culong {. cdecl, importc: "gsl_stats_ulong_select", dynlib: libgsl.}
proc gsl_stats_ulong_median_from_sorted_data*(sorted_data: ptr culong; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_ulong_median_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_ulong_median*(sorted_data: ptr culong; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_ulong_median", dynlib: libgsl.}
proc gsl_stats_ulong_quantile_from_sorted_data*(sorted_data: ptr culong; stride: csize_t; n: csize_t; f: cdouble): cdouble {.cdecl, importc: "gsl_stats_ulong_quantile_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_ulong_trmean_from_sorted_data*(trim: cdouble; sorted_data: ptr culong; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_ulong_trmean_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_ulong_gastwirth_from_sorted_data*(sorted_data: ptr culong; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_ulong_gastwirth_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_ulong_mad0*(data: ptr culong; stride: csize_t; n: csize_t;  work: ptr cdouble): cdouble {.cdecl, importc: "gsl_stats_ulong_mad0", dynlib: libgsl.}
proc gsl_stats_ulong_mad*(data: ptr culong; stride: csize_t; n: csize_t; work: ptr cdouble): cdouble {.cdecl, importc: "gsl_stats_ulong_mad", dynlib: libgsl.}
proc gsl_stats_ulong_Sn0_from_sorted_data*(sorted_data: ptr culong; stride: csize_t; n: csize_t; work: ptr culong): culong {.cdecl, importc: "gsl_stats_ulong_Sn0_from_sorted_data",   dynlib: libgsl.}
proc gsl_stats_ulong_Sn_from_sorted_data*(sorted_data: ptr culong; stride: csize_t; n: csize_t; work: ptr culong): cdouble {.cdecl, importc: "gsl_stats_ulong_Sn_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_ulong_Qn0_from_sorted_data*(sorted_data: ptr culong; stride: csize_t; n: csize_t; work: ptr culong; work_int: ptr cint): culong {.cdecl, importc: "gsl_stats_ulong_Qn0_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_ulong_Qn_from_sorted_data*(sorted_data: ptr culong; stride: csize_t; n: csize_t; work: ptr culong; work_int: ptr cint): cdouble {.cdecl, importc: "gsl_stats_ulong_Qn_from_sorted_data", dynlib: libgsl.}
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
proc gsl_stats_uint_mean*(data: ptr cuint; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_uint_mean", dynlib: libgsl.}
proc gsl_stats_uint_variance*(data: ptr cuint; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_uint_variance", dynlib: libgsl.}
proc gsl_stats_uint_sd*(data: ptr cuint; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_uint_sd", dynlib: libgsl.}
proc gsl_stats_uint_variance_with_fixed_mean*(data: ptr cuint; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_uint_variance_with_fixed_mean",  dynlib: libgsl.}
proc gsl_stats_uint_sd_with_fixed_mean*(data: ptr cuint; stride: csize_t; n: csize_t;    mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_uint_sd_with_fixed_mean", dynlib: libgsl.}
proc gsl_stats_uint_tss*(data: ptr cuint; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_uint_tss", dynlib: libgsl.}
proc gsl_stats_uint_tss_m*(data: ptr cuint; stride: csize_t; n: csize_t; mean: cdouble): cdouble {. cdecl, importc: "gsl_stats_uint_tss_m", dynlib: libgsl.}
proc gsl_stats_uint_absdev*(data: ptr cuint; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_uint_absdev", dynlib: libgsl.}
proc gsl_stats_uint_skew*(data: ptr cuint; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_uint_skew", dynlib: libgsl.}
proc gsl_stats_uint_kurtosis*(data: ptr cuint; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_uint_kurtosis", dynlib: libgsl.}
proc gsl_stats_uint_lag1_autocorrelation*(data: ptr cuint; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_uint_lag1_autocorrelation", dynlib: libgsl.}
proc gsl_stats_uint_covariance*(data1: ptr cuint; stride1: csize_t; data2: ptr cuint; stride2: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_uint_covariance", dynlib: libgsl.}
proc gsl_stats_uint_correlation*(data1: ptr cuint; stride1: csize_t; data2: ptr cuint; stride2: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_uint_correlation", dynlib: libgsl.}
proc gsl_stats_uint_spearman*(data1: ptr cuint; stride1: csize_t; data2: ptr cuint;  stride2: csize_t; n: csize_t; work: ptr cdouble): cdouble {. cdecl, importc: "gsl_stats_uint_spearman", dynlib: libgsl.}
proc gsl_stats_uint_variance_m*(data: ptr cuint; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_uint_variance_m", dynlib: libgsl.}
proc gsl_stats_uint_sd_m*(data: ptr cuint; stride: csize_t; n: csize_t; mean: cdouble): cdouble {. cdecl, importc: "gsl_stats_uint_sd_m", dynlib: libgsl.}
proc gsl_stats_uint_absdev_m*(data: ptr cuint; stride: csize_t; n: csize_t;  mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_uint_absdev_m", dynlib: libgsl.}
proc gsl_stats_uint_skew_m_sd*(data: ptr cuint; stride: csize_t; n: csize_t;   mean: cdouble; sd: cdouble): cdouble {.cdecl, importc: "gsl_stats_uint_skew_m_sd", dynlib: libgsl.}
proc gsl_stats_uint_kurtosis_m_sd*(data: ptr cuint; stride: csize_t; n: csize_t; mean: cdouble; sd: cdouble): cdouble {.cdecl, importc: "gsl_stats_uint_kurtosis_m_sd", dynlib: libgsl.}
proc gsl_stats_uint_lag1_autocorrelation_m*(data: ptr cuint; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_uint_lag1_autocorrelation_m",  dynlib: libgsl.}
proc gsl_stats_uint_covariance_m*(data1: ptr cuint; stride1: csize_t; data2: ptr cuint; stride2: csize_t; n: csize_t; mean1: cdouble; mean2: cdouble): cdouble {.cdecl, importc: "gsl_stats_uint_covariance_m", dynlib: libgsl.}
proc gsl_stats_uint_pvariance*(data1: ptr cuint; stride1: csize_t; n1: csize_t;   data2: ptr cuint; stride2: csize_t; n2: csize_t): cdouble {. cdecl, importc: "gsl_stats_uint_pvariance", dynlib: libgsl.}
proc gsl_stats_uint_ttest*(data1: ptr cuint; stride1: csize_t; n1: csize_t;  data2: ptr cuint; stride2: csize_t; n2: csize_t): cdouble {. cdecl, importc: "gsl_stats_uint_ttest", dynlib: libgsl.}
proc gsl_stats_uint_max*(data: ptr cuint; stride: csize_t; n: csize_t): cuint {.cdecl, importc: "gsl_stats_uint_max", dynlib: libgsl.}
proc gsl_stats_uint_min*(data: ptr cuint; stride: csize_t; n: csize_t): cuint {.cdecl, importc: "gsl_stats_uint_min", dynlib: libgsl.}
proc gsl_stats_uint_minmax*(min: ptr cuint; max: ptr cuint; data: ptr cuint;   stride: csize_t; n: csize_t) {.cdecl, importc: "gsl_stats_uint_minmax", dynlib: libgsl.}
proc gsl_stats_uint_max_index*(data: ptr cuint; stride: csize_t; n: csize_t): csize_t {. cdecl, importc: "gsl_stats_uint_max_index", dynlib: libgsl.}
proc gsl_stats_uint_min_index*(data: ptr cuint; stride: csize_t; n: csize_t): csize_t {. cdecl, importc: "gsl_stats_uint_min_index", dynlib: libgsl.}
proc gsl_stats_uint_minmax_index*(min_index: ptr csize_t; max_index: ptr csize_t; data: ptr cuint; stride: csize_t; n: csize_t) {.cdecl, importc: "gsl_stats_uint_minmax_index", dynlib: libgsl.}
proc gsl_stats_uint_select*(data: ptr cuint; stride: csize_t; n: csize_t; k: csize_t): cuint {. cdecl, importc: "gsl_stats_uint_select", dynlib: libgsl.}
proc gsl_stats_uint_median_from_sorted_data*(sorted_data: ptr cuint; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_uint_median_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_uint_median*(sorted_data: ptr cuint; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_uint_median", dynlib: libgsl.}
proc gsl_stats_uint_quantile_from_sorted_data*(sorted_data: ptr cuint; stride: csize_t; n: csize_t; f: cdouble): cdouble {.cdecl, importc: "gsl_stats_uint_quantile_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_uint_trmean_from_sorted_data*(trim: cdouble; sorted_data: ptr cuint; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_uint_trmean_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_uint_gastwirth_from_sorted_data*(sorted_data: ptr cuint; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_uint_gastwirth_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_uint_mad0*(data: ptr cuint; stride: csize_t; n: csize_t; work: ptr cdouble): cdouble {.cdecl, importc: "gsl_stats_uint_mad0", dynlib: libgsl.}
proc gsl_stats_uint_mad*(data: ptr cuint; stride: csize_t; n: csize_t; work: ptr cdouble): cdouble {. cdecl, importc: "gsl_stats_uint_mad", dynlib: libgsl.}
proc gsl_stats_uint_Sn0_from_sorted_data*(sorted_data: ptr cuint; stride: csize_t; n: csize_t; work: ptr cuint): cuint {.cdecl, importc: "gsl_stats_uint_Sn0_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_uint_Sn_from_sorted_data*(sorted_data: ptr cuint; stride: csize_t; n: csize_t; work: ptr cuint): cdouble {.cdecl, importc: "gsl_stats_uint_Sn_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_uint_Qn0_from_sorted_data*(sorted_data: ptr cuint; stride: csize_t; n: csize_t; work: ptr cuint; work_int: ptr cint): cuint {.cdecl, importc: "gsl_stats_uint_Qn0_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_uint_Qn_from_sorted_data*(sorted_data: ptr cuint; stride: csize_t; n: csize_t; work: ptr cuint; work_int: ptr cint): cdouble {.cdecl, importc: "gsl_stats_uint_Qn_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_int_mean*(data: ptr cint; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_int_mean", dynlib: libgsl.}
proc gsl_stats_int_variance*(data: ptr cint; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_int_variance", dynlib: libgsl.}
proc gsl_stats_int_sd*(data: ptr cint; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_int_sd", dynlib: libgsl.}
proc gsl_stats_int_variance_with_fixed_mean*(data: ptr cint; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_int_variance_with_fixed_mean",  dynlib: libgsl.}
proc gsl_stats_int_sd_with_fixed_mean*(data: ptr cint; stride: csize_t; n: csize_t;   mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_int_sd_with_fixed_mean", dynlib: libgsl.}
proc gsl_stats_int_tss*(data: ptr cint; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_int_tss", dynlib: libgsl.}
proc gsl_stats_int_tss_m*(data: ptr cint; stride: csize_t; n: csize_t; mean: cdouble): cdouble {. cdecl, importc: "gsl_stats_int_tss_m", dynlib: libgsl.}
proc gsl_stats_int_absdev*(data: ptr cint; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_int_absdev", dynlib: libgsl.}
proc gsl_stats_int_skew*(data: ptr cint; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_int_skew", dynlib: libgsl.}
proc gsl_stats_int_kurtosis*(data: ptr cint; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_int_kurtosis", dynlib: libgsl.}
proc gsl_stats_int_lag1_autocorrelation*(data: ptr cint; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_int_lag1_autocorrelation", dynlib: libgsl.}
proc gsl_stats_int_covariance*(data1: ptr cint; stride1: csize_t; data2: ptr cint;   stride2: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_int_covariance", dynlib: libgsl.}
proc gsl_stats_int_correlation*(data1: ptr cint; stride1: csize_t; data2: ptr cint; stride2: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_int_correlation", dynlib: libgsl.}
proc gsl_stats_int_spearman*(data1: ptr cint; stride1: csize_t; data2: ptr cint; stride2: csize_t; n: csize_t; work: ptr cdouble): cdouble {. cdecl, importc: "gsl_stats_int_spearman", dynlib: libgsl.}
proc gsl_stats_int_variance_m*(data: ptr cint; stride: csize_t; n: csize_t;   mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_int_variance_m", dynlib: libgsl.}
proc gsl_stats_int_sd_m*(data: ptr cint; stride: csize_t; n: csize_t; mean: cdouble): cdouble {. cdecl, importc: "gsl_stats_int_sd_m", dynlib: libgsl.}
proc gsl_stats_int_absdev_m*(data: ptr cint; stride: csize_t; n: csize_t; mean: cdouble): cdouble {. cdecl, importc: "gsl_stats_int_absdev_m", dynlib: libgsl.}
proc gsl_stats_int_skew_m_sd*(data: ptr cint; stride: csize_t; n: csize_t;  mean: cdouble; sd: cdouble): cdouble {.cdecl, importc: "gsl_stats_int_skew_m_sd", dynlib: libgsl.}
proc gsl_stats_int_kurtosis_m_sd*(data: ptr cint; stride: csize_t; n: csize_t; mean: cdouble; sd: cdouble): cdouble {.cdecl, importc: "gsl_stats_int_kurtosis_m_sd", dynlib: libgsl.}
proc gsl_stats_int_lag1_autocorrelation_m*(data: ptr cint; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_int_lag1_autocorrelation_m",  dynlib: libgsl.}
proc gsl_stats_int_covariance_m*(data1: ptr cint; stride1: csize_t; data2: ptr cint; stride2: csize_t; n: csize_t; mean1: cdouble; mean2: cdouble): cdouble {.cdecl, importc: "gsl_stats_int_covariance_m", dynlib: libgsl.}
proc gsl_stats_int_pvariance*(data1: ptr cint; stride1: csize_t; n1: csize_t;  data2: ptr cint; stride2: csize_t; n2: csize_t): cdouble {. cdecl, importc: "gsl_stats_int_pvariance", dynlib: libgsl.}
proc gsl_stats_int_ttest*(data1: ptr cint; stride1: csize_t; n1: csize_t; data2: ptr cint; stride2: csize_t; n2: csize_t): cdouble {. cdecl, importc: "gsl_stats_int_ttest", dynlib: libgsl.}
proc gsl_stats_int_max*(data: ptr cint; stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_stats_int_max", dynlib: libgsl.}
proc gsl_stats_int_min*(data: ptr cint; stride: csize_t; n: csize_t): cint {.cdecl, importc: "gsl_stats_int_min", dynlib: libgsl.}
proc gsl_stats_int_minmax*(min: ptr cint; max: ptr cint; data: ptr cint; stride: csize_t;  n: csize_t) {.cdecl, importc: "gsl_stats_int_minmax",   dynlib: libgsl.}
proc gsl_stats_int_max_index*(data: ptr cint; stride: csize_t; n: csize_t): csize_t {. cdecl, importc: "gsl_stats_int_max_index", dynlib: libgsl.}
proc gsl_stats_int_min_index*(data: ptr cint; stride: csize_t; n: csize_t): csize_t {. cdecl, importc: "gsl_stats_int_min_index", dynlib: libgsl.}
proc gsl_stats_int_minmax_index*(min_index: ptr csize_t; max_index: ptr csize_t; data: ptr cint; stride: csize_t; n: csize_t) {.cdecl, importc: "gsl_stats_int_minmax_index", dynlib: libgsl.}
proc gsl_stats_int_select*(data: ptr cint; stride: csize_t; n: csize_t; k: csize_t): cint {. cdecl, importc: "gsl_stats_int_select", dynlib: libgsl.}
proc gsl_stats_int_median_from_sorted_data*(sorted_data: ptr cint; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_int_median_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_int_median*(sorted_data: ptr cint; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_int_median", dynlib: libgsl.}
proc gsl_stats_int_quantile_from_sorted_data*(sorted_data: ptr cint; stride: csize_t; n: csize_t; f: cdouble): cdouble {.cdecl, importc: "gsl_stats_int_quantile_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_int_trmean_from_sorted_data*(trim: cdouble; sorted_data: ptr cint; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_int_trmean_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_int_gastwirth_from_sorted_data*(sorted_data: ptr cint; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_int_gastwirth_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_int_mad0*(data: ptr cint; stride: csize_t; n: csize_t; work: ptr cdouble): cdouble {. cdecl, importc: "gsl_stats_int_mad0", dynlib: libgsl.}
proc gsl_stats_int_mad*(data: ptr cint; stride: csize_t; n: csize_t; work: ptr cdouble): cdouble {. cdecl, importc: "gsl_stats_int_mad", dynlib: libgsl.}
proc gsl_stats_int_Sn0_from_sorted_data*(sorted_data: ptr cint; stride: csize_t; n: csize_t; work: ptr cint): cint {.cdecl, importc: "gsl_stats_int_Sn0_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_int_Sn_from_sorted_data*(sorted_data: ptr cint; stride: csize_t;    n: csize_t; work: ptr cint): cdouble {.cdecl, importc: "gsl_stats_int_Sn_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_int_Qn0_from_sorted_data*(sorted_data: ptr cint; stride: csize_t; n: csize_t; work: ptr cint; work_int: ptr cint): cint {.cdecl, importc: "gsl_stats_int_Qn0_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_int_Qn_from_sorted_data*(sorted_data: ptr cint; stride: csize_t;    n: csize_t; work: ptr cint; work_int: ptr cint): cdouble {. cdecl, importc: "gsl_stats_int_Qn_from_sorted_data", dynlib: libgsl.}
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
proc gsl_stats_uchar_mean*(data: ptr cuchar; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_uchar_mean", dynlib: libgsl.}
proc gsl_stats_uchar_variance*(data: ptr cuchar; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_uchar_variance", dynlib: libgsl.}
proc gsl_stats_uchar_sd*(data: ptr cuchar; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_uchar_sd", dynlib: libgsl.}
proc gsl_stats_uchar_variance_with_fixed_mean*(data: ptr cuchar; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_uchar_variance_with_fixed_mean",  dynlib: libgsl.}
proc gsl_stats_uchar_sd_with_fixed_mean*(data: ptr cuchar; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_uchar_sd_with_fixed_mean", dynlib: libgsl.}
proc gsl_stats_uchar_tss*(data: ptr cuchar; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_uchar_tss", dynlib: libgsl.}
proc gsl_stats_uchar_tss_m*(data: ptr cuchar; stride: csize_t; n: csize_t; mean: cdouble): cdouble {. cdecl, importc: "gsl_stats_uchar_tss_m", dynlib: libgsl.}
proc gsl_stats_uchar_absdev*(data: ptr cuchar; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_uchar_absdev", dynlib: libgsl.}
proc gsl_stats_uchar_skew*(data: ptr cuchar; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_uchar_skew", dynlib: libgsl.}
proc gsl_stats_uchar_kurtosis*(data: ptr cuchar; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_uchar_kurtosis", dynlib: libgsl.}
proc gsl_stats_uchar_lag1_autocorrelation*(data: ptr cuchar; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_uchar_lag1_autocorrelation", dynlib: libgsl.}
proc gsl_stats_uchar_covariance*(data1: ptr cuchar; stride1: csize_t; data2: ptr cuchar; stride2: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_uchar_covariance", dynlib: libgsl.}
proc gsl_stats_uchar_correlation*(data1: ptr cuchar; stride1: csize_t; data2: ptr cuchar; stride2: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_uchar_correlation", dynlib: libgsl.}
proc gsl_stats_uchar_spearman*(data1: ptr cuchar; stride1: csize_t; data2: ptr cuchar;   stride2: csize_t; n: csize_t; work: ptr cdouble): cdouble {. cdecl, importc: "gsl_stats_uchar_spearman", dynlib: libgsl.}
proc gsl_stats_uchar_variance_m*(data: ptr cuchar; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_uchar_variance_m", dynlib: libgsl.}
proc gsl_stats_uchar_sd_m*(data: ptr cuchar; stride: csize_t; n: csize_t; mean: cdouble): cdouble {. cdecl, importc: "gsl_stats_uchar_sd_m", dynlib: libgsl.}
proc gsl_stats_uchar_absdev_m*(data: ptr cuchar; stride: csize_t; n: csize_t;   mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_uchar_absdev_m", dynlib: libgsl.}
proc gsl_stats_uchar_skew_m_sd*(data: ptr cuchar; stride: csize_t; n: csize_t; mean: cdouble; sd: cdouble): cdouble {.cdecl, importc: "gsl_stats_uchar_skew_m_sd", dynlib: libgsl.}
proc gsl_stats_uchar_kurtosis_m_sd*(data: ptr cuchar; stride: csize_t; n: csize_t;  mean: cdouble; sd: cdouble): cdouble {.cdecl, importc: "gsl_stats_uchar_kurtosis_m_sd", dynlib: libgsl.}
proc gsl_stats_uchar_lag1_autocorrelation_m*(data: ptr cuchar; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_uchar_lag1_autocorrelation_m",  dynlib: libgsl.}
proc gsl_stats_uchar_covariance_m*(data1: ptr cuchar; stride1: csize_t; data2: ptr cuchar; stride2: csize_t; n: csize_t; mean1: cdouble; mean2: cdouble): cdouble {.cdecl, importc: "gsl_stats_uchar_covariance_m", dynlib: libgsl.}
proc gsl_stats_uchar_pvariance*(data1: ptr cuchar; stride1: csize_t; n1: csize_t; data2: ptr cuchar; stride2: csize_t; n2: csize_t): cdouble {. cdecl, importc: "gsl_stats_uchar_pvariance", dynlib: libgsl.}
proc gsl_stats_uchar_ttest*(data1: ptr cuchar; stride1: csize_t; n1: csize_t;   data2: ptr cuchar; stride2: csize_t; n2: csize_t): cdouble {. cdecl, importc: "gsl_stats_uchar_ttest", dynlib: libgsl.}
proc gsl_stats_uchar_max*(data: ptr cuchar; stride: csize_t; n: csize_t): cuchar {.cdecl, importc: "gsl_stats_uchar_max", dynlib: libgsl.}
proc gsl_stats_uchar_min*(data: ptr cuchar; stride: csize_t; n: csize_t): cuchar {.cdecl, importc: "gsl_stats_uchar_min", dynlib: libgsl.}
proc gsl_stats_uchar_minmax*(min: ptr cuchar; max: ptr cuchar; data: ptr cuchar; stride: csize_t; n: csize_t) {.cdecl, importc: "gsl_stats_uchar_minmax", dynlib: libgsl.}
proc gsl_stats_uchar_max_index*(data: ptr cuchar; stride: csize_t; n: csize_t): csize_t {. cdecl, importc: "gsl_stats_uchar_max_index", dynlib: libgsl.}
proc gsl_stats_uchar_min_index*(data: ptr cuchar; stride: csize_t; n: csize_t): csize_t {. cdecl, importc: "gsl_stats_uchar_min_index", dynlib: libgsl.}
proc gsl_stats_uchar_minmax_index*(min_index: ptr csize_t; max_index: ptr csize_t; data: ptr cuchar; stride: csize_t; n: csize_t) {. cdecl, importc: "gsl_stats_uchar_minmax_index", dynlib: libgsl.}
proc gsl_stats_uchar_select*(data: ptr cuchar; stride: csize_t; n: csize_t; k: csize_t): cuchar {. cdecl, importc: "gsl_stats_uchar_select", dynlib: libgsl.}
proc gsl_stats_uchar_median_from_sorted_data*(sorted_data: ptr cuchar; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_uchar_median_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_uchar_median*(sorted_data: ptr cuchar; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_uchar_median", dynlib: libgsl.}
proc gsl_stats_uchar_quantile_from_sorted_data*(sorted_data: ptr cuchar; stride: csize_t; n: csize_t; f: cdouble): cdouble {.cdecl, importc: "gsl_stats_uchar_quantile_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_uchar_trmean_from_sorted_data*(trim: cdouble; sorted_data: ptr cuchar; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_uchar_trmean_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_uchar_gastwirth_from_sorted_data*(sorted_data: ptr cuchar; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_uchar_gastwirth_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_uchar_mad0*(data: ptr cuchar; stride: csize_t; n: csize_t;  work: ptr cdouble): cdouble {.cdecl, importc: "gsl_stats_uchar_mad0", dynlib: libgsl.}
proc gsl_stats_uchar_mad*(data: ptr cuchar; stride: csize_t; n: csize_t; work: ptr cdouble): cdouble {.cdecl, importc: "gsl_stats_uchar_mad", dynlib: libgsl.}
proc gsl_stats_uchar_Sn0_from_sorted_data*(sorted_data: ptr cuchar; stride: csize_t; n: csize_t; work: ptr cuchar): cuchar {.cdecl, importc: "gsl_stats_uchar_Sn0_from_sorted_data",   dynlib: libgsl.}
proc gsl_stats_uchar_Sn_from_sorted_data*(sorted_data: ptr cuchar; stride: csize_t; n: csize_t; work: ptr cuchar): cdouble {.cdecl, importc: "gsl_stats_uchar_Sn_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_uchar_Qn0_from_sorted_data*(sorted_data: ptr cuchar; stride: csize_t; n: csize_t; work: ptr cuchar; work_int: ptr cint): cuchar {.cdecl, importc: "gsl_stats_uchar_Qn0_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_uchar_Qn_from_sorted_data*(sorted_data: ptr cuchar; stride: csize_t; n: csize_t; work: ptr cuchar; work_int: ptr cint): cdouble {.cdecl, importc: "gsl_stats_uchar_Qn_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_char_mean*(data: ptr char; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_char_mean", dynlib: libgsl.}
proc gsl_stats_char_variance*(data: ptr char; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_char_variance", dynlib: libgsl.}
proc gsl_stats_char_sd*(data: ptr char; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_char_sd", dynlib: libgsl.}
proc gsl_stats_char_variance_with_fixed_mean*(data: ptr char; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_char_variance_with_fixed_mean",  dynlib: libgsl.}
proc gsl_stats_char_sd_with_fixed_mean*(data: ptr char; stride: csize_t; n: csize_t;    mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_char_sd_with_fixed_mean", dynlib: libgsl.}
proc gsl_stats_char_tss*(data: ptr char; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_char_tss", dynlib: libgsl.}
proc gsl_stats_char_tss_m*(data: ptr char; stride: csize_t; n: csize_t; mean: cdouble): cdouble {. cdecl, importc: "gsl_stats_char_tss_m", dynlib: libgsl.}
proc gsl_stats_char_absdev*(data: ptr char; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_char_absdev", dynlib: libgsl.}
proc gsl_stats_char_skew*(data: ptr char; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_char_skew", dynlib: libgsl.}
proc gsl_stats_char_kurtosis*(data: ptr char; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_char_kurtosis", dynlib: libgsl.}
proc gsl_stats_char_lag1_autocorrelation*(data: ptr char; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_char_lag1_autocorrelation", dynlib: libgsl.}
proc gsl_stats_char_covariance*(data1: ptr char; stride1: csize_t; data2: ptr char; stride2: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_char_covariance", dynlib: libgsl.}
proc gsl_stats_char_correlation*(data1: ptr char; stride1: csize_t; data2: ptr char; stride2: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_char_correlation", dynlib: libgsl.}
proc gsl_stats_char_spearman*(data1: ptr char; stride1: csize_t; data2: ptr char;  stride2: csize_t; n: csize_t; work: ptr cdouble): cdouble {. cdecl, importc: "gsl_stats_char_spearman", dynlib: libgsl.}
proc gsl_stats_char_variance_m*(data: ptr char; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_char_variance_m", dynlib: libgsl.}
proc gsl_stats_char_sd_m*(data: ptr char; stride: csize_t; n: csize_t; mean: cdouble): cdouble {. cdecl, importc: "gsl_stats_char_sd_m", dynlib: libgsl.}
proc gsl_stats_char_absdev_m*(data: ptr char; stride: csize_t; n: csize_t; mean: cdouble): cdouble {. cdecl, importc: "gsl_stats_char_absdev_m", dynlib: libgsl.}
proc gsl_stats_char_skew_m_sd*(data: ptr char; stride: csize_t; n: csize_t;   mean: cdouble; sd: cdouble): cdouble {.cdecl, importc: "gsl_stats_char_skew_m_sd", dynlib: libgsl.}
proc gsl_stats_char_kurtosis_m_sd*(data: ptr char; stride: csize_t; n: csize_t; mean: cdouble; sd: cdouble): cdouble {.cdecl, importc: "gsl_stats_char_kurtosis_m_sd", dynlib: libgsl.}
proc gsl_stats_char_lag1_autocorrelation_m*(data: ptr char; stride: csize_t; n: csize_t; mean: cdouble): cdouble {.cdecl, importc: "gsl_stats_char_lag1_autocorrelation_m",  dynlib: libgsl.}
proc gsl_stats_char_covariance_m*(data1: ptr char; stride1: csize_t; data2: ptr char; stride2: csize_t; n: csize_t; mean1: cdouble; mean2: cdouble): cdouble {.cdecl, importc: "gsl_stats_char_covariance_m", dynlib: libgsl.}
proc gsl_stats_char_pvariance*(data1: ptr char; stride1: csize_t; n1: csize_t;   data2: ptr char; stride2: csize_t; n2: csize_t): cdouble {. cdecl, importc: "gsl_stats_char_pvariance", dynlib: libgsl.}
proc gsl_stats_char_ttest*(data1: ptr char; stride1: csize_t; n1: csize_t;  data2: ptr char; stride2: csize_t; n2: csize_t): cdouble {. cdecl, importc: "gsl_stats_char_ttest", dynlib: libgsl.}
proc gsl_stats_char_max*(data: ptr char; stride: csize_t; n: csize_t): char {.cdecl, importc: "gsl_stats_char_max", dynlib: libgsl.}
proc gsl_stats_char_min*(data: ptr char; stride: csize_t; n: csize_t): char {.cdecl, importc: "gsl_stats_char_min", dynlib: libgsl.}
proc gsl_stats_char_minmax*(min: cstring; max: cstring; data: ptr char; stride: csize_t;   n: csize_t) {.cdecl, importc: "gsl_stats_char_minmax", dynlib: libgsl.}
proc gsl_stats_char_max_index*(data: ptr char; stride: csize_t; n: csize_t): csize_t {. cdecl, importc: "gsl_stats_char_max_index", dynlib: libgsl.}
proc gsl_stats_char_min_index*(data: ptr char; stride: csize_t; n: csize_t): csize_t {. cdecl, importc: "gsl_stats_char_min_index", dynlib: libgsl.}
proc gsl_stats_char_minmax_index*(min_index: ptr csize_t; max_index: ptr csize_t; data: ptr char; stride: csize_t; n: csize_t) {.cdecl, importc: "gsl_stats_char_minmax_index", dynlib: libgsl.}
proc gsl_stats_char_select*(data: ptr char; stride: csize_t; n: csize_t; k: csize_t): char {. cdecl, importc: "gsl_stats_char_select", dynlib: libgsl.}
proc gsl_stats_char_median_from_sorted_data*(sorted_data: ptr char; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_char_median_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_char_median*(sorted_data: ptr char; stride: csize_t; n: csize_t): cdouble {. cdecl, importc: "gsl_stats_char_median", dynlib: libgsl.}
proc gsl_stats_char_quantile_from_sorted_data*(sorted_data: ptr char; stride: csize_t; n: csize_t; f: cdouble): cdouble {.cdecl, importc: "gsl_stats_char_quantile_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_char_trmean_from_sorted_data*(trim: cdouble; sorted_data: ptr char; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_char_trmean_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_char_gastwirth_from_sorted_data*(sorted_data: ptr char; stride: csize_t; n: csize_t): cdouble {.cdecl, importc: "gsl_stats_char_gastwirth_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_char_mad0*(data: ptr char; stride: csize_t; n: csize_t; work: ptr cdouble): cdouble {. cdecl, importc: "gsl_stats_char_mad0", dynlib: libgsl.}
proc gsl_stats_char_mad*(data: ptr char; stride: csize_t; n: csize_t; work: ptr cdouble): cdouble {. cdecl, importc: "gsl_stats_char_mad", dynlib: libgsl.}
proc gsl_stats_char_Sn0_from_sorted_data*(sorted_data: ptr char; stride: csize_t; n: csize_t; work: ptr char): char {.cdecl, importc: "gsl_stats_char_Sn0_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_char_Sn_from_sorted_data*(sorted_data: ptr char; stride: csize_t; n: csize_t; work: ptr char): cdouble {.cdecl, importc: "gsl_stats_char_Sn_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_char_Qn0_from_sorted_data*(sorted_data: ptr char; stride: csize_t; n: csize_t; work: ptr char; work_int: ptr cint): char {.cdecl, importc: "gsl_stats_char_Qn0_from_sorted_data", dynlib: libgsl.}
proc gsl_stats_char_Qn_from_sorted_data*(sorted_data: ptr char; stride: csize_t; n: csize_t; work: ptr char; work_int: ptr cint): cdouble {.cdecl, importc: "gsl_stats_char_Qn_from_sorted_data", dynlib: libgsl.}
