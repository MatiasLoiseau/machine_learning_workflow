# Corrida general del workflow

options(error = function() {
  traceback(20)
  options(error = NULL)
  stop("exiting after script error")
})


# corrida de cada paso del workflow

# primeros pasos, relativamente rapidos
source("~/machine_learning_workflow/src/master-machine/03-undersampling-95/z7103_CA_reparar_dataset.r")
source("~/machine_learning_workflow/src/master-machine/03-undersampling-95/z7203_DR_corregir_drifting.r")
source("~/machine_learning_workflow/src/master-machine/03-undersampling-95/z7303_FE_historia.r")
source("~/machine_learning_workflow/src/master-machine/03-undersampling-95/z7403_TS_training_strategy.r")
source("~/machine_learning_workflow/src/master-machine/03-undersampling-95/z7503_HT_lightgbm.r")
source("~/machine_learning_workflow/src/master-machine/03-undersampling-95/z7603_ZZ_final_semillerio.r")
