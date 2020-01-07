# ExactReals.jl

[![Build Status](https://travis-ci.com/dpsanders/ExactReals.jl.svg?branch=master)](https://travis-ci.com/dpsanders/ExactReals.jl)
[![Build Status](https://ci.appveyor.com/api/projects/status/github/dpsanders/ExactReals.jl?svg=true)](https://ci.appveyor.com/project/dpsanders/ExactReals-jl)
[![Codecov](https://codecov.io/gh/dpsanders/ExactReals.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/dpsanders/ExactReals.jl)


This is a package for performing exact real arithmetic in Julia.
The implementation uses a fast Cauchy sequence to approximate each real number.

## Installation

To install the package, do

```jl
julia> using Pkg

julia> Pkg.add("https://github.com/dpsanders/ExactReals.jl")
```

## Usage

Exact real numbers may be created from integers and rationals.
Basic arithmetic (`+`, `-` and `*`) is implemented:

```jl

julia> using ExactReals

julia> ExactReal(3)
ExactReal in 2.9999999999999996..3.0000000000000004

julia> x = ExactReal(3)
ExactReal in 2.9999999999999996..3.0000000000000004

julia> y = ExactReal(3//5)
ExactReal in 0.6..0.6000000000000001

julia> x + y
ExactReal in 3.5999999999999996..3.6

julia> x - y
ExactReal in 2.4..2.4000000000000004

julia> x * y
ExactReal in 1.7999999999999998..1.8
```

See `examples/logistic.jl` for an example comparing exact real arithmetic to floating-point arithmetic.

## Reference
Keith Briggs, Implementing exact real arithmetic in Python, C++ and C.
*Theor. Comp. Sci.* **351** (2006), 74--81


## Author

- [David P. Sanders](http://sistemas.fciencias.unam.mx/~dsanders), Departamento de Física, Facultad de Ciencias, Universidad Nacional Autónoma de México (UNAM) & Visiting researcher, MIT



## Acknowledgements

Financial support is acknowledged from DGAPA-UNAM PAPIIT grant IN-117117 and a *Cátedra Marcos Moshinsky* (2018).
