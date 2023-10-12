# Videos colaborativos

Resumen de los videos colaborativos

## 1. Encontrar el mejor método para corregir las variables rotas que fueron asignadas a cero

### Grupo A

Link del video: https://drive.google.com/file/d/1P4z42hff7iIkrM0PtVcOKk0XVhUCcMtH/view

**Resultado**

1. No hacer nada
2. Probar el experimento D: https://github.com/JoseRearte/dm2023b/blob/main/src/workflow-inicial-CA/611_CA_reparar_dataset_exp_d.r

### Grupo B

Link del video: https://www.youtube.com/watch?v=is09yDl1Jqc

**Resultado**

1. Probar esto -> Media móvil D (3 lags y 3 leads) https://github.com/GermanLeonarhdt/dm2023b/blob/main/src/workflow-Experimento1B/611_CA_reparar_dataset_1B_07.r
2. Probar números randoms (falopa) https://github.com/GermanLeonarhdt/dm2023b/blob/main/src/workflow-Experimento1B/611_CA_reparar_dataset_1B_11.r


## 2. Determinación de la estrategia óptima para la corrección del Data Drift

### Grupo A

Link del video: https://www.youtube.com/watch?v=2kFMbBwWB7s

**Resultado**

**USAR DEFLACIÓN**

### Grupo B

Link del video: https://www.youtube.com/watch?v=4VC7wE4129g

**Resultado**

**USAR DIV_MEDIA** -> Ojo que no está implementado en el workflow inicial y hay que usar la implementación del autor

link github: https://github.com/RodrigoITBA/dm2023b/blob/main/src/experimento2B/t621_DR_corregir_drifting_007.r

## 3. Variables manuales de Feature Engineering

### Grupo A

Link del video: https://www.youtube.com/watch?v=-Y3avLSiFdw

**Resultado**

Enocntró algo bueno pero no lo puedo recplicar tan facilmente. Lo de abajo es un ejemplo del código pero no se si es el mejor.

```
  # Aqui debe usted agregar sus propias nuevas variables
  
 # Número aleatorio entre 35 y 40 para la cantidad de columnas nuevas
num_nuevas_columnas <- sample(35:40, 1)

# Lista de operaciones matemáticas
operaciones <- list(`+`, `-`, `*`, `/`)

# Definimos los grupos de variables
grupos_variables <- list(
  seguros = c("cseguro_vida", "cseguro_auto", "cseguro_vivienda", "cseguro_accidentes_personales"),
  tarjetas_credito = c("ctarjeta_visa_transacciones", "mtarjeta_visa_consumo", "Visa_mlimitecompra", "ctarjeta_master_transacciones", "mtarjeta_master_consumo", "Visa_mlimitecompra"),
  antiguedad = c("cliente_antiguedad","cliente_edad","numero_de_cliente"),
  prestamos = c("cprestamos_personales", "mprestamos_personales", "cprestamos_prendarios", "mprestamos_prendarios", "cprestamos_hipotecarios", "mprestamos_hipotecarios")
)

# Para cada grupo de variables
for (nombre_grupo in names(grupos_variables)) {
  variables_grupo <- grupos_variables[[nombre_grupo]]
  
  # Generamos las columnas nuevas
  for (valor in 1:num_nuevas_columnas) {
    # Seleccionamos aleatoriamente entre 2 y 4 variables del grupo
    num_variables <- sample(2:4, 1)
    vars <- sample(variables_grupo, num_variables)
    
    # Seleccionamos una operación matemática aleatoria
    operacion <- sample(operaciones, 1)[[1]]
    
    # Realizamos la operación entre las variables
    nueva_columna <- dataset[[vars[1]]]
    for (i in 2:num_variables) {
      nueva_columna <- operacion(nueva_columna, dataset[[vars[i]]])
    }
    
    # Asignamos la nueva columna al dataset
    nombre_columna_nueva <- paste0(nombre_grupo, "_nueva_variable_", paste(vars, collapse="_"))
    dataset[, (nombre_columna_nueva) := nueva_columna]
  }
}
```


Link github: https://github.com/gonzakenny/dm2023b/blob/main/src/workflow-inicial/621_DR_corregir_drifting_01_working.r

### Grupo B

Link del video: https://www.loom.com/share/2ceb71ddca484a2ca54d229a4cc7ae80?sid=2371eaaf-e4a1-482c-9578-66762ff142f2

