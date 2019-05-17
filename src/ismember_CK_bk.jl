function ismember_CK(arr1 :: Array, arr2 :: Array)
    #=
        This function is used to emulate the same function as ismember in matlab
        Input:
            arr1 :: VecOrMat
            arr2 :: VecOrMat
        Output:
            lia, locb
        by Caesar
    =#

    if ndims(arr1) != 1
        a = reshape(arr1, length(arr1), 1)
    else
        a = arr1
    end
    if ndims(arr2) != 1
        b = reshape(arr2, length(arr2), 1)
    else
        b = arr2
    end
    lia = in.(a, [b])
    locb = findfirst.([b], a)

    return lia, locb

end
