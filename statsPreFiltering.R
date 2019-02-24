library(tidyverse)
library(data.table)
library(lme4)
library(stargazer)
library(xtable)

fullPME = fread("finalPME.csv") %>% 
  mutate(v035 = as.factor(v035))

fullPME = fullPME %>% mutate(Gender = as.factor(v203),
                                     Ethnicity = as.factor(v208),
                                     Literacy = as.factor(v301),
                                     Schooling = as.factor(v307),
                                     EmploymentType = as.factor(v409),
                                     idind = as.factor(idind)) %>% 
  select(-v040, -v050, -v203, -v208, -v301, -v307, -v409,
         -starts_with("vD"))
fullPME$Schooling = as.factor(ifelse(is.na(fullPME$Schooling), "NoSchooling", fullPME$Schooling))
levels(fullPME$Gender) = c("Male", "Female")
levels(fullPME$Ethnicity) = c("White", "Black", "Yellow", "Mixed", "Native", "Ignored")
levels(fullPME$Literacy) = c("Deleted by surveyor", "Yes", "No")
levels(fullPME$Schooling) = c("Primary", "HighSchool_1", "HighSchool_2",
                                  "MiddleSchool", "HighSchool_3", "College",
                                  "AdultsSchool", "PreSchool", "Graduate",
                                  "NoSchooling")
levels(fullPME$EmploymentType) = c("Domestic", "Employee", "Self-Employed",
                                   "Employer", "Work at home (unpaid)", "Volunteer") #note that people who own their own business don't report income


stargazer(fullPME[,-c(1,2,3,6,9,10,11,12,14,16,18,21)], digits=2, nobs = F, column.sep.width = "3pt")
print(xtable(summary(fullPME[,c(7:11)])), include.rownames = F)

indInAnalysis = unique(complete.df$idind)
fullPME$indInAnalysis = ifelse(fullPME$idind%in%indInAnalysis, T, F)

ggplot(fullPME)+
  geom_bar(aes(x=Gender,fill=Gender,y=(..count..)/sum(..count..), group=indInAnalysis),position="stack")+
  scale_fill_discrete("Legend_title")

