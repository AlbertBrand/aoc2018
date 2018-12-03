open("02/input") do f
    twos = 0
    threes = 0
    for line in eachline(f)
        count = Dict{Char, Int}()
        for char in line
            if haskey(count, char)
                count[char] += 1
            else
                count[char] = 1
            end
        end
        if findfirst(values(count) .== 2) != nothing
            twos += 1
        end
        if findfirst(values(count) .== 3) != nothing
            threes += 1
        end
    end
    println(twos * threes)
end
