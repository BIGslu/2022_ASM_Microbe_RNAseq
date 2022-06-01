2+2
3*2
6/3
2^3

height_inches <- 64
name <- "Kelly"
typeof(name)
typeof(height_inches)

num_plants <- 14L
typeof(num_plants)

likes_cats <- TRUE
typeof(likes_cats)
dislikes_cats <- FALSE
typeof(dislikes_cats)

cm_per_inch <- 2.54
height_cm <- height_inches * cm_per_inch
height_cm / cm_per_inch

dial_numbers <- c(1, 2, 3)
dial_numbers2 <- 1:10
typeof(dial_numbers)

fan_settings <- c("low", "medium", "high")
typeof(fan_settings)

fan_settings <- factor(c("low", "high", "medium", "high", "medium"), levels = c("low", "medium", "high"))
typeof(fan_settings)

getwd()
Sys.Date()
sum(2, 3)
2+3
sum(2,3,4,5,6)
?sum

round(3.1415)
round(3.1415, digits = 2)
round(3.1415, 3)

library(tidyverse)

meta <- read_csv("0_data/metadata.csv")
head(meta)
tail(meta)
View(meta)
dim(meta)
nrow(meta)
ncol(meta)

meta$ptID
meta["ptID"]
meta[2, "ptID"]
meta[1:4, "ptID"]
meta[1:4,]
meta[1:4, c("ptID", 'condition')]
# how would you subset rows 10 through 15 and the columns libID, methylation, and total_seq
meta[10:15, c("libID", "methylation", "total_seq")]

