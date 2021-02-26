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
