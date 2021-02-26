import gsl/gsl_linalg
import strformat

var
    a_data = @[ 0.18, 0.60, 0.57, 0.96,
                0.41, 0.24, 0.99, 0.58,
                0.14, 0.30, 0.97, 0.66,
                0.51, 0.13, 0.19, 0.85]
    b_data = @[ 1.0, 2.0, 3.0, 4.0]

    m = gsl_matrix_view_array(a_data[0].addr, 4, 4)
    b = gsl_vector_view_array(b_data[0].addr, 4)
    x = gsl_vector_alloc(4)

    s : cint
    p = gsl_permutation_alloc(4)

echo m.matrix
discard gsl_linalg_LU_decomp(m.matrix.addr, p, s.addr)
discard gsl_linalg_LU_solve(m.matrix.addr, p, b.vector.addr, x)

echo x[]
var
    xdata = x[].data
    xdataArr = cast[ptr UncheckedArray[cdouble]](xdata)

echo "a_data^(-1) * b_data ="
echo fmt"{xdataArr[0]:0.6f}"
echo fmt"{xdataArr[1]:0.6f}"
echo fmt"{xdataArr[2]:0.6f}"
echo fmt"{xdataArr[3]:0.6f}"

gsl_permutation_free(p)
gsl_vector_free(x)