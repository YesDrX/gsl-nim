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