**Resultado**

Tuvo una leve mayor ganancia y algunos de sus campos entraban en el feature importance

```
 # Aqui debe usted agregar sus propias nuevas variables

   ## Ganancias banco
  dataset[, mmargen := rowSums(.SD, na.rm = TRUE), .SDcols = c("mactivos_margen", "mpasivos_margen")]
  dataset[, mmargen_x_producto := mmargen / cproductos]

  ## Total Pasivos
  dataset[, total_deuda := rowSums(.SD, na.rm = TRUE), .SDcols = c("mprestamos_personales", "mprestamos_prendarios", "mprestamos_hipotecarios", "Visa_msaldototal", "Master_msaldototal")]

  ## Total Activos
  dataset[, total_activos := rowSums(.SD, na.rm = TRUE), .SDcols = c("mplazo_fijo_dolares", "mplazo_fijo_pesos", "minversion1_pesos", "minversion1_dolares", "minversion2", "mcuentas_saldo")]

  ## Balance en el banco
  dataset[, balance := total_activos - total_deuda]
  dataset[, ratio_deuda := total_deuda / (total_activos + 1)]

  ## saldos
  dataset[, has_cuentacorriente_saldo_pos := ifelse(mcuenta_corriente > 0, 1, 0) ]
  dataset[, has_cajaahorro_saldo_pos := ifelse(mcaja_ahorro > 0, 1, 0) ]
  dataset[, has_saldo_pos := ifelse(mcaja_ahorro + mcuenta_corriente > 0, 1, 0) ]

  ## Tiene movimientos/tarjetas
  dataset[, has_debito_transacciones := ifelse(dataset$ctarjeta_debito_transacciones > 0, 1, 0) ]
  dataset[, has_visa := ifelse(dataset$ctarjeta_visa > 0, 1, 0) ]
  dataset[, has_visa_transacciones := ifelse(dataset$ctarjeta_visa_transacciones > 0, 1, 0) ]
  dataset[, has_master := ifelse(dataset$ctarjeta_master > 0, 1, 0) ]
  dataset[, has_master_transacciones := ifelse(dataset$ctarjeta_master_transacciones > 0, 1, 0) ]

  ## Cantidad de tarjetas total
  dataset[, ctarjetas := rowSums(.SD, na.rm = TRUE), .SDcols = c("ctarjeta_visa", "ctarjeta_master")]

  ## Total seguros
  dataset[, cseguros := cseguro_vida + cseguro_auto + cseguro_vivienda + cseguro_accidentes_personales]

  ## Recibo pago de sueldo?
  dataset[, has_payroll := ifelse(dataset$cpayroll_trx + dataset$cpayroll2_trx  > 0, 1, 0) ]

  ## Total payroll
  dataset[, mpayroll_total := mpayroll + mpayroll2]

  ## Tiene débitos automáticos?
  dataset[, has_da := ifelse(dataset$ccuenta_debitos_automaticos + dataset$ctarjeta_visa_debitos_automaticos + dataset$ctarjeta_master_debitos_automaticos  > 0, 1, 0) ]

  ## cant pago mis cuentas?
  dataset[, has_pmc := ifelse(dataset$cpagomiscuentas  > 0, 1, 0) ]

  ## Total débitos automáticos
  dataset[, debitos_automaticos := mcuenta_debitos_automaticos + mttarjeta_visa_debitos_automaticos + mttarjeta_master_debitos_automaticos]

  ## Total Consumos y gastos
  dataset[, total_consumos := rowSums(.SD, na.rm = TRUE), .SDcols = c("mautoservicio", "mtarjeta_visa_consumo", "mtarjeta_master_consumo", "mpagodeservicios", "debitos_automaticos")]

  ## Total descuentos (sobre total de consumos?)
  dataset[, total_descuentos := rowSums(.SD, na.rm = TRUE), .SDcols = c("mtarjeta_visa_descuentos", "mtarjeta_master_descuentos", "mcajeros_propios_descuentos")]

  ## Descuentos sobre consumos
  dataset[, total_descuentos_sobre_consumos := ifelse(dataset$total_consumos == 0, 0, total_descuentos / total_consumos)]

  ## Total comisiones
  dataset[, has_comisiones := ifelse(dataset$ccomisiones_mantenimiento + dataset$ccomisiones_otras > 0, 1, 0) ]
  dataset[, total_comisiones := mcomisiones_mantenimiento + mcomisiones_otras]

  ## Balance transferencias
  dataset[, balance_transferencias := mtransferencias_recibidas - mtransferencias_emitidas]

  ## ¿hace más transacciones en cajeros de otros bancos?
  dataset[, cajeros_ajenos := ifelse(dataset$matm < dataset$matm_other, 1, 0)]

  ## ctrx quarter / cantidad de productos?
  dataset[, ctrx_x_producto := ctrx_quarter_normalizado / cproductos]

  ## comisiones / ctrx_quarter?
  dataset[, comisiones_x_trx := total_comisiones / (ctrx_quarter_normalizado + 1) ]

  # fechas tarjetas: llevo a años:
  dataset[, master_vencimiento := floor(dataset$Master_Fvencimiento/365)]
  dataset[, master_alta := floor(dataset$Master_fechaalta/365)]
  dataset[, visa_vencimiento := floor(dataset$Visa_Fvencimiento/365)]
  dataset[, visa_alta := floor(dataset$Visa_fechaalta/365)]

  ## limite de compra promedio
  dataset[, promedio_limite_compra := ifelse(dataset$ctarjetas == 0, 0, vm_mlimitecompra / ctarjetas) ]

  # pagado sobre saldo
  dataset[, pagado_sobre_saldo := ifelse(dataset$vm_msaldototal == 0, 0, vm_mpagado / vm_msaldototal) ]

  # consumo promedio
  dataset[, promedio_consumo := ifelse(dataset$vm_cconsumos == 0, 0, vm_mconsumototal /  vm_cconsumos) ]

  ## limite de compra sobre ingresos
  dataset[, limite_compra_sobre_ingresos := ifelse(dataset$mpayroll_total == 0, NA, vm_mlimitecompra / mpayroll_total) ]
  dataset[, limite_compra_sobre_activos := ifelse(dataset$total_activos == 0, NA, vm_mlimitecompra / total_activos) ]

  ## limite de compra real vs esperado según ingreso
  limite_esperado = median(dataset[mpayroll_total > 0, vm_mlimitecompra / mpayroll_total], na.rm=TRUE)
  dataset[, limite_compra_real_sobre_esperado := ifelse(dataset$total_activos == 0, NA, mpayroll_total * limite_esperado - vm_mlimitecompra) ]


  dataset[,"mmaster_consumo_transacciones_ratio"] = dataset[,"mtarjeta_master_consumo"] / dataset[,"ctarjeta_master_transacciones"]
  dataset[,"cmaster_descuentos_transacciones_ratio"] = dataset[,"ctarjeta_master_descuentos"] / (dataset[,"ctarjeta_master_transacciones"] + dataset[,"ctarjeta_master_debitos_automaticos"])
  dataset[,"mmaster_descuentos_transacciones_ratio"] = dataset[,"mtarjeta_master_descuentos"] / (dataset[,"mtarjeta_master_consumo"] + dataset[,"mttarjeta_master_debitos_automaticos"])
  dataset[,"mmaster_consumo_limite_ratio"] = dataset[,"mtarjeta_master_consumo"] / dataset[,"Master_mlimitecompra"]
  dataset[,"mmaster_consumo_limitef_ratio"] = dataset[,"mtarjeta_master_consumo"] / dataset[,"Master_mfinanciacion_limite"]

  dataset[,"mmaster_inicio_mora_s"] = dataset[,Master_Finiciomora < 180]
  dataset[,"mmaster_inicio_mora_a"] = dataset[,Master_Finiciomora < 360]
  dataset[,"mmaster_falta_s"] = dataset[,Master_fechaalta < 180]
  dataset[,"mmaster_falta_a"] = dataset[,Master_fechaalta < 360]
  dataset[,"mmaster_fvencimiento_q"] = dataset[,(Master_Fvencimiento > -90)]

  dataset[,"visa_vsaldo_limite"] = dataset[,"Visa_msaldototal"] / dataset[,"Visa_mlimitecompra"]
  dataset[,"visa_payroll_limite"] = dataset[,"mpayroll"] / dataset[,"Visa_mlimitecompra"]
  dataset[,"visa_saldo_limite"] = dataset[,"mcuentas_saldo"] / dataset[,"Visa_mlimitecompra"]

  dataset[,"visa_pagominimo_vsaldo"] = dataset[,"Visa_mpagominimo"] / dataset[,"Visa_msaldototal"]
  dataset[,"visa_pagominimo_limite"] = dataset[,"Visa_mpagominimo"] / dataset[,"Visa_mlimitecompra"]

  dataset[,"visa_adelanto_saldo"] = dataset[,"Visa_madelantopesos"] / dataset[,"Visa_msaldototal"]
  dataset[,"visa_adelanto_payroll"] = dataset[,"Visa_madelantopesos"] / dataset[,"mpayroll"]

  dataset[,"visa_payroll_saldo"] = dataset[,"mpayroll"] / dataset[,"Visa_msaldototal"]

  dataset[,"master_vsaldo_limite"] = dataset[,"Master_msaldototal"] / dataset[,"Master_mlimitecompra"]
  dataset[,"master_payroll_limite"] = dataset[,"mpayroll"] / dataset[,"Master_mlimitecompra"]
  dataset[,"master_saldo_limite"] = dataset[,"mcuentas_saldo"] / dataset[,"Master_mlimitecompra"]

  dataset[,"master_pagominimo_vsaldo"] = dataset[,"Master_mpagominimo"] / dataset[,"Master_msaldototal"]
  dataset[,"master_pagominimo_limite"] = dataset[,"Master_mpagominimo"] / dataset[,"Master_mlimitecompra"]

  dataset[,"master_adelanto_saldo"] = dataset[,"Master_madelantopesos"] / dataset[,"Master_msaldototal"]
  dataset[,"master_adelanto_payroll"] = dataset[,"Master_madelantopesos"] / dataset[,"mpayroll"]

  dataset[,"master_payroll_saldo"] = dataset[,"mpayroll"] / dataset[,"Master_msaldototal"]


  dataset[, "tenure_over_age"] = (dataset[, "cliente_antiguedad"] / 12) / dataset[, "cliente_edad"]


  dataset[, "master_vencimiento"] = dataset[, "Master_Fvencimiento"] / 365

  dataset[, "visa_vencimiento"] = dataset[, "Visa_Fvencimiento"] / 365

  dataset[, "master_alta"] = dataset[, "Master_fechaalta"] / 365

  dataset[, "visa_alta"] = dataset[, "Visa_fechaalta"] / 365

  # Variables by cliente_edad and cliente_antiguedad
  dataset[, "mpayroll_sobre_edad"] = dataset[, "mpayroll"] / dataset[, "cliente_edad"]
  dataset[, "mpayroll_sobre_antiguedad"] = dataset[, "mpayroll"] / dataset[, "cliente_antiguedad"]

  dataset[, "mpayroll2_sobre_edad"] = dataset[, "mpayroll2"] / dataset[, "cliente_edad"]
  dataset[, "mpayroll2_sobre_antiguedad"] = dataset[, "mpayroll2"] / dataset[, "cliente_antiguedad"]

  dataset[, "vm_mfinanciacion_limite_sobre_edad"] = dataset[, "vm_mfinanciacion_limite"] / dataset[, "cliente_edad"]
  dataset[, "vm_mfinanciacion_limite_sobre_antiguedad"] = dataset[, "vm_mfinanciacion_limite"] / dataset[, "cliente_antiguedad"]

  dataset[, "vm_msaldototal_sobre_edad"] = dataset[, "vm_msaldototal"] / dataset[, "cliente_edad"]
  dataset[, "vm_msaldototal_sobre_antiguedad"] = dataset[, "vm_msaldototal"] / dataset[, "cliente_antiguedad"]

  dataset[, "vm_msaldopesos_sobre_edad"] = dataset[, "vm_msaldopesos"] / dataset[, "cliente_edad"]
  dataset[, "vm_msaldopesos_sobre_antiguedad"] = dataset[, "vm_msaldopesos"] / dataset[, "cliente_antiguedad"]

  dataset[, "vm_msaldodolares_sobre_edad"] = dataset[, "vm_msaldodolares"] / dataset[, "cliente_edad"]
  dataset[, "vm_msaldodolares_sobre_antiguedad"] = dataset[, "vm_msaldodolares"] / dataset[, "cliente_antiguedad"]

  dataset[, "vm_mconsumospesos_sobre_edad"] = dataset[, "vm_mconsumospesos"] / dataset[, "cliente_edad"]
  dataset[, "vm_mconsumospesos_sobre_antiguedad"] = dataset[, "vm_mconsumospesos"] / dataset[, "cliente_antiguedad"]

  dataset[, "vm_mconsumosdolares_sobre_edad"] = dataset[, "vm_mconsumosdolares"] / dataset[, "cliente_edad"]
  dataset[, "vm_mconsumosdolares_sobre_antiguedad"] = dataset[, "vm_mconsumosdolares"] / dataset[, "cliente_antiguedad"]

  dataset[, "vm_mlimitecompra_sobre_edad"] = dataset[, "vm_mlimitecompra"] / dataset[, "cliente_edad"]
  dataset[, "vm_mlimitecompra_sobre_antiguedad"] = dataset[, "vm_mlimitecompra"] / dataset[, "cliente_antiguedad"]

  dataset[, "vm_madelantopesos_sobre_edad"] = dataset[, "vm_madelantopesos"] / dataset[, "cliente_edad"]
  dataset[, "vm_madelantopesos_sobre_antiguedad"] = dataset[, "vm_madelantopesos"] / dataset[, "cliente_antiguedad"]

  dataset[, "vm_madelantodolares_sobre_edad"] = dataset[, "vm_madelantodolares"] / dataset[, "cliente_edad"]
  dataset[, "vm_madelantodolares_sobre_antiguedad"] = dataset[, "vm_madelantodolares"] / dataset[, "cliente_antiguedad"]

  dataset[, "vm_mpagado_sobre_edad"] = dataset[, "vm_mpagado"] / dataset[, "cliente_edad"]
  dataset[, "vm_mpagado_sobre_antiguedad"] = dataset[, "vm_mpagado"] / dataset[, "cliente_antiguedad"]

  dataset[, "vm_mpagospesos_sobre_edad"] = dataset[, "vm_mpagospesos"] / dataset[, "cliente_edad"]
  dataset[, "vm_mpagospesos_sobre_antiguedad"] = dataset[, "vm_mpagospesos"] / dataset[, "cliente_antiguedad"]

  dataset[, "vm_mpagosdolares_sobre_edad"] = dataset[, "vm_mpagosdolares"] / dataset[, "cliente_edad"]
  dataset[, "vm_mpagosdolares_sobre_antiguedad"] = dataset[, "vm_mpagosdolares"] / dataset[, "cliente_antiguedad"]

  dataset[, "vm_mconsumototal_sobre_edad"] = dataset[, "vm_mconsumototal"] / dataset[, "cliente_edad"]
  dataset[, "vm_mconsumototal_sobre_antiguedad"] = dataset[, "vm_mconsumototal"] / dataset[, "cliente_antiguedad"]

  dataset[, "vm_cconsumos_sobre_edad"] = dataset[, "vm_cconsumos"] / dataset[, "cliente_edad"]
  dataset[, "vm_cconsumos_sobre_antiguedad"] = dataset[, "vm_cconsumos"] / dataset[, "cliente_antiguedad"]

  dataset[, "vm_cadelantosefectivo_sobre_edad"] = dataset[, "vm_cadelantosefectivo"] / dataset[, "cliente_edad"]
  dataset[, "vm_cadelantosefectivo_sobre_antiguedad"] = dataset[, "vm_cadelantosefectivo"] / dataset[, "cliente_antiguedad"]

  dataset[, "vm_mpagominimo_sobre_edad"] = dataset[, "vm_mpagominimo"] / dataset[, "cliente_edad"]
  dataset[, "vm_mpagominimo_sobre_antiguedad"] = dataset[, "vm_mpagominimo"] / dataset[, "cliente_antiguedad"]
```

