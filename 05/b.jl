open("05/input") do f
    orig = readline(f)

    minLength = typemax(Int)

    for rem in collect('a':'z')
        p = replace(orig, rem => "")
        p = replace(p, uppercase(rem) => "")

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
    
        len = length(p)
        # println(len)

        if len < minLength
            minLength = len
        end
    end
    
    println(minLength)

end
