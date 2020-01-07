using ExactReals
using Test

@testset "ExactReals.jl" begin

    @testset "Constructors" begin
        a = ExactReal(3//5)
        @test value_range(a) == (0.6, nextfloat(0.6))

        b = ExactReal(3)
        @test value_range(b) == (prevfloat(3.0), nextfloat(3.0))
    end

    @testset "Arithmetic" begin

        a = ExactReal(3//5)

        b = a + a
        @test value_range(b) == (1.2, nextfloat(1.2))

        c = a * a
        @test value_range(c) == (0.36, nextfloat(0.36))

        d = -a
        @test value_range(d) == (prevfloat(-0.6), -0.6)

        e = sqrt(a)
        s = sqrt(0.6)
        @test value_range(e) == (prevfloat(s), s)
    end

    @testset "Comparisons" begin
        a = ExactReal(3//5)
        @test ExactReals.compare(1 - a, a) == -1

        @test a > ExactReal(1//2)
    end

end
