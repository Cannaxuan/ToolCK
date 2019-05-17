function unique_CK(A::Array, keep::String = "first")
    # This function is used to emulate the function of unique() in MATLAB with similar usage

    if keep == "first"
        C = sort(unique(A))
        ia = findfirst.([A], C[:])
        ic = findfirst.([C], A[:])
    elseif keep == "last"
        C = sort(unique(A))
        ia = findlast.([C], A[:])
        ic = findlast.([A], C[:])
    end

    return C, ia, ic

end


function unique_CK(A::Array{T, 2} where T, dim::Int, keep::String = "first")
    # This function is used to emulate the function of unique() in MATLAB with similar usage

    if dim == 2
        A = A'
    end

    if keep == "first"
        C = sortrows(unique(A, 1))
        ia = [findfirst(all(A .== C[i, :]', 2)) for i in 1:size(C, 1)]
        ic = [findfirst(all(C .== A[i, :]', 2)) for i in 1:size(A, 1)]
    elseif keep == "last"
        C = sortrows(unique(A, 1))
        ia = [findlast.(all(A .== C[i, :]', 2)) for i in 1:size(C, 1)]
        ic = [findlast.(all(C .== A[i, :]', 2)) for i in 1:size(A, 1)]
    end

    if dim == 2
        C = C'
    end

    return C, ia, ic
end


function unique_CK(A::BitArray{2}, dim::Int, keep::String = "first")
    # This function is used to emulate the function of unique() in MATLAB with similar usage

    if dim == 2
        A = A'
    end

    if keep == "first"
        C = sortrows(unique(A, 1))
        ia = [findfirst(all(A .== C[i, :]', 2)) for i in 1:size(C, 1)]
        ic = [findfirst(all(C .== A[i, :]', 2)) for i in 1:size(A, 1)]
    elseif keep == "last"
        C = sortrows(unique(A, 1))
        ia = [findlast.(all(A .== C[i, :]', 2)) for i in 1:size(C, 1)]
        ic = [findlast.(all(C .== A[i, :]', 2)) for i in 1:size(A, 1)]
    end

    if dim == 2
        C = C'
    end

    return C, ia, ic
end
