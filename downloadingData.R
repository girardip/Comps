library(lodown)
# examine all available PME microdata files
pme_cat <-
  get_catalog( "pme" ,
               output_dir = file.path( path.expand( "Data/" ) , "PME" ) )

# 2016 only
pme_cat <- subset( pme_cat , year < 2010 )
# download the microdata to your local computer
pme_cat <- lodown( "pme" , pme_cat, 
                   output_dir = file.path( path.expand( "Data/" ) , "Data/PME" ))

# or for complete data:
lodown( "pme" ,output_dir = file.path( path.expand( "Data/" ) , "PME" ) )


library(survey)

pme_df <- readRDS( file.path( path.expand( "Data/" ) , "PME" , "pme 2016 01.rds" ) )


#  OR

# Carregando a bilbioteca para auxiliar no download dos dados
library(downloader)

# Escolhendo o diretório no qual armazenará os microdados
setwd("Data/")

# Escolher o ano da PNAD
years.to.download <- c(2015)

# Script mestre para cuidar de todas as etapas do download
source_url( "https://raw.githubusercontent.com/ajdamico/asdfree/master/Pesquisa%20Nacional%20por%20Amostra%20de%20Domicilios/download%20all%20microdata.R" , prompt = FALSE , echo = TRUE )


# NAH TRY THIS https://rpubs.com/BragaDouglas/335574

