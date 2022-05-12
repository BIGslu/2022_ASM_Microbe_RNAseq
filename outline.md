# 2022 ASM Microbe RNAseq workshop outline
Times in PST

## Intro

8 - 8:20: Workshop and data intro: Kim

## Intro R & tidyverse

* 8:20 - 11: Kelly
* Intro R
    - R vs RStudio
    - Rprojects
    - R packages
    - `read.table`, `read.csv`
    - `help`
    - data types
        - condition as character vs factor
        - age as numeric
* Intro dplyr
    - syntax and pipes
    - select: remove unneeded variable (`ptID_old`), keep only needed variables
    - filter: media-only samples
    - mutate: convert `age_dys` to `age_yrs`
* Intro ggplot
    - syntax and `+`
    - build up to first data cleaning plot, total sequences per library
* Intro tidyr
    - pivot_ and join_

## Lunch 11-12

## Data cleaning of RNAseq

* 12 - 1: Kim
* sample quality filtering
    - total sequences, other metrics
* protein-coding genes
* PCA outliers
* low abundance genes
* normalization
    - TMM
    - voom CPM

## Linear modeling

* 1-3: Holly
*	Model selection
*	Assumptions
*	t-test -> lm -> lme4 on one gene
*	AIC and BIC
*	limma duplicateCorrelation [Kim]
*	kimma? [Kim]

Happy hour at ASM
