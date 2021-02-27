##  cdf/test.c
##
##  Copyright (C) 2002 Jason H Stover.
##
##  This program is free software; you can redistribute it and/or modify
##  it under the terms of the GNU General Public License as published by
##  the Free Software Foundation; either version 3 of the License, or (at
##  your option) any later version.
##
##  This program is distributed in the hope that it will be useful, but
##  WITHOUT ANY WARRANTY; without even the implied warranty of
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
##  General Public License for more details.
##
##  You should have received a copy of the GNU General Public License
##  along with this program; if not, write to the Free Software Foundation,
##  Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
##
import gsl/gsl_math
import gsl/gsl_randist
import gsl/gsl_cdf
import gsl/gsl_test
import gsl/gsl_ieee_utils

const
  pi* = 3.14159265358979323846264338328.cdouble
  GSL_DBL_EPSILON* = 2.2204460492503131e-16.cdouble
  TEST_TOL0* = (2.0 * GSL_DBL_EPSILON).cdouble
  TEST_TOL1* = (16.0 * GSL_DBL_EPSILON).cdouble
  TEST_TOL2* = (256.0 * GSL_DBL_EPSILON).cdouble
  TEST_TOL3* = (2048.0 * GSL_DBL_EPSILON).cdouble
  TEST_TOL4* = (16384.0 * GSL_DBL_EPSILON).cdouble
  TEST_TOL5* = (131072.0 * GSL_DBL_EPSILON).cdouble
  TEST_TOL6* = (1048576.0 * GSL_DBL_EPSILON).cdouble
type
  gsl_range* {.bycopy.} = object
    min*: cuint
    max*: cuint
proc test_binomial_gsl_range*(): gsl_range =
  var r: gsl_range = gsl_range(min: 0, max: 5) ##  NRVO variable
  return r

proc test_binomial_pdf*(k: cuint): cdouble =
  return gsl_ran_binomial_pdf(k, 0.3, 5)

proc test_binomial_cdf_P*(k: cuint): cdouble =
  return gsl_cdf_binomial_P(k, 0.3, 5)

proc test_binomial_cdf_Q*(k: cuint): cdouble =
  return gsl_cdf_binomial_Q(k, 0.3, 5)

proc test_poisson_gsl_range*(): gsl_range =
  var r: gsl_range = gsl_range(min: 0, max: 25) ##  NRVO variable
  return r

proc test_poisson_pdf*(k: cuint): cdouble =
  return gsl_ran_poisson_pdf(k, 2.3)

proc test_poisson_cdf_P*(k: cuint): cdouble =
  return gsl_cdf_poisson_P(k, 2.3)

proc test_poisson_cdf_Q*(k: cuint): cdouble =
  return gsl_cdf_poisson_Q(k, 2.3)

proc test_geometric_gsl_range*(): gsl_range =
  var r: gsl_range = gsl_range(min: 0, max: 25) ##  NRVO variable
  return r

proc test_geometric_pdf*(k: cuint): cdouble =
  return gsl_ran_geometric_pdf(k, 0.3)

proc test_geometric_cdf_P*(k: cuint): cdouble =
  return gsl_cdf_geometric_P(k, 0.3)

proc test_geometric_cdf_Q*(k: cuint): cdouble =
  return gsl_cdf_geometric_Q(k, 0.3)

proc test_negative_binomial_gsl_range*(): gsl_range =
  var r: gsl_range = gsl_range(min: 0, max: 15) ##  NRVO variable
  return r

proc test_negative_binomial_pdf*(k: cuint): cdouble =
  return gsl_ran_negative_binomial_pdf(k, 0.3, 5.3)

proc test_negative_binomial_cdf_P*(k: cuint): cdouble =
  return gsl_cdf_negative_binomial_P(k, 0.3, 5.3)

proc test_negative_binomial_cdf_Q*(k: cuint): cdouble =
  return gsl_cdf_negative_binomial_Q(k, 0.3, 5.3)

proc test_pascal_gsl_range*(): gsl_range =
  var r: gsl_range = gsl_range(min: 0, max: 15) ##  NRVO variable
  return r

proc test_pascal_pdf*(k: cuint): cdouble =
  return gsl_ran_pascal_pdf(k, 0.3, 5)

proc test_pascal_cdf_P*(k: cuint): cdouble =
  return gsl_cdf_pascal_P(k, 0.3, 5)

proc test_pascal_cdf_Q*(k: cuint): cdouble =
  return gsl_cdf_pascal_Q(k, 0.3, 5)

proc test_hypergeometric_gsl_range*(): gsl_range =
  var r: gsl_range = gsl_range(min: 0, max: 26) ##  NRVO variable
  return r

proc test_hypergeometric_pdf*(k: cuint): cdouble =
  return gsl_ran_hypergeometric_pdf(k, 7, 19, 13)

proc test_hypergeometric_cdf_P*(k: cuint): cdouble =
  return gsl_cdf_hypergeometric_P(k, 7, 19, 13)

proc test_hypergeometric_cdf_Q*(k: cuint): cdouble =
  return gsl_cdf_hypergeometric_Q(k, 7, 19, 13)

proc test_hypergeometric2_gsl_range*(): gsl_range =
  var r: gsl_range = gsl_range(min: 0, max: 13250474) ##  NRVO variable
  return r

proc test_hypergeometric2a_gsl_range*(): gsl_range =
  var r: gsl_range = gsl_range(min: 3500, max: 3600)       ##  NRVO variable
  return r

proc test_hypergeometric2b_gsl_range*(): gsl_range =
  var r: gsl_range = gsl_range(min: 13247474, max: 13250474) ##  NRVO variable
  return r

proc test_hypergeometric2_pdf*(k: cuint): cdouble =
  return gsl_ran_hypergeometric_pdf(k, 76200, 13174274, 678090)

proc test_hypergeometric2_cdf_P*(k: cuint): cdouble =
  return gsl_cdf_hypergeometric_P(k, 76200, 13174274, 678090)

proc test_hypergeometric2_cdf_Q*(k: cuint): cdouble =
  return gsl_cdf_hypergeometric_Q(k, 76200, 13174274, 678090)

when defined(LOGARITHMIC):
  proc test_logarithmic_gsl_range*(): gsl_range =
    var r: gsl_range = gsl_range(min: 1, max: 200)
    return r

  proc test_logarithmic_pdf*(k: cuint): cdouble =
    return gsl_ran_logarithmic_pdf(k, 0.9)

  proc test_logarithmic_cdf_P*(k: cuint): cdouble =
    return gsl_cdf_logarithmic_P(k, 0.9)

  proc test_logarithmic_cdf_Q*(k: cuint): cdouble =
    return gsl_cdf_logarithmic_Q(k, 0.9)

proc test_discrete_cdf_P*(pdf: proc (a1: cuint): cdouble; cdf_P: proc (
    a1: cuint): cdouble; gsl_range: proc (): gsl_range; desc: cstring) =
  var sum: cdouble
  var tol: cdouble = (256.0 * 2.220446049250313e-16)
  var i: cint
  var min: cint
  var max: cint
  var r: gsl_range = gsl_range()
  min = cast[cint](r.min)
  max = cast[cint](r.max)
  sum = 0.0
  i = min
  while i <= max:
    var pi: cdouble = pdf(cast[cuint](i))
    var Pi: cdouble = cdf_P(cast[cuint](i))
    sum += pi
    gsl_test_rel(Pi, sum, tol, desc, i)
    i += 1.cint

proc test_discrete_cdf_Q*(pdf: proc (a1: cuint): cdouble; cdf_Q: proc (
    a1: cuint): cdouble; gsl_range: proc (): gsl_range; desc: cstring) =
  var sum: cdouble
  var tol: cdouble = (256.0 * 2.220446049250313e-16)
  var i: cint
  var min: cint
  var max: cint
  var r: gsl_range = gsl_range()
  min = cast[cint](r.min)
  max = cast[cint](r.max)
  sum = cdf_Q(cast[cuint](max))
  i = max
  while i >= min:
    var pi: cdouble = pdf(cast[cuint](i))
    var Qi: cdouble = cdf_Q(cast[cuint](i))
    gsl_test_rel(Qi, sum, tol, desc, i)
    sum += pi
    dec(i)

proc test_discrete_cdf_PQ*(cdf_P: proc (a1: cuint): cdouble; cdf_Q: proc (
    a1: cuint): cdouble; gsl_range: proc (): gsl_range; desc: cstring) =
  var sum: cdouble
  var tol: cdouble = 2.220446049250313e-16
  var i: cint
  var min: cint
  var max: cint
  var r: gsl_range = gsl_range()
  min = cast[cint](r.min)
  max = cast[cint](r.max)
  i = min
  while i <= max:
    var Pi: cdouble = cdf_P(cast[cuint](i))
    var Qi: cdouble = cdf_Q(cast[cuint](i))
    sum = (Pi + Qi)
    gsl_test_rel(sum, 1.0, tol, desc, i)
    var s1: cint = ((Pi < 0) or (Pi > 1)).cint
    var s2: cint = ((Qi < 0) or (Qi > 1)).cint
    gsl_test(s1, "Pi in gsl_range [0,1] (%.18e)", Pi)
    gsl_test(s2, "Qi in gsl_range [0,1] (%.18e)", Qi)

    i += 1.cint

