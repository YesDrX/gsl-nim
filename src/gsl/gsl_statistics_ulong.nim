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
