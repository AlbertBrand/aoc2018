open("03/input") do f
    fields = zeros(Int, (1000, 1000))
    for line in eachline(f)
        s = split(line, r"#| @ |,|: |x")
        # id = parse(Int, s[2])
        x = parse(Int, s[3])
        y = parse(Int, s[4])
        w = parse(Int, s[5])
        h = parse(Int, s[6])
        for i = 1:w
            for j = 1:h
                fields[x + i, y + j] += 1
            end
        end
    end
    println(count(val -> val > 1, fields))
end
