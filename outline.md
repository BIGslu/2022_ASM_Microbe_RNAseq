# 2022 ASM Microbe RNAseq workshop outline

## Intro R & tidyverse

* 9 - 12: Candace, Kelly
* Intro R
    - R vs RStudio
    - Rprojects
    - R packages
    - `read.table`, `read.csv`
    - `help`
    - data types
        - condition as character vs factor
        - age as numeric
* Intro tidyverse
    - syntax and pipes
    - select: remove unneeded variable (`ptID_old`), keep only needed variables
    - filter: media-only samples
    - mutate: convert `age_dys` to `age_yrs`
* Intro ggplot
    - syntax and `+`
    - build up to first data cleaning plot, total sequences per library

## Lunch 12-1

## Data cleaning of RNAseq

* 1 - 2: Kim
* sample quality filtering
    - total sequences, other metrics
* protein-coding genes
* PCA outliers
* low abundance genes
* normalization
    - TMM
    - voom CPM

## Linear modeling

* 2 - 4: Holly
*	Model selection
*	Assumptions
*	lm on one gene
*	lme4 on one gene with paired sample design
*	limma -> kimma [Kim]
*	AIC and BIC

## Gene set analysis

* if time allow: Kim
* GSEA
* clusterProfiler

Happy hour at ASM
