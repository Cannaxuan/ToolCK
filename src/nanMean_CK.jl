using Statistics
function nanMean_CK(data::Array)
    # compute mean of data while ignoring NAN values
    # by Caesar

    data = data[.~isnan.(data)][:]
    mid = Statistics.mean(data)

    return mid
end


function nanMean_CK(data::Matrix, dim::Int)
    # compute mean of data while ignoring NAN values
    # by Caesar

    if dim == 1
        mid = map(i -> try Statistics.mean(data[.~isnan.(data[:, i]), i]) catch; NaN end, 1:size(data, 2))
    else
        mid = map(i -> try Statistics.mean(data[i, .~isnan.(data[i, :])]) catch; NaN end, 1:size(data, 1))
    end

    return mid

end



function nanMean_CK(data::Array{T, 3} where T, dim::Int)
    # compute mean of a matrix along certain dimension while ignoring NAN values
    # by Caesar

    if dim == 1
        mid = map(i -> try nanMean_CK(data[:, :, i], 1) catch; NaN end, 1:size(data, 3))
        mid = hcat(mid...)
    elseif dim == 2
        data = permutedims(data, [2, 1, 3])
        mid = map(i -> try nanMean_CK(data[:, :, i], 1) catch; NaN end, 1:size(data, 3))
        mid = hcat(mid...)
    else
        data = permutedims(data, [3, 1, 2])
        mid = map(i -> try nanMean_CK(data[:, :, i], 1) catch; NaN end, 1:size(data, 3))
        mid = hcat(mid...)
    end

    return mid
end
