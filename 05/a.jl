open("05/input") do f
    p = readline(f)

    @label back
    prevC = ""
    for i in 1:length(p)
        c = p[i]
        if lowercase(c) == lowercase(prevC) && (isuppercase(c) && islowercase(prevC) || isuppercase(prevC) && islowercase(c))
            before = SubString(p, 1, i - 2)
            after = SubString(p, i + 1)
            p = string(before, after)
            @goto back
        end
        prevC = c
    end

    println(length(p))
end
