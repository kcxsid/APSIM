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



## Project Workflow: 
![Workflow](https://user-images.githubusercontent.com/31934083/182606796-aa31c493-c5d2-4590-8dd5-846a3bbf4dbe.png)
I adopted this process from the data-science principles to complete my project. 

## Bulk Density Variation: 

<img width="963" alt="Screen Shot 2022-08-08 at 5 44 02 pm" src="https://user-images.githubusercontent.com/31934083/183366215-16968dee-55c0-45f8-b659-40cc843af76c.png">
The above image shows the variation of bulk density throughout Australia. 

![Bulk Density Variation](https://user-images.githubusercontent.com/31934083/182607174-4adeacbb-1a9d-4985-8b9b-08c9d89250a1.jpg)
The above image shows the variation of bulk density with the increase in depth of soil from the surface. 

## Soil Horizons: 
![soil horizons](https://user-images.githubusercontent.com/31934083/182606820-d2661de2-2dbf-4aa4-b421-a7f6c27ee6a0.jpg)

A soil horizon is a layer parallel to the soil surface whose physical, chemical and biological characteristics differ from the layers above and beneath.

## Spline Plot: 
![SplinePlot](https://user-images.githubusercontent.com/31934083/182607095-b23c34c1-c244-4ca9-9b84-f9adaf4659ea.png)
 The above image shows the fit of the equal areas (mass-preserving) splines to the data. 
 
 
 ## Average Root Mean Squared Errors for each model: 
 <img width="777" alt="image" src="https://user-images.githubusercontent.com/31934083/183366857-ae2ba632-c80c-4c9a-b602-4db60a7472c6.png">

MLR - Multiple Linear Regression 
DTR - Decision Tree Regression 
RF - Random Forest Regression
RFGS - Random Forest Regression with Optimized Hyperparameters using GridSearch CV. 
MART - Multiple Additive Regression Trees. 
MARTGS - Multiple Additive Regression Trees with optimized hyperparameters using GridSearch CV. 
