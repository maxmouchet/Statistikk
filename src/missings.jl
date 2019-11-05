pdf(::Distribution, ::Missing) = 1.0

logpdf(::Distribution, ::Missing) = 0.0

zval(::Normal, ::Missing) = 0.0
