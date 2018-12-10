library(tidyverse)
setwd("PME/")
# does not run
df <- list.files(pattern = ".rds") %>%
  map_dfr(readRDS)

# try own for loop
reduced_list = list.files(pattern = ".rds")[1:10]
reduced_df = map_dfr(reduced_list, readRDS)


# for loop for converting large csv files into smaller csv files with only variables of interest
reduced_list = list.files(pattern = ".rds")[1:10]
for (file in filelist){
  
}