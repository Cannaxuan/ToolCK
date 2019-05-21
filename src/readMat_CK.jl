function readMat_CK(path::String, var::String, dataType::DataType = DataType)
    # read a mat file and return  a variable that is converted to specifed datatype
    # by Caesar

    data = []
    matopen(path, "r") do file
        data = read(file, var)
    end

    if dataType != DataType
        data = convert(dataType, data)
    end

    return data
end


function readMat_CK(path::String)
    # read a mat file that has multiple variables and return data as a dictionary
    # by Caesar
    return matread(path)
end
