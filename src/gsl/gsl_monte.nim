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

type
  gsl_monte_function_struct* {.bycopy.} = object
    f*: proc (x_array: ptr cdouble; dim: csize_t; params: pointer): cdouble {.cdecl.}
    dim*: csize_t
    params*: pointer

  gsl_monte_function* = gsl_monte_function_struct

