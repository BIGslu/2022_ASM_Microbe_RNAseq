# Load packages
library(tidyverse)
library(limma)
library(kimma)

# Load data
# load("0_data/dat_voom.RData")
attach("0_data/dat_voom.RData")
dat <- dat.abund.norm.voom

#limma
mm_limma <- model.matrix(~ condition + sex, data = dat$targets)
mm_limma

dat$targets <- dat$targets %>% 
  mutate(sex = factor(sex, levels = c("M","F")))
mm_limma <- model.matrix(~ condition + sex, data = dat$targets)
mm_limma

fit_limma <- lmFit(dat$E, design = mm_limma, weight = dat$weights)
efit_limma <- eBayes(fit_limma)
fdr_limma <- topTable(efit_limma, number = Inf)
head(fdr_limma)

fdr_limma_mtb <- topTable(efit_limma, coef = "conditionMtb", number = Inf)
fdr_limma_sex <- topTable(efit_limma, coef = "sexF", number = Inf)
head(fdr_limma_mtb)
head(fdr_limma_sex)

fdr_limma_all <- extract_lmFit(design = mm_limma, fit = efit_limma)

# limma pseudo-paired design
#mean correlation between pairs
consensus.corr <- duplicateCorrelation(dat$E, design = mm_limma, 
                                       block = dat$targets$ptID)
consensus.corr$consensus.correlation

fit_limma2 <- lmFit(dat$E, design = mm_limma, weight = dat$weights,
                    block = dat$targets$ptID,
                    correlation = consensus.corr$consensus.correlation)
efit_limma2 <- eBayes(fit_limma2)
fdr_limma2 <- extract_lmFit(mm_limma, efit_limma2)

head(fdr_limma)
head(fdr_limma2)

# Compare FDR
temp <- fdr_limma_all %>% 
  select(gene, variable, FDR) %>% 
  filter(variable == "conditionMtb") %>% 
  rename(`limma` = FDR)

temp2 <- fdr_limma2 %>% 
  select(gene, variable, FDR) %>% 
  filter(variable == "conditionMtb") %>% 
  rename(limma_dupCor = FDR)

#Merge results and plot FDR
full_join(temp, temp2) %>% 
  ggplot(aes(x = `limma`, y = limma_dupCor)) +
  geom_point(alpha = 0.2) +
  geom_abline(intercept = 0, slope = 1, color = "red") +
  theme_classic() +
  coord_fixed() +
  labs(title = "FDR for Mtb vs media")

#Compare fit with sigma
data.frame(limma = efit_limma$sigma,
           limma_dupCor = efit_limma2$sigma) %>% 
  
  ggplot(aes(x=limma, y=limma_dupCor)) +
  geom_point(alpha = 0.2) +
  geom_abline(intercept = 0, slope = 1, color = "red")


# kimma
#Do not run
fit_kimma <- kmFit(dat, model = "~ condition + sex + (1|ptID)",
                   use.weights = TRUE,
                   run.lm = TRUE, run.lme = TRUE,
                   metrics = TRUE)
# lm model: expression~condition+sex
# lme/lmerel model: expression~condition+sex+(1|ptID)
# Input: 20 libraries from 10 unique patients
# Model: 20 libraries
# Complete: 13419 genes
# Failed: 0 genes

load("0_data/kimma_results.RData")
names(fit_kimma)

head(fit_kimma$lm)
head(fit_kimma$lm.fit)

fit_kimma_all <- full_join(fit_kimma$lm.fit, fit_kimma$lme.fit,
                           by="gene", suffix = c("_lm", "_lme"))
head(fit_kimma_all)

fit_kimma_all %>% 
  ggplot(aes(x = AIC_lm, y = AIC_lme)) +
  geom_point(alpha = 0.2) +
  geom_abline(intercept = 0, slope = 1, color = "red")
