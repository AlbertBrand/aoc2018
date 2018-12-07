open("06/input") do f
    coords = Tuple[]
    for line in eachline(f)
        pos = split(line, ", ")
        x = parse(Int, pos[1])+1
        y = parse(Int, pos[2])+1
        push!(coords, (x, y))
    end

    xmax = maximum(first.(coords))
    ymax = maximum(last.(coords))

    grid = zeros(Int, xmax, ymax)

    for x in 1:xmax
        for y in 1:ymax
            total = 0
            for i in 1:length(coords)
                (px, py) = coords[i]
                total += abs(px - x) + abs(py - y)
            end
            grid[x, y] = total < 10000 ? 1 : 0
        end
    end

    println(sum(grid))
end

