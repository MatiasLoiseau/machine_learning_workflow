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
- https://medium.com/dataman-in-ai/explain-your-model-with-the-shap-values-bc36aac4de3d
- https://towardsdatascience.com/explain-any-models-with-the-shap-values-use-the-kernelexplainer-79de9464897a

### Lista de posibles pruebas

1. Cambiar la cantidad de lags
2. Ver si no hay que aplicar lags a todas las variables
3. Rolling window statistics
4. Probar la libreria ([escrita en Python](https://github.com/feature-engine/feature_engine)) de [Soledad Galli](https://github.com/solegalli)
5. Probar combinaciones de tendencias

## Pruebas extras que no se refieren a FE

1. XGBoost.
2. Otro Feature Selection que no sea canaritos asesinos.
3. Polynomial features
4. Statics Aggregation (min,max,std-dev)
5. Detección de outliers
6. Categorical encoding
7. Variable transofrmation
8. Scaling (min-max scaling and normalization)

## Experimentos

**Información importante**: para los experimentos de Feature Engineering se modificará principalmente el archivo FE_historia.r y no hay que tocar los conceptos de *Canarios Asesinos* ni *Random Forest*.

### 0. Workflow Inicial

Este experimento se usa como base para los demás. 

**Resultado:** $68.885.503

**Tiempo de ejecución:** 16 horas, 59 minutos

### 1. Eliminando Feature Engineering

Acá se testea cuanta ganancia da el modelo si **NO** se aplica Feature Engineering.

**Resultado:** $57.826.830

**Tiempo de ejecución:** 2 horas, 40 minutos

### 2. Usar dos tendencias

Vamos a probar una tendencia de 6 meses y otra de 12 meses. Sin configurar ningúna otra variable.

**Resultado:** $68.794.142

**Tiempo de ejecución:** 23 horas, 41 minutos **(con un error en el medio)**

### 3. Usar una tendencia y minimo

Vamos a probar una tendencia de 6 meses y el mínimo

**Resultado:** $65.620.965

**Tiempo de ejecución:** 10 horas, 9 minutos

### 4. Usar una tendencia y máximo

Vamos a probar una tendencia de 6 meses y el máximo

**Resultado:** $65.877.538

**Tiempo de ejecución:** 17 horas, 33 minutos

### 5. Usar una tendencia y promedio

Vamos a probar una tendencia de 6 meses y el promedio

**Resultado:** $66.170.215

**Tiempo de ejecución:** 13 horas, 29 minutos

### 6. Usar una tendencia y ratioavg

Vamos a probar una tendencia de 6 meses y ratioavg

**Resultado:** $66.482.658

**Tiempo de ejecución:** 11 horas, 33 minutos

### 7. Usar una tendencia y ratiomax

Vamos a probar una tendencia de 6 meses y ratiomax

**Resultado:** $68.224.125

**Tiempo de ejecución:** 38 horas, 56 minutos

### 8. Usar una tendencia y todo

Vamos a probar una tendencia de 6 meses y con todas las opciones disponibles

**Resultado:** $67.515.770

**Tiempo de ejecución:** 31 horas, 45 minutos

### 9. Usar dos tendencias y todo

Vamos a probar una tendencia de 6 meses y otra de 12 meses. Además de todas las opciones disponibles.

**Resultado:** $66.598.695

**Tiempo de ejecución:** 21 horas, 36 minutos

### 10. Sin tendencia pero con los dos lags

Prueba sin usar las tendencias pero sí con los lags

**Resultado:** $65.809.157

**Tiempo de ejecución:** 13 horas, 38 minutos

### 11. Dos tendencias, 3 y 6 meses

Prueba con dos tendencias, una de 3 meses y otra de 6 meses

**Resultado:** ¿¿??

**Tiempo de ejecución:**

### 12. Dos tendencias, 3 y 6 meses y todo.

Prueba con dos tendencias, una de 3 meses y otra de 6 meses. Además se calculan todas las variables juntas.

**Resultado:** $65.534.421

**Tiempo de ejecución:**

### 13. Dos tendencias, 3 y todo, 6 sola

Prueba con dos tendencias, una de 3 meses con todas las opciones activadas y otra de 6 meses pero sola.

**Resultado:** ¿¿??

**Tiempo de ejecución:**

### Training Strategy

#### Grupo A

```
PARAM$future <- c(202109)
PARAM$final_train <- c(
 202107, 202106, 202105, 202104, 202103, 202102,
 202101, 202012, 202011, 202010, 202009, 202008, 202002, 202001, 201912,
 201911, 201910, 201909
)

PARAM$train$training <- c(
 202105, 202104, 202103, 202102, 202101,
 202012, 202011, 202010, 202009, 202008, 202002, 202001, 201912, 201911,
 201910, 201909, 201908, 201907
)

PARAM$train$validation <- c(202106)
PARAM$train$testing <- c(202107)
```

#### Grupo B

```
PARAM$future <- c(202107)
PARAM$final_train <- c(
 202105, 202104, 202103, 202102,
 202101, 202012, 202011, 202010, 202009, 202008, 202002, 202001, 201912,
 201911, 201910, 201909, 201908, 201907
)
PARAM$train$training <- c(
 202103, 202102, 202101,
 202012, 202011, 202010, 202009, 202008, 202002, 202001, 201912, 201911,
 201910, 201909, 201908, 201907, 201906, 201905
)

PARAM$train$validation <- c(202104)
PARAM$train$testing <- c(202105)
```

## Importancia de Feature Engineering
1. Feature Engineering
2. Entrenar en varios meses
3. Variables históricas
4. Qué meses usar para val/test
5. Vars random forest
6. FE intra mes

## Importancia de Algoritmos de Machine Learning
1. LightGBM/XGBoost
2. Deep Learning
3. Support Vector Machine
4. Random Forest
5. Arboles Azarosos
6. Logistic Regression
7. Árboles de decisión
8. Naive Bayes

## Importancia de Hyperparam Tuning
1. Bayesian Optimization
2. Random search
3. Grid Search

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