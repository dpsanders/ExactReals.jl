
Base.:+(x::ExactReal, y::ExactReal) = ExactReal(n -> (x(n+2) + y(n+2) + 2) >> 2)


Base.:-(x::ExactReal) = ExactReal(n->-x(n))
Base.:-(x::ExactReal, y::ExactReal) = x + (-y)
Base.:-(x::Union{Rational, Integer}, y::ExactReal) = ExactReal(x) - y



"Most significant digit"
function msd(x::ExactReal)
    x.msd > -1 && return x.msd

    n = 0

    while x(n) == 0
        n += 1
    end

    x.msd = n

    return n
end


function Base.:*(x::ExactReal, y::ExactReal)
    return ExactReal(n -> begin
        p = max(n - msd(y) + 4, n + 3 >> 1)
        q = max(n - msd(x) + 4, n + 3 >> 1)

        (1 + x(p) * y(q)) >> (p + q - n)
    end
    )
end

Base.:*(x::Rational, y::ExactReal) = ExactReal(x) * y

Base.sqrt(x::ExactReal) = ExactReal(n -> isqrt(x(2n)))


"Returns -1 if x < y and +1 if x > y"
function compare(x::ExactReal, y::ExactReal)
    n = 0

    while true
        xn, yn = x(n), y(n)
        xn < yn - 1 && return -1  # x < y
        xn > yn + 1 && return 1   # x > y

        n += 1
    end
end




Base.:<(x::ExactReal, y::ExactReal) = compare(x, y) == -1
