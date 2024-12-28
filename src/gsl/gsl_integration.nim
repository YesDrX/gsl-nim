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
  GSL_INTEG_GAUSS15* = 1
  GSL_INTEG_GAUSS21* = 2
  GSL_INTEG_GAUSS31* = 3
  GSL_INTEG_GAUSS41* = 4
  GSL_INTEG_GAUSS51* = 5
  GSL_INTEG_GAUSS61* = 6

type
  gsl_prec_t* = cuint

  gsl_function_struct* {.bycopy.} = object
    function*: proc (x: cdouble; params: pointer): cdouble {.cdecl.}
    params*: pointer

  gsl_function* = gsl_function_struct
  gsl_function_fdf_struct* {.bycopy.} = object
    f*: proc (x: cdouble; params: pointer): cdouble {.cdecl.}
    df*: proc (x: cdouble; params: pointer): cdouble {.cdecl.}
    fdf*: proc (x: cdouble; params: pointer; f: ptr cdouble; df: ptr cdouble) {.cdecl.}
    params*: pointer

  gsl_function_fdf* = gsl_function_fdf_struct
  gsl_function_vec_struct* {.bycopy.} = object
    function*: proc (x: cdouble; y: ptr cdouble; params: pointer): cint {.cdecl.}
    params*: pointer

  gsl_function_vec* = gsl_function_vec_struct
  gsl_integration_workspace* {.bycopy.} = object
    limit*: csize_t
    size*: csize_t
    nrmax*: csize_t
    i*: csize_t
    maximum_level*: csize_t
    alist*: ptr cdouble
    blist*: ptr cdouble
    rlist*: ptr cdouble
    elist*: ptr cdouble
    order*: ptr csize_t
    level*: ptr csize_t

  gsl_integration_qaws_table* {.bycopy.} = object
    alpha*: cdouble
    beta*: cdouble
    mu*: cint
    nu*: cint
    ri*: array[25, cdouble]
    rj*: array[25, cdouble]
    rg*: array[25, cdouble]
    rh*: array[25, cdouble]

  gsl_integration_qawo_enum* {.size: sizeof(cint).} = enum
    GSL_INTEG_COSINE, GSL_INTEG_SINE

  gsl_integration_qawo_table* {.bycopy.} = object
    n*: csize_t
    omega*: cdouble
    L*: cdouble
    par*: cdouble
    sine*: gsl_integration_qawo_enum
    chebmo*: ptr cdouble

  gsl_integration_rule* = proc (f: ptr gsl_function; a: cdouble; b: cdouble;  result: ptr cdouble; abserr: ptr cdouble;  defabs: ptr cdouble; resabs: ptr cdouble): void {.cdecl.}

  gsl_integration_glfixed_table* {.bycopy.} = object
    n*: csize_t
    x*: ptr cdouble
    w*: ptr cdouble
    precomputed*: cint

  gsl_integration_cquad_ival* {.bycopy.} = object
    a*: cdouble
    b*: cdouble
    c*: array[64, cdouble]
    fx*: array[33, cdouble]
    igral*: cdouble
    err*: cdouble
    depth*: cint
    rdepth*: cint
    ndiv*: cint

  gsl_integration_cquad_workspace* {.bycopy.} = object
    size*: csize_t
    ivals*: ptr gsl_integration_cquad_ival
    heap*: ptr csize_t

  gsl_integration_romberg_workspace* {.bycopy.} = object
    n*: csize_t
    work1*: ptr cdouble
    work2*: ptr cdouble

  gsl_integration_fixed_params* {.bycopy.} = object
    alpha*: cdouble
    beta*: cdouble
    a*: cdouble
    b*: cdouble
    zemu*: cdouble
    shft*: cdouble
    slp*: cdouble
    al*: cdouble
    be*: cdouble

  gsl_integration_fixed_type* {.bycopy.} = object
    check*: proc (n: csize_t; params: ptr gsl_integration_fixed_params): cint {.cdecl.}
    init*: proc (n: csize_t; diag: ptr cdouble; subdiag: ptr cdouble; params: ptr gsl_integration_fixed_params): cint {.cdecl.}

  gsl_integration_fixed_workspace* {.bycopy.} = object
    n*: csize_t
    weights*: ptr cdouble
    x*: ptr cdouble
    diag*: ptr cdouble
    subdiag*: ptr cdouble
    `type`*: ptr gsl_integration_fixed_type

