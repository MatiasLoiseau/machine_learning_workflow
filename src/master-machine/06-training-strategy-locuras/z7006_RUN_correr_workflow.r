# Corrida general del workflow

options(error = function() {
  traceback(20)
  options(error = NULL)
  stop("exiting after script error")
})


# corrida de cada paso del workflow

# primeros pasos, relativamente rapidos
source("~/machine_learning_workflow/src/master-machine/06-training-strategy-locuras/z7106_CA_reparar_dataset.r")
source("~/machine_learning_workflow/src/master-machine/06-training-strategy-locuras/z7206_DR_corregir_drifting.r")
source("~/machine_learning_workflow/src/master-machine/06-training-strategy-locuras/z7306_FE_historia.r")
source("~/machine_learning_workflow/src/master-machine/06-training-strategy-locuras/z7406_TS_training_strategy.r")
source("~/machine_learning_workflow/src/master-machine/06-training-strategy-locuras/z7506_HT_lightgbm.r")
source("~/machine_learning_workflow/src/master-machine/06-training-strategy-locuras/z7606_ZZ_final_semillerio.r")
