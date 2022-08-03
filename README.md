## APSIM (Agricultural Production System sIMulator) 

<!------------------->


### Description

The APSIM Crop Production Model is a tool that is used to simulate an agricultural ecosystem. It
consists of various components, such as plant, soil, and climate modules. The soil module is based on
several soil properties, such as the amount of clay, organic carbon content, fine sand particle size, and
inter-particle spaces. Due to complications in obtaining manual readings for specific properties (such
as Bulk Density), there is a need to establish a relation between such variables and other soil properties
for their prediction. A relation between the soil properties and Bulk Density should be established using
Pedo-Transfer functions.
Bulk Density is defined as the mass of the material’s particles divided by the total occupancy volume.
The dataset comprises of soil data from various sources (Queensland Govt. and others). Inconsistencies
(duplicate data, missing observations) must be removed from the dataset. Mathematical tools (Splines)
can be implemented to obtain consistent readings for all soil properties, at every interval. Machine
Learning models are used to fit the data to observe patterns between the input variables and the target
variable (Bulk Density). The model that best fits the data and which has the lowest prediction errors is
used to obtain Pedo-Transfer functions, which is used for Bulk Density Predictions. 

The soil data that has been collated from various sources consists of a vast amount of
information that can be used to predict Bulk Density. Exploratory data analysis (EDA) was performed
on the cleaned dataset to observe any patterns and get a better understanding of the dataset. Observations
for each soil parameter were recorded at different depths. Mass preserving Splines were fit to each soil
profile in order to obtain a continuous set of values from the surface to the maximum depth, thereby
making the data more uniform. A set of the most common properties on soils is extracted and a
correlation plot is obtained to visualise their relationship. Machine Learning Models are applied to the
dataset to observe the RMSE values and obtain Pedo-Transfer functions. 


### Procedure
- Registering credentials in order to obtain an API key to download the dataset: *https://shiny.esoil.io/SoilDataFederator/Pages/Register*
- Downloading the datasets from the swagger API Docs: *https://esoil.io/TERNLandscapes/SoilDataFederatoR/__swagger__/#* 
- Performing extensive research on the domain of soil chemistry (mainly Bulk Density) and study of soil properties. 
- Transforming the dataset to remove inconsistencies.
- Performing Exploratory Data Analysis and implementing Data Mining Techniques to observe any patterns.  
- Utilizing a Spline (Equal-area) to maintain data continuity and fill-in missing values at specified intervals. 
- Identifying Machine learning models that can be used with the dataset. 
- Performing n-fold Cross Validation prior to splitting the dataset between training and testing models (to maintain statistical independence). 
- Studying the results between various models and identifying the best model to obtain relations between Bulk Density and other soil properties. 



Project Workflow: 
![Workflow](https://user-images.githubusercontent.com/31934083/182606796-aa31c493-c5d2-4590-8dd5-846a3bbf4dbe.png)

Bulk Density Variation: 
![Bulk Density Variation](https://user-images.githubusercontent.com/31934083/182607174-4adeacbb-1a9d-4985-8b9b-08c9d89250a1.jpg)

Soil Horizons: 
![soil horizons](https://user-images.githubusercontent.com/31934083/182606820-d2661de2-2dbf-4aa4-b421-a7f6c27ee6a0.jpg)

Spline Plot: 
![SplinePlot](https://user-images.githubusercontent.com/31934083/182607095-b23c34c1-c244-4ca9-9b84-f9adaf4659ea.png)

