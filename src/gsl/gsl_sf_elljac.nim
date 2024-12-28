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

proc gsl_sf_elljac_e*(u: cdouble; m: cdouble; sn: ptr cdouble; cn: ptr cdouble; dn: ptr cdouble): cint {.cdecl, importc: "gsl_sf_elljac_e", dynlib: libgsl.}
