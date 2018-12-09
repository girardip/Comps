library(tidyverse)
inflationData = read.csv("inflacaoMetro.csv", skip = 3)[-1,]
inflationData = inflationData[1:8,]
inflationData = inflationData %>% gather(2:ncol(inflationData), key = "Month", value = "Inflation")
colnames(inflationData)[1] = "Region"
inflationData = arrange(inflationData,Region)
monthsPortuguese = c("jan", "fev", "mar", "abr", "mai",
                                      "jun", "jul", "ago", "set", "out",
                                      "nov", "dez")
inflationData = inflationData %>% mutate(year=as.integer(str_sub(Month, -4,-1)),
                                         Month=str_sub(Month, 1,3))
inflationData = inflationData %>% mutate(Month = match(inflationData$Month, monthsPortuguese))

write.csv(inflationData, "inflationCleaned.csv")
