# Corrida general del workflow

options(error = function() {
  traceback(20)
  options(error = NULL)
  stop("exiting after script error")
})


# corrida de cada paso del workflow

# primeros pasos, relativamente rapidos
source("~/machine_learning_workflow/src/master-machine/05-pandemia/z7105_CA_reparar_dataset.r")
source("~/machine_learning_workflow/src/master-machine/05-pandemia/z7205_DR_corregir_drifting.r")
source("~/machine_learning_workflow/src/master-machine/05-pandemia/z7305_FE_historia.r")
source("~/machine_learning_workflow/src/master-machine/05-pandemia/z7405_TS_training_strategy.r")
source("~/machine_learning_workflow/src/master-machine/05-pandemia/z7505_HT_lightgbm.r")
source("~/machine_learning_workflow/src/master-machine/05-pandemia/z7605_ZZ_final_semillerio.r")
