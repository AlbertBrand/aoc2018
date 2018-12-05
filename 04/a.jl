using Dates

df = DateFormat("y-m-d H:M");

open("04/input") do f
    lineDict = Dict{String, String}()
    for line in eachline(f)
        ds = SubString(line, 2, 17)
        lineDict[ds] = line
    end

    guardsMin = Dict{Int, Array}()

    id = 0
    midnight = nothing
    asleepDT = nothing

    for ds in sort(collect(keys(lineDict)))
        line = lineDict[ds]
        dt = DateTime(ds, df)

        linetype = SubString(line, 20, 24)
        if linetype == "Guard"
            id = parse(Int, match(r"#(\d+)", line).captures[1])
            midnight = DateTime(Dates.year(dt), Dates.month(dt), Dates.day(dt), 0, 0, 0)
            if Dates.hour(dt) > 0
                midnight += Day(1)
            end

        elseif linetype == "falls"
            asleepDT = dt

        elseif linetype == "wakes"
            midnightEnd = midnight + Hour(1)
            d1 = asleepDT > midnight ? asleepDT : midnight
            d2 = dt < midnightEnd ? dt : midnightEnd
            min1 = Dates.minute(d1)
            min2 = Dates.minute(d2)

            if !haskey(guardsMin, id)
                guardsMin[id] = zeros(Int, 60)
            end
            guardSleep = guardsMin[id]

            for minute in min1:min2-1
                guardSleep[minute+1] += 1
            end

        else
            @warn "Incorrect state"
        end
    end

    sleepyId = 0
    sleepyMin = 0
    for item in guardsMin
        mins = sum(item[2])
        if mins > sleepyMin
            sleepyMin = mins
            sleepyId = item[1]
        end
    end

    sleepyMin = argmax(guardsMin[sleepyId]) - 1

    println(sleepyId * sleepyMin)

end
