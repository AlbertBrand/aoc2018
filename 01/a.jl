open("01/input") do f
    elems = Int[]
    for line in eachline(f)
        push!(elems, parse(Int, line))
    end
    println(reduce(+, elems))
end
