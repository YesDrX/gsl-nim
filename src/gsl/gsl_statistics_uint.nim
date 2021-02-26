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
