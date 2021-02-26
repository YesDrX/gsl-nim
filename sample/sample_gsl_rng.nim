import gsl/gsl_rng

var
    Tt: ptr gsl_rng_type
    r: ptr gsl_rng
    i = 10
    n = 10
    u : cdouble

discard gsl_rng_env_setup()
Tt = gsl_rng_default
r = gsl_rng_alloc(Tt)

for i in 0 .. n-1:
    u = gsl_rng_uniform(r)
    echo u

gsl_rng_free(r)