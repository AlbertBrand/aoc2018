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
            won = 0
            distMin = typemax(Int)
            for i in 1:length(coords)
                (px, py) = coords[i]
                dist = abs(px - x) + abs(py - y)
                if dist < distMin
                    won = i
                    distMin = dist
                elseif dist == distMin
                    won = 0
                end
            end
            grid[x, y] = won
        end
    end

    # display(grid)
    # exclude all edge winners
    exclude = [grid[1, :]; grid[xmax, :]; grid[:, 1]; grid[:, ymax]]

    # calculate area of other winner locations
    u = setdiff(unique(grid), exclude)
    freq = [(i, count(x -> x == i, grid)) for i in u]

    # winner has largest area
    winner = maximum(last.(freq))
    println(winner)
end
