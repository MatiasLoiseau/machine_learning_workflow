# Machine Learning Workspace

Mis semillas para la materia: [374063, 356101, 374483, 413783, 149111]

## Descripción

Repositorio personal de la materia Data Mining de la [Maestría en Ciencia de Datos](https://www.itba.edu.ar/posgrado/especializacion-en-ciencia-de-datos/ "MCD Homepage") del [Instituto Tecnológico de Buenos Aires](https://www.itba.edu.ar/ "ITBA Homepage") para la elaboración de experimentos de Feature Engineering.  

Además, este repositorio contiene material, recursos y proyectos relacionados con la materia.

## Contenido

El repositorio se organiza de la siguiente manera:

- **src**: Experimentos
- **Tareas**: Tareas de la materia

## Ideas para Feature Engineering

### Hipótesis:
**Sesgos cognitivos**: El Feature Engineering Historico (FE) es tremendamente útil para mejorar los resultados de predicción en los modelos de machine learning. Al agregar lags, deltas y tendencias el rendimiento del modelo mejorará notablemente.

### Bibliografía del profe
- https://towardsdatascience.com/4-tips-for-advanced-feature-engineering-and-preprocessing-ec11575c09ea
- https://towardsdatascience.com/three-approaches-to-feature-engineering-for-time-series-2123069567be
- https://shaz13.medium.com/rare-feature-engineering-techniques-for-machine-learning-competitions-de36c7bb418f
- https://towardsdatascience.com/feature-engineering-for-machine-learning-a80d3cdfede6
- https://towardsdatascience.com/feature-engineering-for-machine-lea374063

### Bibliografía mia
- https://www.kaggle.com/code/prashant111/a-reference-guide-to-feature-engineering-methods#5.-Variable-Transformation-
- https://medium.com/data-science-at-microsoft/introduction-to-feature-engineering-for-time-series-forecasting-620aa55fcab0

### Lista de posibles pruebas

1. Polynomial features
2. Cambiar la cantidad de lags
3. Statics Aggregation (min,max,std-dev)
4. Ver si no hay que aplicar lags a todas las variables
5. Crear nuevas variables:
   a. Visa_consumo / Visa_limite_compra
   b. mcaja_ahorro + mcuenta_corriente + mplazo_fijo + minversiones1 + minversiones2
   c. mpayroll / cliente_edad
6. Detección de outliers
7. Categorical encoding
8. Variable transofrmation
9. Scaling (min-max scaling and normalization)
10. Rolling window statistics
11. Probar la libreria ([escrita en Python](https://github.com/feature-engine/feature_engine)) de [Soledad Galli](https://github.com/solegalli)
12. 

## Pruebas extras que no se refieren a FE

1. XGBoost
2.

## Experimentos

**Información importante**: para los experimentos de Feature Engineering se modificará principalmente el archivo FE_historia.r y no hay que tocar los conceptos de *Canarios Asesinos* ni *Random Forest*.

### 0. Workflow Inicial

Este experimento se usa como base para los demás. 

**Resultados:** ¿¿??

### 1. Eliminando Feature Engineering

Acá se testea cuanta ganancia da el modelo si **NO** se aplica Feature Engineering.

**Resultados:** ¿¿??

## Recursos extras

Enlaces a recursos externos, bibliografía recomendada y otros materiales de apoyo.

### General Purpose Machine Learning
* [scikit-learn](http://scikit-learn.org/stable/) - Machine learning en Python.

* [XGBoost](https://github.com/dmlc/xgboost) - Scalable, Portable, and Distributed Gradient Boosting.
* [LightGBM](https://github.com/Microsoft/LightGBM) - A fast, distributed, high-performance gradient boosting.

### Feature Engineering
* [Featuretools](https://github.com/Featuretools/featuretools) - Automated feature engineering.
* [Feature Engine](https://github.com/feature-engine/feature_engine) - Feature engineering package with sklearn-like functionality.

### Feature Selection
* [scikit-feature](https://github.com/jundongl/scikit-feature) - Feature selection repository in Python.

### Julia
* [Julia.jl](https://github.com/svaksha/Julia.jl#readme) - Repositorio con información relevante sobre el lenguaje de programación Julia.

## Licencia

Este repositorio se distribuye bajo la licencia "GNU GENERAL PUBLIC LICENSE". Consultar [Licencia](./LICENSE) para obtener más detalles.