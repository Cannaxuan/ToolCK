function ismember_CK(arr1 :: Array, arr2 :: Array, by::String = "element")
    #=
        This function is used to emulate the same function as ismember in matlab
        Input:
            arr1 :: VecOrMat
            arr2 :: VecOrMat
        Output:
            lia, locb
        by Caesar
    =#

    if by == "element"
        if ndims(arr1) != 1
            arr1 = reshape(arr1, length(arr1), 1)
        else
            arr1 = arr1
        end
        if ndims(arr2) != 1
            arr2 = reshape(arr2, length(arr2), 1)
        else
            arr2 = arr2
        end
        lia = in.(arr1, [arr2])
        # locb = findfirst.([arr2], arr1)
        locb = indexin(arr1, arr2)
    elseif by == "rows"
        lia = []
        @inbounds for i in 1:size(arr1, 1)
            for j in 1:size(arr2, 1)
                if arr1[i, :] == arr2[j, :]
                    push!(lia, true)
                    break
                end
                j == size(arr2, 1) ? push!(lia, false) : nothing
            end
        end
        locb = []
        @inbounds for i in 1:size(arr1, 1)
            for j in 1:size(arr2, 1)
                if arr1[i, :] == arr2[j, :];
                    push!(locb, j)
                    break
                end
                j == size(arr2, 1) ? push!(locb, 0) : nothing
            end
        end
    elseif by == "columns"
        arr1 = arr1'
        arr2 = arr2'
        lia, locb = ismember_CK(Array(arr1), Array(arr2), "rows")
    end

    return lia, locb

end


#
# A = [1 3 5 6; 2 4 6 8; 2 4 6 8]
# B = [1 3 5 7; 2 4 6 8; 2 4 6 8]
# #
# lia, locb = ismember_CK(A, B, "columns")
# lia, locb = ismember_CK(A, B, "rows")
