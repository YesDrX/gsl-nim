import gsl/gsl_permutation

{.emit: "#include <stdio.h>".}
var
    p = gsl_permutation_alloc(3)
    pData = cast[ptr UncheckedArray[byte]](p)
    cstdout {.importc : "stdout", nodecl.} : ptr File

gsl_permutation_init(p)
while gsl_permutation_next(p) == GSL_SUCCESS:
    discard gsl_permutation_fprintf(cstdout, p, " %u")
    echo "\n"
gsl_permutation_free(p)