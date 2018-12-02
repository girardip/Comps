library(lodown)

pnad_cat <-
  get_catalog( "pnad" ,
               output_dir = file.path( path.expand( "Data/" ) , "PNAD" ) )
pnad_cat <- subset( pnad_cat , year%in%!c(1992,1993,2007:2009, 2011, 2013:2015) )
# download the microdata to your local computer
pnad_cat <- lodown( "pnad" , pnad_cat )
options( survey.lonely.psu = "adjust" )

# or for complete data:
lodown( "pnad" , output_dir = file.path( path.expand( "Data/" ) , "PNAD_COMPLETE" ) )


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

