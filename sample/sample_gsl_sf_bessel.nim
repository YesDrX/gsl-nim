import gsl/gsl_errno
import gsl/gsl_sf_bessel
import strformat

var
    x = 5.0
    result : gsl_sf_result
    expected = -0.17759677131433830434739701
    status = gsl_sf_bessel_J0_e(x, result.addr)

echo fmt"status = {gsl_strerror(status)}"
echo fmt"J0({x}) = {result.val} +/- {result.err}"
echo fmt"exact = {expected}"
