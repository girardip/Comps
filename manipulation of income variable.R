# manipulation of income variable

reduced_pme = read.csv("~/Comps/pme_reduced.csv")
reduced_pme = reduced_pme[,-c(1)]
names(reduced_pme) = c("Gender", "Month", "Household", "MetropolitanArea", "Income")

mean(is.na(reduced_pme$Income))
mean(reduced_pme$Income==0, na.rm=T) 
#there are people with income of 0. I will add $1 to all incomes so we don't have issues with log
# only getting the observations with income
percentiles_income = quantile(reduced_pme$Income, probs = 1:100/100, na.rm=T)# some percentiles are off at the very top (people making 10^9 reals)
reduced_pme = reduced_pme %>% filter(Income<1e6)
reduced_pme = reduced_pme[complete.cases(reduced_pme),]
reduced_pme$logIncome = log(reduced_pme$Income+1)
reduced_pme$MetropolitanArea = as.factor(reduced_pme$MetropolitanArea)
summary(reduced_pme)
