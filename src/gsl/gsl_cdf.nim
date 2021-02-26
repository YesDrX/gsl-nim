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

proc gsl_cdf_ugaussian_P*(x: cdouble): cdouble {.cdecl, importc: "gsl_cdf_ugaussian_P", dynlib: libgsl.}
proc gsl_cdf_ugaussian_Q*(x: cdouble): cdouble {.cdecl, importc: "gsl_cdf_ugaussian_Q", dynlib: libgsl.}
proc gsl_cdf_ugaussian_Pinv*(P: cdouble): cdouble {.cdecl, importc: "gsl_cdf_ugaussian_Pinv", dynlib: libgsl.}
proc gsl_cdf_ugaussian_Qinv*(Q: cdouble): cdouble {.cdecl, importc: "gsl_cdf_ugaussian_Qinv", dynlib: libgsl.}
proc gsl_cdf_gaussian_P*(x: cdouble; sigma: cdouble): cdouble {.cdecl, importc: "gsl_cdf_gaussian_P", dynlib: libgsl.}
proc gsl_cdf_gaussian_Q*(x: cdouble; sigma: cdouble): cdouble {.cdecl, importc: "gsl_cdf_gaussian_Q", dynlib: libgsl.}
proc gsl_cdf_gaussian_Pinv*(P: cdouble; sigma: cdouble): cdouble {.cdecl, importc: "gsl_cdf_gaussian_Pinv", dynlib: libgsl.}
proc gsl_cdf_gaussian_Qinv*(Q: cdouble; sigma: cdouble): cdouble {.cdecl, importc: "gsl_cdf_gaussian_Qinv", dynlib: libgsl.}
proc gsl_cdf_gamma_P*(x: cdouble; a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_cdf_gamma_P", dynlib: libgsl.}
proc gsl_cdf_gamma_Q*(x: cdouble; a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_cdf_gamma_Q", dynlib: libgsl.}
proc gsl_cdf_gamma_Pinv*(P: cdouble; a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_cdf_gamma_Pinv", dynlib: libgsl.}
proc gsl_cdf_gamma_Qinv*(Q: cdouble; a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_cdf_gamma_Qinv", dynlib: libgsl.}
proc gsl_cdf_cauchy_P*(x: cdouble; a: cdouble): cdouble {.cdecl, importc: "gsl_cdf_cauchy_P", dynlib: libgsl.}
proc gsl_cdf_cauchy_Q*(x: cdouble; a: cdouble): cdouble {.cdecl, importc: "gsl_cdf_cauchy_Q", dynlib: libgsl.}
proc gsl_cdf_cauchy_Pinv*(P: cdouble; a: cdouble): cdouble {.cdecl, importc: "gsl_cdf_cauchy_Pinv", dynlib: libgsl.}
proc gsl_cdf_cauchy_Qinv*(Q: cdouble; a: cdouble): cdouble {.cdecl, importc: "gsl_cdf_cauchy_Qinv", dynlib: libgsl.}
proc gsl_cdf_laplace_P*(x: cdouble; a: cdouble): cdouble {.cdecl, importc: "gsl_cdf_laplace_P", dynlib: libgsl.}
proc gsl_cdf_laplace_Q*(x: cdouble; a: cdouble): cdouble {.cdecl, importc: "gsl_cdf_laplace_Q", dynlib: libgsl.}
proc gsl_cdf_laplace_Pinv*(P: cdouble; a: cdouble): cdouble {.cdecl, importc: "gsl_cdf_laplace_Pinv", dynlib: libgsl.}
proc gsl_cdf_laplace_Qinv*(Q: cdouble; a: cdouble): cdouble {.cdecl, importc: "gsl_cdf_laplace_Qinv", dynlib: libgsl.}
proc gsl_cdf_rayleigh_P*(x: cdouble; sigma: cdouble): cdouble {.cdecl, importc: "gsl_cdf_rayleigh_P", dynlib: libgsl.}
proc gsl_cdf_rayleigh_Q*(x: cdouble; sigma: cdouble): cdouble {.cdecl, importc: "gsl_cdf_rayleigh_Q", dynlib: libgsl.}
proc gsl_cdf_rayleigh_Pinv*(P: cdouble; sigma: cdouble): cdouble {.cdecl, importc: "gsl_cdf_rayleigh_Pinv", dynlib: libgsl.}
proc gsl_cdf_rayleigh_Qinv*(Q: cdouble; sigma: cdouble): cdouble {.cdecl, importc: "gsl_cdf_rayleigh_Qinv", dynlib: libgsl.}
proc gsl_cdf_chisq_P*(x: cdouble; nu: cdouble): cdouble {.cdecl, importc: "gsl_cdf_chisq_P", dynlib: libgsl.}
proc gsl_cdf_chisq_Q*(x: cdouble; nu: cdouble): cdouble {.cdecl, importc: "gsl_cdf_chisq_Q", dynlib: libgsl.}
proc gsl_cdf_chisq_Pinv*(P: cdouble; nu: cdouble): cdouble {.cdecl, importc: "gsl_cdf_chisq_Pinv", dynlib: libgsl.}
proc gsl_cdf_chisq_Qinv*(Q: cdouble; nu: cdouble): cdouble {.cdecl, importc: "gsl_cdf_chisq_Qinv", dynlib: libgsl.}
proc gsl_cdf_exponential_P*(x: cdouble; mu: cdouble): cdouble {.cdecl, importc: "gsl_cdf_exponential_P", dynlib: libgsl.}
proc gsl_cdf_exponential_Q*(x: cdouble; mu: cdouble): cdouble {.cdecl, importc: "gsl_cdf_exponential_Q", dynlib: libgsl.}
proc gsl_cdf_exponential_Pinv*(P: cdouble; mu: cdouble): cdouble {.cdecl, importc: "gsl_cdf_exponential_Pinv", dynlib: libgsl.}
proc gsl_cdf_exponential_Qinv*(Q: cdouble; mu: cdouble): cdouble {.cdecl, importc: "gsl_cdf_exponential_Qinv", dynlib: libgsl.}
proc gsl_cdf_exppow_P*(x: cdouble; a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_cdf_exppow_P", dynlib: libgsl.}
proc gsl_cdf_exppow_Q*(x: cdouble; a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_cdf_exppow_Q", dynlib: libgsl.}
proc gsl_cdf_tdist_P*(x: cdouble; nu: cdouble): cdouble {.cdecl, importc: "gsl_cdf_tdist_P", dynlib: libgsl.}
proc gsl_cdf_tdist_Q*(x: cdouble; nu: cdouble): cdouble {.cdecl, importc: "gsl_cdf_tdist_Q", dynlib: libgsl.}
proc gsl_cdf_tdist_Pinv*(P: cdouble; nu: cdouble): cdouble {.cdecl, importc: "gsl_cdf_tdist_Pinv", dynlib: libgsl.}
proc gsl_cdf_tdist_Qinv*(Q: cdouble; nu: cdouble): cdouble {.cdecl, importc: "gsl_cdf_tdist_Qinv", dynlib: libgsl.}
proc gsl_cdf_fdist_P*(x: cdouble; nu1: cdouble; nu2: cdouble): cdouble {.cdecl, importc: "gsl_cdf_fdist_P", dynlib: libgsl.}
proc gsl_cdf_fdist_Q*(x: cdouble; nu1: cdouble; nu2: cdouble): cdouble {.cdecl, importc: "gsl_cdf_fdist_Q", dynlib: libgsl.}
proc gsl_cdf_fdist_Pinv*(P: cdouble; nu1: cdouble; nu2: cdouble): cdouble {.cdecl, importc: "gsl_cdf_fdist_Pinv", dynlib: libgsl.}
proc gsl_cdf_fdist_Qinv*(Q: cdouble; nu1: cdouble; nu2: cdouble): cdouble {.cdecl, importc: "gsl_cdf_fdist_Qinv", dynlib: libgsl.}
proc gsl_cdf_beta_P*(x: cdouble; a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_cdf_beta_P", dynlib: libgsl.}
proc gsl_cdf_beta_Q*(x: cdouble; a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_cdf_beta_Q", dynlib: libgsl.}
proc gsl_cdf_beta_Pinv*(P: cdouble; a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_cdf_beta_Pinv", dynlib: libgsl.}
proc gsl_cdf_beta_Qinv*(Q: cdouble; a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_cdf_beta_Qinv", dynlib: libgsl.}
proc gsl_cdf_flat_P*(x: cdouble; a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_cdf_flat_P", dynlib: libgsl.}
proc gsl_cdf_flat_Q*(x: cdouble; a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_cdf_flat_Q", dynlib: libgsl.}
proc gsl_cdf_flat_Pinv*(P: cdouble; a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_cdf_flat_Pinv", dynlib: libgsl.}
proc gsl_cdf_flat_Qinv*(Q: cdouble; a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_cdf_flat_Qinv", dynlib: libgsl.}
proc gsl_cdf_lognormal_P*(x: cdouble; zeta: cdouble; sigma: cdouble): cdouble {.cdecl, importc: "gsl_cdf_lognormal_P", dynlib: libgsl.}
proc gsl_cdf_lognormal_Q*(x: cdouble; zeta: cdouble; sigma: cdouble): cdouble {.cdecl, importc: "gsl_cdf_lognormal_Q", dynlib: libgsl.}
proc gsl_cdf_lognormal_Pinv*(P: cdouble; zeta: cdouble; sigma: cdouble): cdouble {. cdecl, importc: "gsl_cdf_lognormal_Pinv", dynlib: libgsl.}
proc gsl_cdf_lognormal_Qinv*(Q: cdouble; zeta: cdouble; sigma: cdouble): cdouble {. cdecl, importc: "gsl_cdf_lognormal_Qinv", dynlib: libgsl.}
proc gsl_cdf_gumbel1_P*(x: cdouble; a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_cdf_gumbel1_P", dynlib: libgsl.}
proc gsl_cdf_gumbel1_Q*(x: cdouble; a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_cdf_gumbel1_Q", dynlib: libgsl.}
proc gsl_cdf_gumbel1_Pinv*(P: cdouble; a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_cdf_gumbel1_Pinv", dynlib: libgsl.}
proc gsl_cdf_gumbel1_Qinv*(Q: cdouble; a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_cdf_gumbel1_Qinv", dynlib: libgsl.}
proc gsl_cdf_gumbel2_P*(x: cdouble; a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_cdf_gumbel2_P", dynlib: libgsl.}
proc gsl_cdf_gumbel2_Q*(x: cdouble; a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_cdf_gumbel2_Q", dynlib: libgsl.}
proc gsl_cdf_gumbel2_Pinv*(P: cdouble; a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_cdf_gumbel2_Pinv", dynlib: libgsl.}
proc gsl_cdf_gumbel2_Qinv*(Q: cdouble; a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_cdf_gumbel2_Qinv", dynlib: libgsl.}
proc gsl_cdf_weibull_P*(x: cdouble; a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_cdf_weibull_P", dynlib: libgsl.}
proc gsl_cdf_weibull_Q*(x: cdouble; a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_cdf_weibull_Q", dynlib: libgsl.}
proc gsl_cdf_weibull_Pinv*(P: cdouble; a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_cdf_weibull_Pinv", dynlib: libgsl.}
proc gsl_cdf_weibull_Qinv*(Q: cdouble; a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_cdf_weibull_Qinv", dynlib: libgsl.}
proc gsl_cdf_pareto_P*(x: cdouble; a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_cdf_pareto_P", dynlib: libgsl.}
proc gsl_cdf_pareto_Q*(x: cdouble; a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_cdf_pareto_Q", dynlib: libgsl.}
proc gsl_cdf_pareto_Pinv*(P: cdouble; a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_cdf_pareto_Pinv", dynlib: libgsl.}
proc gsl_cdf_pareto_Qinv*(Q: cdouble; a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_cdf_pareto_Qinv", dynlib: libgsl.}
proc gsl_cdf_logistic_P*(x: cdouble; a: cdouble): cdouble {.cdecl, importc: "gsl_cdf_logistic_P", dynlib: libgsl.}
proc gsl_cdf_logistic_Q*(x: cdouble; a: cdouble): cdouble {.cdecl, importc: "gsl_cdf_logistic_Q", dynlib: libgsl.}
proc gsl_cdf_logistic_Pinv*(P: cdouble; a: cdouble): cdouble {.cdecl, importc: "gsl_cdf_logistic_Pinv", dynlib: libgsl.}
proc gsl_cdf_logistic_Qinv*(Q: cdouble; a: cdouble): cdouble {.cdecl, importc: "gsl_cdf_logistic_Qinv", dynlib: libgsl.}
proc gsl_cdf_binomial_P*(k: cuint; p: cdouble; n: cuint): cdouble {.cdecl, importc: "gsl_cdf_binomial_P", dynlib: libgsl.}
proc gsl_cdf_binomial_Q*(k: cuint; p: cdouble; n: cuint): cdouble {.cdecl, importc: "gsl_cdf_binomial_Q", dynlib: libgsl.}
proc gsl_cdf_poisson_P*(k: cuint; mu: cdouble): cdouble {.cdecl, importc: "gsl_cdf_poisson_P", dynlib: libgsl.}
proc gsl_cdf_poisson_Q*(k: cuint; mu: cdouble): cdouble {.cdecl, importc: "gsl_cdf_poisson_Q", dynlib: libgsl.}
proc gsl_cdf_geometric_P*(k: cuint; p: cdouble): cdouble {.cdecl, importc: "gsl_cdf_geometric_P", dynlib: libgsl.}
proc gsl_cdf_geometric_Q*(k: cuint; p: cdouble): cdouble {.cdecl, importc: "gsl_cdf_geometric_Q", dynlib: libgsl.}
proc gsl_cdf_negative_binomial_P*(k: cuint; p: cdouble; n: cdouble): cdouble {.cdecl, importc: "gsl_cdf_negative_binomial_P", dynlib: libgsl.}
proc gsl_cdf_negative_binomial_Q*(k: cuint; p: cdouble; n: cdouble): cdouble {.cdecl, importc: "gsl_cdf_negative_binomial_Q", dynlib: libgsl.}
proc gsl_cdf_pascal_P*(k: cuint; p: cdouble; n: cuint): cdouble {.cdecl, importc: "gsl_cdf_pascal_P", dynlib: libgsl.}
proc gsl_cdf_pascal_Q*(k: cuint; p: cdouble; n: cuint): cdouble {.cdecl, importc: "gsl_cdf_pascal_Q", dynlib: libgsl.}
proc gsl_cdf_hypergeometric_P*(k: cuint; n1: cuint; n2: cuint; t: cuint): cdouble {.cdecl, importc: "gsl_cdf_hypergeometric_P", dynlib: libgsl.}
proc gsl_cdf_hypergeometric_Q*(k: cuint; n1: cuint; n2: cuint; t: cuint): cdouble {.cdecl, importc: "gsl_cdf_hypergeometric_Q", dynlib: libgsl.}