Link github: https://github.com/IlicicAxel/dm2023b/blob/main/Experimentos/workflow-inicial_1/z621_DR_corregir_drifting.r

## 4. Feature Engineering Intra Mes. Variables derivadas de un random forest

### Grupo A

Link del video: https://www.youtube.com/watch?v=dofkXW6UAbw

**Resultado**

Si cambiaban los parámetros, se hacía más lento y obtenían la misma ganancia

### Grupo B

Link del video: https://www.loom.com/share/4e4990302e584e06888573de1694d11e

**Resultado**

Según el autor hay que usar este método -> hellinger y sample fraction con 0.8 https://github.com/MatiasFlores96/dm2023b/blob/main/src/workflow-10/631_FE_historia_10.r

## 5. Feature Engineering Histórico Épico

### Grupo A

Link del video: https://www.youtube.com/watch?v=LC0-xgBZM9I

**Resultado**

1. Siempre usar deltas ON
2. Aumentar la cantidad de lags no aumenta la ganancia

### Grupo B

Link del video: 

**Resultado**

1. No usar variables móviles
2. Usar una tendencia 6 meses

## 6. ¿La técnica de reducción de variable Boruta mejora la ganancia? ¿Cómo se compara contra los canarios asesinos?

### Grupo A

Link del video: https://www.youtube.com/watch?v=2sm3TEwXcho

