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
  
  * example 
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
(size1: 4, size2: 4, tda: 4, data: ..., block: ..., owner: 0)
(size: 4, stride: 1, data: ..., block: ..., owner: 1)
a_data^(-1) * b_data =
-4.052050
-12.605611
1.660912
8.693767
  ```
  
