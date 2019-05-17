using MAT

function writeMat_CK(path::String, varname::String, var)
    #= write single variable to a mat file
    Inputs:
        path: output path
        varname: save as the variable name (in mat file)
        var: variable bingding to the data to be saved
    Outputs:
        mat file
    by Caesar
    =#

    matopen(path, "w") do file
        write(file, varname, var)
    end

end


function writeMat_CK(path::String, varname::Tuple, var::Tuple)
    #= write single variable to a mat file
    Inputs:
        path: output path
        varname: save as the variable names (in mat file)
        var: multiple variable bingdings to the data to be saved
    Outputs:
        mat file
    by Caesar
    =#

    data = Dict(zip(varname, var))
    matwrite(path, data)

end


# ::String, ::NTuple{9,String}, ::NTuple{9,Dict{Any,Any}}
function writeMat_CK(path::String, varname::NTuple{N,String} where N, var::NTuple{N,Dict{Any,Any}} where N)
    #= write single variable to a mat file
    Inputs:
        path: output path
        varname: save as the variable names (in mat file)
        var: multiple variable bingdings to the data to be saved
    Outputs:
        mat file
    by Caesar
    =#

    data = Dict(zip(varname, var))
    matwrite(path, data)

end


function writeMat_CK(path::String, varname::Tuple{N, String} where N, var::Tuple{N, Any} where N)
    #= write single variable to a mat file
    Inputs:
        path: output path
        varname: save as the variable names (in mat file)
        var: multiple variable bingdings to the data to be saved
    Outputs:
        mat file
    by Caesar
    =#

    data = Dict(zip(varname, var))
    matwrite(path, data)

end

function writeMat_CK(path::String, var::Dict{N, Any} where N)
    #= write multiple variable to a mat file
    Inputs:
        path: output path
        var: dictionary that contains variable names (Keys) => data(Values) to be saved
    Outputs:
        mat file
    by Caesar
    =#

    matwrite(path, var)

end

function writeMat_CK(path::String, var::Dict{String, Dict{Any,Any}})
    #= write multiple variable to a mat file
    Inputs:
        path: output path
        var: dictionary that contains variable names (Keys) => data(Values) to be saved
    Outputs:
        mat file
    by Caesar
    =#

    matwrite(path, var)

end