**Resultado**

Usar canaritos con Ratio: 1.3 y desvío: 4

Igual ojo porque en su github su experimento tiene ratio 1 https://github.com/naylamreina/dm2023b/blob/main/src/workflow-inicial/exp04/631_FE_historia_04.r

### Grupo B

Link del video: https://www.youtube.com/watch?v=B4xfm9OkBIQ

**Resultado**

La técnica de Canarios asesinos es mucho más rápida, aunque Boruta produce los mismos resultados.

github: https://gist.github.com/itba-fcastaneda/c32aab82aa852e5f8a8a40b4f17a82e7

## 7. Utilización de los meses de pandemia

### Grupo A

Link del video: https://www.loom.com/share/3e2802af647c4e65a27ddcb4ddea1255

**Resultado**

No encontraron mejores resultados que el workflow inicial. Aclaran que no hicieron muchas pruebas.

### Grupo B

Link del video: https://drive.google.com/file/d/1Dp1vjnlVh9m-Hks-rQccqh9b6Hlg7hg4/view

**Resultado**

La prueba 1 con esta combinación de meses le dio mejor

```
PARAM$future <- c(202107)
PARAM$final_train <- c(
  202105, 202104, 202103, 202102,
  202101, 202012, 202011, 202010, 202008, 202006, 202004, 202002,  
  201912, 201911, 201910, 201909, 
  201908, 201907
)

PARAM$train$training <- c(
  202103, 202102, 202101,
  202012, 202011, 202010, 202008, 202006, 202004, 202002, 201912, 201911,
  201910, 201909, 201908, 201907, 201906, 201905
)

PARAM$train$validation <- c(202104)
PARAM$train$testing <- c(202105)
```

