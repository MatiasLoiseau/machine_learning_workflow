# Corrida general del workflow

options(error = function() {
  traceback(20)
  options(error = NULL)
  stop("exiting after script error")
})


# corrida de cada paso del workflow

# primeros pasos, relativamente rapidos
source("~/machine_learning_workflow/src/1-sin-tendencia/1_CA_reparar_dataset.r")
source("~/machine_learning_workflow/src/1-sin-tendencia/2_DR_corregir_drifting.r")
source("~/machine_learning_workflow/src/1-sin-tendencia/3_FE_historia.r")
source("~/machine_learning_workflow/src/1-sin-tendencia/4_TS_training_strategy.r")
source("~/machine_learning_workflow/src/1-sin-tendencia/5_HT_lightgbm.r")
source("~/machine_learning_workflow/src/1-sin-tendencia/6_ZZ_final.r")