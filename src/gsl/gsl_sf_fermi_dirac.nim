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
  gsl_sf_result_struct* {.bycopy.} = object
    val*: cdouble
    err*: cdouble

  gsl_sf_result* = gsl_sf_result_struct
  gsl_sf_result_e10_struct* {.bycopy.} = object
    val*: cdouble
    err*: cdouble
    e10*: cint

  gsl_sf_result_e10* = gsl_sf_result_e10_struct

proc gsl_sf_result_smash_e*(re: ptr gsl_sf_result_e10; r: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_result_smash_e", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_m1_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_fermi_dirac_m1_e", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_m1*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_fermi_dirac_m1", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_0_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_fermi_dirac_0_e", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_0*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_fermi_dirac_0", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_1_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_fermi_dirac_1_e", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_1*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_fermi_dirac_1", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_2_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_fermi_dirac_2_e", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_2*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_fermi_dirac_2", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_int_e*(j: cint; x: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_fermi_dirac_int_e", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_int*(j: cint; x: cdouble): cdouble {.cdecl, importc: "gsl_sf_fermi_dirac_int", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_mhalf_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_fermi_dirac_mhalf_e", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_mhalf*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_fermi_dirac_mhalf", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_half_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_fermi_dirac_half_e", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_half*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_fermi_dirac_half", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_3half_e*(x: cdouble; result: ptr gsl_sf_result): cint {.cdecl, importc: "gsl_sf_fermi_dirac_3half_e", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_3half*(x: cdouble): cdouble {.cdecl, importc: "gsl_sf_fermi_dirac_3half", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_inc_0_e*(x: cdouble; b: cdouble; result: ptr gsl_sf_result): cint {. cdecl, importc: "gsl_sf_fermi_dirac_inc_0_e", dynlib: libgsl.}
proc gsl_sf_fermi_dirac_inc_0*(x: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_sf_fermi_dirac_inc_0", dynlib: libgsl.}
