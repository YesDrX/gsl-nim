import gsl/gsl_poly
import strformat

var
    i : cint
    a = @[-1.0, 0.0, 0.0, 0.0, 0.0, 1.0]
    z = newSeq[cdouble](10)

    w = gsl_poly_complex_workspace_alloc(6)

discard gsl_poly_complex_solve(a[0].addr, 6, w, z[0].addr)
gsl_poly_complex_workspace_free(w)

echo fmt"Roots for x^5 - 1 = 0"
for i in 0 .. 4:
    echo fmt"z{i} = {z[2*i]} + {z[2*i+1]} i"