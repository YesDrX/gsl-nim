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
