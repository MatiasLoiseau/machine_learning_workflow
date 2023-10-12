# Training Strategy -> Contemplando la pandemia

En esta prueba agregué:

1. Media móvil D (3 lags y 3 leads)
2. Deflación
3. Variables nuevas creadas por Axel
4. Hellinger method y sample fraction al 0.8 en random forest
5. Undersampling 4.0
6. **Prueba modificando los meses de pandemia**:

```
PARAM$future <- c(202109)
PARAM$final_train <- c(
  202107, 202106,
  202105, 202104, 202103, 202102,
  202101, 202012, 202011, 202010, 202008, 202006, 202004, 202002,
  201912, 201911, 201910, 201909,
  201908, 201907
)

PARAM$train$training <- c(
  202105, 202104,
  202103, 202102, 202101,
  202012, 202011, 202010, 202008, 202006, 202004, 202002, 201912, 201911,
  201910, 201909, 201908, 201907, 201906, 201905
)

PARAM$train$validation <- c(202106)
PARAM$train$testing <- c(202107)
```