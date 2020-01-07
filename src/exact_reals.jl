
"Structure representing a real number that is computable to arbitrary precision."
mutable struct ExactReal <: Real
    f::Function
    largest_n::Int  # largest n for which computed
    largest_value::BigInt  # value at that n
    msd::Int  # minimum significant digit
end

ExactReal(f) = ExactReal(f, -1, -1, -1)

"""
Memoized evaluation of the nth value in the representation
"""
function (x::ExactReal)(n::Integer)

    if n == x.largest_n
        return x.largest_value

    elseif n < x.largest_n
        return x.largest_value >> (x.largest_n - n)

    end

    value = (x.f)(n)

    x.largest_n = n
    x.largest_value = value

    return value
end

const B = big(2)  # base of the expansion


ExactReal(q::Rational) = ExactReal(n -> ((B^n) * numerator(q)) ÷ denominator(q))
ExactReal(q::Integer) = ExactReal(q//1)

const exact_real_precision = big(100)

"""
Returns an interval (as a tuple) containing the exact real number;
this interval is of approximate width `2^(-n)`.
"""
function value_range(x::ExactReal, n=exact_real_precision)
    numerator = x(n)
    denominator = big(2)^n

    return (Float64( (numerator - 1) / denominator, RoundDown),
            Float64( (numerator + 1) / denominator, RoundUp))
end

function Base.show(io::IO, r::ExactReal)
    lo, hi = value_range(r)

    print(io, "ExactReal in ",
        lo, "..", hi)

end
