using BenchmarkTools
using Distributions

d = Normal()
X = rand(d, 5000)

@btime pdf.(d, X)
@btime logpdf.(d, X)

using Statistikk

@btime Statistikk.pdf(d, X)
@btime Statistikk.logpdf(d, X)
