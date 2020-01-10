using Test
using Statistikk
using Distributions

@testset "UnnormalizedCategorical" begin
    idx = (7,5)
    p = zeros(10, 10)
    p[idx...] = 10.0
    d = UnnormalizedCategorical(p)
    @test d.s == 10
    @test rand(d) == idx
end

@testset "Missings" begin
    # No errors if called multiple times
    @test_nowarn Statistikk.enablemissing()
    @test_nowarn Statistikk.enablemissing()
    @test_nowarn Statistikk.disablemissing()
    @test_nowarn Statistikk.disablemissing()
end

@testset "Missings $f" for f in [pdf, logpdf, Distributions.zval]
    Statistikk.disablemissing()
    @test_throws MethodError f(Normal(), missing)

    Statistikk.enablemissing()
    @test_nowarn f(Normal(), missing)
end

@testset "Vector" begin
    d = Normal()
    X = rand(d, 1000)
    @test pdf(d, X) == pdf.(d, X)
    @test logpdf(d, X) == logpdf.(d, X)
end