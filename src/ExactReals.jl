"""
Exact real arithmetic using a Boehm scaled-integer representation.

Reference:
Keith Briggs, Implementing exact real arithmetic in Python, C++ and C.
*Theor. Comp. Sci.* **351** (2006), 74--81

"""
module ExactReals

export ExactReal, value_range

include("exact_reals.jl")
include("arithmetic.jl")



end # module
