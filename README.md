# FileIOWorldAgeProblem.jl

MWE repo to exhibit world age problem with FileIO

## This works

```julia
julia> using FileIO

julia> FileIO.load("data/tifFloat64_3x3.tif") .* 255
3×3 Array{Gray{Float32},2} with eltype ColorTypes.Gray{Float32}:
 Gray{Float32}(50.0)   Gray{Float32}(237.0)  Gray{Float32}(215.0)
 Gray{Float32}(33.0)   Gray{Float32}(114.0)  Gray{Float32}(202.0)
 Gray{Float32}(171.0)  Gray{Float32}(65.0)   Gray{Float32}(171.0)
```

## But this doesn't

```julia
julia> using FileIOWorldAgeProblem

julia> FileIOWorldAgeProblem.loadasUInt8()
ERROR: MethodError: no method matching *(::ColorTypes.Gray{FixedPointNumbers.Normed{UInt8,8}}, ::Int64)
The applicable method may be too new: running in world age 27810, while current world is 27834.
Closest candidates are:
  *(::ColorTypes.Color{T,1} where T, ::Real) at /Users/james/.julia/packages/ColorVectorSpace/N6pFk/src/ColorVectorSpace.jl:223 (method too new to be called from this world context.)
  *(::Any, ::Any, ::Any, ::Any...) at operators.jl:538
  *(::Complex{Bool}, ::Real) at complex.jl:309
  ...
Stacktrace:
 [1] _broadcast_getindex_evalf at ./broadcast.jl:648 [inlined]
 [2] _broadcast_getindex at ./broadcast.jl:621 [inlined]
 [3] _getindex at ./broadcast.jl:645 [inlined]
 [4] _broadcast_getindex at ./broadcast.jl:620 [inlined]
 [5] getindex at ./broadcast.jl:575 [inlined]
 [6] copy(::Base.Broadcast.Broadcasted{Base.Broadcast.DefaultArrayStyle{2},Tuple{Base.OneTo{Int64},Base.OneTo{Int64}},Type{UInt8},Tuple{Base.Broadcast.Broadcasted{Base.Broadcast.DefaultArrayStyle{2},Nothing,typeof(*),Tuple{Array{ColorTypes.Gray{FixedPointNumbers.Normed{UInt8,8}},2},Int64}}}}) at ./broadcast.jl:876
 [7] materialize at ./broadcast.jl:837 [inlined]
 [8] loadasUInt8(::String) at /Users/james/Documents/code/julia/FileIOWorldAgeProblem/src/FileIOWorldAgeProblem.jl:6 (repeats 2 times)
 [9] top-level scope at REPL[2]:1
```
