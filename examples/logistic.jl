
# Example of logistic map from Keith Briggs's 2006 paper


using ExactReals


"Iterate the function `f` for `n` steps, starting at `x0`."
function iterates(f, n, x0)

    x = x0

    for i in 1:n
        x = f(x)
    end

    return x
end

"Logistic map"
logistic(a, x) = a * x * (1 - x)
logistic(a) = x -> logistic(a, x)

a = rationalize(3.999)
x0 = rationalize(0.9)
n = 54

y = iterates(logistic(ExactReal(a)), n, ExactReal(x0))

@show y > ExactReal(1//2)

# Floating point:

z = iterates(logistic(float(a)), n, float(x0))

@show z > 0.5

nothing

#
# using IntervalArithmetic
#
# x = interval(big"0.9")
#
# iterates(logistic(@biginterval(3.999)), 53, @biginterval(0.9)) |> showfull
#
# iterates(logistic(I"3.999"), 53, I"0.9")
#
# showfull(I"3.999")
#
# # example where double precision is on wrong side of 1/2:
# iterates(logistic(3.999), 54, 0.9)
#
# iterates(logistic(@biginterval(3.999)), 54, @biginterval(0.9)) |> showfull
#
#
# @time y = iterates(logistic(ExactReal(3999//1000)), 54, ExactReal(9//10))
#
# y > ExactReal(1//2)
