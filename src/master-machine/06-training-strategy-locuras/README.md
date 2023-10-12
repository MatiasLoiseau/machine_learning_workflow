# Training Strategy -> Locuras

En esta prueba agregué:

1. Media móvil D (3 lags y 3 leads)
2. Deflación
3. Variables nuevas creadas por Axel
4. Hellinger method y sample fraction al 0.8 en random forest
5. Undersampling 4.0
6. **Combinación de meses falopas**:

```
PARAM$future       <- c( 202109 )
PARAM$final_train  <- c( 202107, 202106, 202104, 202103, 202101, 202012, 202010, 202009, 202002, 202001, 201911, 201910 )

PARAM$train$training     <- c( 202104, 202103, 202101, 202012, 202010, 202009, 202002, 202001, 201911, 201910, 201908, 201907 )
PARAM$train$validation   <- c( 202105 )
PARAM$train$testing      <- c( 202107 )
```