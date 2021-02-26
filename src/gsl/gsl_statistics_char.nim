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
