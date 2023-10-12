# Corrida general del workflow

options(error = function() {
  traceback(20)
  options(error = NULL)
  stop("exiting after script error")
})


# corrida de cada paso del workflow

# primeros pasos, relativamente rapidos
source("~/machine_learning_workflow/src/master-machine/01-experimentos-colaborativos/z7101_CA_reparar_dataset.r")
source("~/machine_learning_workflow/src/master-machine/01-experimentos-colaborativos/z7201_DR_corregir_drifting.r")
source("~/machine_learning_workflow/src/master-machine/01-experimentos-colaborativos/z7301_FE_historia.r")
source("~/machine_learning_workflow/src/master-machine/01-experimentos-colaborativos/z7401_TS_training_strategy.r")
source("~/machine_learning_workflow/src/master-machine/01-experimentos-colaborativos/z7501_HT_lightgbm.r")
source("~/machine_learning_workflow/src/master-machine/01-experimentos-colaborativos/z7601_ZZ_final_semillerio.r")
