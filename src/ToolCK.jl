__precompile__()

module ToolCK

using PyCall, MAT

include("corr_CK.jl")
include("readMat_CK.jl")
include("writeMat_CK.jl")
include("ismember_CK.jl")
include("nanstd_CK.jl")
include("nanMedian_CK.jl")
include("nanSum_CK.jl")
include("nanMean_CK.jl")
include("unique_CK.jl")

export corr_CK, readMat_CK, writeMat_CK, ismember_CK, nanstd_CK, nanSum_CK, nanMean_CK, nanMedian_CK, unique_CK


end
