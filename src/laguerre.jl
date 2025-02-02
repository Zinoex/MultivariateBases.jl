"""
    struct LaguerreBasis{P} <: AbstractMultipleOrthogonalBasis{P}
        polynomials::Vector{P}
    end

Orthogonal polynomial with respect to the univariate weight function ``w(x) = \\exp(-x)`` over the interval ``[0, \\infty]``.
"""
struct LaguerreBasis{P} <: AbstractMultipleOrthogonalBasis{P}
    polynomials::Vector{P}
end

function MP.polynomial_type(::Type{<:LaguerreBasis}, V::Type)
    return MP.polynomial_type(V, Float64)
end

even_odd_separated(::Type{<:LaguerreBasis}) = false

reccurence_first_coef(::Type{<:LaguerreBasis}, degree) = -1
reccurence_second_coef(::Type{<:LaguerreBasis}, degree) = (2degree - 1)
reccurence_third_coef(::Type{<:LaguerreBasis}, degree) = -(degree - 1)
reccurence_deno_coef(::Type{<:LaguerreBasis}, degree) = degree

function degree_one_univariate_polynomial(
    ::Type{<:LaguerreBasis},
    variable::MP.AbstractVariable,
)
    MA.@rewrite(1 - variable)
end
