# Training Strategy

En esta prueba agregué:

1. Media móvil D (3 lags y 3 leads)
2. Deflación
3. Variables nuevas creadas por Axel
4. Hellinger method y sample fraction al 0.8 en random forest
5. Undersampling 4.0
6. **Bayesiana con estos meses**:

```
PARAM$train$training <- c(
202103, 202102, 202101, 202012, 202011, 202010, 202009, 202008, 202002, 202001, 201912, 201911, 201910, 201909, 201908, 201907, 201906, 201905
)
PARAM$train$validation <- c(202104)
PARAM$train$testing <- c(202105)
```