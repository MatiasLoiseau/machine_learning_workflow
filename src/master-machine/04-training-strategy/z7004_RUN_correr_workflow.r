# Corrida general del workflow

options(error = function() {
  traceback(20)
  options(error = NULL)
  stop("exiting after script error")
})


# corrida de cada paso del workflow

# primeros pasos, relativamente rapidos
source("~/machine_learning_workflow/src/master-machine/04-training-strategy/z7104_CA_reparar_dataset.r")
source("~/machine_learning_workflow/src/master-machine/04-training-strategy/z7204_DR_corregir_drifting.r")
source("~/machine_learning_workflow/src/master-machine/04-training-strategy/z7304_FE_historia.r")
source("~/machine_learning_workflow/src/master-machine/04-training-strategy/z7404_TS_training_strategy.r")
source("~/machine_learning_workflow/src/master-machine/04-training-strategy/z7504_HT_lightgbm.r")
source("~/machine_learning_workflow/src/master-machine/04-training-strategy/z7604_ZZ_final_semillerio.r")
