library(dicionariosIBGE)
library(tidyverse)
data("dicPNAD2012")
pnad2013 = readRDS("Data/PNAD/2013 main.rds")

dicpes2012


relabeling_colnames = function(pnad_pesquisa, pnad_dic){
  pnadNames = colnames(pnad_pesquisa)
  for (i in 1:length(pnadNames)){
    for (j in 1:length(pnad_dic$cod)){
      if (str_to_upper(pnadNames[i])==pnad_dic$cod[j]) {
        pnadNames[i]=pnad_dic$desc[j]
      }
    }
  }
  colnames(pnad_pesquisa) = pnadNames
}

# it seems that this is it:
# V4750
# 12
# REND. MENSAL FAM. PER CAPITA