library(tidyverse)
library(lme4) #for linear mixed effects models
library(lmerTest) #p-values for lme

modelDat<-read_csv('0_data/IFNG.csv')

head(modelDat)

p <- ggplot(modelDat, aes(x = condition, y = E)) +
  geom_boxplot() +
  geom_jitter(shape = 16, position = position_jitter(0.2))+
  xlab("Condition") +
  ylab(expression(paste('Log'[2], " Expression")))
p

ttestRes <- t.test(E ~ condition, data = modelDat)
ttestRes

p <- modelDat %>% 
  ggplot(aes(x= condition, y = E, group = ptID)) +
  geom_line()
p

modelDatPair <- modelDat %>% 
  select(c(E, condition, ptID)) %>% 
  pivot_wider(names_from = condition, 
              values_from = E)
modelDatPair

ptTestRes<- t.test(modelDatPair$Mtb,
                   modelDatPair$Media,
                   paired = T)
ptTestRes

lmMod <- lm(E ~ condition, data = modelDat)
summary(lmMod)

head(modelDat)

lmModBig<- lm(E ~ condition + age_dys + sex, data = modelDat)
summary(lmModBig)

AIC(lmMod)
AIC(lmModBig)

BIC(lmMod)
BIC(lmModBig)

lmeMod <- lmer(E ~ condition + (1 | ptID), data = modelDat)
summary(lmeMod)

lmeModBig <- lmer(E~condition + age_dys + sex + (1 | ptID), data = modelDat)
summary(lmeModBig)

AIC(lmeMod)
AIC(lmeModBig)

AIC(lmMod)
AIC(lmeMod)
