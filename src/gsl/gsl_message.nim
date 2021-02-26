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

const
  GSL_MESSAGE_MASK_A* = 1
  GSL_MESSAGE_MASK_B* = 2
  GSL_MESSAGE_MASK_C* = 4
  GSL_MESSAGE_MASK_D* = 8
  GSL_MESSAGE_MASK_E* = 16
  GSL_MESSAGE_MASK_F* = 32
  GSL_MESSAGE_MASK_G* = 64
  GSL_MESSAGE_MASK_H* = 128

proc gsl_message*(message: cstring; file: cstring; line: cint; mask: cuint) {.cdecl, importc: "gsl_message", dynlib: libgsl.}

var gsl_message_mask* {.importc: "gsl_message_mask", dynlib: libgsl.}: cuint

