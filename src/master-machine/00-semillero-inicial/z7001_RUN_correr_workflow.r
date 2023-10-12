# Corrida general del workflow

options(error = function() {
  traceback(20)
  options(error = NULL)
  stop("exiting after script error")
})


# corrida de cada paso del workflow

# primeros pasos, relativamente rapidos
source("~/machine_learning_workflow/src/workflow-semillerio/z7101_CA_reparar_dataset.r")
source("~/machine_learning_workflow/src/workflow-semillerio/z7201_DR_corregir_drifting.r")
source("~/machine_learning_workflow/src/workflow-semillerio/z7301_FE_historia.r")
source("~/machine_learning_workflow/src/workflow-semillerio/z7401_TS_training_strategy.r")
source("~/machine_learning_workflow/src/workflow-semillerio/z7501_HT_lightgbm.r")
source("~/machine_learning_workflow/src/workflow-semillerio/z7905_ZZ_final_semillerio.r")
source("~/machine_learning_workflow/src/workflow-semillerio/z7906_HB_semillerios_hibridacion.r")
