using Test
using Statistikk

@testset "UnnormalizedCategorical" begin

    idx = (7,5)
    p = zeros(10, 10)
    p[idx...] = 10.0
    d = UnnormalizedCategorical(p)
    @test d.s == 10
    @test rand(d) == idx

end