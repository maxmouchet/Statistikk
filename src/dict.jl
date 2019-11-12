
Normal(d::Dict) = Normal(d[:μ], d[:σ])
MixtureModel(d::Dict) = MixtureModel(map(Normal, d[:components]), Vector{Float64}(d[:prior][:p]))
# HMMBase.HMM(d::Dict, T::Type) = HMM(Vector{Float64}(d[:a]), hcat(d[:A]...), map(T, d[:B]))