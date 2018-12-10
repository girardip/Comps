library(tidyverse)
library(data.table)

setwd("PME/")
# does not run
df <- list.files(pattern = ".rds") %>%
  map_dfr(readRDS)

# try own for loop
reduced_list = list.files(pattern = ".rds")[1:10]
reduced_df = map_dfr(reduced_list, readRDS)


csvWriter = function(filesList){
  for (file in filesList){
    partial_df = map_dfr(reduced_list, readRDS)
    write.csv(partial_df, file = paste0(str_sub(file, end = -4),"csv"))
  }
}


# reading and merging

listFiles =list.files("PME_csv/")
setwd("PME_csv/")
ab = F
for (file in listFiles){
  if (ab==F) {
    completePME = read_csv(file)
    ab=T
  }
  if (ab==T) {
    completePME = completePME %>%
      bind_rows(read_csv(file))
  }
}



# for loop for converting large csv files into smaller csv files with only variables of interest
reduced_list = list.files(pattern = ".rds")[1:10]
for (file in filelist){
  
}

fwrite(reduced_df, "~/Comps/reduced_df1.csv")

