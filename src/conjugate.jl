# TODO: Generic implementation of this
function rand(::Type{<:Normal}, pri::NormalInverseChisq, X)
    if length(X) > 0
        pri = posterior_canon(pri, suffstats(Normal, X))
    end
    μ, σ2 = rand(pri)
    Normal(μ, sqrt(σ2))
end

# abstract type ConjguateModel end

# struct NormalNIX <: ConjguateModel
#     distn::Normal
#     prior::NormalInverseChisq
# end

# struct MixtureModel{T} <: ConjguateModel
#     components::Vector{T}
#     weights::Vector{Float64}
#     prior::Dirichlet
# end

# # Rename resample to rand ?
# function resample(m::NormalNIX, X)
#     distn = rand(typeof(distn), m.prior, X)
#     NormalNIX(distn, prior)
# end

# function resample(m::MixtureModel{T}, X) where T
#     # TODO: Argcheck X is vector of vector
#     components = map(i -> resample(m.components[i], X[i]))
#     weights = rand()
# end
