library(tidyverse)

meta <- read_csv("0_data/metadata.csv")

summarize(meta, mean_age_days = mean(age_dys))

meta %>% 
  summarize(mean_age_days = mean(age_dys))

meta_summarized <- meta %>% 
  summarize(mean_age_days = mean(age_dys))

meta %>% 
  group_by(sex) %>% 
  summarize(mean_age_days = mean(age_dys))

meta %>% 
  select(ptID, age_dys)

meta %>% 
  select(-ptID_old)

meta <- meta %>% 
  select(-ptID_old)

meta %>% 
  mutate(age_yrs = age_dys / 365.25)

meta <- meta %>% 
  mutate(age_yrs = age_dys / 365.25)

# create a new column total_seq_millions based on total_seq
meta <- meta %>% 
  mutate(total_seq_millions = total_seq / 1000000)

meta %>% 
  filter(condition == "Media")

# == eqal
# != not equal
# < less than
# > greater than
# <= less than or equal to
# >= greater than or equal to

meta %>% 
  filter(condition != "Mtb")

meta %>% 
  filter(condition == "media")

# & and
meta %>% 
  filter(condition == "Media" & total_seq_millions > 7)

# | or
meta %>% 
  filter(sex == "M" | age_yrs >= 21)

# plotting with ggplot
meta %>% 
  ggplot() +
  aes(x = age_yrs, y = total_seq, color = condition) +
  labs(x = "Age (years)", y = "Total sequences") +
  geom_point()

meta %>% 
  ggplot() +
  aes(x = condition, y = total_seq) +
  geom_boxplot()

meta %>% 
  ggplot() +
  aes(x = libID, y = total_seq, fill = condition) +
  geom_col() +
  coord_flip()


meta %>% 
  ggplot() +
  aes(x = ptID, y = total_seq, fill = condition) +
  geom_col(position = position_dodge())


seq_per_lib_plot <- meta %>% 
  ggplot() +
  aes(x = ptID, y = total_seq, fill = condition) +
  geom_col(position = position_dodge())

ggsave("seq_per_lib.png", plot = seq_per_lib_plot)


# intro tidyr
meta_wide <- meta %>% 
  select(-libID, -total_seq_millions) %>% 
  pivot_wider(names_from = condition, values_from = total_seq)

meta_wide %>% pivot_longer(c(Media, Mtb), names_to = "condition", values_to = "total_seq")

meta %>% 
  select(-libID, -total_seq_millions) %>% 
  pivot_wider(names_from = condition, values_from = total_seq, names_prefix = "total_seq_")

## read seq data
count <- read_csv("0_data/raw_counts.csv")
count_long <- count %>% 
  pivot_longer(-hgnc_symbol, names_to = 'libID', values_to = "raw_count")

full_data <- inner_join(meta, count_long, by = "libID")
