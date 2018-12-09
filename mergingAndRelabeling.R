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

download_sourceData("PNAD", 2012, unzip = T)
install.packages("devtools")
install.packages("stringi") 
devtools::install_github("lucasmation/microdadosBrasil")
library('microdadosBrasil')
d2 <- read_PNAD("pessoas", 2012, file = "PNAD_reponderado_2012_20150814/2012/Dados/PES2012.TXT")
saveRDS(d2, "Data/PNAD/PNAD2012.rds")
# https://downloads.ibge.gov.br/downloads_estatisticas.htm?caminho=Trabalho_e_Rendimento/Pesquisa_Nacional_por_Amostra_de_Domicilios_continua/Trimestral/Microdados/



# try 2 

pnad112 = read_PNADcontinua("pessoas", i = "2012-1q", file = "Data/PNAD_CONT/PNADC_012012_20180816.txt")
