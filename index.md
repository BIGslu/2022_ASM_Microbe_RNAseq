# RNA-seq analysis in R

Welcome! This workshop takes you through RNA-seq differential gene expression analysis, from intro R to the tidyverse to RNA-seq specific tools. You **do not** need any prior experience in R or coding!

## Outline

* [Entire workshop][workshop]

Each lesson

* [0: Setup and installation][lesson0]
* [1: Intro to R and RStudio][lesson1]
* [2: Intro to the tidyverse][lesson2]
* [3: RNA-seq data cleaning][lesson3]
* [4.1: Linear modeling][lesson4.1]
* [4.2: RNA-seq linear modeling][lesson4.2]

## Instructors

[Kim Dill-McFarland, PhD](https://kdillmcfarland.github.io/) is a Senior Bioinformatician in the Div of Allergy and Infectious Diseases at the U of Washington. She received her PhD in microbiology from the U of Wisconsin-Madison. Kim now leads a team of bioinformaticians who use sequencing and other high-throughput techniques to research how the human immune system responds to diseases like tuberculosis, asthma, and COVID. Kim has been coding in R for more than 10 years and taught bioinformatics as an Instructor at the U of British Columbia as well as for the Carpentries and RLadies.

[Kelly Sovacool](https://sovacool.dev/) is a Bioinformatics PhD candidate in Pat Schloss’ lab at the U of Michigan. She develops bioinformatics tools and data analysis pipelines for microbial ecology and host-associated microbiome research. She is a fan of open science, open source software, and reproducible research. When she’s not in the dry lab, you might find her running, cycling, climbing, or volunteering with Girls Who Code or the Carpentries.

[Holly Hartman, PhD](https://holly-hartman.com/) is an Assistant Professor in the Dept of Population and Quantitative Health Sciences at Case Western Reserve University. She received my PhD in biostatistics from the U of Michigan. Holly's current work is in understanding systemic drivers of racial disparities in prostate cancer outcomes. She also works on methodological improvements for clinical trial design and collaborates with clinicians to provide better care for patients. Her main goal is to use statistics to identify solutions to health disparities.

[Candace Williams, PhD](https://github.com/clw224) is a microbial ecologist at the San Diego Zoo Wildlife Alliance. She received her PhD in Molecular Biology with a minor in statistics at Mississippi State University where she studied the microbiome of the giant and red panda. Candace's current work aims to understand the microbial drivers of wildlife fitness in the growing anthropogenic landscape using multi-omic approaches, integrating both traditional and novel microbiological, analytical chemistry, and endocrinological methods. She is also passionate about open science, making tools/protocols that work for everyone across the globe, training the next generation of scientists through inclusive practices, and her dog Darby (not in any particular order!). 


## Additional resources

#### General workshops 

* [The Carpentries](https://carpentries.org/workshops/#workshop-curriculum) for workshops on R, python, command line, git, and more! Introductory through intermediate content.
* [EDUCE](https://educe-ubc.github.io/workshops/) for R workshops using microbial ecology data. Intro R, tidyverse, reproducible research, and statistics.

#### RNA-seq data analysis

* [SEAsnake](https://bigslu.github.io/SEAsnake/vignette/SEAsnake_vignette.html) for processing fastq sequences to counts data used in this workshop
    * Software at <https://github.com/BIGslu/SEAsnake>
* [limma](http://bioconductor.org/packages/devel/bioc/vignettes/limma/inst/doc/usersguide.pdf) for linear modeling (Chapter 15: RNA-Seq Data)
    * [voom weights](https://genomebiology.biomedcentral.com/articles/10.1186/gb-2014-15-2-r29) for correcting for sample and gene quality
* [dream](https://www.bioconductor.org/packages/devel/bioc/vignettes/variancePartition/inst/doc/dream.html) for paired sample designs
* [kimma](https://github.com/BIGslu/tutorials/blob/main/RNAseq/3.Hawn_RNAseq_voom.to.DEG.pdf) for flexible model design


***

[lesson0]: https://bigslu.github.io/2022_ASM_Microbe_RNAseq/0_welcome/0_install.html
[lesson1]: https://bigslu.github.io/2022_ASM_Microbe_RNAseq/1_introR/1_intro-R.html
[lesson2]: https://bigslu.github.io/2022_ASM_Microbe_RNAseq/2_tidyverse/2_tidyverse.html
[lesson3]: https://bigslu.github.io/2022_ASM_Microbe_RNAseq/3_RNAseq_cleaning/3_RNAseq_cleaning.html
[lesson4.1]: https://bigslu.github.io/2022_ASM_Microbe_RNAseq/4_linear_models/4.1_linear-models.html
[lesson4.2]: https://bigslu.github.io/2022_ASM_Microbe_RNAseq/4_linear_models/4.2_linear_model_rnaseq.html
[workshop]: https://bigslu.github.io/2022_ASM_Microbe_RNAseq/RNAseq_analysis_R.html
