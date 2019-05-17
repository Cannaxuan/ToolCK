using CSV
using DataFrames

nofDataSets = 2
splSize = 420
noPs = 45
Pl = 2
Pu = 20
with_intercept = true
Gps = 3
iGps = fld(noPs, 3)
create_interaction = true #false #
kfolds = 3
Rsqr_dataSets = [0.9 0.5]
use_common_rseed = true


selectedPs, dataSets = dataGen(nofDataSets, splSize, noPs,iGps, Pl, Pu, Rsqr_dataSets,
kfolds, with_intercept, create_interaction, use_common_rseed)

data = DataFrame(dataSets["set_1"])
# rename!(data, :x1 => :y)
model = DataFrame(selectedPs["model_1"])

CSV.write(raw"C:\Users\rmikk\Documents\RMI\SelectRegressors_demo_Julia\model1.csv", model)
CSV.write(raw"C:\Users\rmikk\Documents\RMI\SelectRegressors_demo_Julia\data1.csv", data)

using GLM
fit(GeneralizedLinearModel, dataSets["set_1"][:, 2:end], dataSets["set_1"][:, 1])