Link github: https://github.com/jzungri/dm2023b/tree/1a47bed63c674d0b20173ce81cd846b68170db1e/src/workflow-inicial

Consideraciones: Lo compara con un workflow inicial base que le dio 65 millones.

## 8. Estrategia de entrenamiento: ¿Cómo afecta un Testing en dos o más meses?

### Grupo A

Link del video: https://www.youtube.com/watch?v=dLUoWmAphM4

**Resultado**

El workflow inicial era la combinación más robusta.

### Grupo B

Link del video: https://www.loom.com/share/61fb7ea1b487442e908c712202bc3e36?sid=d5273053-a6a9-4e7b-835a-7fa467cdbb66

**Resultado**

El workflow inicial era la combinación más robusta.

## 9. Elegir inteligentemente mes de testeo en la optimización bayesiana

### Grupo A

Link del video: https://www.loom.com/share/50fe231e4a33488181ad8c11d0d0330c?sid=a4efdb34-7e92-476e-a392-fb0afc5edf86

**Resultados:**

El mejor rendimiento fue con los siguientes meses:

```
PARAM$train$training <- c(
202103, 202102, 202101, 202012, 202011, 202010, 202009, 202008, 202002, 202001, 201912, 201911, 201910, 201909, 201908, 201907, 201906, 201905
)
PARAM$train$validation <- c(202104)
PARAM$train$testing <- c(202105)
```
Consideraciones: hizo pocas pruebas.

### Grupo B

Link del video: https://www.loom.com/share/d9f6e69e54cc4ceeb879624bcb5a8ed0?sid=d74323bf-d104-4c8d-9b83-23d6ae3dd05b

**Resultados:**

No consiguió superar workflow inicial

## 10. Estabilidad del modelo predictivo frente al undersampling

### Grupo A

Link del video: https://www.youtube.com/watch?v=u2yQ7cPK95E

**Resultados:**

Usar un undersampling del 5%

Link del github: https://github.com/hbaragli/dm2023b/tree/experimentos_colaborativos/Experimento_base

### Grupo B

Link del video: https://www.youtube.com/watch?v=x1U860Jx1Rs

**Resultados:**

No obtuvo ganancia