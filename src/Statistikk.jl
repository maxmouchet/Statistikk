module Statistikk

using ConjugatePriors
using Distributions

import Base: rand
import ConjugatePriors: NormalInverseChisq
import Distributions: invsqrt2π, log2π, logpdf, pdf, zval

export UnnormalizedCategorical

include("conjugate.jl")
include("distributions.jl")
include("missings.jl")
include("vector.jl")

end
