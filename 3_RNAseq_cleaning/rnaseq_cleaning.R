#Load packages
library(tidyverse)
library(edgeR)
library(limma)
library(RNAetc)

#Load data
meta <- read_csv("0_data/metadata.csv")
count <- read_csv("0_data/raw_counts.csv")

#QC
head(meta)

ggplot(meta, aes(x = libID, y = total_seq)) +
  geom_col() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  geom_hline(yintercept = 1E6)

#Protein-coding
ensembl <- biomaRt::useEnsembl(biomart = "ensembl", dataset = "hsapiens_gene_ensembl",
                               mirror = "www")
key <- biomaRt::getBM(attributes = c("hgnc_symbol","gene_biotype"), mart = ensembl)
head(key)

attrib <- biomaRt::listAttributes(ensembl)

key.filter <- key %>% 
  filter(gene_biotype == "protein_coding") %>%  # the same as ==
  filter(hgnc_symbol %in% count$hgnc_symbol)

count.pc <- count %>% 
  filter(hgnc_symbol %in% key.filter$hgnc_symbol)

# PCA
count.for.pca <- count.pc %>% 
  column_to_rownames("hgnc_symbol") %>% 
  #counts per million
  cpm(log = TRUE) %>% 
  #transpose
  t()

PCA <- prcomp(count.for.pca, scale.=TRUE, center=TRUE)
summary(PCA)

as.data.frame(PCA$x) %>% 
  ggplot(aes(x = PC1, y = PC2)) +
  geom_point(size=3)

# PCA outliers
PCA.summ <- as.data.frame(PCA$x) %>% 
  rownames_to_column("libID") %>% 
  pivot_longer(-libID) %>% 
  group_by(name) %>% 
  summarise(meanPC = mean(value),
            sdPC = sd(value))
head(PCA.summ)

#ifelse(a,b,c)
# if a is TRUE, make value equal to b. else make it equal to c
PCA2 <- as.data.frame(PCA$x) %>% 
  mutate(outlier = ifelse(
    PC1 > -0.250 + 3*67.4 |
      PC1 < -0.250 - 3*67.4 |
      PC2 > 0.362 + 3*46.1 |
      PC2 < 0.362 - 3*46.1,
    "outlier","okay"
  ))
head(PCA2)


PCA2 %>% 
  ggplot(aes(x = PC1, y = PC2, color=outlier)) +
  geom_point(size=3)

#Add metadata for coloring
as.data.frame(PCA$x) %>% 
  rownames_to_column("libID") %>% 
  inner_join(meta)  %>% 
  
  ggplot(aes(x = PC1, y = PC2, color = condition)) +
  geom_point(size=3)

#edgeR package
count.pc.mat <- count.pc %>% 
  column_to_rownames("hgnc_symbol") %>% 
  as.matrix()
head(count.pc.mat)

dat <- DGEList(counts = count.pc.mat, samples = meta, genes = key.filter)
typeof(dat)
class(dat)

dat$samples
dat$genes
dat$samples$libID

#Low abundance
mv1 <- voom(dat, plot=TRUE)

dat.abund <- filter_rare(dat, min.CPM = 0.5, min.sample = 3, 
                         gene.var = "hgnc_symbol")

mv2 <- voom(dat.abund, plot=TRUE)

#check if important genes pass filtering
"IFNG" %in% rownames(dat.abund$counts)

dim(dat.abund)

#Normalization
#trimmed mean of means
dat.abund.norm <- calcNormFactors(dat.abund, method = "TMM")

# voom log2 counts per million with weights
# limma package

mm <- model.matrix(~ condition, data = dat.abund.norm$samples)
mm

dat.abund.norm.voom <- voomWithQualityWeights(dat.abund.norm,
                                              design = mm,
                                              plot = TRUE)

# final data
dat.abund.norm.voom$targets

save(dat.abund.norm.voom, file = "0_data/dat_voom.RData")

#IFNG data for modeling
IFNG <- as.data.frame(dat.abund.norm.voom$E) %>% 
  rownames_to_column("hgnc_symbol") %>% 
  filter(hgnc_symbol == "IFNG") %>% 
  pivot_longer(-hgnc_symbol, names_to = "libID", values_to = "E") %>% 
  full_join(dat.abund.norm.voom$targets, by="libID")
IFNG
