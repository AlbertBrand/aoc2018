open("02/input") do f
    elems = String[]
    for line in eachline(f)
        push!(elems, line)
    end
    for e1 in elems
        for e2 in elems
            diff = 0
            for i = 1:length(e1)
                if e1[i] != e2[i]
                    diff += 1
                end
                if diff > 1
                    @goto next
                end
            end
            @label next
            if diff == 1
                final = ""
                for i = 1:length(e1)
                    if e1[i] == e2[i]
                        final = string(final, e1[i])
                    end
                end
                println(final)
                exit()
            end
        end
    end
end
