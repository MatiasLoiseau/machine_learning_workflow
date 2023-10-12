# Corrida general del workflow

options(error = function() {
  traceback(20)
  options(error = NULL)
  stop("exiting after script error")
})


# corrida de cada paso del workflow

# primeros pasos, relativamente rapidos
source("~/machine_learning_workflow/src/master-machine/02-undersampling-40/z7102_CA_reparar_dataset.r")
source("~/machine_learning_workflow/src/master-machine/02-undersampling-40/z7202_DR_corregir_drifting.r")
source("~/machine_learning_workflow/src/master-machine/02-undersampling-40/z7302_FE_historia.r")
source("~/machine_learning_workflow/src/master-machine/02-undersampling-40/z7402_TS_training_strategy.r")
source("~/machine_learning_workflow/src/master-machine/02-undersampling-40/z7502_HT_lightgbm.r")
source("~/machine_learning_workflow/src/master-machine/02-undersampling-40/z7602_ZZ_final_semillerio.r")
