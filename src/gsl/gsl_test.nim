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

proc gsl_test*(status: cint; test_description: cstring) {.varargs, cdecl, importc: "gsl_test", dynlib: libgsl.}
proc gsl_test_rel*(result: cdouble; expected: cdouble; relative_error: cdouble; test_description: cstring) {.varargs, cdecl, importc: "gsl_test_rel", dynlib: libgsl.}
proc gsl_test_abs*(result: cdouble; expected: cdouble; absolute_error: cdouble; test_description: cstring) {.varargs, cdecl, importc: "gsl_test_abs", dynlib: libgsl.}
proc gsl_test_factor*(result: cdouble; expected: cdouble; factor: cdouble; test_description: cstring) {.varargs, cdecl, importc: "gsl_test_factor", dynlib: libgsl.}
proc gsl_test_int*(result: cint; expected: cint; test_description: cstring) {.varargs, cdecl, importc: "gsl_test_int", dynlib: libgsl.}
proc gsl_test_str*(result: cstring; expected: cstring; test_description: cstring) {. varargs, cdecl, importc: "gsl_test_str", dynlib: libgsl.}
proc gsl_test_verbose*(verbose: cint) {.cdecl, importc: "gsl_test_verbose",  dynlib: libgsl.}
proc gsl_test_summary*(): cint {.cdecl, importc: "gsl_test_summary", dynlib: libgsl.}
