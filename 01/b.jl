open("01/input") do f
    elems = Int[]
    for line in eachline(f)
        push!(elems, parse(Int, line))
    end
    freqseen = Dict{Integer, Bool}()
    freq = 0
    pos = 1
    while true
        freq += elems[pos]
        if haskey(freqseen, freq)
            println(freq)
            exit()
        end
        freqseen[freq] = true
        pos += 1
        if pos > length(elems)
            pos = 1
        end
    end
end
