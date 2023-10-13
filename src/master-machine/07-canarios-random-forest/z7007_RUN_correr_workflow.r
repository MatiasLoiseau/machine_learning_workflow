# Corrida general del workflow

options(error = function() {
  traceback(20)
  options(error = NULL)
  stop("exiting after script error")
})


# corrida de cada paso del workflow

# primeros pasos, relativamente rapidos
source("~/machine_learning_workflow/src/master-machine/07-canarios-random-forest/z7107_CA_reparar_dataset.r")
source("~/machine_learning_workflow/src/master-machine/07-canarios-random-forest/z7207_DR_corregir_drifting.r")
source("~/machine_learning_workflow/src/master-machine/07-canarios-random-forest/z7307_FE_historia.r")
source("~/machine_learning_workflow/src/master-machine/07-canarios-random-forest/z7407_TS_training_strategy.r")
source("~/machine_learning_workflow/src/master-machine/07-canarios-random-forest/z7507_HT_lightgbm.r")
source("~/machine_learning_workflow/src/master-machine/07-canarios-random-forest/z7607_ZZ_final_semillerio.r")