proc gsl_log1p*(x: cdouble): cdouble {.cdecl, importc: "gsl_log1p", dynlib: libgsl.}
proc gsl_expm1*(x: cdouble): cdouble {.cdecl, importc: "gsl_expm1", dynlib: libgsl.}
proc gsl_hypot*(x: cdouble; y: cdouble): cdouble {.cdecl, importc: "gsl_hypot", dynlib: libgsl.}
proc gsl_hypot3*(x: cdouble; y: cdouble; z: cdouble): cdouble {.cdecl, importc: "gsl_hypot3", dynlib: libgsl.}
proc gsl_acosh*(x: cdouble): cdouble {.cdecl, importc: "gsl_acosh", dynlib: libgsl.}
proc gsl_asinh*(x: cdouble): cdouble {.cdecl, importc: "gsl_asinh", dynlib: libgsl.}
proc gsl_atanh*(x: cdouble): cdouble {.cdecl, importc: "gsl_atanh", dynlib: libgsl.}
proc gsl_isnan*(x: cdouble): cint {.cdecl, importc: "gsl_isnan", dynlib: libgsl.}
proc gsl_isinf*(x: cdouble): cint {.cdecl, importc: "gsl_isinf", dynlib: libgsl.}
proc gsl_finite*(x: cdouble): cint {.cdecl, importc: "gsl_finite", dynlib: libgsl.}
proc gsl_nan*(): cdouble {.cdecl, importc: "gsl_nan", dynlib: libgsl.}
proc gsl_posinf*(): cdouble {.cdecl, importc: "gsl_posinf", dynlib: libgsl.}
proc gsl_neginf*(): cdouble {.cdecl, importc: "gsl_neginf", dynlib: libgsl.}
proc gsl_fdiv*(x: cdouble; y: cdouble): cdouble {.cdecl, importc: "gsl_fdiv", dynlib: libgsl.}
proc gsl_coerce_double*(x: cdouble): cdouble {.cdecl, importc: "gsl_coerce_double", dynlib: libgsl.}
proc gsl_coerce_float*(x: cfloat): cfloat {.cdecl, importc: "gsl_coerce_float",  dynlib: libgsl.}
proc gsl_coerce_long_double*(x: clongdouble): clongdouble {.cdecl, importc: "gsl_coerce_long_double", dynlib: libgsl.}
proc gsl_ldexp*(x: cdouble; e: cint): cdouble {.cdecl, importc: "gsl_ldexp", dynlib: libgsl.}
proc gsl_frexp*(x: cdouble; e: ptr cint): cdouble {.cdecl, importc: "gsl_frexp", dynlib: libgsl.}
proc gsl_fcmp*(x1: cdouble; x2: cdouble; epsilon: cdouble): cint {.cdecl, importc: "gsl_fcmp", dynlib: libgsl.}
proc gsl_pow_2*(x: cdouble): cdouble {.cdecl, importc: "gsl_pow_2", dynlib: libgsl.}
proc gsl_pow_3*(x: cdouble): cdouble {.cdecl, importc: "gsl_pow_3", dynlib: libgsl.}
proc gsl_pow_4*(x: cdouble): cdouble {.cdecl, importc: "gsl_pow_4", dynlib: libgsl.}
proc gsl_pow_5*(x: cdouble): cdouble {.cdecl, importc: "gsl_pow_5", dynlib: libgsl.}
proc gsl_pow_6*(x: cdouble): cdouble {.cdecl, importc: "gsl_pow_6", dynlib: libgsl.}
proc gsl_pow_7*(x: cdouble): cdouble {.cdecl, importc: "gsl_pow_7", dynlib: libgsl.}
proc gsl_pow_8*(x: cdouble): cdouble {.cdecl, importc: "gsl_pow_8", dynlib: libgsl.}
proc gsl_pow_9*(x: cdouble): cdouble {.cdecl, importc: "gsl_pow_9", dynlib: libgsl.}
proc gsl_pow_int*(x: cdouble; n: cint): cdouble {.cdecl, importc: "gsl_pow_int", dynlib: libgsl.}
proc gsl_pow_uint*(x: cdouble; n: cuint): cdouble {.cdecl, importc: "gsl_pow_uint", dynlib: libgsl.}
proc gsl_max*(a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_max", dynlib: libgsl.}
proc gsl_min*(a: cdouble; b: cdouble): cdouble {.cdecl, importc: "gsl_min", dynlib: libgsl.}
proc gsl_integration_workspace_alloc*(n: csize_t): ptr gsl_integration_workspace {. cdecl, importc: "gsl_integration_workspace_alloc", dynlib: libgsl.}
proc gsl_integration_workspace_free*(w: ptr gsl_integration_workspace) {.cdecl, importc: "gsl_integration_workspace_free", dynlib: libgsl.}
proc gsl_integration_qaws_table_alloc*(alpha: cdouble; beta: cdouble; mu: cint;   nu: cint): ptr gsl_integration_qaws_table {. cdecl, importc: "gsl_integration_qaws_table_alloc", dynlib: libgsl.}
proc gsl_integration_qaws_table_set*(t: ptr gsl_integration_qaws_table; alpha: cdouble; beta: cdouble; mu: cint; nu: cint): cint {. cdecl, importc: "gsl_integration_qaws_table_set", dynlib: libgsl.}
proc gsl_integration_qaws_table_free*(t: ptr gsl_integration_qaws_table) {.cdecl, importc: "gsl_integration_qaws_table_free", dynlib: libgsl.}
proc gsl_integration_qawo_table_alloc*(omega: cdouble; L: cdouble;   sine: gsl_integration_qawo_enum; n: csize_t): ptr gsl_integration_qawo_table {. cdecl, importc: "gsl_integration_qawo_table_alloc", dynlib: libgsl.}
proc gsl_integration_qawo_table_set*(t: ptr gsl_integration_qawo_table; omega: cdouble; L: cdouble; sine: gsl_integration_qawo_enum): cint {.cdecl, importc: "gsl_integration_qawo_table_set", dynlib: libgsl.}
proc gsl_integration_qawo_table_set_length*(t: ptr gsl_integration_qawo_table; L: cdouble): cint {.cdecl, importc: "gsl_integration_qawo_table_set_length", dynlib: libgsl.}
proc gsl_integration_qawo_table_free*(t: ptr gsl_integration_qawo_table) {.cdecl, importc: "gsl_integration_qawo_table_free", dynlib: libgsl.}
proc gsl_integration_qk15*(f: ptr gsl_function; a: cdouble; b: cdouble;  result: ptr cdouble; abserr: ptr cdouble;  resabs: ptr cdouble; resasc: ptr cdouble) {.cdecl, importc: "gsl_integration_qk15", dynlib: libgsl.}
proc gsl_integration_qk21*(f: ptr gsl_function; a: cdouble; b: cdouble;  result: ptr cdouble; abserr: ptr cdouble;  resabs: ptr cdouble; resasc: ptr cdouble) {.cdecl, importc: "gsl_integration_qk21", dynlib: libgsl.}
proc gsl_integration_qk31*(f: ptr gsl_function; a: cdouble; b: cdouble;  result: ptr cdouble; abserr: ptr cdouble;  resabs: ptr cdouble; resasc: ptr cdouble) {.cdecl, importc: "gsl_integration_qk31", dynlib: libgsl.}
proc gsl_integration_qk41*(f: ptr gsl_function; a: cdouble; b: cdouble;  result: ptr cdouble; abserr: ptr cdouble;  resabs: ptr cdouble; resasc: ptr cdouble) {.cdecl, importc: "gsl_integration_qk41", dynlib: libgsl.}
proc gsl_integration_qk51*(f: ptr gsl_function; a: cdouble; b: cdouble;  result: ptr cdouble; abserr: ptr cdouble;  resabs: ptr cdouble; resasc: ptr cdouble) {.cdecl, importc: "gsl_integration_qk51", dynlib: libgsl.}
proc gsl_integration_qk61*(f: ptr gsl_function; a: cdouble; b: cdouble;  result: ptr cdouble; abserr: ptr cdouble;  resabs: ptr cdouble; resasc: ptr cdouble) {.cdecl, importc: "gsl_integration_qk61", dynlib: libgsl.}
proc gsl_integration_qcheb*(f: ptr gsl_function; a: cdouble; b: cdouble;   cheb12: ptr cdouble; cheb24: ptr cdouble) {.cdecl, importc: "gsl_integration_qcheb", dynlib: libgsl.}
proc gsl_integration_qk*(n: cint; xgk: ptr cdouble; wg: ptr cdouble; wgk: ptr cdouble;    fv1: ptr cdouble; fv2: ptr cdouble; f: ptr gsl_function;    a: cdouble; b: cdouble; result: ptr cdouble;    abserr: ptr cdouble; resabs: ptr cdouble; resasc: ptr cdouble) {. cdecl, importc: "gsl_integration_qk", dynlib: libgsl.}
proc gsl_integration_qng*(f: ptr gsl_function; a: cdouble; b: cdouble; epsabs: cdouble; epsrel: cdouble; result: ptr cdouble; abserr: ptr cdouble; neval: ptr csize_t): cint {.cdecl, importc: "gsl_integration_qng", dynlib: libgsl.}
proc gsl_integration_qag*(f: ptr gsl_function; a: cdouble; b: cdouble; epsabs: cdouble; epsrel: cdouble; limit: csize_t; key: cint; workspace: ptr gsl_integration_workspace; result: ptr cdouble; abserr: ptr cdouble): cint {.cdecl, importc: "gsl_integration_qag", dynlib: libgsl.}
proc gsl_integration_qagi*(f: ptr gsl_function; epsabs: cdouble; epsrel: cdouble;  limit: csize_t;  workspace: ptr gsl_integration_workspace;  result: ptr cdouble; abserr: ptr cdouble): cint {.cdecl, importc: "gsl_integration_qagi", dynlib: libgsl.}
proc gsl_integration_qagiu*(f: ptr gsl_function; a: cdouble; epsabs: cdouble;   epsrel: cdouble; limit: csize_t;   workspace: ptr gsl_integration_workspace;   result: ptr cdouble; abserr: ptr cdouble): cint {.cdecl, importc: "gsl_integration_qagiu", dynlib: libgsl.}
proc gsl_integration_qagil*(f: ptr gsl_function; b: cdouble; epsabs: cdouble;   epsrel: cdouble; limit: csize_t;   workspace: ptr gsl_integration_workspace;   result: ptr cdouble; abserr: ptr cdouble): cint {.cdecl, importc: "gsl_integration_qagil", dynlib: libgsl.}
proc gsl_integration_qags*(f: ptr gsl_function; a: cdouble; b: cdouble; epsabs: cdouble;  epsrel: cdouble; limit: csize_t;  workspace: ptr gsl_integration_workspace;  result: ptr cdouble; abserr: ptr cdouble): cint {.cdecl, importc: "gsl_integration_qags", dynlib: libgsl.}
proc gsl_integration_qagp*(f: ptr gsl_function; pts: ptr cdouble; npts: csize_t;  epsabs: cdouble; epsrel: cdouble; limit: csize_t;  workspace: ptr gsl_integration_workspace;  result: ptr cdouble; abserr: ptr cdouble): cint {.cdecl, importc: "gsl_integration_qagp", dynlib: libgsl.}
proc gsl_integration_qawc*(f: ptr gsl_function; a: cdouble; b: cdouble; c: cdouble;  epsabs: cdouble; epsrel: cdouble; limit: csize_t;  workspace: ptr gsl_integration_workspace;  result: ptr cdouble; abserr: ptr cdouble): cint {.cdecl, importc: "gsl_integration_qawc", dynlib: libgsl.}
proc gsl_integration_qaws*(f: ptr gsl_function; a: cdouble; b: cdouble;  t: ptr gsl_integration_qaws_table; epsabs: cdouble;  epsrel: cdouble; limit: csize_t;  workspace: ptr gsl_integration_workspace;  result: ptr cdouble; abserr: ptr cdouble): cint {.cdecl, importc: "gsl_integration_qaws", dynlib: libgsl.}
proc gsl_integration_qawo*(f: ptr gsl_function; a: cdouble; epsabs: cdouble;  epsrel: cdouble; limit: csize_t;  workspace: ptr gsl_integration_workspace;  wf: ptr gsl_integration_qawo_table; result: ptr cdouble;  abserr: ptr cdouble): cint {.cdecl, importc: "gsl_integration_qawo", dynlib: libgsl.}
proc gsl_integration_qawf*(f: ptr gsl_function; a: cdouble; epsabs: cdouble;  limit: csize_t;  workspace: ptr gsl_integration_workspace;  cycle_workspace: ptr gsl_integration_workspace;  wf: ptr gsl_integration_qawo_table; result: ptr cdouble;  abserr: ptr cdouble): cint {.cdecl, importc: "gsl_integration_qawf", dynlib: libgsl.}
proc gsl_integration_glfixed_table_alloc*(n: csize_t): ptr gsl_integration_glfixed_table {. cdecl, importc: "gsl_integration_glfixed_table_alloc", dynlib: libgsl.}
proc gsl_integration_glfixed_table_free*(t: ptr gsl_integration_glfixed_table) {. cdecl, importc: "gsl_integration_glfixed_table_free", dynlib: libgsl.}
proc gsl_integration_glfixed*(f: ptr gsl_function; a: cdouble; b: cdouble;  t: ptr gsl_integration_glfixed_table): cdouble {.cdecl, importc: "gsl_integration_glfixed", dynlib: libgsl.}
proc gsl_integration_glfixed_point*(a: cdouble; b: cdouble; i: csize_t;  xi: ptr cdouble; wi: ptr cdouble;  t: ptr gsl_integration_glfixed_table): cint {. cdecl, importc: "gsl_integration_glfixed_point", dynlib: libgsl.}
proc gsl_integration_cquad_workspace_alloc*(n: csize_t): ptr gsl_integration_cquad_workspace {. cdecl, importc: "gsl_integration_cquad_workspace_alloc", dynlib: libgsl.}
proc gsl_integration_cquad_workspace_free*(w: ptr gsl_integration_cquad_workspace) {. cdecl, importc: "gsl_integration_cquad_workspace_free", dynlib: libgsl.}
proc gsl_integration_cquad*(f: ptr gsl_function; a: cdouble; b: cdouble;   epsabs: cdouble; epsrel: cdouble;   ws: ptr gsl_integration_cquad_workspace;   result: ptr cdouble; abserr: ptr cdouble;   nevals: ptr csize_t): cint {.cdecl, importc: "gsl_integration_cquad", dynlib: libgsl.}
proc gsl_integration_romberg_alloc*(n: csize_t): ptr gsl_integration_romberg_workspace {. cdecl, importc: "gsl_integration_romberg_alloc", dynlib: libgsl.}
proc gsl_integration_romberg_free*(w: ptr gsl_integration_romberg_workspace) {. cdecl, importc: "gsl_integration_romberg_free", dynlib: libgsl.}
proc gsl_integration_romberg*(f: ptr gsl_function; a: cdouble; b: cdouble;  epsabs: cdouble; epsrel: cdouble; result: ptr cdouble;  neval: ptr csize_t;  w: ptr gsl_integration_romberg_workspace): cint {. cdecl, importc: "gsl_integration_romberg", dynlib: libgsl.}
proc gsl_integration_fixed_alloc*(`type`: ptr gsl_integration_fixed_type; n: csize_t; a: cdouble; b: cdouble; alpha: cdouble; beta: cdouble): ptr gsl_integration_fixed_workspace {. cdecl, importc: "gsl_integration_fixed_alloc", dynlib: libgsl.}
proc gsl_integration_fixed_free*(w: ptr gsl_integration_fixed_workspace) {.cdecl, importc: "gsl_integration_fixed_free", dynlib: libgsl.}
proc gsl_integration_fixed_n*(w: ptr gsl_integration_fixed_workspace): csize_t {. cdecl, importc: "gsl_integration_fixed_n", dynlib: libgsl.}
proc gsl_integration_fixed_nodes*(w: ptr gsl_integration_fixed_workspace): ptr cdouble {. cdecl, importc: "gsl_integration_fixed_nodes", dynlib: libgsl.}
proc gsl_integration_fixed_weights*(w: ptr gsl_integration_fixed_workspace): ptr cdouble {. cdecl, importc: "gsl_integration_fixed_weights", dynlib: libgsl.}
proc gsl_integration_fixed*(`func`: ptr gsl_function; result: ptr cdouble;   w: ptr gsl_integration_fixed_workspace): cint {.cdecl, importc: "gsl_integration_fixed", dynlib: libgsl.}

var gsl_prec_eps* {.importc: "gsl_prec_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_sqrt_eps* {.importc: "gsl_prec_sqrt_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root3_eps* {.importc: "gsl_prec_root3_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root4_eps* {.importc: "gsl_prec_root4_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root5_eps* {.importc: "gsl_prec_root5_eps", dynlib: libgsl.}: ptr cdouble

var gsl_prec_root6_eps* {.importc: "gsl_prec_root6_eps", dynlib: libgsl.}: ptr cdouble

var gsl_integration_fixed_legendre* {.importc: "gsl_integration_fixed_legendre", dynlib: libgsl.}: ptr gsl_integration_fixed_type

var gsl_integration_fixed_chebyshev* {.importc: "gsl_integration_fixed_chebyshev",  dynlib: libgsl.}: ptr gsl_integration_fixed_type

var gsl_integration_fixed_gegenbauer* {.importc: "gsl_integration_fixed_gegenbauer",   dynlib: libgsl.}: ptr gsl_integration_fixed_type

var gsl_integration_fixed_jacobi* {.importc: "gsl_integration_fixed_jacobi", dynlib: libgsl.}: ptr gsl_integration_fixed_type

var gsl_integration_fixed_laguerre* {.importc: "gsl_integration_fixed_laguerre", dynlib: libgsl.}: ptr gsl_integration_fixed_type

var gsl_integration_fixed_hermite* {.importc: "gsl_integration_fixed_hermite",  dynlib: libgsl.}: ptr gsl_integration_fixed_type

var gsl_integration_fixed_exponential* {.importc: "gsl_integration_fixed_exponential", dynlib: libgsl.}: ptr gsl_integration_fixed_type

var gsl_integration_fixed_rational* {.importc: "gsl_integration_fixed_rational", dynlib: libgsl.}: ptr gsl_integration_fixed_type

var gsl_integration_fixed_chebyshev2* {.importc: "gsl_integration_fixed_chebyshev2",   dynlib: libgsl.}: ptr gsl_integration_fixed_type

