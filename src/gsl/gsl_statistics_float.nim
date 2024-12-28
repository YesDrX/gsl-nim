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
