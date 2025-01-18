#Use pip to install the Python libraries
from sklearn.ensemble import RandomForestRegressor
import pandas as pd

dataset = pd.read_csv("finalData.csv")
print(dataset.head()) #To see dataset
array = dataset.values

#This dataset has 6 input features, and predicts a value based on those. All double values.
X = array[:,0:6]
y = array[:,6]

rf_model = RandomForestRegressor(n_estimators=100, random_state=42)
rf_model.fit(X, y)

# Converting the RandomForestRegressor to Core ML, and Save it to use in XCode
import coremltools as ct
coreml_model = ct.converters.sklearn.convert(rf_model)
coreml_model.save("RF_Model.mlmodel")