proc test_ugaussian*() =
  var res = gsl_cdf_ugaussian_P(0.0)
  gsl_test_rel(res, 0.5, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_P(0.0)")

  res = gsl_cdf_ugaussian_P(1e-32)
  gsl_test_rel(res, 0.5, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_P(1e-32)")

  res = gsl_cdf_ugaussian_P(1e-16)
  gsl_test_rel(res, 0.5, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_P(1e-16)")

  res = gsl_cdf_ugaussian_P(1e-08)
  gsl_test_rel(res, 0.5000000039894228, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_P(1e-8)")

  res = gsl_cdf_ugaussian_P(0.5)
  gsl_test_rel(res, 0.6914624612740131, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_P(0.5)")

  res = gsl_cdf_ugaussian_P(0.7)
  gsl_test_rel(res, 0.758036347776927, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_P(0.7)")

  res = gsl_cdf_ugaussian_P(5.0)
  gsl_test_rel(res, 0.9999997133484281, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_P(5.0)")

  res = gsl_cdf_ugaussian_P(10.0)
  gsl_test_rel(res, 1.0, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_P(10.0)")

  res = gsl_cdf_ugaussian_P(30.0)
  gsl_test_rel(res, 1.0, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_P(30.0)")

  res = gsl_cdf_ugaussian_P(40.0)
  gsl_test_rel(res, 1.0, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_P(40.0)")

  res = gsl_cdf_ugaussian_P(10000000000.0)
  gsl_test_rel(res, 1.0, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_P(1e10)")

  res = gsl_cdf_ugaussian_P(-1e-32)
  gsl_test_rel(res, 0.5, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_P(-1e-32)")

  res = gsl_cdf_ugaussian_P(-1e-16)
  gsl_test_rel(res, 0.4999999999999999, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_P(-1e-16)")

  res = gsl_cdf_ugaussian_P(-1e-08)
  gsl_test_rel(res, 0.4999999960105772, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_P(-1e-8)")

  res = gsl_cdf_ugaussian_P(-0.5)
  gsl_test_rel(res, 0.3085375387259869, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_P(-0.5)")

  res = gsl_cdf_ugaussian_P(-0.7)
  gsl_test_rel(res, 0.241963652223073, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_P(-0.7)")

  res = gsl_cdf_ugaussian_P(-5.0)
  gsl_test_rel(res, 2.866515718791939e-07, (16.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_P(-5.0)")

  res = gsl_cdf_ugaussian_P(-10.0)
  gsl_test_rel(res, 7.619853024160525e-24, (2048.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_P(-10.0)")

  res = gsl_cdf_ugaussian_P(-30.0)
  gsl_test_rel(res, 4.906713927148187e-198, (2048.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_P(-30.0)")

  res = gsl_cdf_ugaussian_P(-10000000000.0)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_ugaussian_P(-1e10)")

  res = gsl_cdf_ugaussian_Q(0.0)
  gsl_test_rel(res, 0.5, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Q(0.0)")

  res = gsl_cdf_ugaussian_Q(1e-32)
  gsl_test_rel(res, 0.5, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Q(1e-32)")

  res = gsl_cdf_ugaussian_Q(1e-16)
  gsl_test_rel(res, 0.4999999999999999, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Q(1e-16)")

  res = gsl_cdf_ugaussian_Q(1e-08)
  gsl_test_rel(res, 0.4999999960105772, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Q(1e-8)")

  res = gsl_cdf_ugaussian_Q(0.5)
  gsl_test_rel(res, 0.3085375387259869, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Q(0.5)")

  res = gsl_cdf_ugaussian_Q(0.7)
  gsl_test_rel(res, 0.241963652223073, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Q(0.7)")

  res = gsl_cdf_ugaussian_Q(5.0)
  gsl_test_rel(res, 2.866515718791939e-07, (2048.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Q(5.0)")

  res = gsl_cdf_ugaussian_Q(10.0)
  gsl_test_rel(res, 7.619853024160525e-24, (2048.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Q(10.0)")

  res = gsl_cdf_ugaussian_Q(30.0)
  gsl_test_rel(res, 4.906713927148187e-198, (2048.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Q(30.0)")

  res = gsl_cdf_ugaussian_Q(10000000000.0)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_ugaussian_Q(1e10)")

  res = gsl_cdf_ugaussian_Q(-1e-32)
  gsl_test_rel(res, 0.5, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Q(-1e-32)")

  res = gsl_cdf_ugaussian_Q(-1e-16)
  gsl_test_rel(res, 0.5, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Q(-1e-16)")

  res = gsl_cdf_ugaussian_Q(-1e-08)
  gsl_test_rel(res, 0.5000000039894228, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Q(-1e-8)")

  res = gsl_cdf_ugaussian_Q(-0.5)
  gsl_test_rel(res, 0.6914624612740131, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Q(-0.5)")

  res = gsl_cdf_ugaussian_Q(-0.7)
  gsl_test_rel(res, 0.758036347776927, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Q(-0.7)")

  res = gsl_cdf_ugaussian_Q(-5.0)
  gsl_test_rel(res, 0.9999997133484281, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Q(-5.0)")

  res = gsl_cdf_ugaussian_Q(-10.0)
  gsl_test_rel(res, 1.0, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Q(-10.0)")

  res = gsl_cdf_ugaussian_Q(-30.0)
  gsl_test_rel(res, 1.0, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Q(-30.0)")

  res = gsl_cdf_ugaussian_Q(-40.0)
  gsl_test_rel(res, 1.0, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Q(-40.0)")

  res = gsl_cdf_ugaussian_Q(-10000000000.0)
  gsl_test_rel(res, 1.0, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Q(-1e10)")


##  Test values from Abramowitz & Stegun, Handbook of Mathematical
##      Functions, Table 26.1.  Error term is given by dx = dP / Z(x)

proc test_ugaussianinv*() =
  var res = gsl_cdf_ugaussian_Pinv(0.9999997133)
  gsl_test_rel(res, 5.0, 0.0001, "gsl_cdf_ugaussian_Pinv(0.9999997133)")

  res = gsl_cdf_ugaussian_Pinv(0.9999683288)
  gsl_test_rel(res, 4.0, 1e-06, "gsl_cdf_ugaussian_Pinv(0.9999683288)")

  res = gsl_cdf_ugaussian_Pinv(0.998650102)
  gsl_test_rel(res, 3.0, 1e-08, "gsl_cdf_ugaussian_Pinv(0.9986501020)")

  res = gsl_cdf_ugaussian_Pinv(0.977249868051821)
  gsl_test_rel(res, 2.0, 1e-14, "gsl_cdf_ugaussian_Pinv(0.977249868051821)")

  res = gsl_cdf_ugaussian_Pinv(0.841344746068543)
  gsl_test_rel(res, 1.0, (2048.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Pinv(0.841344746068543)")

  res = gsl_cdf_ugaussian_Pinv(0.691462461274013)
  gsl_test_rel(res, 0.5, (256.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Pinv(0.691462461274013)")

  res = gsl_cdf_ugaussian_Pinv(0.655421741610324)
  gsl_test_rel(res, 0.4, (16.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Pinv(0.655421741610324)")

  res = gsl_cdf_ugaussian_Pinv(0.617911422188953)
  gsl_test_rel(res, 0.3, (16.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Pinv(0.617911422188953)")

  res = gsl_cdf_ugaussian_Pinv(0.579259709439103)
  gsl_test_rel(res, 0.2, (16.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Pinv(0.579259709439103)")

  res = gsl_cdf_ugaussian_Pinv(0.539827837277029)
  gsl_test_rel(res, 0.1, (16.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Pinv(0.539827837277029)")

  res = gsl_cdf_ugaussian_Pinv(0.5)
  gsl_test_rel(res, 0.0, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Pinv(0.5)")

  res = gsl_cdf_ugaussian_Pinv(0.460172162722971)
  gsl_test_rel(res, -0.1, (16.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Pinv(4.60172162722971e-1)")

  res = gsl_cdf_ugaussian_Pinv(0.420740290560897)
  gsl_test_rel(res, -0.2, (16.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Pinv(4.20740290560897e-1)")

  res = gsl_cdf_ugaussian_Pinv(0.382088577811047)
  gsl_test_rel(res, -0.3, (16.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Pinv(3.82088577811047e-1)")

  res = gsl_cdf_ugaussian_Pinv(0.344578258389676)
  gsl_test_rel(res, -0.4, (16.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Pinv(3.44578258389676e-1)")

  res = gsl_cdf_ugaussian_Pinv(0.308537538725987)
  gsl_test_rel(res, -0.5, (256.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Pinv(3.08537538725987e-1)")

  res = gsl_cdf_ugaussian_Pinv(0.158655253931457)
  gsl_test_rel(res, -1.0, (2048.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Pinv(1.58655253931457e-1)")

  res = gsl_cdf_ugaussian_Pinv(0.022750131948179)
  gsl_test_rel(res, -2.0, 1e-14, "gsl_cdf_ugaussian_Pinv(2.2750131948179e-2)")

  res = gsl_cdf_ugaussian_Pinv(0.001349898)
  gsl_test_rel(res, -3.0, 1e-08, "gsl_cdf_ugaussian_Pinv(1.349898e-3)")

  res = gsl_cdf_ugaussian_Pinv(3.16712e-05)
  gsl_test_rel(res, -4.0, 1e-06, "gsl_cdf_ugaussian_Pinv(3.16712e-5)")

  res = gsl_cdf_ugaussian_Pinv(2.86648e-07)
  gsl_test_rel(res, -5.0, 0.0001, "gsl_cdf_ugaussian_Pinv(2.86648e-7)")

  res = gsl_cdf_ugaussian_Pinv(7.61985302416052e-24)
  gsl_test_rel(res, -10.0, 0.0001, "gsl_cdf_ugaussian_Pinv(7.61985302416052e-24)")

  res = gsl_cdf_ugaussian_Qinv(7.61985302416052e-24)
  gsl_test_rel(res, 10.0, 0.0001, "gsl_cdf_ugaussian_Qinv(7.61985302416052e-24)")

  res = gsl_cdf_ugaussian_Qinv(2.86648e-07)
  gsl_test_rel(res, 5.0, 0.0001, "gsl_cdf_ugaussian_Qinv(2.86648e-7)")

  res = gsl_cdf_ugaussian_Qinv(3.16712e-05)
  gsl_test_rel(res, 4.0, 1e-06, "gsl_cdf_ugaussian_Qinv(3.16712e-5)")

  res = gsl_cdf_ugaussian_Qinv(0.001349898)
  gsl_test_rel(res, 3.0, 1e-08, "gsl_cdf_ugaussian_Qinv(1.349898e-3)")

  res = gsl_cdf_ugaussian_Qinv(0.022750131948179)
  gsl_test_rel(res, 2.0, 1e-14, "gsl_cdf_ugaussian_Qinv(2.2750131948179e-2)")

  res = gsl_cdf_ugaussian_Qinv(0.158655253931457)
  gsl_test_rel(res, 1.0, (2048.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Qinv(1.58655253931457e-1)")

  res = gsl_cdf_ugaussian_Qinv(0.308537538725987)
  gsl_test_rel(res, 0.5, (256.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Qinv(3.08537538725987e-1)")

  res = gsl_cdf_ugaussian_Qinv(0.344578258389676)
  gsl_test_rel(res, 0.4, (16.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Qinv(3.44578258389676e-1)")

  res = gsl_cdf_ugaussian_Qinv(0.382088577811047)
  gsl_test_rel(res, 0.3, (16.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Qinv(3.82088577811047e-1)")

  res = gsl_cdf_ugaussian_Qinv(0.420740290560897)
  gsl_test_rel(res, 0.2, (16.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Qinv(4.20740290560897e-1)")

  res = gsl_cdf_ugaussian_Qinv(0.460172162722971)
  gsl_test_rel(res, 0.1, (16.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Qinv(4.60172162722971e-1)")

  res = gsl_cdf_ugaussian_Qinv(0.5)
  gsl_test_rel(res, 0.0, (2.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Qinv(0.5)")

  res = gsl_cdf_ugaussian_Qinv(0.539827837277029)
  gsl_test_rel(res, -0.1, (16.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Qinv(0.539827837277029)")

  res = gsl_cdf_ugaussian_Qinv(0.579259709439103)
  gsl_test_rel(res, -0.2, (16.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Qinv(0.579259709439103)")

  res = gsl_cdf_ugaussian_Qinv(0.617911422188953)
  gsl_test_rel(res, -0.3, (16.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Qinv(0.617911422188953)")

  res = gsl_cdf_ugaussian_Qinv(0.655421741610324)
  gsl_test_rel(res, -0.4, (16.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Qinv(0.655421741610324)")

  res = gsl_cdf_ugaussian_Qinv(0.691462461274013)
  gsl_test_rel(res, -0.5, (256.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Qinv(0.691462461274013)")

  res = gsl_cdf_ugaussian_Qinv(0.841344746068543)
  gsl_test_rel(res, -1.0, (2048.0 * 2.220446049250313e-16), "gsl_cdf_ugaussian_Qinv(0.841344746068543)")

  res = gsl_cdf_ugaussian_Qinv(0.977249868051821)
  gsl_test_rel(res, -2.0, 1e-14, "gsl_cdf_ugaussian_Qinv(0.977249868051821)")

  res = gsl_cdf_ugaussian_Qinv(0.998650102)
  gsl_test_rel(res, -3.0, 1e-08, "gsl_cdf_ugaussian_Qinv(0.9986501020)")

  res = gsl_cdf_ugaussian_Qinv(0.9999683288)
  gsl_test_rel(res, -4.0, 1e-06, "gsl_cdf_ugaussian_Qinv(0.9999683288)")

  res = gsl_cdf_ugaussian_Qinv(0.9999997133)
  gsl_test_rel(res, -5.0, 0.0001, "gsl_cdf_ugaussian_Qinv(0.9999997133)")


##  Tests for exponential cumulative distribution function
##      Function values computed with PARI, 28 digits precision

proc test_exponential*() =
  var res = gsl_cdf_exponential_P(0.1, 0.7)
  gsl_test_rel(res, 0.1331221002498184, (2.0 * 2.220446049250313e-16), "gsl_cdf_exponential_P(0.1, 0.7)")

  res = gsl_cdf_exponential_P(1e-32, 0.7)
  gsl_test_rel(res, 1.428571428571429e-32, (2.0 * 2.220446049250313e-16), "gsl_cdf_exponential_P(1e-32, 0.7)")

  res = gsl_cdf_exponential_P(1000.0, 0.7)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_exponential_P(1000.0, 0.7)")

  res = gsl_cdf_exponential_Q(0.1, 0.7)
  gsl_test_rel(res, 0.8668778997501816, (2.0 * 2.220446049250313e-16), "gsl_cdf_exponential_Q(0.1, 0.7)")

  res = gsl_cdf_exponential_Q(1e-32, 0.7)
  gsl_test_rel(res, 1.0, (2.0 * 2.220446049250313e-16), "gsl_cdf_exponential_Q(1e-32, 0.7)")

  res = gsl_cdf_exponential_Q(1000.0, 0.7)
  gsl_test_rel(res, 0.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_exponential_Q(1000.0, 0.7)")


proc test_exponentialinv*() =
  var res = gsl_cdf_exponential_Pinv(0.13, 0.7)
  gsl_test_rel(res, 0.09748344713345536, (2.0 * 2.220446049250313e-16), "gsl_cdf_exponential_Pinv(0.13, 0.7)")

  res = gsl_cdf_exponential_Pinv(1.42e-32, 0.7)
  gsl_test_rel(res, 9.940000000000001e-33, (2.0 * 2.220446049250313e-16), "gsl_cdf_exponential_Pinv(1.42e-32, 0.7)")

  res = gsl_cdf_exponential_Qinv(0.86, 0.7)
  gsl_test_rel(res, 0.1055760228142085, (2.0 * 2.220446049250313e-16), "gsl_cdf_exponential_Qinv(0.86, 0.7)")

  res = gsl_cdf_exponential_Qinv(0.99999, 0.7)
  gsl_test_rel(res, 7.000035000233335e-06, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_exponential_Qinv(0.99999, 0.7)")


proc test_exppow*() =
  var res = gsl_cdf_exppow_P(-1000.0, 0.7, 1.8)
  gsl_test_rel(res, 0.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_exppow_P(-1000.0, 0.7, 1.8)")

  res = gsl_cdf_exppow_P(-0.1, 0.7, 1.8)
  gsl_test_rel(res, 0.4205349082867516, (2.0 * 2.220446049250313e-16), "gsl_cdf_exppow_P(-0.1, 0.7, 1.8)")

  res = gsl_cdf_exppow_P(-1e-32, 0.7, 1.8)
  gsl_test_rel(res, 0.5, (2.0 * 2.220446049250313e-16), "gsl_cdf_exppow_P(-1e-32, 0.7, 1.8)")

  res = gsl_cdf_exppow_P(0.1, 0.7, 1.8)
  gsl_test_rel(res, 0.5794650917132484, (2.0 * 2.220446049250313e-16), "gsl_cdf_exppow_P(0.1, 0.7, 1.8)")

  res = gsl_cdf_exppow_P(1e-32, 0.7, 1.8)
  gsl_test_rel(res, 0.5, (2.0 * 2.220446049250313e-16), "gsl_cdf_exppow_P(1e-32, 0.7, 1.8)")

  res = gsl_cdf_exppow_P(1000.0, 0.7, 1.8)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_exppow_P(1000.0, 0.7, 1.8)")

  res = gsl_cdf_exppow_Q(-1000.0, 0.7, 1.8)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_exppow_Q(-1000.0, 0.7, 1.8)")

  res = gsl_cdf_exppow_Q(-0.1, 0.7, 1.8)
  gsl_test_rel(res, 0.5794650917132484, (2.0 * 2.220446049250313e-16), "gsl_cdf_exppow_Q(-0.1, 0.7, 1.8)")

  res = gsl_cdf_exppow_Q(-1e-32, 0.7, 1.8)
  gsl_test_rel(res, 0.5, (2.0 * 2.220446049250313e-16), "gsl_cdf_exppow_Q(-1e-32, 0.7, 1.8)")

  res = gsl_cdf_exppow_Q(0.1, 0.7, 1.8)
  gsl_test_rel(res, 0.4205349082867516, (2.0 * 2.220446049250313e-16), "gsl_cdf_exppow_Q(0.1, 0.7, 1.8)")

  res = gsl_cdf_exppow_Q(1e-32, 0.7, 1.8)
  gsl_test_rel(res, 0.5, (2.0 * 2.220446049250313e-16), "gsl_cdf_exppow_Q(1e-32, 0.7, 1.8)")

  res = gsl_cdf_exppow_Q(1000.0, 0.7, 1.8)
  gsl_test_rel(res, 0.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_exppow_Q(1000.0, 0.7, 1.8)")


##  Tests for student's T distribution
##  p(x,nu) = (1/2)*(1+sign(x)*betaI(x^2/(nu+x^2),1/2,nu/2))
##      q(x,nu) = (1/2)*(1-sign(x)*betaI(x^2/(nu+x^2),1/2,nu/2))

proc test_tdist*() =
  var res = gsl_cdf_tdist_P(0.0, 1.0)
  gsl_test_rel(res, 0.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(0.0, 1.0)")

  res = gsl_cdf_tdist_P(1e-100, 1.0)
  gsl_test_rel(res, 0.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(1e-100, 1.0)")

  res = gsl_cdf_tdist_P(0.001, 1.0)
  gsl_test_rel(res, 0.5003183097800805, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(0.001, 1.0)")

  res = gsl_cdf_tdist_P(0.01, 1.0)
  gsl_test_rel(res, 0.5031829927649083, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(0.01, 1.0)")

  res = gsl_cdf_tdist_P(0.1, 1.0)
  gsl_test_rel(res, 0.5317255174305535, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(0.1, 1.0)")

  res = gsl_cdf_tdist_P(0.325, 1.0)
  gsl_test_rel(res, 0.6000231200328521, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(0.325, 1.0)")

  res = gsl_cdf_tdist_P(1.0, 1.0)
  gsl_test_rel(res, 0.75, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(1.0, 1.0)")

  res = gsl_cdf_tdist_P(1.5, 1.0)
  gsl_test_rel(res, 0.8128329581890011, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(1.5, 1.0)")

  res = gsl_cdf_tdist_P(2.0, 1.0)
  gsl_test_rel(res, 0.8524163823495667, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(2.0, 1.0)")

  res = gsl_cdf_tdist_P(10.0, 1.0)
  gsl_test_rel(res, 0.9682744825694465, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(10.0, 1.0)")

  res = gsl_cdf_tdist_P(20.0, 1.0)
  gsl_test_rel(res, 0.9840977487438236, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(20.0, 1.0)")

  res = gsl_cdf_tdist_P(100.0, 1.0)
  gsl_test_rel(res, 0.9968170072350917, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(100.0, 1.0)")

  res = gsl_cdf_tdist_P(1000.0, 1.0)
  gsl_test_rel(res, 0.9996816902199195, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(1000.0, 1.0)")

  res = gsl_cdf_tdist_P(10000.0, 1.0)
  gsl_test_rel(res, 0.9999681690114878, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(10000.0, 1.0)")

  res = gsl_cdf_tdist_Q(0.0, 1.0)
  gsl_test_rel(res, 0.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(0.0, 1.0)")

  res = gsl_cdf_tdist_Q(1e-100, 1.0)
  gsl_test_rel(res, 0.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(1e-100, 1.0)")

  res = gsl_cdf_tdist_Q(0.001, 1.0)
  gsl_test_rel(res, 0.4996816902199194, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(0.001, 1.0)")

  res = gsl_cdf_tdist_Q(0.01, 1.0)
  gsl_test_rel(res, 0.4968170072350918, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(0.01, 1.0)")

  res = gsl_cdf_tdist_Q(0.1, 1.0)
  gsl_test_rel(res, 0.4682744825694464, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(0.1, 1.0)")

  res = gsl_cdf_tdist_Q(0.325, 1.0)
  gsl_test_rel(res, 0.3999768799671479, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(0.325, 1.0)")

  res = gsl_cdf_tdist_Q(1.0, 1.0)
  gsl_test_rel(res, 0.25, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(1.0, 1.0)")

  res = gsl_cdf_tdist_Q(1.5, 1.0)
  gsl_test_rel(res, 0.1871670418109988, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(1.5, 1.0)")

  res = gsl_cdf_tdist_Q(2.0, 1.0)
  gsl_test_rel(res, 0.1475836176504333, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(2.0, 1.0)")

  res = gsl_cdf_tdist_Q(10.0, 1.0)
  gsl_test_rel(res, 0.03172551743055357, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(10.0, 1.0)")

  res = gsl_cdf_tdist_Q(20.0, 1.0)
  gsl_test_rel(res, 0.01590225125617637, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(20.0, 1.0)")

  res = gsl_cdf_tdist_Q(100.0, 1.0)
  gsl_test_rel(res, 0.003182992764908255, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(100.0, 1.0)")

  res = gsl_cdf_tdist_Q(1000.0, 1.0)
  gsl_test_rel(res, 0.0003183097800805589, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(1000.0, 1.0)")

  res = gsl_cdf_tdist_Q(10000.0, 1.0)
  gsl_test_rel(res, 3.183098851227577e-05, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(10000.0, 1.0)")

  res = gsl_cdf_tdist_P(-1e-100, 1.0)
  gsl_test_rel(res, 0.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-1e-100, 1.0)")

  res = gsl_cdf_tdist_P(-0.001, 1.0)
  gsl_test_rel(res, 0.4996816902199194, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-0.001, 1.0)")

  res = gsl_cdf_tdist_P(-0.01, 1.0)
  gsl_test_rel(res, 0.4968170072350918, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-0.01, 1.0)")

  res = gsl_cdf_tdist_P(-0.1, 1.0)
  gsl_test_rel(res, 0.4682744825694464, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-0.1, 1.0)")

  res = gsl_cdf_tdist_P(-0.325, 1.0)
  gsl_test_rel(res, 0.3999768799671479, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-0.325, 1.0)")

  res = gsl_cdf_tdist_P(-1.0, 1.0)
  gsl_test_rel(res, 0.25, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-1.0, 1.0)")

  res = gsl_cdf_tdist_P(-1.5, 1.0)
  gsl_test_rel(res, 0.1871670418109988, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-1.5, 1.0)")

  res = gsl_cdf_tdist_P(-2.0, 1.0)
  gsl_test_rel(res, 0.1475836176504333, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-2.0, 1.0)")

  res = gsl_cdf_tdist_P(-10.0, 1.0)
  gsl_test_rel(res, 0.03172551743055357, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-10.0, 1.0)")

  res = gsl_cdf_tdist_P(-20.0, 1.0)
  gsl_test_rel(res, 0.01590225125617637, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-20.0, 1.0)")

  res = gsl_cdf_tdist_P(-100.0, 1.0)
  gsl_test_rel(res, 0.003182992764908255, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-100.0, 1.0)")

  res = gsl_cdf_tdist_P(-1000.0, 1.0)
  gsl_test_rel(res, 0.0003183097800805589, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-1000.0, 1.0)")

  res = gsl_cdf_tdist_P(-10000.0, 1.0)
  gsl_test_rel(res, 3.183098851227577e-05, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-10000.0, 1.0)")

  res = gsl_cdf_tdist_Q(-1e-100, 1.0)
  gsl_test_rel(res, 0.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-1e-100, 1.0)")

  res = gsl_cdf_tdist_Q(-0.001, 1.0)
  gsl_test_rel(res, 0.5003183097800805, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-0.001, 1.0)")

  res = gsl_cdf_tdist_Q(-0.01, 1.0)
  gsl_test_rel(res, 0.5031829927649083, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-0.01, 1.0)")

  res = gsl_cdf_tdist_Q(-0.1, 1.0)
  gsl_test_rel(res, 0.5317255174305535, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-0.1, 1.0)")

  res = gsl_cdf_tdist_Q(-0.325, 1.0)
  gsl_test_rel(res, 0.6000231200328521, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-0.325, 1.0)")

  res = gsl_cdf_tdist_Q(-1.0, 1.0)
  gsl_test_rel(res, 0.75, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-1.0, 1.0)")

  res = gsl_cdf_tdist_Q(-1.5, 1.0)
  gsl_test_rel(res, 0.8128329581890011, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-1.5, 1.0)")

  res = gsl_cdf_tdist_Q(-2.0, 1.0)
  gsl_test_rel(res, 0.8524163823495667, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-2.0, 1.0)")

  res = gsl_cdf_tdist_Q(-10.0, 1.0)
  gsl_test_rel(res, 0.9682744825694465, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-10.0, 1.0)")

  res = gsl_cdf_tdist_Q(-20.0, 1.0)
  gsl_test_rel(res, 0.9840977487438236, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-20.0, 1.0)")

  res = gsl_cdf_tdist_Q(-100.0, 1.0)
  gsl_test_rel(res, 0.9968170072350917, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-100.0, 1.0)")

  res = gsl_cdf_tdist_Q(-1000.0, 1.0)
  gsl_test_rel(res, 0.9996816902199195, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-1000.0, 1.0)")

  res = gsl_cdf_tdist_Q(-10000.0, 1.0)
  gsl_test_rel(res, 0.9999681690114878, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-10000.0, 1.0)")

  res = gsl_cdf_tdist_P(0.0, 2.0)
  gsl_test_rel(res, 0.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(0.0, 2.0)")

  res = gsl_cdf_tdist_P(1e-100, 2.0)
  gsl_test_rel(res, 0.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(1e-100, 2.0)")

  res = gsl_cdf_tdist_P(0.001, 2.0)
  gsl_test_rel(res, 0.500353553302205, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(0.001, 2.0)")

  res = gsl_cdf_tdist_P(0.01, 2.0)
  gsl_test_rel(res, 0.5035354455208995, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(0.01, 2.0)")

  res = gsl_cdf_tdist_P(0.1, 2.0)
  gsl_test_rel(res, 0.53526728079293, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(0.1, 2.0)")

  res = gsl_cdf_tdist_P(0.325, 2.0)
  gsl_test_rel(res, 0.6119857727468737, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(0.325, 2.0)")

  res = gsl_cdf_tdist_P(1.0, 2.0)
  gsl_test_rel(res, 0.7886751345948129, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(1.0, 2.0)")

  res = gsl_cdf_tdist_P(1.5, 2.0)
  gsl_test_rel(res, 0.8638034375544995, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(1.5, 2.0)")

  res = gsl_cdf_tdist_P(2.0, 2.0)
  gsl_test_rel(res, 0.908248290463863, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(2.0, 2.0)")

  res = gsl_cdf_tdist_P(10.0, 2.0)
  gsl_test_rel(res, 0.9950737714883372, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(10.0, 2.0)")

  res = gsl_cdf_tdist_P(20.0, 2.0)
  gsl_test_rel(res, 0.9987546680538164, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(20.0, 2.0)")

  res = gsl_cdf_tdist_P(100.0, 2.0)
  gsl_test_rel(res, 0.9999500074987502, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(100.0, 2.0)")

  res = gsl_cdf_tdist_P(1000.0, 2.0)
  gsl_test_rel(res, 0.99999950000075, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(1000.0, 2.0)")

  res = gsl_cdf_tdist_P(10000.0, 2.0)
  gsl_test_rel(res, 0.999999995, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(10000.0, 2.0)")

  res = gsl_cdf_tdist_Q(0.0, 2.0)
  gsl_test_rel(res, 0.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(0.0, 2.0)")

  res = gsl_cdf_tdist_Q(1e-100, 2.0)
  gsl_test_rel(res, 0.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(1e-100, 2.0)")

  res = gsl_cdf_tdist_Q(0.001, 2.0)
  gsl_test_rel(res, 0.4996464466977951, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(0.001, 2.0)")

  res = gsl_cdf_tdist_Q(0.01, 2.0)
  gsl_test_rel(res, 0.4964645544791005, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(0.01, 2.0)")

  res = gsl_cdf_tdist_Q(0.1, 2.0)
  gsl_test_rel(res, 0.4647327192070701, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(0.1, 2.0)")

  res = gsl_cdf_tdist_Q(0.325, 2.0)
  gsl_test_rel(res, 0.3880142272531262, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(0.325, 2.0)")

  res = gsl_cdf_tdist_Q(1.0, 2.0)
  gsl_test_rel(res, 0.2113248654051871, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(1.0, 2.0)")

  res = gsl_cdf_tdist_Q(1.5, 2.0)
  gsl_test_rel(res, 0.1361965624455005, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(1.5, 2.0)")

  res = gsl_cdf_tdist_Q(2.0, 2.0)
  gsl_test_rel(res, 0.09175170953613698, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(2.0, 2.0)")

  res = gsl_cdf_tdist_Q(10.0, 2.0)
  gsl_test_rel(res, 0.004926228511662845, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(10.0, 2.0)")

  res = gsl_cdf_tdist_Q(20.0, 2.0)
  gsl_test_rel(res, 0.001245331946183549, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(20.0, 2.0)")

  res = gsl_cdf_tdist_Q(100.0, 2.0)
  gsl_test_rel(res, 4.999250124978129e-05, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(100.0, 2.0)")

  res = gsl_cdf_tdist_Q(1000.0, 2.0)
  gsl_test_rel(res, 4.9999925000125e-07, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(1000.0, 2.0)")

  res = gsl_cdf_tdist_Q(10000.0, 2.0)
  gsl_test_rel(res, 4.999999925000001e-09, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(10000.0, 2.0)")

  res = gsl_cdf_tdist_P(-1e-100, 2.0)
  gsl_test_rel(res, 0.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-1e-100, 2.0)")

  res = gsl_cdf_tdist_P(-0.001, 2.0)
  gsl_test_rel(res, 0.4996464466977951, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-0.001, 2.0)")

  res = gsl_cdf_tdist_P(-0.01, 2.0)
  gsl_test_rel(res, 0.4964645544791005, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-0.01, 2.0)")

  res = gsl_cdf_tdist_P(-0.1, 2.0)
  gsl_test_rel(res, 0.4647327192070701, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-0.1, 2.0)")

  res = gsl_cdf_tdist_P(-0.325, 2.0)
  gsl_test_rel(res, 0.3880142272531262, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-0.325, 2.0)")

  res = gsl_cdf_tdist_P(-1.0, 2.0)
  gsl_test_rel(res, 0.2113248654051871, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-1.0, 2.0)")

  res = gsl_cdf_tdist_P(-1.5, 2.0)
  gsl_test_rel(res, 0.1361965624455005, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-1.5, 2.0)")

  res = gsl_cdf_tdist_P(-2.0, 2.0)
  gsl_test_rel(res, 0.09175170953613698, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-2.0, 2.0)")

  res = gsl_cdf_tdist_P(-10.0, 2.0)
  gsl_test_rel(res, 0.004926228511662845, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-10.0, 2.0)")

  res = gsl_cdf_tdist_P(-20.0, 2.0)
  gsl_test_rel(res, 0.001245331946183549, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-20.0, 2.0)")

  res = gsl_cdf_tdist_P(-100.0, 2.0)
  gsl_test_rel(res, 4.999250124978129e-05, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-100.0, 2.0)")

  res = gsl_cdf_tdist_P(-1000.0, 2.0)
  gsl_test_rel(res, 4.9999925000125e-07, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-1000.0, 2.0)")

  res = gsl_cdf_tdist_P(-10000.0, 2.0)
  gsl_test_rel(res, 4.999999925000001e-09, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-10000.0, 2.0)")

  res = gsl_cdf_tdist_Q(-1e-100, 2.0)
  gsl_test_rel(res, 0.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-1e-100, 2.0)")

  res = gsl_cdf_tdist_Q(-0.001, 2.0)
  gsl_test_rel(res, 0.500353553302205, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-0.001, 2.0)")

  res = gsl_cdf_tdist_Q(-0.01, 2.0)
  gsl_test_rel(res, 0.5035354455208995, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-0.01, 2.0)")

  res = gsl_cdf_tdist_Q(-0.1, 2.0)
  gsl_test_rel(res, 0.53526728079293, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-0.1, 2.0)")

  res = gsl_cdf_tdist_Q(-0.325, 2.0)
  gsl_test_rel(res, 0.6119857727468737, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-0.325, 2.0)")

  res = gsl_cdf_tdist_Q(-1.0, 2.0)
  gsl_test_rel(res, 0.7886751345948129, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-1.0, 2.0)")

  res = gsl_cdf_tdist_Q(-1.5, 2.0)
  gsl_test_rel(res, 0.8638034375544995, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-1.5, 2.0)")

  res = gsl_cdf_tdist_Q(-2.0, 2.0)
  gsl_test_rel(res, 0.908248290463863, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-2.0, 2.0)")

  res = gsl_cdf_tdist_Q(-10.0, 2.0)
  gsl_test_rel(res, 0.9950737714883372, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-10.0, 2.0)")

  res = gsl_cdf_tdist_Q(-20.0, 2.0)
  gsl_test_rel(res, 0.9987546680538164, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-20.0, 2.0)")

  res = gsl_cdf_tdist_Q(-100.0, 2.0)
  gsl_test_rel(res, 0.9999500074987502, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-100.0, 2.0)")

  res = gsl_cdf_tdist_Q(-1000.0, 2.0)
  gsl_test_rel(res, 0.99999950000075, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-1000.0, 2.0)")

  res = gsl_cdf_tdist_Q(-10000.0, 2.0)
  gsl_test_rel(res, 0.999999995, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-10000.0, 2.0)")

  res = gsl_cdf_tdist_P(0.0, 300.0)
  gsl_test_rel(res, 0.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(0.0, 300.0)")

  res = gsl_cdf_tdist_P(1e-100, 300.0)
  gsl_test_rel(res, 0.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(1e-100, 300.0)")

  res = gsl_cdf_tdist_P(0.001, 300.0)
  gsl_test_rel(res, 0.500398609900943, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(0.001, 300.0)")

  res = gsl_cdf_tdist_P(0.01, 300.0)
  gsl_test_rel(res, 0.5039860330205591, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(0.01, 300.0)")

  res = gsl_cdf_tdist_P(0.1, 300.0)
  gsl_test_rel(res, 0.5397944411777682, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(0.1, 300.0)")

  res = gsl_cdf_tdist_P(0.325, 300.0)
  gsl_test_rel(res, 0.6272962015425239, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(0.325, 300.0)")

  res = gsl_cdf_tdist_P(1.0, 300.0)
  gsl_test_rel(res, 0.8409417977846868, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(1.0, 300.0)")

  res = gsl_cdf_tdist_P(1.5, 300.0)
  gsl_test_rel(res, 0.9326669834253691, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(1.5, 300.0)")

  res = gsl_cdf_tdist_P(2.0, 300.0)
  gsl_test_rel(res, 0.9767992395084255, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(2.0, 300.0)")

  res = gsl_cdf_tdist_P(10.0, 300.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(10.0, 300.0)")

  res = gsl_cdf_tdist_P(20.0, 300.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(20.0, 300.0)")

  res = gsl_cdf_tdist_P(100.0, 300.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(100.0, 300.0)")

  res = gsl_cdf_tdist_P(1000.0, 300.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(1000.0, 300.0)")

  res = gsl_cdf_tdist_P(10000.0, 300.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(10000.0, 300.0)")

  res = gsl_cdf_tdist_Q(0.0, 300.0)
  gsl_test_rel(res, 0.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(0.0, 300.0)")

  res = gsl_cdf_tdist_Q(1e-100, 300.0)
  gsl_test_rel(res, 0.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(1e-100, 300.0)")

  res = gsl_cdf_tdist_Q(0.001, 300.0)
  gsl_test_rel(res, 0.4996013900990571, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(0.001, 300.0)")

  res = gsl_cdf_tdist_Q(0.01, 300.0)
  gsl_test_rel(res, 0.4960139669794409, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(0.01, 300.0)")

  res = gsl_cdf_tdist_Q(0.1, 300.0)
  gsl_test_rel(res, 0.4602055588222318, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(0.1, 300.0)")

  res = gsl_cdf_tdist_Q(0.325, 300.0)
  gsl_test_rel(res, 0.3727037984574762, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(0.325, 300.0)")

  res = gsl_cdf_tdist_Q(1.0, 300.0)
  gsl_test_rel(res, 0.1590582022153131, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(1.0, 300.0)")

  res = gsl_cdf_tdist_Q(1.5, 300.0)
  gsl_test_rel(res, 0.06733301657463087, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(1.5, 300.0)")

  res = gsl_cdf_tdist_Q(2.0, 300.0)
  gsl_test_rel(res, 0.02320076049157455, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(2.0, 300.0)")

  res = gsl_cdf_tdist_Q(10.0, 300.0)
  gsl_test_rel(res, 8.279313677e-21, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(10.0, 300.0)")

  res = gsl_cdf_tdist_Q(20.0, 300.0)
  gsl_test_rel(res, 1.93159812815804e-57, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(20.0, 300.0)")

  res = gsl_cdf_tdist_Q(100.0, 300.0)
  gsl_test_rel(res, 1.025575199977362e-232, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(100.0, 300.0)")

  res = gsl_cdf_tdist_Q(1000.0, 300.0)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_tdist_Q(1000.0, 300.0)")

  res = gsl_cdf_tdist_Q(10000.0, 300.0)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_tdist_Q(10000.0, 300.0)")

  res = gsl_cdf_tdist_P(-1e-100, 300.0)
  gsl_test_rel(res, 0.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-1e-100, 300.0)")

  res = gsl_cdf_tdist_P(-0.001, 300.0)
  gsl_test_rel(res, 0.4996013900990571, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-0.001, 300.0)")

  res = gsl_cdf_tdist_P(-0.01, 300.0)
  gsl_test_rel(res, 0.4960139669794409, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-0.01, 300.0)")

  res = gsl_cdf_tdist_P(-0.1, 300.0)
  gsl_test_rel(res, 0.4602055588222318, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-0.1, 300.0)")

  res = gsl_cdf_tdist_P(-0.325, 300.0)
  gsl_test_rel(res, 0.3727037984574762, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-0.325, 300.0)")

  res = gsl_cdf_tdist_P(-1.0, 300.0)
  gsl_test_rel(res, 0.1590582022153131, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-1.0, 300.0)")

  res = gsl_cdf_tdist_P(-1.5, 300.0)
  gsl_test_rel(res, 0.06733301657463087, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-1.5, 300.0)")

  res = gsl_cdf_tdist_P(-2.0, 300.0)
  gsl_test_rel(res, 0.02320076049157455, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-2.0, 300.0)")

  res = gsl_cdf_tdist_P(-10.0, 300.0)
  gsl_test_rel(res, 8.279313675556273e-21, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-10.0, 300.0)")

  res = gsl_cdf_tdist_P(-20.0, 300.0)
  gsl_test_rel(res, 1.93159812815804e-57, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-20.0, 300.0)")

  res = gsl_cdf_tdist_P(-100.0, 300.0)
  gsl_test_rel(res, 1.025575199977362e-232, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_P(-100.0, 300.0)")

  res = gsl_cdf_tdist_P(-1000.0, 300.0)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_tdist_P(-1000.0, 300.0)")

  res = gsl_cdf_tdist_P(-10000.0, 300.0)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_tdist_P(-10000.0, 300.0)")

  res = gsl_cdf_tdist_Q(-1e-100, 300.0)
  gsl_test_rel(res, 0.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-1e-100, 300.0)")

  res = gsl_cdf_tdist_Q(-0.001, 300.0)
  gsl_test_rel(res, 0.500398609900943, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-0.001, 300.0)")

  res = gsl_cdf_tdist_Q(-0.01, 300.0)
  gsl_test_rel(res, 0.5039860330205591, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-0.01, 300.0)")

  res = gsl_cdf_tdist_Q(-0.1, 300.0)
  gsl_test_rel(res, 0.5397944411777682, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-0.1, 300.0)")

  res = gsl_cdf_tdist_Q(-0.325, 300.0)
  gsl_test_rel(res, 0.6272962015425239, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-0.325, 300.0)")

  res = gsl_cdf_tdist_Q(-1.0, 300.0)
  gsl_test_rel(res, 0.8409417977846869, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-1.0, 300.0)")

  res = gsl_cdf_tdist_Q(-1.5, 300.0)
  gsl_test_rel(res, 0.9326669834253691, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-1.5, 300.0)")

  res = gsl_cdf_tdist_Q(-2.0, 300.0)
  gsl_test_rel(res, 0.9767992395084255, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-2.0, 300.0)")

  res = gsl_cdf_tdist_Q(-10.0, 300.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-10.0, 300.0)")

  res = gsl_cdf_tdist_Q(-20.0, 300.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-20.0, 300.0)")

  res = gsl_cdf_tdist_Q(-100.0, 300.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-100.0, 300.0)")

  res = gsl_cdf_tdist_Q(-1000.0, 300.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-1000.0, 300.0)")

  res = gsl_cdf_tdist_Q(-10000.0, 300.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Q(-10000.0, 300.0)")


##  Tests for F distribution
##  p(x, nu1, nu2) := betaI(1 / (1 + (nu2 / nu1) / x), nu1 / 2, nu2 / 2)

proc test_fdist*() =
  var res = gsl_cdf_fdist_P(0.0, 1.2, 1.3)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_fdist_P(0.0, 1.2, 1.3)")

  res = gsl_cdf_fdist_P(1e-100, 1.2, 1.3)
  gsl_test_rel(res, 6.981942755250389e-61, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(1e-100, 1.2, 1.3)")

  res = gsl_cdf_fdist_P(0.001, 1.2, 1.3)
  gsl_test_rel(res, 0.01106084858602386, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(0.001, 1.2, 1.3)")

  res = gsl_cdf_fdist_P(0.01, 1.2, 1.3)
  gsl_test_rel(res, 0.04386367570683138, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(0.01, 1.2, 1.3)")

  res = gsl_cdf_fdist_P(0.1, 1.2, 1.3)
  gsl_test_rel(res, 0.1682423927128407, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(0.1, 1.2, 1.3)")

  res = gsl_cdf_fdist_P(0.325, 1.2, 1.3)
  gsl_test_rel(res, 0.3141300452461954, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(0.325, 1.2, 1.3)")

  res = gsl_cdf_fdist_P(1.0, 1.2, 1.3)
  gsl_test_rel(res, 0.5096307790747553, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(1.0, 1.2, 1.3)")

  res = gsl_cdf_fdist_P(1.5, 1.2, 1.3)
  gsl_test_rel(res, 0.5839986406415538, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(1.5, 1.2, 1.3)")

  res = gsl_cdf_fdist_P(2.0, 1.2, 1.3)
  gsl_test_rel(res, 0.6347335813519388, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(2.0, 1.2, 1.3)")

  res = gsl_cdf_fdist_P(10.0, 1.2, 1.3)
  gsl_test_rel(res, 0.8484462378792009, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(10.0, 1.2, 1.3)")

  res = gsl_cdf_fdist_P(20.0, 1.2, 1.3)
  gsl_test_rel(res, 0.9009877263368751, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(20.0, 1.2, 1.3)")

  res = gsl_cdf_fdist_P(100.0, 1.2, 1.3)
  gsl_test_rel(res, 0.9644891270476884, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(100.0, 1.2, 1.3)")

  res = gsl_cdf_fdist_P(1000.0, 1.2, 1.3)
  gsl_test_rel(res, 0.9920120516941164, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(1000.0, 1.2, 1.3)")

  res = gsl_cdf_fdist_P(10000.0, 1.2, 1.3)
  gsl_test_rel(res, 0.9982108628088426, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(10000.0, 1.2, 1.3)")

  res = gsl_cdf_fdist_Q(0.0, 1.2, 1.3)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(0.0, 1.2, 1.3)")

  res = gsl_cdf_fdist_Q(1e-100, 1.2, 1.3)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(1e-100, 1.2, 1.3)")

  res = gsl_cdf_fdist_Q(0.001, 1.2, 1.3)
  gsl_test_rel(res, 0.9889391514139761, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(0.001, 1.2, 1.3)")

  res = gsl_cdf_fdist_Q(0.01, 1.2, 1.3)
  gsl_test_rel(res, 0.9561363242931686, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(0.01, 1.2, 1.3)")

  res = gsl_cdf_fdist_Q(0.1, 1.2, 1.3)
  gsl_test_rel(res, 0.8317576072871593, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(0.1, 1.2, 1.3)")

  res = gsl_cdf_fdist_Q(0.325, 1.2, 1.3)
  gsl_test_rel(res, 0.6858699547538045, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(0.325, 1.2, 1.3)")

  res = gsl_cdf_fdist_Q(1.0, 1.2, 1.3)
  gsl_test_rel(res, 0.4903692209252448, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(1.0, 1.2, 1.3)")

  res = gsl_cdf_fdist_Q(1.5, 1.2, 1.3)
  gsl_test_rel(res, 0.4160013593584461, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(1.5, 1.2, 1.3)")

  res = gsl_cdf_fdist_Q(2.0, 1.2, 1.3)
  gsl_test_rel(res, 0.3652664186480612, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(2.0, 1.2, 1.3)")

  res = gsl_cdf_fdist_Q(10.0, 1.2, 1.3)
  gsl_test_rel(res, 0.151553762120799, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(10.0, 1.2, 1.3)")

  res = gsl_cdf_fdist_Q(20.0, 1.2, 1.3)
  gsl_test_rel(res, 0.09901227366312496, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(20.0, 1.2, 1.3)")

  res = gsl_cdf_fdist_Q(100.0, 1.2, 1.3)
  gsl_test_rel(res, 0.03551087295231156, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(100.0, 1.2, 1.3)")

  res = gsl_cdf_fdist_Q(1000.0, 1.2, 1.3)
  gsl_test_rel(res, 0.007987948305883612, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(1000.0, 1.2, 1.3)")

  res = gsl_cdf_fdist_Q(10000.0, 1.2, 1.3)
  gsl_test_rel(res, 0.001789137191157414, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(10000.0, 1.2, 1.3)")

  res = gsl_cdf_fdist_P(3.479082213465833, 1, 4040712)
  gsl_test_rel(res, 0.9378507276372341, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(3.479082213465832574, 1, 4040712)")

  res = gsl_cdf_fdist_P(3.002774644786533, 1, 4040712)
  gsl_test_rel(res, 0.9168778737947606, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(3.002774644786533109, 1, 4040712)")

  res = gsl_cdf_fdist_P(3.000854441173131, 1, 4040712)
  gsl_test_rel(res, 0.9167793071981358, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(3.000854441173130827, 1, 4040712)")

  res = gsl_cdf_fdist_P(3.000064021622133, 1, 4040712)
  gsl_test_rel(res, 0.9167386972447996, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(3.000064021622133037, 1, 4040712)")

  res = gsl_cdf_fdist_P(0.0, 500.0, 1.3)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_fdist_P(0.0, 500.0, 1.3)")

  res = gsl_cdf_fdist_P(1e-100, 500.0, 1.3)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_fdist_P(1e-100, 500.0, 1.3)")

  res = gsl_cdf_fdist_P(0.001, 500.0, 1.3)
  gsl_test_rel(res, 9.834344603933047e-141, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(0.001, 500.0, 1.3)")

  res = gsl_cdf_fdist_P(0.01, 500.0, 1.3)
  gsl_test_rel(res, 1.4591562488855e-26, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(0.01, 500.0, 1.3)")

  res = gsl_cdf_fdist_P(0.1, 500.0, 1.3)
  gsl_test_rel(res, 0.0005899765096196881, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(0.1, 500.0, 1.3)")

  res = gsl_cdf_fdist_P(0.325, 500.0, 1.3)
  gsl_test_rel(res, 0.06861104860515425, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(0.325, 500.0, 1.3)")

  res = gsl_cdf_fdist_P(1.0, 500.0, 1.3)
  gsl_test_rel(res, 0.3384750538064046, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(1.0, 500.0, 1.3)")

  res = gsl_cdf_fdist_P(1.5, 500.0, 1.3)
  gsl_test_rel(res, 0.4520162452474574, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(1.5, 500.0, 1.3)")

  res = gsl_cdf_fdist_P(2.0, 500.0, 1.3)
  gsl_test_rel(res, 0.5273390689373888, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(2.0, 500.0, 1.3)")

  res = gsl_cdf_fdist_P(10.0, 500.0, 1.3)
  gsl_test_rel(res, 0.8168396285784139, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(10.0, 500.0, 1.3)")

  res = gsl_cdf_fdist_P(20.0, 500.0, 1.3)
  gsl_test_rel(res, 0.8817846230569114, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(20.0, 500.0, 1.3)")

  res = gsl_cdf_fdist_P(100.0, 500.0, 1.3)
  gsl_test_rel(res, 0.9580450572042213, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(100.0, 500.0, 1.3)")

  res = gsl_cdf_fdist_P(1000.0, 500.0, 1.3)
  gsl_test_rel(res, 0.9905857493806552, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(1000.0, 500.0, 1.3)")

  res = gsl_cdf_fdist_P(10000.0, 500.0, 1.3)
  gsl_test_rel(res, 0.9978919248314614, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(10000.0, 500.0, 1.3)")

  res = gsl_cdf_fdist_Q(0.0, 500.0, 1.3)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(0.0, 500.0, 1.3)")

  res = gsl_cdf_fdist_Q(1e-100, 500.0, 1.3)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(1e-100, 500.0, 1.3)")

  res = gsl_cdf_fdist_Q(0.001, 500.0, 1.3)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(0.001, 500.0, 1.3)")

  res = gsl_cdf_fdist_Q(0.01, 500.0, 1.3)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(0.01, 500.0, 1.3)")

  res = gsl_cdf_fdist_Q(0.1, 500.0, 1.3)
  gsl_test_rel(res, 0.9994100234903803, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(0.1, 500.0, 1.3)")

  res = gsl_cdf_fdist_Q(0.325, 500.0, 1.3)
  gsl_test_rel(res, 0.9313889513948458, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(0.325, 500.0, 1.3)")

  res = gsl_cdf_fdist_Q(1.0, 500.0, 1.3)
  gsl_test_rel(res, 0.6615249461935954, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(1.0, 500.0, 1.3)")

  res = gsl_cdf_fdist_Q(1.5, 500.0, 1.3)
  gsl_test_rel(res, 0.5479837547525426, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(1.5, 500.0, 1.3)")

  res = gsl_cdf_fdist_Q(2.0, 500.0, 1.3)
  gsl_test_rel(res, 0.4726609310626112, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(2.0, 500.0, 1.3)")

  res = gsl_cdf_fdist_Q(10.0, 500.0, 1.3)
  gsl_test_rel(res, 0.1831603714215861, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(10.0, 500.0, 1.3)")

  res = gsl_cdf_fdist_Q(20.0, 500.0, 1.3)
  gsl_test_rel(res, 0.1182153769430886, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(20.0, 500.0, 1.3)")

  res = gsl_cdf_fdist_Q(100.0, 500.0, 1.3)
  gsl_test_rel(res, 0.0419549427957787, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(100.0, 500.0, 1.3)")

  res = gsl_cdf_fdist_Q(1000.0, 500.0, 1.3)
  gsl_test_rel(res, 0.009414250619344734, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(1000.0, 500.0, 1.3)")

  res = gsl_cdf_fdist_Q(10000.0, 500.0, 1.3)
  gsl_test_rel(res, 0.002108075168538626, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(10000.0, 500.0, 1.3)")

  res = gsl_cdf_fdist_P(0.0, 1.2, 500.0)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_fdist_P(0.0, 1.2, 500.0)")

  res = gsl_cdf_fdist_P(1e-100, 1.2, 500.0)
  gsl_test_rel(res, 8.23342055585483e-61, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(1e-100, 1.2, 500.0)")

  res = gsl_cdf_fdist_P(0.001, 1.2, 500.0)
  gsl_test_rel(res, 0.01304614964412895, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(0.001, 1.2, 500.0)")

  res = gsl_cdf_fdist_P(0.01, 1.2, 500.0)
  gsl_test_rel(res, 0.05183242246080333, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(0.01, 1.2, 500.0)")

  res = gsl_cdf_fdist_P(0.1, 1.2, 500.0)
  gsl_test_rel(res, 0.2022351017160763, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(0.1, 1.2, 500.0)")

  res = gsl_cdf_fdist_P(0.325, 1.2, 500.0)
  gsl_test_rel(res, 0.3905029832193938, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(0.325, 1.2, 500.0)")

  res = gsl_cdf_fdist_P(1.0, 1.2, 500.0)
  gsl_test_rel(res, 0.6676561915746536, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(1.0, 1.2, 500.0)")

  res = gsl_cdf_fdist_P(1.5, 1.2, 500.0)
  gsl_test_rel(res, 0.7755392302714671, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(1.5, 1.2, 500.0)")

  res = gsl_cdf_fdist_P(2.0, 1.2, 500.0)
  gsl_test_rel(res, 0.8452091149046137, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(2.0, 1.2, 500.0)")

  res = gsl_cdf_fdist_P(10.0, 1.2, 500.0)
  gsl_test_rel(res, 0.999168017659121, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(10.0, 1.2, 500.0)")

  res = gsl_cdf_fdist_P(20.0, 1.2, 500.0)
  gsl_test_rel(res, 0.9999980057383717, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(20.0, 1.2, 500.0)")

  res = gsl_cdf_fdist_P(100.0, 1.2, 500.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(100.0, 1.2, 500.0)")

  res = gsl_cdf_fdist_P(1000.0, 1.2, 500.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(1000.0, 1.2, 500.0)")

  res = gsl_cdf_fdist_P(10000.0, 1.2, 500.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(10000.0, 1.2, 500.0)")

  res = gsl_cdf_fdist_Q(0.0, 1.2, 500.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(0.0, 1.2, 500.0)")

  res = gsl_cdf_fdist_Q(1e-100, 1.2, 500.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(1e-100, 1.2, 500.0)")

  res = gsl_cdf_fdist_Q(0.001, 1.2, 500.0)
  gsl_test_rel(res, 0.986953850355871, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(0.001, 1.2, 500.0)")

  res = gsl_cdf_fdist_Q(0.01, 1.2, 500.0)
  gsl_test_rel(res, 0.9481675775391967, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(0.01, 1.2, 500.0)")

  res = gsl_cdf_fdist_Q(0.1, 1.2, 500.0)
  gsl_test_rel(res, 0.7977648982839237, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(0.1, 1.2, 500.0)")

  res = gsl_cdf_fdist_Q(0.325, 1.2, 500.0)
  gsl_test_rel(res, 0.6094970167806063, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(0.325, 1.2, 500.0)")

  res = gsl_cdf_fdist_Q(1.0, 1.2, 500.0)
  gsl_test_rel(res, 0.3323438084253464, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(1.0, 1.2, 500.0)")

  res = gsl_cdf_fdist_Q(1.5, 1.2, 500.0)
  gsl_test_rel(res, 0.2244607697285329, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(1.5, 1.2, 500.0)")

  res = gsl_cdf_fdist_Q(2.0, 1.2, 500.0)
  gsl_test_rel(res, 0.1547908850953863, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(2.0, 1.2, 500.0)")

  res = gsl_cdf_fdist_Q(10.0, 1.2, 500.0)
  gsl_test_rel(res, 0.0008319823408790116, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(10.0, 1.2, 500.0)")

  res = gsl_cdf_fdist_Q(20.0, 1.2, 500.0)
  gsl_test_rel(res, 1.99426162833131e-06, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(20.0, 1.2, 500.0)")

  res = gsl_cdf_fdist_Q(100.0, 1.2, 500.0)
  gsl_test_rel(res, 6.233026622882171e-25, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(100.0, 1.2, 500.0)")

  res = gsl_cdf_fdist_Q(1000.0, 1.2, 500.0)
  gsl_test_rel(res, 1.143285772596669e-134, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(1000.0, 1.2, 500.0)")

  res = gsl_cdf_fdist_Q(10000.0, 1.2, 500.0)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_fdist_Q(10000.0, 1.2, 500.0)")

  res = gsl_cdf_fdist_P(0.0, 200.0, 500.0)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_fdist_P(0.0, 200.0, 500.0)")

  res = gsl_cdf_fdist_P(1e-100, 200.0, 500.0)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_fdist_P(1e-100, 200.0, 500.0)")

  res = gsl_cdf_fdist_P(0.001, 200.0, 500.0)
  gsl_test_rel(res, 4.093250804036699e-251, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(0.001, 200.0, 500.0)")

  res = gsl_cdf_fdist_P(0.01, 200.0, 500.0)
  gsl_test_rel(res, 1.178943254196287e-151, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(0.01, 200.0, 500.0)")

  res = gsl_cdf_fdist_P(0.1, 200.0, 500.0)
  gsl_test_rel(res, 5.924309407968612e-57, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(0.1, 200.0, 500.0)")

  res = gsl_cdf_fdist_P(0.325, 200.0, 500.0)
  gsl_test_rel(res, 3.182204523572636e-18, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(0.325, 200.0, 500.0)")

  res = gsl_cdf_fdist_P(1.0, 200.0, 500.0)
  gsl_test_rel(res, 0.5067463261211682, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(1.0, 200.0, 500.0)")

  res = gsl_cdf_fdist_P(1.5, 200.0, 500.0)
  gsl_test_rel(res, 0.9997941757187124, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(1.5, 200.0, 500.0)")

  res = gsl_cdf_fdist_P(2.0, 200.0, 500.0)
  gsl_test_rel(res, 0.9999999995282361, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(2.0, 200.0, 500.0)")

  res = gsl_cdf_fdist_P(10.0, 200.0, 500.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(10.0, 200.0, 500.0)")

  res = gsl_cdf_fdist_P(20.0, 200.0, 500.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(20.0, 200.0, 500.0)")

  res = gsl_cdf_fdist_P(100.0, 200.0, 500.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(100.0, 200.0, 500.0)")

  res = gsl_cdf_fdist_P(1000.0, 200.0, 500.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(1000.0, 200.0, 500.0)")

  res = gsl_cdf_fdist_P(10000.0, 200.0, 500.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_P(10000.0, 200.0, 500.0)")

  res = gsl_cdf_fdist_Q(0.0, 200.0, 500.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(0.0, 200.0, 500.0)")

  res = gsl_cdf_fdist_Q(1e-100, 200.0, 500.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(1e-100, 200.0, 500.0)")

  res = gsl_cdf_fdist_Q(0.001, 200.0, 500.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(0.001, 200.0, 500.0)")

  res = gsl_cdf_fdist_Q(0.01, 200.0, 500.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(0.01, 200.0, 500.0)")

  res = gsl_cdf_fdist_Q(0.1, 200.0, 500.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(0.1, 200.0, 500.0)")

  res = gsl_cdf_fdist_Q(0.325, 200.0, 500.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(0.325, 200.0, 500.0)")

  res = gsl_cdf_fdist_Q(1.0, 200.0, 500.0)
  gsl_test_rel(res, 0.4932536738788317, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(1.0, 200.0, 500.0)")

  res = gsl_cdf_fdist_Q(1.5, 200.0, 500.0)
  gsl_test_rel(res, 0.0002058242812875618, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(1.5, 200.0, 500.0)")

  res = gsl_cdf_fdist_Q(2.0, 200.0, 500.0)
  gsl_test_rel(res, 4.717638483714107e-10, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(2.0, 200.0, 500.0)")

  res = gsl_cdf_fdist_Q(10.0, 200.0, 500.0)
  gsl_test_rel(res, 5.980483371819484e-96, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(10.0, 200.0, 500.0)")

  res = gsl_cdf_fdist_Q(20.0, 200.0, 500.0)
  gsl_test_rel(res, 2.920992658799795e-155, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Q(20.0, 200.0, 500.0)")

  res = gsl_cdf_fdist_Q(1000.0, 200.0, 500.0)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_fdist_Q(1000.0, 200.0, 500.0)")

  res = gsl_cdf_fdist_Q(10000.0, 200.0, 500.0)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_fdist_Q(10000.0, 200.0, 500.0)")


proc test_finv*() =
  var res = gsl_cdf_fdist_Pinv(0.0, 1.2, 1.3)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_fdist_Pinv(0.0, 1.2, 1.3)")

  res = gsl_cdf_fdist_Pinv(6.981942755250389e-61, 1.2, 1.3)
  gsl_test_rel(res, 1e-100, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 6.98194275525039002e-61, 1.2, 1.3)")

  res = gsl_cdf_fdist_Pinv(0.01106084858602386, 1.2, 1.3)
  gsl_test_rel(res, 0.001, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 1.10608485860238564e-2, 1.2, 1.3)")

  res = gsl_cdf_fdist_Pinv(0.04386367570683138, 1.2, 1.3)
  gsl_test_rel(res, 0.01, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 4.38636757068313850e-2, 1.2, 1.3)")

  res = gsl_cdf_fdist_Pinv(0.1682423927128407, 1.2, 1.3)
  gsl_test_rel(res, 0.1, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 1.68242392712840734e-1, 1.2, 1.3)")

  res = gsl_cdf_fdist_Pinv(0.3141300452461954, 1.2, 1.3)
  gsl_test_rel(res, 0.325, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 3.14130045246195449e-1, 1.2, 1.3)")

  res = gsl_cdf_fdist_Pinv(0.5096307790747553, 1.2, 1.3)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 5.09630779074755253e-01, 1.2, 1.3)")

  res = gsl_cdf_fdist_Pinv(0.5839986406415538, 1.2, 1.3)
  gsl_test_rel(res, 1.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 5.83998640641553852e-1, 1.2, 1.3)")

  res = gsl_cdf_fdist_Pinv(0.6347335813519388, 1.2, 1.3)
  gsl_test_rel(res, 2.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 6.34733581351938787e-1, 1.2, 1.3)")

  res = gsl_cdf_fdist_Pinv(0.8484462378792009, 1.2, 1.3)
  gsl_test_rel(res, 10.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 8.48446237879200975e-1, 1.2, 1.3)")

  res = gsl_cdf_fdist_Pinv(0.9009877263368751, 1.2, 1.3)
  gsl_test_rel(res, 20.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 9.00987726336875039e-1, 1.2, 1.3)")

  res = gsl_cdf_fdist_Pinv(0.9644891270476884, 1.2, 1.3)
  gsl_test_rel(res, 100.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 9.64489127047688435e-1, 1.2, 1.3)")

  res = gsl_cdf_fdist_Pinv(0.9920120516941164, 1.2, 1.3)
  gsl_test_rel(res, 1000.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 9.92012051694116388e-1, 1.2, 1.3)")

  res = gsl_cdf_fdist_Pinv(0.9982108628088426, 1.2, 1.3)
  gsl_test_rel(res, 10000.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 9.98210862808842585e-1, 1.2, 1.3)")

  res = gsl_cdf_fdist_Qinv(1.0, 1.2, 1.3)
  gsl_test_rel(res, 0.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 1.0, 1.2, 1.3)")

  res = gsl_cdf_fdist_Qinv(0.9889391514139761, 1.2, 1.3)
  gsl_test_rel(res, 0.001, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 9.88939151413976144e-1, 1.2, 1.3)")

  res = gsl_cdf_fdist_Qinv(0.9561363242931686, 1.2, 1.3)
  gsl_test_rel(res, 0.01, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 9.56136324293168615e-1, 1.2, 1.3)")

  res = gsl_cdf_fdist_Qinv(0.8317576072871593, 1.2, 1.3)
  gsl_test_rel(res, 0.1, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 8.31757607287159265e-1, 1.2, 1.3)")

  res = gsl_cdf_fdist_Qinv(0.6858699547538045, 1.2, 1.3)
  gsl_test_rel(res, 0.325, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 6.85869954753804551e-1, 1.2, 1.3)")

  res = gsl_cdf_fdist_Qinv(0.4903692209252448, 1.2, 1.3)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 4.90369220925244747e-1, 1.2, 1.3)")

  res = gsl_cdf_fdist_Qinv(0.4160013593584461, 1.2, 1.3)
  gsl_test_rel(res, 1.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 4.16001359358446148e-1, 1.2, 1.3)")

  res = gsl_cdf_fdist_Qinv(0.3652664186480612, 1.2, 1.3)
  gsl_test_rel(res, 2.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 3.65266418648061213e-1, 1.2, 1.3)")

  res = gsl_cdf_fdist_Qinv(0.151553762120799, 1.2, 1.3)
  gsl_test_rel(res, 10.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 1.51553762120799025e-1, 1.2, 1.3)")

  res = gsl_cdf_fdist_Qinv(0.09901227366312496, 1.2, 1.3)
  gsl_test_rel(res, 20.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 9.90122736631249612e-2, 1.2, 1.3)")

  res = gsl_cdf_fdist_Qinv(0.03551087295231156, 1.2, 1.3)
  gsl_test_rel(res, 100.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 3.55108729523115643e-2, 1.2, 1.3)")

  res = gsl_cdf_fdist_Qinv(0.007987948305883612, 1.2, 1.3)
  gsl_test_rel(res, 1000.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 7.98794830588361109e-3, 1.2, 1.3)")

  res = gsl_cdf_fdist_Qinv(0.001789137191157414, 1.2, 1.3)
  gsl_test_rel(res, 10000.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 1.7891371911574145e-3, 1.2, 1.3)")

  res = gsl_cdf_fdist_Pinv(0.0, 500.0, 1.3)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_fdist_Pinv( 0.0, 500.0, 1.3)")

  res = gsl_cdf_fdist_Pinv(9.834344603933047e-141, 500.0, 1.3)
  gsl_test_rel(res, 0.001, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 9.83434460393304765e-141, 500.0, 1.3)")

  res = gsl_cdf_fdist_Pinv(1.4591562488855e-26, 500.0, 1.3)
  gsl_test_rel(res, 0.01, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 1.45915624888550014e-26, 500.0, 1.3)")

  res = gsl_cdf_fdist_Pinv(0.0005899765096196881, 500.0, 1.3)
  gsl_test_rel(res, 0.1, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 5.89976509619688165e-4, 500.0, 1.3)")

  res = gsl_cdf_fdist_Pinv(0.06861104860515425, 500.0, 1.3)
  gsl_test_rel(res, 0.325, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 6.86110486051542533e-2, 500.0, 1.3)")

  res = gsl_cdf_fdist_Pinv(0.3384750538064046, 500.0, 1.3)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 3.38475053806404615e-1, 500.0, 1.3)")

  res = gsl_cdf_fdist_Pinv(0.4520162452474574, 500.0, 1.3)
  gsl_test_rel(res, 1.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 4.52016245247457422e-1, 500.0, 1.3)")

  res = gsl_cdf_fdist_Pinv(0.5273390689373888, 500.0, 1.3)
  gsl_test_rel(res, 2.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 5.27339068937388798e-1, 500.0, 1.3)")

  res = gsl_cdf_fdist_Pinv(0.8168396285784139, 500.0, 1.3)
  gsl_test_rel(res, 10.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 8.16839628578413905e-1, 500.0, 1.3)")

  res = gsl_cdf_fdist_Pinv(0.8817846230569114, 500.0, 1.3)
  gsl_test_rel(res, 20.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 8.81784623056911406e-1, 500.0, 1.3)")

  res = gsl_cdf_fdist_Pinv(0.9580450572042213, 500.0, 1.3)
  gsl_test_rel(res, 100.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 9.58045057204221295e-1, 500.0, 1.3)")

  res = gsl_cdf_fdist_Pinv(0.9905857493806552, 500.0, 1.3)
  gsl_test_rel(res, 1000.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 9.90585749380655275e-1, 500.0, 1.3)")

  res = gsl_cdf_fdist_Pinv(0.9978919248314614, 500.0, 1.3)
  gsl_test_rel(res, 10000.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 9.97891924831461387e-1, 500.0, 1.3)")

  res = gsl_cdf_fdist_Qinv(1.0, 500.0, 1.3)
  gsl_test_rel(res, 0.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 1.0, 500.0, 1.3)")

  res = gsl_cdf_fdist_Qinv(0.9994100234903803, 500.0, 1.3)
  gsl_test_rel(res, 0.1, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 9.99410023490380312e-1, 500.0, 1.3)")

  res = gsl_cdf_fdist_Qinv(0.9313889513948458, 500.0, 1.3)
  gsl_test_rel(res, 0.325, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 9.31388951394845747e-1, 500.0, 1.3)")

  res = gsl_cdf_fdist_Qinv(0.6615249461935954, 500.0, 1.3)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 6.61524946193595385e-1, 500.0, 1.3)")

  res = gsl_cdf_fdist_Qinv(0.5479837547525426, 500.0, 1.3)
  gsl_test_rel(res, 1.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 5.47983754752542572e-1, 500.0, 1.3)")

  res = gsl_cdf_fdist_Qinv(0.4726609310626112, 500.0, 1.3)
  gsl_test_rel(res, 2.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 4.72660931062611202e-1, 500.0, 1.3)")

  res = gsl_cdf_fdist_Qinv(0.1831603714215861, 500.0, 1.3)
  gsl_test_rel(res, 10.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 1.83160371421586096e-1, 500.0, 1.3)")

  res = gsl_cdf_fdist_Qinv(0.1182153769430886, 500.0, 1.3)
  gsl_test_rel(res, 20.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 1.18215376943088595e-1, 500.0, 1.3)")

  res = gsl_cdf_fdist_Qinv(0.0419549427957787, 500.0, 1.3)
  gsl_test_rel(res, 100.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 4.19549427957787016e-2, 500.0, 1.3)")

  res = gsl_cdf_fdist_Qinv(0.009414250619344734, 500.0, 1.3)
  gsl_test_rel(res, 1000.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 9.41425061934473424e-3, 500.0, 1.3)")

  res = gsl_cdf_fdist_Qinv(0.002108075168538626, 500.0, 1.3)
  gsl_test_rel(res, 10000.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 2.10807516853862603e-3, 500.0, 1.3)")

  res = gsl_cdf_fdist_Pinv(0.0, 1.2, 500.0)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_fdist_Pinv( 0.0, 1.2, 500.0)")

  res = gsl_cdf_fdist_Pinv(8.23342055585483e-61, 1.2, 500.0)
  gsl_test_rel(res, 1e-100, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 8.23342055585482999e-61, 1.2, 500.0)")

  res = gsl_cdf_fdist_Pinv(0.01304614964412895, 1.2, 500.0)
  gsl_test_rel(res, 0.001, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 1.30461496441289529e-2, 1.2, 500.0)")

  res = gsl_cdf_fdist_Pinv(0.05183242246080333, 1.2, 500.0)
  gsl_test_rel(res, 0.01, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 5.18324224608033294e-2, 1.2, 500.0)")

  res = gsl_cdf_fdist_Pinv(0.2022351017160763, 1.2, 500.0)
  gsl_test_rel(res, 0.1, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 2.02235101716076289e-1, 1.2, 500.0)")

  res = gsl_cdf_fdist_Pinv(0.3905029832193938, 1.2, 500.0)
  gsl_test_rel(res, 0.325, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 3.90502983219393749e-1, 1.2, 500.0)")

  res = gsl_cdf_fdist_Pinv(0.6676561915746536, 1.2, 500.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 6.67656191574653619e-1, 1.2, 500.0)")

  res = gsl_cdf_fdist_Pinv(0.7755392302714671, 1.2, 500.0)
  gsl_test_rel(res, 1.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 7.75539230271467054e-1, 1.2, 500.0)")

  res = gsl_cdf_fdist_Pinv(0.8452091149046137, 1.2, 500.0)
  gsl_test_rel(res, 2.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 8.45209114904613705e-1, 1.2, 500.0)")

  res = gsl_cdf_fdist_Pinv(0.999168017659121, 1.2, 500.0)
  gsl_test_rel(res, 10.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 9.99168017659120988e-1, 1.2, 500.0)")

  res = gsl_cdf_fdist_Pinv(0.9999980057383717, 1.2, 500.0)
  gsl_test_rel(res, 20.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 9.99998005738371669e-1, 1.2, 500.0)")

  res = gsl_cdf_fdist_Pinv(1.0, 1.2, 500.0)
  gsl_test_rel(res, cast[cdouble](cdouble.high), (1048576.0 *
      2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 1.0, 1.2, 500.0)")

  res = gsl_cdf_fdist_Pinv(1.0, 1.2, 500.0)
  gsl_test_rel(res, cast[cdouble](cdouble.high), (1048576.0 *
      2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 1.0, 1.2, 500.0)")

  res = gsl_cdf_fdist_Pinv(1.0, 1.2, 500.0)
  gsl_test_rel(res, cast[cdouble](cdouble.high), (1048576.0 *
      2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 1.0, 1.2, 500.0)")

  res = gsl_cdf_fdist_Qinv(1.0, 1.2, 500.0)
  gsl_test_rel(res, 0.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 1.0, 1.2, 500.0)")

  res = gsl_cdf_fdist_Qinv(0.986953850355871, 1.2, 500.0)
  gsl_test_rel(res, 0.001, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 9.86953850355871047e-1, 1.2, 500.0)")

  res = gsl_cdf_fdist_Qinv(0.9481675775391967, 1.2, 500.0)
  gsl_test_rel(res, 0.01, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 9.48167577539196671e-1, 1.2, 500.0)")

  res = gsl_cdf_fdist_Qinv(0.7977648982839237, 1.2, 500.0)
  gsl_test_rel(res, 0.1, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 7.97764898283923711e-1, 1.2, 500.0)")

  res = gsl_cdf_fdist_Qinv(0.6094970167806063, 1.2, 500.0)
  gsl_test_rel(res, 0.325, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 6.09497016780606251e-1, 1.2, 500.0)")

  res = gsl_cdf_fdist_Qinv(0.3323438084253464, 1.2, 500.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 3.32343808425346381e-1, 1.2, 500.0)")

  res = gsl_cdf_fdist_Qinv(0.2244607697285329, 1.2, 500.0)
  gsl_test_rel(res, 1.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 2.24460769728532946e-1, 1.2, 500.0)")

  res = gsl_cdf_fdist_Qinv(0.1547908850953863, 1.2, 500.0)
  gsl_test_rel(res, 2.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 1.54790885095386295e-1, 1.2, 500.0)")

  res = gsl_cdf_fdist_Qinv(0.0008319823408790116, 1.2, 500.0)
  gsl_test_rel(res, 10.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 8.3198234087901168e-4, 1.2, 500.0)")

  res = gsl_cdf_fdist_Qinv(1.99426162833131e-06, 1.2, 500.0)
  gsl_test_rel(res, 20.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 1.99426162833131e-6, 1.2, 500.0)")

  res = gsl_cdf_fdist_Qinv(6.233026622882171e-25, 1.2, 500.0)
  gsl_test_rel(res, 100.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 6.23302662288217117e-25, 1.2, 500.0)")

  res = gsl_cdf_fdist_Qinv(1.143285772596669e-134, 1.2, 500.0)
  gsl_test_rel(res, 1000.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 1.14328577259666930e-134, 1.2, 500.0)")

  res = gsl_cdf_fdist_Qinv(0.0, 1.2, 500.0)
  gsl_test_rel(res, cast[cdouble](cdouble.high), 0.0, "gsl_cdf_fdist_Qinv( 0.0, 1.2, 500.0)")

  res = gsl_cdf_fdist_Pinv(0.0, 200.0, 500.0)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_fdist_Pinv( 0.0, 200.0, 500.0)")

  res = gsl_cdf_fdist_Pinv(4.093250804036699e-251, 200.0, 500.0)
  gsl_test_rel(res, 0.001, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 4.09325080403669893e-251, 200.0, 500.0)")

  res = gsl_cdf_fdist_Pinv(1.178943254196287e-151, 200.0, 500.0)
  gsl_test_rel(res, 0.01, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 1.17894325419628688e-151, 200.0, 500.0)")

  res = gsl_cdf_fdist_Pinv(5.924309407968612e-57, 200.0, 500.0)
  gsl_test_rel(res, 0.1, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 5.92430940796861258e-57, 200.0, 500.0)")

  res = gsl_cdf_fdist_Pinv(3.182204523572636e-18, 200.0, 500.0)
  gsl_test_rel(res, 0.325, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 3.18220452357263554e-18, 200.0, 500.0)")

  res = gsl_cdf_fdist_Pinv(0.5067463261211682, 200.0, 500.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 5.06746326121168266e-1, 200.0, 500.0)")

  res = gsl_cdf_fdist_Pinv(0.9997941757187124, 200.0, 500.0)
  gsl_test_rel(res, 1.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 9.99794175718712438e-1, 200.0, 500.0)")

  res = gsl_cdf_fdist_Pinv(1.0, 200.0, 500.0)
  gsl_test_rel(res, cast[cdouble](cdouble.high), (1048576.0 *
      2.220446049250313e-16), "gsl_cdf_fdist_Pinv( 1.0, 200.0, 500.0)")

  res = gsl_cdf_fdist_Qinv(1.0, 200.0, 500.0)
  gsl_test_rel(res, 0.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 1.0, 200.0, 500.0)")

  res = gsl_cdf_fdist_Qinv(0.4932536738788317, 200.0, 500.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 4.93253673878831734e-1, 200.0, 500.0)")

  res = gsl_cdf_fdist_Qinv(0.0002058242812875618, 200.0, 500.0)
  gsl_test_rel(res, 1.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 2.05824281287561795e-4, 200.0, 500.0)")

  res = gsl_cdf_fdist_Qinv(4.717638483714107e-10, 200.0, 500.0)
  gsl_test_rel(res, 2.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 4.71763848371410786e-10, 200.0, 500.0)")

  res = gsl_cdf_fdist_Qinv(5.980483371819484e-96, 200.0, 500.0)
  gsl_test_rel(res, 10.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 5.98048337181948436e-96, 200.0, 500.0)")

  res = gsl_cdf_fdist_Qinv(2.920992658799795e-155, 200.0, 500.0)
  gsl_test_rel(res, 20.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Qinv( 2.92099265879979502e-155, 200.0, 500.0)")

  res = gsl_cdf_fdist_Qinv(0.0, 200.0, 500.0)
  gsl_test_rel(res, cast[cdouble](cdouble.high), 0.0, "gsl_cdf_fdist_Qinv( 0.0, 200.0, 500.0)")

  res = gsl_cdf_fdist_Pinv(0.95, 1.0, 261.0)
  gsl_test_rel(res, 3.877334032250872, (2048.0 * 2.220446049250313e-16), "gsl_cdf_fdist_Pinv(0.95,1.0,261.0)")


##  Tests for gamma distribution
##  p(x, a, b) := gammaP(b, x / a)

proc test_gamma*() =
  var res = gsl_cdf_gamma_P(0.0, 1.0, 1.0)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_gamma_P(0.0, 1.0, 1.0)")

  res = gsl_cdf_gamma_P(1e-100, 1.0, 1.0)
  gsl_test_rel(res, 1e-100, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(1e-100, 1.0, 1.0)")

  res = gsl_cdf_gamma_P(0.001, 1.0, 1.0)
  gsl_test_rel(res, 0.0009995001666250082, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(0.001, 1.0, 1.0)")

  res = gsl_cdf_gamma_P(0.01, 1.0, 1.0)
  gsl_test_rel(res, 0.009950166250831947, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(0.01, 1.0, 1.0)")

  res = gsl_cdf_gamma_P(0.1, 1.0, 1.0)
  gsl_test_rel(res, 0.09516258196404043, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(0.1, 1.0, 1.0)")

  res = gsl_cdf_gamma_P(0.325, 1.0, 1.0)
  gsl_test_rel(res, 0.2774726463579278, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(0.325, 1.0, 1.0)")

  res = gsl_cdf_gamma_P(1.0, 1.0, 1.0)
  gsl_test_rel(res, 0.6321205588285577, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(1.0, 1.0, 1.0)")

  res = gsl_cdf_gamma_P(1.5, 1.0, 1.0)
  gsl_test_rel(res, 0.7768698398515702, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(1.5, 1.0, 1.0)")

  res = gsl_cdf_gamma_P(2.0, 1.0, 1.0)
  gsl_test_rel(res, 0.8646647167633873, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(2.0, 1.0, 1.0)")

  res = gsl_cdf_gamma_P(10.0, 1.0, 1.0)
  gsl_test_rel(res, 0.9999546000702375, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(10.0, 1.0, 1.0)")

  res = gsl_cdf_gamma_P(20.0, 1.0, 1.0)
  gsl_test_rel(res, 0.9999999979388464, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(20.0, 1.0, 1.0)")

  res = gsl_cdf_gamma_P(100.0, 1.0, 1.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(100.0, 1.0, 1.0)")

  res = gsl_cdf_gamma_P(1000.0, 1.0, 1.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(1000.0, 1.0, 1.0)")

  res = gsl_cdf_gamma_P(10000.0, 1.0, 1.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(10000.0, 1.0, 1.0)")

  res = gsl_cdf_gamma_Q(0.0, 1.0, 1.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(0.0, 1.0, 1.0)")

  res = gsl_cdf_gamma_Q(1e-100, 1.0, 1.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(1e-100, 1.0, 1.0)")

  res = gsl_cdf_gamma_Q(0.001, 1.0, 1.0)
  gsl_test_rel(res, 0.999000499833375, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(0.001, 1.0, 1.0)")

  res = gsl_cdf_gamma_Q(0.01, 1.0, 1.0)
  gsl_test_rel(res, 0.9900498337491681, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(0.01, 1.0, 1.0)")

  res = gsl_cdf_gamma_Q(0.1, 1.0, 1.0)
  gsl_test_rel(res, 0.9048374180359595, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(0.1, 1.0, 1.0)")

  res = gsl_cdf_gamma_Q(0.325, 1.0, 1.0)
  gsl_test_rel(res, 0.7225273536420722, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(0.325, 1.0, 1.0)")

  res = gsl_cdf_gamma_Q(1.0, 1.0, 1.0)
  gsl_test_rel(res, 0.3678794411714423, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(1.0, 1.0, 1.0)")

  res = gsl_cdf_gamma_Q(1.5, 1.0, 1.0)
  gsl_test_rel(res, 0.2231301601484298, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(1.5, 1.0, 1.0)")

  res = gsl_cdf_gamma_Q(2.0, 1.0, 1.0)
  gsl_test_rel(res, 0.1353352832366127, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(2.0, 1.0, 1.0)")

  res = gsl_cdf_gamma_Q(10.0, 1.0, 1.0)
  gsl_test_rel(res, 4.539992976248485e-05, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(10.0, 1.0, 1.0)")

  res = gsl_cdf_gamma_Q(20.0, 1.0, 1.0)
  gsl_test_rel(res, 2.061153622438558e-09, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(20.0, 1.0, 1.0)")

  res = gsl_cdf_gamma_Q(100.0, 1.0, 1.0)
  gsl_test_rel(res, 3.720075976020836e-44, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(100.0, 1.0, 1.0)")

  res = gsl_cdf_gamma_Q(1000.0, 1.0, 1.0)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_gamma_Q(1000.0, 1.0, 1.0)")

  res = gsl_cdf_gamma_Q(10000.0, 1.0, 1.0)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_gamma_Q(10000.0, 1.0, 1.0)")

  res = gsl_cdf_gamma_P(0.0, 1.0, 10.0)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_gamma_P(0.0, 1.0, 10.0)")

  res = gsl_cdf_gamma_P(1e-100, 1.0, 10.0)
  gsl_test_rel(res, 1e-101, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(1e-100, 1.0, 10.0)")

  res = gsl_cdf_gamma_P(0.001, 1.0, 10.0)
  gsl_test_rel(res, 9.999500016666249e-05, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(0.001, 1.0, 10.0)")

  res = gsl_cdf_gamma_P(0.01, 1.0, 10.0)
  gsl_test_rel(res, 0.0009995001666250082, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(0.01, 1.0, 10.0)")

  res = gsl_cdf_gamma_P(0.1, 1.0, 10.0)
  gsl_test_rel(res, 0.009950166250831947, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(0.1, 1.0, 10.0)")

  res = gsl_cdf_gamma_P(0.325, 1.0, 10.0)
  gsl_test_rel(res, 0.03197755016869396, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(0.325, 1.0, 10.0)")

  res = gsl_cdf_gamma_P(1.0, 1.0, 10.0)
  gsl_test_rel(res, 0.09516258196404043, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(1.0, 1.0, 10.0)")

  res = gsl_cdf_gamma_P(1.5, 1.0, 10.0)
  gsl_test_rel(res, 0.1392920235749422, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(1.5, 1.0, 10.0)")

  res = gsl_cdf_gamma_P(2.0, 1.0, 10.0)
  gsl_test_rel(res, 0.1812692469220182, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(2.0, 1.0, 10.0)")

  res = gsl_cdf_gamma_P(10.0, 1.0, 10.0)
  gsl_test_rel(res, 0.6321205588285577, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(10.0, 1.0, 10.0)")

  res = gsl_cdf_gamma_P(20.0, 1.0, 10.0)
  gsl_test_rel(res, 0.8646647167633873, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(20.0, 1.0, 10.0)")

  res = gsl_cdf_gamma_P(100.0, 1.0, 10.0)
  gsl_test_rel(res, 0.9999546000702375, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(100.0, 1.0, 10.0)")

  res = gsl_cdf_gamma_P(1000.0, 1.0, 10.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(1000.0, 1.0, 10.0)")

  res = gsl_cdf_gamma_P(10000.0, 1.0, 10.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(10000.0, 1.0, 10.0)")

  res = gsl_cdf_gamma_Q(0.0, 1.0, 10.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(0.0, 1.0, 10.0)")

  res = gsl_cdf_gamma_Q(1e-100, 1.0, 10.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(1e-100, 1.0, 10.0)")

  res = gsl_cdf_gamma_Q(0.001, 1.0, 10.0)
  gsl_test_rel(res, 0.9999000049998333, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(0.001, 1.0, 10.0)")

  res = gsl_cdf_gamma_Q(0.01, 1.0, 10.0)
  gsl_test_rel(res, 0.999000499833375, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(0.01, 1.0, 10.0)")

  res = gsl_cdf_gamma_Q(0.1, 1.0, 10.0)
  gsl_test_rel(res, 0.9900498337491681, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(0.1, 1.0, 10.0)")

  res = gsl_cdf_gamma_Q(0.325, 1.0, 10.0)
  gsl_test_rel(res, 0.968022449831306, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(0.325, 1.0, 10.0)")

  res = gsl_cdf_gamma_Q(1.0, 1.0, 10.0)
  gsl_test_rel(res, 0.9048374180359595, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(1.0, 1.0, 10.0)")

  res = gsl_cdf_gamma_Q(1.5, 1.0, 10.0)
  gsl_test_rel(res, 0.8607079764250578, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(1.5, 1.0, 10.0)")

  res = gsl_cdf_gamma_Q(2.0, 1.0, 10.0)
  gsl_test_rel(res, 0.8187307530779818, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(2.0, 1.0, 10.0)")

  res = gsl_cdf_gamma_Q(10.0, 1.0, 10.0)
  gsl_test_rel(res, 0.3678794411714423, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(10.0, 1.0, 10.0)")

  res = gsl_cdf_gamma_Q(20.0, 1.0, 10.0)
  gsl_test_rel(res, 0.1353352832366127, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(20.0, 1.0, 10.0)")

  res = gsl_cdf_gamma_Q(100.0, 1.0, 10.0)
  gsl_test_rel(res, 4.539992976248485e-05, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(100.0, 1.0, 10.0)")

  res = gsl_cdf_gamma_Q(1000.0, 1.0, 10.0)
  gsl_test_rel(res, 3.720075976020836e-44, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(1000.0, 1.0, 10.0)")

  res = gsl_cdf_gamma_Q(10000.0, 1.0, 10.0)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_gamma_Q(10000.0, 1.0, 10.0)")

  res = gsl_cdf_gamma_P(0.0, 17.0, 10.0)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_gamma_P(0.0, 17.0, 10.0)")

  res = gsl_cdf_gamma_P(1e-100, 17.0, 10.0)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_gamma_P(1e-100, 17.0, 10.0)")

  res = gsl_cdf_gamma_P(0.001, 17.0, 10.0)
  gsl_test_rel(res, 2.811191740404229e-83, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(0.001, 17.0, 10.0)")

  res = gsl_cdf_gamma_P(0.01, 17.0, 10.0)
  gsl_test_rel(res, 2.808803246519859e-66, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(0.01, 17.0, 10.0)")

  res = gsl_cdf_gamma_P(0.1, 17.0, 10.0)
  gsl_test_rel(res, 2.785029980874921e-49, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(0.1, 17.0, 10.0)")

  res = gsl_cdf_gamma_P(0.325, 17.0, 10.0)
  gsl_test_rel(res, 1.372836532451259e-40, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(0.325, 17.0, 10.0)")

  res = gsl_cdf_gamma_P(1.0, 17.0, 10.0)
  gsl_test_rel(res, 2.558119322925443e-32, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(1.0, 17.0, 10.0)")

  res = gsl_cdf_gamma_P(1.5, 17.0, 10.0)
  gsl_test_rel(res, 2.404204411754224e-29, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(1.5, 17.0, 10.0)")

  res = gsl_cdf_gamma_P(2.0, 17.0, 10.0)
  gsl_test_rel(res, 3.050929262178986e-27, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(2.0, 17.0, 10.0)")

  res = gsl_cdf_gamma_P(10.0, 17.0, 10.0)
  gsl_test_rel(res, 1.094920130378183e-15, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(10.0, 17.0, 10.0)")

  res = gsl_cdf_gamma_P(20.0, 17.0, 10.0)
  gsl_test_rel(res, 5.606050961731617e-11, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(20.0, 17.0, 10.0)")

  res = gsl_cdf_gamma_P(100.0, 17.0, 10.0)
  gsl_test_rel(res, 0.02704160978480113, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(100.0, 17.0, 10.0)")

  res = gsl_cdf_gamma_P(1000.0, 17.0, 10.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(1000.0, 17.0, 10.0)")

  res = gsl_cdf_gamma_P(10000.0, 17.0, 10.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_P(10000.0, 17.0, 10.0)")

  res = gsl_cdf_gamma_Q(0.0, 17.0, 10.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(0.0, 17.0, 10.0)")

  res = gsl_cdf_gamma_Q(1e-100, 17.0, 10.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(1e-100, 17.0, 10.0)")

  res = gsl_cdf_gamma_Q(0.001, 17.0, 10.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(0.001, 17.0, 10.0)")

  res = gsl_cdf_gamma_Q(0.01, 17.0, 10.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(0.01, 17.0, 10.0)")

  res = gsl_cdf_gamma_Q(0.1, 17.0, 10.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(0.1, 17.0, 10.0)")

  res = gsl_cdf_gamma_Q(0.325, 17.0, 10.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(0.325, 17.0, 10.0)")

  res = gsl_cdf_gamma_Q(1.0, 17.0, 10.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(1.0, 17.0, 10.0)")

  res = gsl_cdf_gamma_Q(1.5, 17.0, 10.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(1.5, 17.0, 10.0)")

  res = gsl_cdf_gamma_Q(2.0, 17.0, 10.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(2.0, 17.0, 10.0)")

  res = gsl_cdf_gamma_Q(10.0, 17.0, 10.0)
  gsl_test_rel(res, 0.9999999999999989, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(10.0, 17.0, 10.0)")

  res = gsl_cdf_gamma_Q(20.0, 17.0, 10.0)
  gsl_test_rel(res, 0.9999999999439395, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(20.0, 17.0, 10.0)")

  res = gsl_cdf_gamma_Q(100.0, 17.0, 10.0)
  gsl_test_rel(res, 0.9729583902151989, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(100.0, 17.0, 10.0)")

  res = gsl_cdf_gamma_Q(1000.0, 17.0, 10.0)
  gsl_test_rel(res, 2.112009516339486e-25, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Q(1000.0, 17.0, 10.0)")

  res = gsl_cdf_gamma_Q(10000.0, 17.0, 10.0)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_gamma_Q(10000.0, 17.0, 10.0)")


proc test_chisq*() =
  var res = gsl_cdf_chisq_P(0.0, 13.0)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_chisq_P(0.0, 13.0)")

  res = gsl_cdf_chisq_P(1e-100, 13.0)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_chisq_P(1e-100, 13.0)")

  res = gsl_cdf_chisq_P(0.001, 13.0)
  gsl_test_rel(res, 1.86631102655846e-25, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_P(0.001, 13.0)")

  res = gsl_cdf_chisq_P(0.01, 13.0)
  gsl_test_rel(res, 5.878822485045298e-19, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_P(0.01, 13.0)")

  res = gsl_cdf_chisq_P(0.1, 13.0)
  gsl_test_rel(res, 1.787969833585554e-12, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_P(0.1, 13.0)")

  res = gsl_cdf_chisq_P(0.325, 13.0)
  gsl_test_rel(res, 3.446113137799052e-09, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_P(0.325, 13.0)")

  res = gsl_cdf_chisq_P(1.0, 13.0)
  gsl_test_rel(res, 3.834734735135952e-06, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_P(1.0, 13.0)")

  res = gsl_cdf_chisq_P(1.5, 13.0)
  gsl_test_rel(res, 4.317183892010419e-05, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_P(1.5, 13.0)")

  res = gsl_cdf_chisq_P(2.0, 13.0)
  gsl_test_rel(res, 0.0002262500846560472, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_P(2.0, 13.0)")

  res = gsl_cdf_chisq_P(10.0, 13.0)
  gsl_test_rel(res, 0.3060656320192511, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_P(10.0, 13.0)")

  res = gsl_cdf_chisq_P(20.0, 13.0)
  gsl_test_rel(res, 0.9047897439219085, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_P(20.0, 13.0)")

  res = gsl_cdf_chisq_P(100.0, 13.0)
  gsl_test_rel(res, 0.9999999999999983, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_P(100.0, 13.0)")

  res = gsl_cdf_chisq_P(1000.0, 13.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_P(1000.0, 13.0)")

  res = gsl_cdf_chisq_P(10000.0, 13.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_P(10000.0, 13.0)")

  res = gsl_cdf_chisq_Q(0.0, 13.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_Q(0.0, 13.0)")

  res = gsl_cdf_chisq_Q(1e-100, 13.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_Q(1e-100, 13.0)")

  res = gsl_cdf_chisq_Q(0.001, 13.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_Q(0.001, 13.0)")

  res = gsl_cdf_chisq_Q(0.01, 13.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_Q(0.01, 13.0)")

  res = gsl_cdf_chisq_Q(0.1, 13.0)
  gsl_test_rel(res, 0.999999999998212, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_Q(0.1, 13.0)")

  res = gsl_cdf_chisq_Q(0.325, 13.0)
  gsl_test_rel(res, 0.9999999965538868, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_Q(0.325, 13.0)")

  res = gsl_cdf_chisq_Q(1.0, 13.0)
  gsl_test_rel(res, 0.9999961652652649, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_Q(1.0, 13.0)")

  res = gsl_cdf_chisq_Q(1.5, 13.0)
  gsl_test_rel(res, 0.9999568281610799, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_Q(1.5, 13.0)")

  res = gsl_cdf_chisq_Q(2.0, 13.0)
  gsl_test_rel(res, 0.999773749915344, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_Q(2.0, 13.0)")

  res = gsl_cdf_chisq_Q(10.0, 13.0)
  gsl_test_rel(res, 0.6939343679807489, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_Q(10.0, 13.0)")

  res = gsl_cdf_chisq_Q(20.0, 13.0)
  gsl_test_rel(res, 0.09521025607809151, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_Q(20.0, 13.0)")

  res = gsl_cdf_chisq_Q(100.0, 13.0)
  gsl_test_rel(res, 1.659026080708588e-15, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_Q(100.0, 13.0)")

  res = gsl_cdf_chisq_Q(1000.0, 13.0)
  gsl_test_rel(res, 1.748511915448602e-205, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_Q(1000.0, 13.0)")

  res = gsl_cdf_chisq_Q(10000.0, 13.0)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_chisq_Q(10000.0, 13.0)")


##  Beta distribution

proc test_beta*() =
  var res = gsl_cdf_beta_P(0.0, 1.2, 1.3)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_beta_P(0.0, 1.2, 1.3)")

  res = gsl_cdf_beta_P(1e-100, 1.2, 1.3)
  gsl_test_rel(res, 1.344349446564896e-120, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_P(1e-100, 1.2, 1.3)")

  res = gsl_cdf_beta_P(0.001, 1.2, 1.3)
  gsl_test_rel(res, 0.0003376300425045358, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_P(0.001, 1.2, 1.3)")

  res = gsl_cdf_beta_P(0.01, 1.2, 1.3)
  gsl_test_rel(res, 0.005343172640389295, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_P(0.01, 1.2, 1.3)")

  res = gsl_cdf_beta_P(0.1, 1.2, 1.3)
  gsl_test_rel(res, 0.08339978283067484, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_P(0.1, 1.2, 1.3)")

  res = gsl_cdf_beta_P(0.325, 1.2, 1.3)
  gsl_test_rel(res, 0.3286986541805839, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_P(0.325, 1.2, 1.3)")

  res = gsl_cdf_beta_P(0.5, 1.2, 1.3)
  gsl_test_rel(res, 0.5297814294512991, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_P(0.5, 1.2, 1.3)")

  res = gsl_cdf_beta_P(0.9, 1.2, 1.3)
  gsl_test_rel(res, 0.9385293972244306, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_P(0.9, 1.2, 1.3)")

  res = gsl_cdf_beta_P(0.99, 1.2, 1.3)
  gsl_test_rel(res, 0.9968864383412543, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_P(0.99, 1.2, 1.3)")

  res = gsl_cdf_beta_P(0.999, 1.2, 1.3)
  gsl_test_rel(res, 0.9998437928330677, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_P(0.999, 1.2, 1.3)")

  res = gsl_cdf_beta_P(1.0, 1.2, 1.3)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_P(1.0, 1.2, 1.3)")

  res = gsl_cdf_beta_Q(0.0, 1.2, 1.3)
  gsl_test_rel(res, 1.0, 0.0, "gsl_cdf_beta_Q(0.0, 1.2, 1.3)")

  res = gsl_cdf_beta_Q(1e-100, 1.2, 1.3)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_Q(1e-100, 1.2, 1.3)")

  res = gsl_cdf_beta_Q(0.001, 1.2, 1.3)
  gsl_test_rel(res, 0.9996623699574955, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_Q(0.001, 1.2, 1.3)")

  res = gsl_cdf_beta_Q(0.01, 1.2, 1.3)
  gsl_test_rel(res, 0.9946568273596107, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_Q(0.01, 1.2, 1.3)")

  res = gsl_cdf_beta_Q(0.1, 1.2, 1.3)
  gsl_test_rel(res, 0.9166002171693252, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_Q(0.1, 1.2, 1.3)")

  res = gsl_cdf_beta_Q(0.325, 1.2, 1.3)
  gsl_test_rel(res, 0.671301345819416, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_Q(0.325, 1.2, 1.3)")

  res = gsl_cdf_beta_Q(0.5, 1.2, 1.3)
  gsl_test_rel(res, 0.4702185705487009, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_Q(0.5, 1.2, 1.3)")

  res = gsl_cdf_beta_Q(0.9, 1.2, 1.3)
  gsl_test_rel(res, 0.06147060277556934, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_Q(0.9, 1.2, 1.3)")

  res = gsl_cdf_beta_Q(0.99, 1.2, 1.3)
  gsl_test_rel(res, 0.00311356165874562, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_Q(0.99, 1.2, 1.3)")

  res = gsl_cdf_beta_Q(0.999, 1.2, 1.3)
  gsl_test_rel(res, 0.0001562071669323657, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_Q(0.999, 1.2, 1.3)")

  res = gsl_cdf_beta_Q(1.0, 1.2, 1.3)
  gsl_test_rel(res, 0.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_Q(1.0, 1.2, 1.3)")


proc test_betainv*() =
  var res = gsl_cdf_beta_Pinv(0.0, 1.2, 1.3)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_beta_Pinv(0.0, 1.2, 1.3)")

  res = gsl_cdf_beta_Pinv(1.344349446564896e-120, 1.2, 1.3)
  gsl_test_rel(res, 1e-100, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_Pinv( 1.34434944656489596e-120, 1.2, 1.3)")

  res = gsl_cdf_beta_Pinv(0.0003376300425045358, 1.2, 1.3)
  gsl_test_rel(res, 0.001, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_Pinv( 3.37630042504535813e-4, 1.2, 1.3)")

  res = gsl_cdf_beta_Pinv(0.005343172640389295, 1.2, 1.3)
  gsl_test_rel(res, 0.01, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_Pinv( 5.34317264038929473e-3, 1.2, 1.3)")

  res = gsl_cdf_beta_Pinv(0.08339978283067484, 1.2, 1.3)
  gsl_test_rel(res, 0.1, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_Pinv( 8.33997828306748346e-2, 1.2, 1.3)")

  res = gsl_cdf_beta_Pinv(0.3286986541805839, 1.2, 1.3)
  gsl_test_rel(res, 0.325, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_Pinv( 3.28698654180583916e-1, 1.2, 1.3)")

  res = gsl_cdf_beta_Pinv(0.5297814294512991, 1.2, 1.3)
  gsl_test_rel(res, 0.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_Pinv( 5.29781429451299081e-1, 1.2, 1.3)")

  res = gsl_cdf_beta_Pinv(0.9385293972244306, 1.2, 1.3)
  gsl_test_rel(res, 0.9, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_Pinv( 9.38529397224430659e-1, 1.2, 1.3)")

  res = gsl_cdf_beta_Pinv(0.9968864383412543, 1.2, 1.3)
  gsl_test_rel(res, 0.99, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_Pinv( 9.96886438341254380e-1, 1.2, 1.3)")

  res = gsl_cdf_beta_Pinv(0.9998437928330677, 1.2, 1.3)
  gsl_test_rel(res, 0.999, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_Pinv( 9.99843792833067634e-1, 1.2, 1.3)")

  res = gsl_cdf_beta_Pinv(1.0, 1.2, 1.3)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_Pinv( 1.0, 1.2, 1.3)")

  res = gsl_cdf_beta_Qinv(1.0, 1.2, 1.3)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_beta_Qinv( 1.0, 1.2, 1.3)")

  res = gsl_cdf_beta_Qinv(1.0, 1.2, 1.3)
  gsl_test_rel(res, 0.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_Qinv( 1e0, 1.2, 1.3)")

  res = gsl_cdf_beta_Qinv(0.9996623699574955, 1.2, 1.3)
  gsl_test_rel(res, 0.001, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_Qinv( 9.99662369957495464e-1, 1.2, 1.3)")

  res = gsl_cdf_beta_Qinv(0.9946568273596107, 1.2, 1.3)
  gsl_test_rel(res, 0.01, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_Qinv( 9.94656827359610705e-1, 1.2, 1.3)")

  res = gsl_cdf_beta_Qinv(0.9166002171693252, 1.2, 1.3)
  gsl_test_rel(res, 0.1, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_Qinv( 9.16600217169325165e-1, 1.2, 1.3)")

  res = gsl_cdf_beta_Qinv(0.671301345819416, 1.2, 1.3)
  gsl_test_rel(res, 0.325, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_Qinv( 6.71301345819416084e-1, 1.2, 1.3)")

  res = gsl_cdf_beta_Qinv(0.4702185705487009, 1.2, 1.3)
  gsl_test_rel(res, 0.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_Qinv( 4.70218570548700919e-1, 1.2, 1.3)")

  res = gsl_cdf_beta_Qinv(0.06147060277556934, 1.2, 1.3)
  gsl_test_rel(res, 0.9, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_Qinv( 6.14706027755693408e-2, 1.2, 1.3)")

  res = gsl_cdf_beta_Qinv(0.00311356165874562, 1.2, 1.3)
  gsl_test_rel(res, 0.99, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_Qinv( 3.11356165874561958e-3, 1.2, 1.3)")

  res = gsl_cdf_beta_Qinv(0.0001562071669323657, 1.2, 1.3)
  gsl_test_rel(res, 0.999, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_Qinv( 1.56207166932365759e-4, 1.2, 1.3)")

  res = gsl_cdf_beta_Qinv(0.0, 1.2, 1.3)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_Qinv( 0.0, 1.2, 1.3)")

  res = gsl_cdf_beta_Pinv(0.025, 2133.0, 7868.0)
  gsl_test_rel(res, 0.2053056292991587, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_beta_Pinv( 0.025, 2133.0, 7868.0)")


proc test_gammainv*() =
  var res = gsl_cdf_gamma_Pinv(0.0, 1.0, 1.0)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_gamma_Pinv(0.0, 1.0, 1.0)")

  res = gsl_cdf_gamma_Pinv(1e-100, 1.0, 1.0)
  gsl_test_rel(res, 1e-100, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Pinv(1e-100, 1.0, 1.0)")

  res = gsl_cdf_gamma_Pinv(0.0009995001666250082, 1.0, 1.0)
  gsl_test_rel(res, 0.001, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Pinv(9.99500166625008332e-4, 1.0, 1.0)")

  res = gsl_cdf_gamma_Pinv(0.009950166250831947, 1.0, 1.0)
  gsl_test_rel(res, 0.01, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Pinv(9.95016625083194643e-3, 1.0, 1.0)")

  res = gsl_cdf_gamma_Pinv(0.09516258196404043, 1.0, 1.0)
  gsl_test_rel(res, 0.1, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Pinv(9.51625819640404268e-2, 1.0, 1.0)")

  res = gsl_cdf_gamma_Pinv(0.2774726463579278, 1.0, 1.0)
  gsl_test_rel(res, 0.325, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Pinv(2.77472646357927811e-1, 1.0, 1.0)")

  res = gsl_cdf_gamma_Pinv(0.6321205588285577, 1.0, 1.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Pinv(6.32120558828557678e-1, 1.0, 1.0)")

  res = gsl_cdf_gamma_Pinv(0.7768698398515702, 1.0, 1.0)
  gsl_test_rel(res, 1.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Pinv(7.76869839851570171e-1, 1.0, 1.0)")

  res = gsl_cdf_gamma_Pinv(0.8646647167633873, 1.0, 1.0)
  gsl_test_rel(res, 2.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Pinv(8.64664716763387308e-1, 1.0, 1.0)")

  res = gsl_cdf_gamma_Pinv(0.9999546000702375, 1.0, 1.0)
  gsl_test_rel(res, 10.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Pinv(9.99954600070237515e-1, 1.0, 1.0)")

  res = gsl_cdf_gamma_Pinv(0.9999999979388464, 1.0, 1.0)
  gsl_test_rel(res, 20.0, 100 * (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Pinv(9.99999997938846378e-1, 1.0, 1.0)")

  res = gsl_cdf_gamma_Pinv(1.0, 1.0, 1.0)
  gsl_test_rel(res, cast[cdouble](cdouble.high), 0.0, "gsl_cdf_gamma_Pinv(1.0, 1.0, 1.0)")

  res = gsl_cdf_gamma_Pinv(0.1, 11.88741149153085, 1.0)
  gsl_test_rel(res, 7.73788447848618, (16.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Pinv(0.1, 11.887411491530846,1.0)")

  res = gsl_cdf_gamma_Qinv(0.0, 1.0, 1.0)
  gsl_test_rel(res, cast[cdouble](cdouble.high), 0.0, "gsl_cdf_gamma_Qinv(0.0, 1.0, 1.0)")

  res = gsl_cdf_gamma_Qinv(2.061153622438558e-09, 1.0, 1.0)
  gsl_test_rel(res, 20.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Qinv(2.06115362243855783e-9, 1.0, 1.0)")

  res = gsl_cdf_gamma_Qinv(4.539992976248485e-05, 1.0, 1.0)
  gsl_test_rel(res, 10.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Qinv(4.53999297624848515e-5, 1.0, 1.0)")

  res = gsl_cdf_gamma_Qinv(0.1353352832366127, 1.0, 1.0)
  gsl_test_rel(res, 2.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Qinv(1.35335283236612692e-1, 1.0, 1.0)")

  res = gsl_cdf_gamma_Qinv(0.2231301601484298, 1.0, 1.0)
  gsl_test_rel(res, 1.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Qinv(2.23130160148429829e-1, 1.0, 1.0)")

  res = gsl_cdf_gamma_Qinv(0.3678794411714423, 1.0, 1.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Qinv(3.67879441171442322e-1, 1.0, 1.0)")

  res = gsl_cdf_gamma_Qinv(0.7225273536420722, 1.0, 1.0)
  gsl_test_rel(res, 0.325, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Qinv(7.22527353642072189e-1, 1.0, 1.0)")

  res = gsl_cdf_gamma_Qinv(0.9048374180359595, 1.0, 1.0)
  gsl_test_rel(res, 0.1, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Qinv(9.04837418035959573e-1, 1.0, 1.0)")

  res = gsl_cdf_gamma_Qinv(0.9900498337491681, 1.0, 1.0)
  gsl_test_rel(res, 0.01, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Qinv(9.90049833749168054e-1, 1.0, 1.0)")

  res = gsl_cdf_gamma_Qinv(0.999000499833375, 1.0, 1.0)
  gsl_test_rel(res, 0.001, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_gamma_Qinv(9.99000499833374992e-1, 1.0, 1.0)")

  res = gsl_cdf_gamma_Qinv(1.0, 1.0, 1.0)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_gamma_Qinv(1.0, 1.0, 1.0)")


proc test_chisqinv*() =
  var res = gsl_cdf_chisq_Pinv(0.0, 13.0)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_chisq_Pinv(0.0, 13.0)")

  res = gsl_cdf_chisq_Pinv(1.86631102655846e-25, 13.0)
  gsl_test_rel(res, 0.001, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_Pinv(1.86631102655845996e-25, 13.0)")

  res = gsl_cdf_chisq_Pinv(5.878822485045298e-19, 13.0)
  gsl_test_rel(res, 0.01, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_Pinv(5.87882248504529790e-19, 13.0)")

  res = gsl_cdf_chisq_Pinv(1.787969833585554e-12, 13.0)
  gsl_test_rel(res, 0.1, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_Pinv(1.78796983358555410e-12, 13.0)")

  res = gsl_cdf_chisq_Pinv(3.446113137799052e-09, 13.0)
  gsl_test_rel(res, 0.325, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_Pinv(3.44611313779905183e-9, 13.0)")

  res = gsl_cdf_chisq_Pinv(3.834734735135952e-06, 13.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_Pinv(3.83473473513595154e-6, 13.0)")

  res = gsl_cdf_chisq_Pinv(4.317183892010419e-05, 13.0)
  gsl_test_rel(res, 1.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_Pinv(4.31718389201041932e-5, 13.0)")

  res = gsl_cdf_chisq_Pinv(0.0002262500846560472, 13.0)
  gsl_test_rel(res, 2.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_Pinv(2.26250084656047180e-4, 13.0)")

  res = gsl_cdf_chisq_Pinv(0.3060656320192511, 13.0)
  gsl_test_rel(res, 10.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_Pinv(3.06065632019251110e-1, 13.0)")

  res = gsl_cdf_chisq_Pinv(0.9047897439219085, 13.0)
  gsl_test_rel(res, 20.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_Pinv(9.04789743921908487e-1, 13.0)")

  res = gsl_cdf_chisq_Pinv(0.9999999999999983, 13.0)
  gsl_test_rel(res, 100.0, 0.01, "gsl_cdf_chisq_Pinv(9.99999999999998341e-1, 13.0)")

  res = gsl_cdf_chisq_Pinv(1.0, 13.0)
  gsl_test_rel(res, cast[cdouble](cdouble.high), 0.0, "gsl_cdf_chisq_Pinv(1e0, 13.0)")

  res = gsl_cdf_chisq_Pinv(0.1932381452061236, 1.5)
  gsl_test_rel(res, 0.2119800929317995, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_Pinv(1.93238145206123590e-01, 1.5)")

  res = gsl_cdf_chisq_Pinv(4.83e-08, 19.19)
  gsl_test_rel(res, 1.632280186860267, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_Pinv(4.83e-8, 19.19)")

  res = gsl_cdf_chisq_Pinv(0.05, 1263131.0)
  gsl_test_rel(res, 1260517.771133389, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_Pinv(0.05, 1263131.0)")

  res = gsl_cdf_chisq_Pinv(0.05, 2526262.0)
  gsl_test_rel(res, 2522565.864973351, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_Pinv(0.05, 2526262.0)")

  res = gsl_cdf_chisq_Qinv(0.0, 13.0)
  gsl_test_rel(res, cast[cdouble](cdouble.high), (1048576.0 *
      2.220446049250313e-16), "gsl_cdf_chisq_Qinv(0.0, 13.0)")

  res = gsl_cdf_chisq_Qinv(1.659026080708588e-15, 13.0)
  gsl_test_rel(res, 100.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_Qinv(1.65902608070858809e-15, 13.0)")

  res = gsl_cdf_chisq_Qinv(0.09521025607809151, 13.0)
  gsl_test_rel(res, 20.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_Qinv(9.52102560780915127e-2, 13.0)")

  res = gsl_cdf_chisq_Qinv(0.6939343679807489, 13.0)
  gsl_test_rel(res, 10.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_Qinv(6.93934367980748892e-1, 13.0)")

  res = gsl_cdf_chisq_Qinv(0.999773749915344, 13.0)
  gsl_test_rel(res, 2.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_Qinv(9.99773749915343954e-1, 13.0)")

  res = gsl_cdf_chisq_Qinv(0.9999568281610799, 13.0)
  gsl_test_rel(res, 1.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_Qinv(9.99956828161079894e-1, 13.0)")

  res = gsl_cdf_chisq_Qinv(0.9999961652652649, 13.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_chisq_Qinv(9.99996165265264863e-1, 13.0)")

  res = gsl_cdf_chisq_Qinv(0.9999999965538868, 13.0)
  gsl_test_rel(res, 0.325, 1e-06, "gsl_cdf_chisq_Qinv(9.99999996553886862e-1, 13.0)")

  res = gsl_cdf_chisq_Qinv(0.999999999998212, 13.0)
  gsl_test_rel(res, 0.1, 1e-05, "gsl_cdf_chisq_Qinv(9.99999999998212031e-1, 13.0)")

  res = gsl_cdf_chisq_Qinv(1.0, 13.0)
  gsl_test_rel(res, 0.0, 0.0, "gsl_cdf_chisq_Qinv(1.0, 13.0)")


proc test_tdistinv*() =
  var res = gsl_cdf_tdist_Pinv(0.5, 1.0)
  gsl_test_rel(res, 0.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(0.5, 1.0)")

  res = gsl_cdf_tdist_Pinv(0.5003183097800805, 1.0)
  gsl_test_rel(res, 0.001, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(5.00318309780080559e-1, 1.0)")

  res = gsl_cdf_tdist_Pinv(0.5031829927649083, 1.0)
  gsl_test_rel(res, 0.01, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(5.03182992764908255e-1, 1.0)")

  res = gsl_cdf_tdist_Pinv(0.5317255174305535, 1.0)
  gsl_test_rel(res, 0.1, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(5.31725517430553569e-1, 1.0)")

  res = gsl_cdf_tdist_Pinv(0.6000231200328521, 1.0)
  gsl_test_rel(res, 0.325, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(6.00023120032852123e-1, 1.0)")

  res = gsl_cdf_tdist_Pinv(0.75, 1.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(0.75000000000000000e0, 1.0)")

  res = gsl_cdf_tdist_Pinv(0.8128329581890011, 1.0)
  gsl_test_rel(res, 1.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(8.12832958189001183e-1, 1.0)")

  res = gsl_cdf_tdist_Pinv(0.8524163823495667, 1.0)
  gsl_test_rel(res, 2.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(8.52416382349566726e-1, 1.0)")

  res = gsl_cdf_tdist_Pinv(0.9682744825694465, 1.0)
  gsl_test_rel(res, 10.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(9.68274482569446430e-1, 1.0)")

  res = gsl_cdf_tdist_Pinv(0.9840977487438236, 1.0)
  gsl_test_rel(res, 20.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(9.84097748743823625e-1, 1.0)")

  res = gsl_cdf_tdist_Pinv(0.9968170072350917, 1.0)
  gsl_test_rel(res, 100.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(9.96817007235091745e-1, 1.0)")

  res = gsl_cdf_tdist_Pinv(0.9996816902199195, 1.0)
  gsl_test_rel(res, 1000.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(9.99681690219919441e-1, 1.0)")

  res = gsl_cdf_tdist_Pinv(0.9999681690114878, 1.0)
  gsl_test_rel(res, 10000.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(9.99968169011487724e-1, 1.0)")

  res = gsl_cdf_tdist_Qinv(0.5, 1.0)
  gsl_test_rel(res, 0.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(0.5, 1.0)")

  res = gsl_cdf_tdist_Qinv(0.4996816902199194, 1.0)
  gsl_test_rel(res, 0.001, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(4.99681690219919441e-1, 1.0)")

  res = gsl_cdf_tdist_Qinv(0.4968170072350918, 1.0)
  gsl_test_rel(res, 0.01, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(4.96817007235091745e-1, 1.0)")

  res = gsl_cdf_tdist_Qinv(0.4682744825694464, 1.0)
  gsl_test_rel(res, 0.1, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(4.68274482569446430e-1, 1.0)")

  res = gsl_cdf_tdist_Qinv(0.3999768799671479, 1.0)
  gsl_test_rel(res, 0.325, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(3.99976879967147876e-1, 1.0)")

  res = gsl_cdf_tdist_Qinv(0.25, 1.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(2.5e-1, 1.0)")

  res = gsl_cdf_tdist_Qinv(0.1871670418109988, 1.0)
  gsl_test_rel(res, 1.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(1.87167041810998816e-1, 1.0)")

  res = gsl_cdf_tdist_Qinv(0.1475836176504333, 1.0)
  gsl_test_rel(res, 2.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(1.47583617650433274e-1, 1.0)")

  res = gsl_cdf_tdist_Qinv(0.03172551743055357, 1.0)
  gsl_test_rel(res, 10.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(3.17255174305535695e-2, 1.0)")

  res = gsl_cdf_tdist_Qinv(0.01590225125617637, 1.0)
  gsl_test_rel(res, 20.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(1.59022512561763752e-2, 1.0)")

  res = gsl_cdf_tdist_Qinv(0.003182992764908255, 1.0)
  gsl_test_rel(res, 100.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(3.18299276490825515e-3, 1.0)")

  res = gsl_cdf_tdist_Qinv(0.0003183097800805589, 1.0)
  gsl_test_rel(res, 1000.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(3.18309780080558939e-4, 1.0)")

  res = gsl_cdf_tdist_Qinv(3.183098851227577e-05, 1.0)
  gsl_test_rel(res, 10000.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(3.18309885122757724e-5, 1.0)")

  res = gsl_cdf_tdist_Pinv(0.4996816902199194, 1.0)
  gsl_test_rel(res, -0.001, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(4.99681690219919441e-1, 1.0)")

  res = gsl_cdf_tdist_Pinv(0.4968170072350918, 1.0)
  gsl_test_rel(res, -0.01, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(4.96817007235091744e-1, 1.0)")

  res = gsl_cdf_tdist_Pinv(0.4682744825694464, 1.0)
  gsl_test_rel(res, -0.1, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(4.68274482569446430e-1, 1.0)")

  res = gsl_cdf_tdist_Pinv(0.3999768799671479, 1.0)
  gsl_test_rel(res, -0.325, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(3.99976879967147876e-1, 1.0)")

  res = gsl_cdf_tdist_Pinv(0.25, 1.0)
  gsl_test_rel(res, -1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(0.25, 1.0)")

  res = gsl_cdf_tdist_Pinv(0.1871670418109988, 1.0)
  gsl_test_rel(res, -1.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(1.87167041810998816e-1, 1.0)")

  res = gsl_cdf_tdist_Pinv(0.1475836176504333, 1.0)
  gsl_test_rel(res, -2.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(1.47583617650433274e-1, 1.0)")

  res = gsl_cdf_tdist_Pinv(0.03172551743055357, 1.0)
  gsl_test_rel(res, -10.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(3.17255174305535695e-2, 1.0)")

  res = gsl_cdf_tdist_Pinv(0.01590225125617637, 1.0)
  gsl_test_rel(res, -20.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(1.59022512561763751e-2, 1.0)")

  res = gsl_cdf_tdist_Pinv(0.003182992764908255, 1.0)
  gsl_test_rel(res, -100.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(3.18299276490825514e-3, 1.0)")

  res = gsl_cdf_tdist_Pinv(0.0003183097800805589, 1.0)
  gsl_test_rel(res, -1000.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(3.18309780080558938e-4, 1.0)")

  res = gsl_cdf_tdist_Pinv(3.183098851227577e-05, 1.0)
  gsl_test_rel(res, -10000.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(3.18309885122757724e-5, 1.0)")

  res = gsl_cdf_tdist_Qinv(0.5003183097800805, 1.0)
  gsl_test_rel(res, -0.001, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(5.00318309780080559e-1, 1.0)")

  res = gsl_cdf_tdist_Qinv(0.5031829927649083, 1.0)
  gsl_test_rel(res, -0.01, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(5.03182992764908255e-1, 1.0)")

  res = gsl_cdf_tdist_Qinv(0.5317255174305535, 1.0)
  gsl_test_rel(res, -0.1, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(5.31725517430553570e-1, 1.0)")

  res = gsl_cdf_tdist_Qinv(0.6000231200328521, 1.0)
  gsl_test_rel(res, -0.325, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(6.00023120032852124e-1, 1.0)")

  res = gsl_cdf_tdist_Qinv(0.75, 1.0)
  gsl_test_rel(res, -1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(7.5e-1, 1.0)")

  res = gsl_cdf_tdist_Qinv(0.8128329581890011, 1.0)
  gsl_test_rel(res, -1.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(8.12832958189001184e-1, 1.0)")

  res = gsl_cdf_tdist_Qinv(0.8524163823495667, 1.0)
  gsl_test_rel(res, -2.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(8.52416382349566726e-1, 1.0)")

  res = gsl_cdf_tdist_Qinv(0.9682744825694465, 1.0)
  gsl_test_rel(res, -10.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(9.68274482569446430e-1, 1.0)")

  res = gsl_cdf_tdist_Qinv(0.9840977487438236, 1.0)
  gsl_test_rel(res, -20.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(9.84097748743823625e-1, 1.0)")

  res = gsl_cdf_tdist_Qinv(0.9968170072350917, 1.0)
  gsl_test_rel(res, -100.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(9.96817007235091745e-1, 1.0)")

  res = gsl_cdf_tdist_Qinv(0.9996816902199195, 1.0)
  gsl_test_rel(res, -1000.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(9.99681690219919441e-1, 1.0)")

  res = gsl_cdf_tdist_Qinv(0.9999681690114878, 1.0)
  gsl_test_rel(res, -10000.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(9.99968169011487724e-1, 1.0)")

  res = gsl_cdf_tdist_Pinv(0.4996464466977951, 2.0)
  gsl_test_rel(res, -0.001, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(4.99646446697795041e-01, 2.0)")

  res = gsl_cdf_tdist_Pinv(0.4964645544791005, 2.0)
  gsl_test_rel(res, -0.01, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(4.96464554479100486e-01, 2.0)")

  res = gsl_cdf_tdist_Pinv(0.4647327192070701, 2.0)
  gsl_test_rel(res, -0.1, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(4.64732719207070087e-01, 2.0)")

  res = gsl_cdf_tdist_Pinv(0.3880142272531262, 2.0)
  gsl_test_rel(res, -0.325, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(3.88014227253126233e-01, 2.0)")

  res = gsl_cdf_tdist_Pinv(0.2113248654051871, 2.0)
  gsl_test_rel(res, -1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(2.11324865405187118e-01, 2.0)")

  res = gsl_cdf_tdist_Pinv(0.1361965624455005, 2.0)
  gsl_test_rel(res, -1.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(1.36196562445500540e-01, 2.0)")

  res = gsl_cdf_tdist_Pinv(0.09175170953613698, 2.0)
  gsl_test_rel(res, -2.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(9.17517095361369836e-02, 2.0)")

  res = gsl_cdf_tdist_Pinv(0.004926228511662845, 2.0)
  gsl_test_rel(res, -10.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(4.92622851166284542e-03, 2.0)")

  res = gsl_cdf_tdist_Pinv(0.001245331946183549, 2.0)
  gsl_test_rel(res, -20.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(1.24533194618354849e-03, 2.0)")

  res = gsl_cdf_tdist_Pinv(4.999250124978129e-05, 2.0)
  gsl_test_rel(res, -100.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(4.99925012497812894e-05, 2.0)")

  res = gsl_cdf_tdist_Pinv(4.9999925000125e-07, 2.0)
  gsl_test_rel(res, -1000.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(4.99999250001249998e-07, 2.0)")

  res = gsl_cdf_tdist_Pinv(4.999999925000001e-09, 2.0)
  gsl_test_rel(res, -10000.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(4.99999992500000125e-09, 2.0)")

  res = gsl_cdf_tdist_Qinv(0.500353553302205, 2.0)
  gsl_test_rel(res, -0.001, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(5.00353553302204959e-1, 2.0)")

  res = gsl_cdf_tdist_Qinv(0.5035354455208995, 2.0)
  gsl_test_rel(res, -0.01, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(5.03535445520899514e-1, 2.0)")

  res = gsl_cdf_tdist_Qinv(0.53526728079293, 2.0)
  gsl_test_rel(res, -0.1, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(5.35267280792929913e-1, 2.0)")

  res = gsl_cdf_tdist_Qinv(0.6119857727468737, 2.0)
  gsl_test_rel(res, -0.325, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(6.11985772746873767e-1, 2.0)")

  res = gsl_cdf_tdist_Qinv(0.7886751345948129, 2.0)
  gsl_test_rel(res, -1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(7.88675134594812882e-1, 2.0)")

  res = gsl_cdf_tdist_Qinv(0.8638034375544995, 2.0)
  gsl_test_rel(res, -1.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(8.63803437554499460e-1, 2.0)")

  res = gsl_cdf_tdist_Qinv(0.908248290463863, 2.0)
  gsl_test_rel(res, -2.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(9.08248290463863016e-1, 2.0)")

  res = gsl_cdf_tdist_Qinv(0.9950737714883372, 2.0)
  gsl_test_rel(res, -10.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(9.95073771488337155e-1, 2.0)")

  res = gsl_cdf_tdist_Qinv(0.9987546680538164, 2.0)
  gsl_test_rel(res, -20.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(9.98754668053816452e-1, 2.0)")

  res = gsl_cdf_tdist_Qinv(0.9999500074987502, 2.0)
  gsl_test_rel(res, -100.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(9.99950007498750219e-1, 2.0)")

  res = gsl_cdf_tdist_Qinv(0.99999950000075, 2.0)
  gsl_test_rel(res, -1000.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(9.99999500000749999e-1, 2.0)")

  res = gsl_cdf_tdist_Qinv(0.999999995, 2.0)
  gsl_test_rel(res, -10000.0, 1e-06, "gsl_cdf_tdist_Qinv(9.99999995000000075e-1, 2.0)")

  res = gsl_cdf_tdist_Pinv(0.5, 300.0)
  gsl_test_rel(res, 0.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(5.00000000000000000e-01, 300.0)")

  res = gsl_cdf_tdist_Pinv(0.500398609900943, 300.0)
  gsl_test_rel(res, 0.001, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(5.00398609900942949e-01, 300.0)")

  res = gsl_cdf_tdist_Pinv(0.5039860330205591, 300.0)
  gsl_test_rel(res, 0.01, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(5.03986033020559088e-01, 300.0)")

  res = gsl_cdf_tdist_Pinv(0.5397944411777682, 300.0)
  gsl_test_rel(res, 0.1, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(5.39794441177768194e-01, 300.0)")

  res = gsl_cdf_tdist_Pinv(0.6272962015425239, 300.0)
  gsl_test_rel(res, 0.325, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(6.27296201542523812e-01, 300.0)")

  res = gsl_cdf_tdist_Pinv(0.8409417977846868, 300.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(8.40941797784686861e-01, 300.0)")

  res = gsl_cdf_tdist_Pinv(0.9326669834253691, 300.0)
  gsl_test_rel(res, 1.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(9.32666983425369137e-01, 300.0)")

  res = gsl_cdf_tdist_Pinv(0.9767992395084255, 300.0)
  gsl_test_rel(res, 2.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(9.76799239508425455e-01, 300.0)")

  res = gsl_cdf_tdist_Pinv(1.0, 300.0)
  gsl_test_rel(res, cast[cdouble](cdouble.high), 0.0, "gsl_cdf_tdist_Pinv(1.00000000000000000e+00, 300.0)")

  res = gsl_cdf_tdist_Qinv(0.5, 300.0)
  gsl_test_rel(res, 0.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(5.00000000000000000e-01, 300.0)")

  res = gsl_cdf_tdist_Qinv(0.4996013900990571, 300.0)
  gsl_test_rel(res, 0.001, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(4.99601390099057051e-1, 300.0)")

  res = gsl_cdf_tdist_Qinv(0.4960139669794409, 300.0)
  gsl_test_rel(res, 0.01, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(4.96013966979440912e-1, 300.0)")

  res = gsl_cdf_tdist_Qinv(0.4602055588222318, 300.0)
  gsl_test_rel(res, 0.1, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(4.60205558822231806e-1, 300.0)")

  res = gsl_cdf_tdist_Qinv(0.3727037984574762, 300.0)
  gsl_test_rel(res, 0.325, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(3.72703798457476188e-1, 300.0)")

  res = gsl_cdf_tdist_Qinv(0.1590582022153131, 300.0)
  gsl_test_rel(res, 1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(1.59058202215313138e-1, 300.0)")

  res = gsl_cdf_tdist_Qinv(0.06733301657463087, 300.0)
  gsl_test_rel(res, 1.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(6.73330165746308628e-2, 300.0)")

  res = gsl_cdf_tdist_Qinv(0.02320076049157455, 300.0)
  gsl_test_rel(res, 2.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(2.32007604915745452e-2, 300.0)")

  res = gsl_cdf_tdist_Qinv(8.279313677e-21, 300.0)
  gsl_test_rel(res, 10.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(8.279313677e-21, 300.0)")

  res = gsl_cdf_tdist_Qinv(1.93159812815804e-57, 300.0)
  gsl_test_rel(res, 20.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(1.93159812815803978e-57, 300.0)")

  res = gsl_cdf_tdist_Qinv(1.025575199977362e-232, 300.0)
  gsl_test_rel(res, 100.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(1.02557519997736154e-232, 300.0)")

  res = gsl_cdf_tdist_Qinv(0.0, 300.0)
  gsl_test_rel(res, cast[cdouble](cdouble.high), 0.0, "gsl_cdf_tdist_Qinv(0.00000000000000000e+00, 300.0)")

  res = gsl_cdf_tdist_Pinv(0.4996013900990571, 300.0)
  gsl_test_rel(res, -0.001, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(4.99601390099057051e-01, 300.0)")

  res = gsl_cdf_tdist_Pinv(0.4960139669794409, 300.0)
  gsl_test_rel(res, -0.01, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(4.96013966979440912e-01, 300.0)")

  res = gsl_cdf_tdist_Pinv(0.4602055588222318, 300.0)
  gsl_test_rel(res, -0.1, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(4.60205558822231806e-01, 300.0)")

  res = gsl_cdf_tdist_Pinv(0.3727037984574762, 300.0)
  gsl_test_rel(res, -0.325, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(3.72703798457476188e-01, 300.0)")

  res = gsl_cdf_tdist_Pinv(0.1590582022153131, 300.0)
  gsl_test_rel(res, -1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(1.59058202215313138e-01, 300.0)")

  res = gsl_cdf_tdist_Pinv(0.06733301657463087, 300.0)
  gsl_test_rel(res, -1.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(6.73330165746308628e-02, 300.0)")

  res = gsl_cdf_tdist_Pinv(0.02320076049157455, 300.0)
  gsl_test_rel(res, -2.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(2.32007604915745452e-02, 300.0)")

  res = gsl_cdf_tdist_Pinv(8.279313675556273e-21, 300.0)
  gsl_test_rel(res, -10.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(8.279313675556272534e-21, 300.0)")

  res = gsl_cdf_tdist_Pinv(1.93159812815804e-57, 300.0)
  gsl_test_rel(res, -20.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(1.93159812815803978e-57, 300.0)")

  res = gsl_cdf_tdist_Pinv(1.025575199977362e-232, 300.0)
  gsl_test_rel(res, -100.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Pinv(1.02557519997736154e-232, 300.0)")

  res = gsl_cdf_tdist_Pinv(0.0, 300.0)
  gsl_test_rel(res, cast[cdouble](cdouble.low), 0.0, "gsl_cdf_tdist_Pinv(0.0, 300.0)")

  res = gsl_cdf_tdist_Qinv(0.500398609900943, 300.0)
  gsl_test_rel(res, -0.001, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(5.00398609900942949e-1, 300.0)")

  res = gsl_cdf_tdist_Qinv(0.5039860330205591, 300.0)
  gsl_test_rel(res, -0.01, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(5.03986033020559088e-1, 300.0)")

  res = gsl_cdf_tdist_Qinv(0.5397944411777682, 300.0)
  gsl_test_rel(res, -0.1, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(5.39794441177768194e-1, 300.0)")

  res = gsl_cdf_tdist_Qinv(0.6272962015425239, 300.0)
  gsl_test_rel(res, -0.325, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(6.27296201542523812e-1, 300.0)")

  res = gsl_cdf_tdist_Qinv(0.8409417977846869, 300.0)
  gsl_test_rel(res, -1.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(8.40941797784686862e-1, 300.0)")

  res = gsl_cdf_tdist_Qinv(0.9326669834253691, 300.0)
  gsl_test_rel(res, -1.5, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(9.32666983425369137e-1, 300.0)")

  res = gsl_cdf_tdist_Qinv(0.9767992395084255, 300.0)
  gsl_test_rel(res, -2.0, (1048576.0 * 2.220446049250313e-16), "gsl_cdf_tdist_Qinv(9.76799239508425455e-1, 300.0)")

  res = gsl_cdf_tdist_Qinv(1.0, 300.0)
  gsl_test_rel(res, cast[cdouble](cdouble.low), (1048576.0 *
      2.220446049250313e-16), "gsl_cdf_tdist_Qinv(1.000000000000000000e0, 300.0)")
proc test_auto_beta*() =
  var res: cdouble = cast[cdouble](gsl_cdf_beta_P(0.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_P(1e-10, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_P(1e-09, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_P(1e-08, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_P(1e-07, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_P(1e-06, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_P(1e-05, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_P(0.0001, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_P(0.001, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_P(0.01, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_P(0.1, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_P(0.2, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_P(0.3, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_P(0.4, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_P(0.5, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_P(0.6, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_P(0.8, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_P(0.9, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_P(0.99, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_P(0.999, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_P(0.9999, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_P(0.99999, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_P(1.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_Q(1.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_Q(0.99999, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_Q(0.9999, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_Q(0.999, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_Q(0.99, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_Q(0.9, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_Q(0.8, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_Q(0.6, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_Q(0.5, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_Q(0.4, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_Q(0.3, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_Q(0.2, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_Q(0.1, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_Q(0.01, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_Q(0.001, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_Q(0.0001, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_Q(1e-05, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_Q(1e-06, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_Q(1e-07, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_Q(1e-08, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_Q(1e-09, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_Q(1e-10, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_beta_Q(0.0, 1.3, 2.7))

proc test_auto_fdist*() =
  var res: cdouble = cast[cdouble](gsl_cdf_fdist_P(0.0, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_P(1e-10, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_P(1e-09, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_P(1e-08, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_P(1e-07, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_P(1e-06, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_P(1e-05, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_P(0.0001, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_P(0.001, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_P(0.01, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_P(0.1, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_P(1.0, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_P(10.0, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_P(100.0, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_P(1000.0, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_P(10000.0, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_P(100000.0, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_P(1000000.0, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_P(10000000.0, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_P(100000000.0, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_P(1000000000.0, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_P(10000000000.0, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_Q(10000000000.0, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_Q(1000000000.0, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_Q(100000000.0, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_Q(10000000.0, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_Q(1000000.0, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_Q(100000.0, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_Q(10000.0, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_Q(1000.0, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_Q(100.0, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_Q(10.0, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_Q(1.0, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_Q(0.1, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_Q(0.01, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_Q(0.001, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_Q(0.0001, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_Q(1e-05, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_Q(1e-06, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_Q(1e-07, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_Q(1e-08, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_Q(1e-09, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_Q(1e-10, 5.3, 2.7))

  res = cast[cdouble](gsl_cdf_fdist_Q(0.0, 5.3, 2.7))
proc test_auto_cauchy*() =
  var res: cdouble = cast[cdouble](gsl_cdf_cauchy_P(-10000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Pinv(4.138028520389278e-11, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(-1000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Pinv(4.138028520389279e-10, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(-100000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Pinv(4.138028520389279e-09, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(-10000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Pinv(4.138028520389256e-08, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(-1000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Pinv(4.138028520386949e-07, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(-100000.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Pinv(4.138028520156169e-06, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(-10000.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Pinv(4.138028497078385e-05, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(-1000.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Pinv(0.0004138026189302242, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(-100.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Pinv(0.004137795435083691, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(-10.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Pinv(0.04114951182497351, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(-1.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Pinv(0.2912855998398473, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(-0.1, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Pinv(0.4755627480278025, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(-0.01, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Pinv(0.4975515107068832, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(-0.001, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Pinv(0.4997551462896916, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(-0.0001, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(-1e-05, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(-1e-06, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(-1e-07, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(-1e-08, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(-1e-09, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(-1e-10, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(0.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Pinv(0.5000000000000001, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(1e-10, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(1e-09, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(1e-08, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(1e-07, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(1e-06, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(1e-05, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(0.0001, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(0.001, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Pinv(0.5002448537103084, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(0.01, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Pinv(0.5024484892931167, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(0.1, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Pinv(0.5244372519721975, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(1.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Pinv(0.7087144001601527, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(10.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Pinv(0.9588504881750265, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(100.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Pinv(0.9958622045649164, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(1000.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Pinv(0.9995861973810698, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(10000.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(100000.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(1000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(10000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(100000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(1000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_P(10000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(10000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Qinv(4.138028520389278e-11, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(1000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Qinv(4.138028520389279e-10, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(100000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Qinv(4.138028520389279e-09, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(10000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Qinv(4.138028520389256e-08, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(1000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Qinv(4.138028520386949e-07, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(100000.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Qinv(4.138028520156169e-06, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(10000.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Qinv(4.138028497078385e-05, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(1000.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Qinv(0.0004138026189302242, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(100.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Qinv(0.004137795435083691, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(10.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Qinv(0.04114951182497351, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(1.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Qinv(0.2912855998398473, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(0.1, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Qinv(0.4755627480278025, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(0.01, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Qinv(0.4975515107068832, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(0.001, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Qinv(0.4997551462896916, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(0.0001, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(1e-05, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(1e-06, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(1e-07, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(1e-08, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(1e-09, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(1e-10, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(0.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Qinv(0.5000000000000001, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(-1e-10, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(-1e-09, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(-1e-08, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(-1e-07, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(-1e-06, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(-1e-05, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(-0.0001, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(-0.001, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Qinv(0.5002448537103084, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(-0.01, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Qinv(0.5024484892931167, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(-0.1, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Qinv(0.5244372519721975, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(-1.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Qinv(0.7087144001601527, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(-10.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Qinv(0.9588504881750265, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(-100.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Qinv(0.9958622045649164, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(-1000.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Qinv(0.9995861973810698, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(-10000.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(-100000.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(-1000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(-10000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(-100000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(-1000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_cauchy_Q(-10000000000.0, 1.3))

proc test_auto_gaussian*() =
  var res: cdouble = cast[cdouble](gsl_cdf_gaussian_P(-10000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(-1000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(-100000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(-10000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(-1000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(-100000.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(-10000.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(-1000.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(-100.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(-10.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Pinv(7.225229227926508e-15, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(-1.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Pinv(0.2208781637124597, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(-0.1, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Pinv(0.4693423696033875, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(-0.01, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Pinv(0.496931243491582, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(-0.001, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Pinv(0.4996931213530323, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(-0.0001, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(-1e-05, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(-1e-06, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(-1e-07, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(-1e-08, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(-1e-09, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(-1e-10, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(0.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Pinv(0.5, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(1e-10, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(1e-09, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(1e-08, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(1e-07, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(1e-06, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(1e-05, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(0.0001, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(0.001, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Pinv(0.5003068786469678, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(0.01, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Pinv(0.503068756508418, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(0.1, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Pinv(0.5306576303966125, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(1.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Pinv(0.7791218362875403, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(10.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(100.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(1000.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(10000.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(100000.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(1000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(10000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(100000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(1000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_P(10000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(10000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(1000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(100000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(10000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(1000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(100000.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(10000.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(1000.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(100.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(10.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Qinv(7.225229227926508e-15, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(1.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Qinv(0.2208781637124597, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(0.1, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Qinv(0.4693423696033875, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(0.01, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Qinv(0.496931243491582, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(0.001, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Qinv(0.4996931213530323, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(0.0001, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(1e-05, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(1e-06, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(1e-07, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(1e-08, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(1e-09, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(1e-10, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(0.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Qinv(0.5, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(-1e-10, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(-1e-09, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(-1e-08, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(-1e-07, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(-1e-06, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(-1e-05, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(-0.0001, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(-0.001, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Qinv(0.5003068786469678, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(-0.01, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Qinv(0.503068756508418, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(-0.1, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Qinv(0.5306576303966125, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(-1.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Qinv(0.7791218362875403, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(-10.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(-100.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(-1000.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(-10000.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(-100000.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(-1000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(-10000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(-100000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(-1000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_gaussian_Q(-10000000000.0, 1.3))

proc test_auto_laplace*() =
  var res: cdouble = cast[cdouble](gsl_cdf_laplace_P(-10000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(-1000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(-100000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(-10000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(-1000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(-100000.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(-10000.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(-1000.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(-100.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Pinv(1.957501779912233e-34, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(-10.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Pinv(0.0002281619502905156, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(-1.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Pinv(0.2316846846155876, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(-0.1, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Pinv(0.462980539321158, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(-0.01, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Pinv(0.4961686011955743, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(-0.001, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Pinv(0.4996155325064555, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(-0.0001, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(-1e-05, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(-1e-06, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(-1e-07, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(-1e-08, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(-1e-09, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(-1e-10, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(0.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Pinv(0.5, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(1e-10, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(1e-09, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(1e-08, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(1e-07, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(1e-06, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(1e-05, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(0.0001, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(0.001, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Pinv(0.5003844674935445, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(0.01, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Pinv(0.5038313988044256, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(0.1, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Pinv(0.537019460678842, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(1.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Pinv(0.7683153153844123, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(10.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Pinv(0.9997718380497095, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(100.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(1000.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(10000.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(100000.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(1000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(10000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(100000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(1000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_P(10000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(10000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(1000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(100000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(10000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(1000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(100000.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(10000.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(1000.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(100.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Qinv(1.957501779912233e-34, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(10.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Qinv(0.0002281619502905156, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(1.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Qinv(0.2316846846155876, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(0.1, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Qinv(0.462980539321158, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(0.01, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Qinv(0.4961686011955743, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(0.001, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Qinv(0.4996155325064555, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(0.0001, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(1e-05, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(1e-06, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(1e-07, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(1e-08, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(1e-09, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(1e-10, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(0.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Qinv(0.5, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(-1e-10, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(-1e-09, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(-1e-08, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(-1e-07, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(-1e-06, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(-1e-05, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(-0.0001, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(-0.001, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Qinv(0.5003844674935445, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(-0.01, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Qinv(0.5038313988044256, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(-0.1, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Qinv(0.537019460678842, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(-1.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Qinv(0.7683153153844123, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(-10.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Qinv(0.9997718380497095, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(-100.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(-1000.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(-10000.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(-100000.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(-1000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(-10000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(-100000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(-1000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_laplace_Q(-10000000000.0, 1.3))

proc test_auto_rayleigh*() =
  var res: cdouble = cast[cdouble](gsl_cdf_rayleigh_P(0.0, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_P(1e-10, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Pinv(2.958579881656805e-21, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_P(1e-09, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Pinv(2.958579881656805e-19, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_P(1e-08, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Pinv(2.958579881656805e-17, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_P(1e-07, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Pinv(2.9585798816568e-15, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_P(1e-06, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Pinv(2.958579881656367e-13, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_P(1e-05, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Pinv(2.958579881613039e-11, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_P(0.0001, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Pinv(2.958579877280208e-09, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_P(0.001, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Pinv(2.958579443997103e-07, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_P(0.01, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Pinv(2.958536116113838e-05, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_P(0.1, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Pinv(0.00295420759717925, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_P(1.0, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Pinv(0.2561069378623536, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_P(10.0, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_P(100.0, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_P(1000.0, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_P(10000.0, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_P(100000.0, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_P(1000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_P(10000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_P(100000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_P(1000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_P(10000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Q(10000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Q(1000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Q(100000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Q(10000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Q(1000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Q(100000.0, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Q(10000.0, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Q(1000.0, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Q(100.0, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Q(10.0, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Qinv(1.415959498848783e-13, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Q(1.0, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Qinv(0.7438930621376464, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Q(0.1, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Qinv(0.9970457924028208, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Q(0.01, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Q(0.001, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Q(0.0001, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Q(1e-05, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Q(1e-06, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Q(1e-07, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Q(1e-08, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Q(1e-09, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Q(1e-10, 1.3))

  res = cast[cdouble](gsl_cdf_rayleigh_Q(0.0, 1.3))

proc test_auto_flat*() =
  var res: cdouble = cast[cdouble](gsl_cdf_flat_P(0.0, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_P(1e-10, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_P(1e-09, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_P(1e-08, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_P(1e-07, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_P(1e-06, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_P(1e-05, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_P(0.0001, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_P(0.001, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_P(0.01, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_P(0.1, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_P(1.0, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_P(10.0, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_Pinv(0.01162014157873855, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_P(100.0, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_Pinv(0.1318285027380814, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_P(1000.0, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_P(10000.0, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_P(100000.0, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_P(1000000.0, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_P(10000000.0, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_P(100000000.0, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_P(1000000000.0, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_P(10000000000.0, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_Q(10000000000.0, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_Q(1000000000.0, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_Q(100000000.0, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_Q(10000000.0, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_Q(1000000.0, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_Q(100000.0, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_Q(10000.0, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_Q(1000.0, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_Q(100.0, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_Qinv(0.8681714972619037, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_Q(10.0, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_Qinv(0.9883798584212535, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_Q(1.0, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_Q(0.1, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_Q(0.01, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_Q(0.001, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_Q(0.0001, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_Q(1e-05, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_Q(1e-06, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_Q(1e-07, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_Q(1e-08, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_Q(1e-09, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_Q(1e-10, 1.3, 750.0))

  res = cast[cdouble](gsl_cdf_flat_Q(0.0, 1.3, 750.0))

proc test_auto_lognormal*() =
  var res: cdouble = cast[cdouble](gsl_cdf_lognormal_P(0.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_P(1e-10, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Pinv(1.034288276011547e-19,
      1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_P(1e-09, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Pinv(1.720583234427518e-16,
      1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_P(1e-08, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Pinv(1.397140696549631e-13,
      1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_P(1e-07, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Pinv(5.550354890101576e-11,
      1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_P(1e-06, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Pinv(1.082087222874984e-08,
      1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_P(1e-05, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Pinv(1.039815967490383e-06,
      1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_P(0.0001, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Pinv(4.956354352666784e-05,
      1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_P(0.001, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Pinv(0.001183246775456206, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_P(0.01, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Pinv(0.01436760981040652, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_P(0.1, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Pinv(0.09105428982940558, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_P(1.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Pinv(0.3150871690837552, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_P(10.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Pinv(0.6448033073717402, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_P(100.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Pinv(0.8895497448370264, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_P(1000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Pinv(0.9810967467051815, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_P(10000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Pinv(0.9983038570318435, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_P(100000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Pinv(0.9999223897250857, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_P(1000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_P(10000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_P(100000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_P(1000000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_P(10000000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Q(10000000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Qinv(4.255893513650278e-16,
      1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Q(1000000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Qinv(3.15057402384183e-13, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Q(100000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Qinv(1.141445550080211e-10,
      1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Q(10000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Qinv(2.030439602857691e-08,
      1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Q(1000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Qinv(1.781461076603194e-06,
      1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Q(100000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Qinv(7.761027491429001e-05,
      1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Q(10000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Qinv(0.001696142968156535, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Q(1000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Qinv(0.01890325329481853, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Q(100.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Qinv(0.1104502551629737, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Q(10.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Qinv(0.3551966926282599, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Q(1.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Qinv(0.684912830916245, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Q(0.1, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Qinv(0.9089457101705947, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Q(0.01, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Qinv(0.9856323901895937, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Q(0.001, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Qinv(0.998816753224544, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Q(0.0001, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Q(1e-05, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Q(1e-06, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Q(1e-07, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Q(1e-08, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Q(1e-09, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Q(1e-10, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_lognormal_Q(0.0, 1.3, 2.7))

proc test_auto_gamma*() =
  var res: cdouble = cast[cdouble](gsl_cdf_gamma_P(0.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_P(1e-10, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Pinv(2.356478475163866e-14, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_P(1e-09, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Pinv(4.701792696643945e-13, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_P(1e-08, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Pinv(9.381309762734639e-12, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_P(1e-07, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Pinv(1.871817348197282e-10, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_P(1e-06, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Pinv(3.734765911711424e-09, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_P(1e-05, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Pinv(7.451823639191012e-08, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_P(0.0001, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Pinv(1.486806276026347e-06, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_P(0.001, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Pinv(2.966009681151866e-05, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_P(0.01, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Pinv(0.0005906831032949983, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_P(0.1, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Pinv(0.01156629233127959, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_P(1.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Pinv(0.1921237769663047, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_P(10.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Pinv(0.9565035356115379, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_P(100.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_P(1000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_P(10000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_P(100000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_P(1000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_P(10000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_P(100000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_P(1000000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_P(10000000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Q(10000000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Q(1000000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Q(100000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Q(10000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Q(1000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Q(100000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Q(10000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Q(1000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Qinv(9.292091038793986e-161, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Q(100.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Qinv(2.729167976527317e-16, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Q(10.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Qinv(0.04349646438846219, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Q(1.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Qinv(0.8078762230336953, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Q(0.1, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Qinv(0.9884337076687204, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Q(0.01, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Qinv(0.999409316896705, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Q(0.001, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Q(0.0001, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Q(1e-05, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Q(1e-06, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Q(1e-07, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Q(1e-08, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Q(1e-09, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Q(1e-10, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gamma_Q(0.0, 1.3, 2.7))

proc test_auto_chisq*() =
  var res: cdouble = cast[cdouble](gsl_cdf_chisq_P(0.0, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_P(1e-10, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Pinv(2.238884178785273e-07, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_P(1e-09, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Pinv(1.000072827212493e-06, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_P(1e-08, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Pinv(4.467161220799411e-06, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_P(1e-07, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Pinv(1.995407585451029e-05, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_P(1e-06, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Pinv(8.913156700685821e-05, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_P(1e-05, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Pinv(0.00039813537946105, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_P(0.0001, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Pinv(0.001778373888800392, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_P(0.001, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Pinv(0.00794229637958962, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_P(0.01, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Pinv(0.03541413902540241, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_P(0.1, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Pinv(0.1554268895840359, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_P(1.0, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Pinv(0.5878620132778858, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_P(10.0, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Pinv(0.9973867890205305, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_P(100.0, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_P(1000.0, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_P(10000.0, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_P(100000.0, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_P(1000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_P(10000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_P(100000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_P(1000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_P(10000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Q(10000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Q(1000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Q(100000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Q(10000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Q(1000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Q(100000.0, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Q(10000.0, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Q(1000.0, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Qinv(5.840240518728896e-219, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Q(100.0, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Qinv(3.517864771107665e-23, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Q(10.0, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Qinv(0.002613210979469623, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Q(1.0, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Qinv(0.4121379867221143, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Q(0.1, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Qinv(0.8445731104159642, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Q(0.01, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Qinv(0.9645858609745978, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Q(0.001, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Qinv(0.9920577036204106, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Q(0.0001, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Qinv(0.9982216261111997, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Q(1e-05, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Qinv(0.9996018646205391, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Q(1e-06, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Q(1e-07, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Q(1e-08, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Q(1e-09, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Q(1e-10, 1.3))

  res = cast[cdouble](gsl_cdf_chisq_Q(0.0, 1.3))

proc test_auto_tdist*() =
  var res: cdouble = cast[cdouble](gsl_cdf_tdist_P(-10000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Pinv(3.467848111850031e-14, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(-1000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Pinv(6.919266651610352e-13, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(-100000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Pinv(1.380575199717903e-11, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(-10000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Pinv(2.754609668977748e-10, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(-1000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Pinv(5.496168864956998e-09, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(-100000.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Pinv(1.096629861231458e-07, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(-10000.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Pinv(2.18806422282717e-06, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(-1000.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Pinv(4.365759541083357e-05, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(-100.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Pinv(0.000871032764760792, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(-10.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Pinv(0.01727893386820445, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(-1.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Pinv(0.2336211937932252, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(-0.1, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Pinv(0.4667575980082614, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(-0.01, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Pinv(0.4966660755116961, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(-0.001, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Pinv(0.4996665978188763, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(-0.0001, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(-1e-05, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(-1e-06, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(-1e-07, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(-1e-08, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(-1e-09, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(-1e-10, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(0.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Pinv(0.499999999999999, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(1e-10, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(1e-09, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(1e-08, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(1e-07, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(1e-06, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(1e-05, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(0.0001, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(0.001, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Pinv(0.5003334021811237, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(0.01, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Pinv(0.5033339244883039, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(0.1, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Pinv(0.5332424019917386, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(1.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Pinv(0.7663788062067749, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(10.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Pinv(0.9827210661317956, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(100.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Pinv(0.9991289672352393, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(1000.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(10000.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(100000.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(1000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(10000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(100000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(1000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_P(10000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(10000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Qinv(3.467848111850031e-14, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(1000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Qinv(6.919266651610352e-13, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(100000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Qinv(1.380575199717903e-11, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(10000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Qinv(2.754609668977748e-10, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(1000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Qinv(5.496168864956998e-09, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(100000.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Qinv(1.096629861231458e-07, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(10000.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Qinv(2.18806422282717e-06, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(1000.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Qinv(4.365759541083357e-05, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(100.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Qinv(0.000871032764760792, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(10.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Qinv(0.01727893386820445, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(1.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Qinv(0.2336211937932252, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(0.1, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Qinv(0.4667575980082614, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(0.01, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Qinv(0.4966660755116961, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(0.001, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Qinv(0.4996665978188763, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(0.0001, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(1e-05, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(1e-06, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(1e-07, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(1e-08, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(1e-09, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(1e-10, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(0.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Qinv(0.499999999999999, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(-1e-10, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(-1e-09, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(-1e-08, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(-1e-07, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(-1e-06, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(-1e-05, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(-0.0001, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(-0.001, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Qinv(0.5003334021811237, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(-0.01, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Qinv(0.5033339244883039, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(-0.1, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Qinv(0.5332424019917386, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(-1.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Qinv(0.7663788062067749, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(-10.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Qinv(0.9827210661317956, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(-100.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Qinv(0.9991289672352393, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(-1000.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(-10000.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(-100000.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(-1000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(-10000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(-100000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(-1000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_tdist_Q(-10000000000.0, 1.3))

proc test_auto_gumbel1*() =
  var res: cdouble = cast[cdouble](gsl_cdf_gumbel1_P(-10000000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(-1000000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(-100000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(-10000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(-1000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(-100000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(-10000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(-1000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(-100.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(-10.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(-1.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Pinv(4.981965353091824e-05, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(-0.1, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Pinv(0.04619717476779808, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(-0.01, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Pinv(0.06487265128366305, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(-0.001, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Pinv(0.0669698820372176, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(-0.0001, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Pinv(0.06718192621136487, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(-1e-05, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(-1e-06, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(-1e-07, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(-1e-08, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(-1e-09, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(-1e-10, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(0.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Pinv(0.06720551273974995, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(1e-10, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(1e-09, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(1e-08, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(1e-07, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(1e-06, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(1e-05, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(0.0001, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Pinv(0.06722910448133346, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(0.001, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Pinv(0.06744166476189883, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(0.01, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Pinv(0.06959050352517981, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(0.1, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Pinv(0.09340058564429043, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(1.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Pinv(0.4791048360124848, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(10.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(100.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(1000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(10000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(100000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(1000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(10000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(100000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(1000000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_P(10000000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(10000000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(1000000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(100000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(10000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(1000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(100000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(10000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(1000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(100.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Qinv(9.398988467741606e-57, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(10.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Qinv(6.10287077625722e-06, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(1.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Qinv(0.5208951639875152, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(0.1, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Qinv(0.9065994143557096, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(0.01, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Qinv(0.9304094964748202, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(0.001, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Qinv(0.9325583352381012, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(0.0001, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(1e-05, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(1e-06, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(1e-07, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(1e-08, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(1e-09, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(1e-10, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(0.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Qinv(0.9327944872602503, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(-1e-10, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(-1e-09, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(-1e-08, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(-1e-07, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(-1e-06, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(-1e-05, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(-0.0001, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(-0.001, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Qinv(0.9330301179627825, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(-0.01, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Qinv(0.935127348716337, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(-0.1, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Qinv(0.9538028252322019, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(-1.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Qinv(0.9999501803464691, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(-10.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(-100.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(-1000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(-10000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(-100000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(-1000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(-10000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(-100000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(-1000000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel1_Q(-10000000000.0, 1.3, 2.7))

proc test_auto_gumbel2*() =
  var res: cdouble = cast[cdouble](gsl_cdf_gumbel2_P(0.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_P(1e-10, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_P(1e-09, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_P(1e-08, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_P(1e-07, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_P(1e-06, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_P(1e-05, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_P(0.0001, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_P(0.001, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_P(0.01, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_P(0.1, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Pinv(4.014688368993475e-24, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_P(1.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Pinv(0.06720551273974974, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_P(10.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Pinv(0.8734358842462814, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_P(100.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Pinv(0.9932408531257445, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_P(1000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Pinv(0.9996601479016278, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_P(10000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_P(100000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_P(1000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_P(10000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_P(100000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_P(1000000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_P(10000000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Q(10000000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Qinv(2.699999999999649e-13, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Q(1000000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Qinv(5.387208250401491e-12, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Q(100000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Qinv(1.074889360436678e-10, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Q(10000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Qinv(2.144686231455729e-09, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Q(1000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Qinv(4.279211528086765e-08, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Q(100000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Qinv(8.53814603745569e-07, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Q(10000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Qinv(1.703570319172562e-05, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Q(1000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Qinv(0.0003398520983724625, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Q(100.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Qinv(0.006759146874255832, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Q(10.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Qinv(0.126564115753719, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Q(1.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Qinv(0.9327944872602512, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Q(0.1, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Q(0.01, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Q(0.001, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Q(0.0001, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Q(1e-05, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Q(1e-06, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Q(1e-07, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Q(1e-08, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Q(1e-09, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Q(1e-10, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_gumbel2_Q(0.0, 1.3, 2.7))

proc test_auto_weibull*() =
  var res: cdouble = cast[cdouble](gsl_cdf_weibull_P(0.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_P(1e-10, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Pinv(4.92439576078527e-28, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_P(1e-09, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Pinv(2.468044288633838e-25, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_P(1e-08, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Pinv(1.236952289489982e-22, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_P(1e-07, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Pinv(6.199446960984052e-20, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_P(1e-06, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Pinv(3.107083672394598e-17, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_P(1e-05, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Pinv(1.557230670415903e-14, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_P(0.0001, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Pinv(7.804641318222502e-12, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_P(0.001, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Pinv(3.911586584098054e-09, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_P(0.01, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Pinv(1.960435341355991e-06, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_P(0.1, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Pinv(0.0009820635881537139, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_P(1.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Pinv(0.3888663329608595, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_P(10.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_P(100.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_P(1000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_P(10000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_P(100000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_P(1000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_P(10000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_P(100000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_P(1000000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_P(10000000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Q(10000000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Q(1000000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Q(100000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Q(10000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Q(1000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Q(100000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Q(10000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Q(1000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Q(100.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Q(10.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Qinv(6.519262004069862e-108, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Q(1.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Qinv(0.6111336670391404, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Q(0.1, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Qinv(0.9990179364118463, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Q(0.01, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Q(0.001, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Q(0.0001, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Q(1e-05, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Q(1e-06, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Q(1e-07, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Q(1e-08, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Q(1e-09, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Q(1e-10, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_weibull_Q(0.0, 1.3, 2.7))

proc test_auto_pareto*() =
  var res: cdouble = cast[cdouble](gsl_cdf_pareto_P(0.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_P(1e-10, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_P(1e-09, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_P(1e-08, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_P(1e-07, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_P(1e-06, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_P(1e-05, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_P(0.0001, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_P(0.001, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_P(0.01, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_P(0.1, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_P(1.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_P(10.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Pinv(0.8177057822239537, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_P(100.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Pinv(0.9908636465286981, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_P(1000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Pinv(0.9995420976278682, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_P(10000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_P(100000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_P(1000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_P(10000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_P(100000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_P(1000000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_P(10000000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Q(10000000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Qinv(3.637247829653617e-13, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Q(1000000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Qinv(7.257263524710211e-12, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Q(100000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Qinv(1.44801444206525e-10, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Q(10000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Qinv(2.889168647783478e-09, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Q(1000000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Qinv(5.764649324511972e-08, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Q(100000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Qinv(1.150198755620954e-06, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Q(10000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Qinv(2.294948231814587e-05, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Q(1000.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Qinv(0.0004579023721744107, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Q(100.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Qinv(0.009136353471344562, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Q(10.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Qinv(0.182294217776089, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Q(1.0, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Q(0.1, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Q(0.01, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Q(0.001, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Q(0.0001, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Q(1e-05, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Q(1e-06, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Q(1e-07, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Q(1e-08, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Q(1e-09, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Q(1e-10, 1.3, 2.7))

  res = cast[cdouble](gsl_cdf_pareto_Q(0.0, 1.3, 2.7))

proc test_auto_logistic*() =
  var res: cdouble = cast[cdouble](gsl_cdf_logistic_P(-10000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(-1000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(-100000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(-10000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(-1000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(-100000.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(-10000.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(-1000.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(-100.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Pinv(3.915003559824466e-34, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(-10.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Pinv(0.0004561157640564605, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(-1.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Pinv(0.316645529812217, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(-0.1, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Pinv(0.4807787077893918, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(-0.01, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Pinv(0.4980769325594948, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(-0.001, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Pinv(0.4998076923171749, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(-0.0001, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(-1e-05, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(-1e-06, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(-1e-07, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(-1e-08, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(-1e-09, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(-1e-10, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(0.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Pinv(0.5, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(1e-10, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(1e-09, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(1e-08, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(1e-07, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(1e-06, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(1e-05, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(0.0001, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(0.001, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Pinv(0.5001923076828251, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(0.01, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Pinv(0.5019230674405052, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(0.1, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Pinv(0.5192212922106082, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(1.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Pinv(0.6833544701877829, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(10.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Pinv(0.9995438842359435, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(100.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(1000.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(10000.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(100000.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(1000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(10000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(100000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(1000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_P(10000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(10000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(1000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(100000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(10000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(1000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(100000.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(10000.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(1000.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(100.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Qinv(3.915003559824466e-34, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(10.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Qinv(0.0004561157640564605, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(1.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Qinv(0.316645529812217, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(0.1, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Qinv(0.4807787077893918, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(0.01, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Qinv(0.4980769325594948, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(0.001, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Qinv(0.4998076923171749, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(0.0001, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(1e-05, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(1e-06, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(1e-07, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(1e-08, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(1e-09, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(1e-10, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(0.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Qinv(0.5, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(-1e-10, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(-1e-09, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(-1e-08, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(-1e-07, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(-1e-06, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(-1e-05, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(-0.0001, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(-0.001, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Qinv(0.5001923076828251, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(-0.01, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Qinv(0.5019230674405052, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(-0.1, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Qinv(0.5192212922106082, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(-1.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Qinv(0.6833544701877829, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(-10.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Qinv(0.9995438842359435, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(-100.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(-1000.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(-10000.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(-100000.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(-1000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(-10000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(-100000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(-1000000000.0, 1.3))

  res = cast[cdouble](gsl_cdf_logistic_Q(-10000000000.0, 1.3))

proc test_auto_gammalarge*() =
  var res: cdouble = cast[cdouble](gsl_cdf_gamma_P(0.0, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_P(1e-10, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Pinv(1.644976604681201e-16, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_P(1e-09, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Pinv(3.282159828312286e-15, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_P(1e-08, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Pinv(6.548769816865393e-14, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_P(1e-07, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Pinv(1.30665136195932e-12, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_P(1e-06, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Pinv(2.607112210537862e-11, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_P(1e-05, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Pinv(5.201872529445639e-10, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_P(0.0001, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Pinv(1.037909593275298e-08, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_P(0.001, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Pinv(2.070893333124014e-07, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_P(0.01, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Pinv(4.131804542806129e-06, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_P(0.1, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Pinv(8.240625287201719e-05, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_P(1.0, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Pinv(0.001637438876041161, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_P(10.0, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Pinv(0.03135521671622352, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_P(100.0, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Pinv(0.4240385705333852, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_P(1000.0, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Pinv(0.9993635318323562, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_P(10000.0, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_P(100000.0, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_P(1000000.0, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_P(10000000.0, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_P(100000000.0, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_P(1000000000.0, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_P(10000000000.0, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Q(10000000000.0, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Q(1000000000.0, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Q(100000000.0, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Q(10000000.0, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Q(1000000.0, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Q(100000.0, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Q(10000.0, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Qinv(2.056363344745294e-35, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Q(1000.0, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Qinv(0.0006364681676439553, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Q(100.0, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Qinv(0.5759614294666149, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Q(10.0, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Qinv(0.9686447832837765, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Q(1.0, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Qinv(0.9983625611239588, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Q(0.1, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Qinv(0.999917593747128, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Q(0.01, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Q(0.001, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Q(0.0001, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Q(1e-05, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Q(1e-06, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Q(1e-07, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Q(1e-08, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Q(1e-09, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Q(1e-10, 1.3, 123.0))

  res = cast[cdouble](gsl_cdf_gamma_Q(0.0, 1.3, 123.0))

proc main*(): cint =
  gsl_ieee_env_setup()
  while true:
    test_discrete_cdf_P(test_binomial_pdf, test_binomial_cdf_P,
        test_binomial_gsl_range, "test gsl_cdf_binomial_P (k=%d)")
    test_discrete_cdf_Q(test_binomial_pdf, test_binomial_cdf_Q,
        test_binomial_gsl_range, "test gsl_cdf_binomial_Q (k=%d)")
    test_discrete_cdf_PQ(test_binomial_cdf_P, test_binomial_cdf_Q,
        test_binomial_gsl_range, "test gsl_cdf_binomial_P+Q (k=%d)")
    if not 0.bool:
      break

  while true:
    test_discrete_cdf_P(test_poisson_pdf, test_poisson_cdf_P,
        test_poisson_gsl_range, "test gsl_cdf_poisson_P (k=%d)")
    test_discrete_cdf_Q(test_poisson_pdf, test_poisson_cdf_Q,
        test_poisson_gsl_range, "test gsl_cdf_poisson_Q (k=%d)")
    test_discrete_cdf_PQ(test_poisson_cdf_P, test_poisson_cdf_Q,
        test_poisson_gsl_range, "test gsl_cdf_poisson_P+Q (k=%d)")
    if not 0.bool:
      break

  while true:
    test_discrete_cdf_P(test_geometric_pdf, test_geometric_cdf_P,
        test_geometric_gsl_range, "test gsl_cdf_geometric_P (k=%d)")
    test_discrete_cdf_Q(test_geometric_pdf, test_geometric_cdf_Q,
        test_geometric_gsl_range, "test gsl_cdf_geometric_Q (k=%d)")
    test_discrete_cdf_PQ(test_geometric_cdf_P, test_geometric_cdf_Q,
        test_geometric_gsl_range, "test gsl_cdf_geometric_P+Q (k=%d)")
    if not 0.bool:
      break

  while true:
    test_discrete_cdf_P(test_negative_binomial_pdf,
        test_negative_binomial_cdf_P, test_negative_binomial_gsl_range, "test gsl_cdf_negative_binomial_P (k=%d)")
    test_discrete_cdf_Q(test_negative_binomial_pdf,
        test_negative_binomial_cdf_Q, test_negative_binomial_gsl_range, "test gsl_cdf_negative_binomial_Q (k=%d)")
    test_discrete_cdf_PQ(test_negative_binomial_cdf_P,
        test_negative_binomial_cdf_Q, test_negative_binomial_gsl_range, "test gsl_cdf_negative_binomial_P+Q (k=%d)")
    if not 0.bool:
      break

  while true:
    test_discrete_cdf_P(test_pascal_pdf, test_pascal_cdf_P,
        test_pascal_gsl_range, "test gsl_cdf_pascal_P (k=%d)")
    test_discrete_cdf_Q(test_pascal_pdf, test_pascal_cdf_Q,
        test_pascal_gsl_range, "test gsl_cdf_pascal_Q (k=%d)")
    test_discrete_cdf_PQ(test_pascal_cdf_P, test_pascal_cdf_Q,
        test_pascal_gsl_range, "test gsl_cdf_pascal_P+Q (k=%d)")
    if not 0.bool:
      break

  while true:
    test_discrete_cdf_P(test_hypergeometric_pdf, test_hypergeometric_cdf_P,
        test_hypergeometric_gsl_range, "test gsl_cdf_hypergeometric_P (k=%d)")
    test_discrete_cdf_Q(test_hypergeometric_pdf, test_hypergeometric_cdf_Q,
        test_hypergeometric_gsl_range, "test gsl_cdf_hypergeometric_Q (k=%d)")
    test_discrete_cdf_PQ(test_hypergeometric_cdf_P, test_hypergeometric_cdf_Q,
        test_hypergeometric_gsl_range, "test gsl_cdf_hypergeometric_P+Q (k=%d)")
    if not 0.bool:
      break

  test_discrete_cdf_PQ(test_hypergeometric2_cdf_P, test_hypergeometric2_cdf_Q,
      test_hypergeometric2a_gsl_range, "test gsl_cdf_hypergeometric_P+Q (k=%d)")
  test_discrete_cdf_PQ(test_hypergeometric2_cdf_P, test_hypergeometric2_cdf_Q,
      test_hypergeometric2b_gsl_range, "test gsl_cdf_hypergeometric_P+Q (k=%d)")
  test_ugaussian()
  test_exponential()
  test_exppow()
  test_tdist()
  test_fdist()
  test_gamma()
  test_chisq()
  test_beta()
  test_ugaussianinv()
  test_exponentialinv()
  test_gammainv()
  test_chisqinv()
  test_tdistinv()
  test_betainv()
  test_finv()
  test_auto_beta()
  test_auto_fdist()
  test_auto_cauchy()
  test_auto_gaussian()
  test_auto_laplace()
  test_auto_rayleigh()
  test_auto_flat()
  test_auto_lognormal()
  test_auto_gamma()
  test_auto_chisq()
  test_auto_tdist()
  test_auto_gumbel1()
  test_auto_gumbel2()
  test_auto_weibull()
  test_auto_pareto()
  test_auto_logistic()
  test_auto_gammalarge()
  echo "TEST SUMMARY (Exit Code): " & $gsl_test_summary()

discard main()
