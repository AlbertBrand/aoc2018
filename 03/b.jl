open("03/input") do f
    fields = zeros(Int, (1000, 1000))
    unclaimed = Int[]
    for line in eachline(f)
        s = split(line, r"#| @ |,|: |x")
        id = parse(Int, s[2])
        x = parse(Int, s[3])
        y = parse(Int, s[4])
        w = parse(Int, s[5])
        h = parse(Int, s[6])
        push!(unclaimed, id)
        for i = 1:w
            for j = 1:h
                fid = fields[x + i, y + j]
                if fid != 0
                    filter!(u -> u != id && u != fid, unclaimed)
                end
                fields[x + i, y + j] = id
            end
        end
    end
    println(unclaimed[1])
end
