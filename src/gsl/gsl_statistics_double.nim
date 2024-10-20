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
