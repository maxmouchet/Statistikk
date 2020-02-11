**Deserialization**

```julia
using Distributions, JSON, Statistikk

d = Normal()
# => Normal{Float64}(μ=0.0, σ=1.0)

s = JSON.json(d)
# => {"μ":0.0,"σ":1.0}

o = JSON.parse(s)
# => Dict{String,Any}("μ" => 0.0,"σ" => 1.0)

Normal(o)
# => Normal{Float64}(μ=0.0, σ=1.0)
```

**Missing values handling**

```julia
using Distributions, Statistikk

pdf(Normal(), missing)
# ERROR: MethodError: no method matching pdf(::Normal{Float64}, ::Missing)

Statistikk.enablemissing()
pdf(Normal(), missing) # => missing

Statistikk.enablemissing(1.0)
pdf(Normal(), missing)    # => 1.0
logpdf(Normal(), missing) # => 0.0

Statistikk.disablemissing()
```

**Un-normalized categorical distribution**

```julia
using Statistikk

A = rand(10, 10)
d = UnnormalizedCategorical(A)
rand(d, 3)
# Tuple{Int64,Int64}[(3, 1), (7, 2), (8, 5)]
```
