# gsl-nim [GNU Scientific Library for nim](https://www.gnu.org/software/gsl/)
* This is GNU GSL C Api wrapped for nim (generated using [c2nim](https://github.com/nim-lang/c2nim)).
* [GSL Home Page](https://www.gnu.org/software/gsl/)
* [GSL Github](https://github.com/ampl/gsl)
* [GSL Doc](https://www.gnu.org/software/gsl/doc/html/)

# Install
* 1. install GNU GSL library
  * Ubuntu 
  
    sudo apt-get install libgsl-dev
  
  * MacOs
    
    brew install gsl
   
  * Windows
    
    Why do you want to do this on windows? Use WSL maybe.
    
  * Build from source
  
    download source code from https://www.gnu.org/software/gsl/
    
    ```
    ./configure --prefix=???
    make
    make check
    make install
    ```
* 2. install gsl-nim package
  ```
  git clone https://github.com/YesDrX/gsl-nim
  cd gsl-nim
  nimble install
  ```
# Sample code
  [samples](https://github.com/YesDrX/gsl-nim/tree/main/sample)
  
  * example : solve for root of a 5th order polynomial equation
  ```nim
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
  ```
  * output
  ```
Roots for x^5 - 1 = 0
z0 = -0.8090169943749477 + 0.5877852522924734 i
z1 = -0.8090169943749477 + -0.5877852522924734 i
z2 = 0.3090169943749475 + 0.951056516295153 i
z3 = 0.3090169943749475 + -0.951056516295153 i
z4 = 0.9999999999999999 + 0.0 i
  ```
  
