boxplot(mpg$hwy)

boxplot(mpg$hwy)$stats

mpg$hwy <-ifelse(mpg$hwy<12 | mpg$hwy>37, NA, mpg$hwy)
table(is.na(mpg$hwy))

library(dplyr)
mpg %>% group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy, na.rm = T))

# 혼자서 해보기

mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10,14,58,93), "drv"] <- "k"
mpg[c(29, 43, 129, 203), "cty"] <- c(3,4,39,42)

# Q1.
table(mpg$drv)
mpg$drv <- ifelse(mpg$drv == "k", NA, mpg$drv)
table(mpg$drv)

# Q2.
boxplot(mpg$cty)$stats
mpg$cty <- ifelse(mpg$cty<9 | mpg$cty > 26, NA, mpg$cty)
boxplot(mpg$cty)$stats

# Q3.
mpg %>% filter(!is.na(drv) & !is.na(cty)) %>% 
  group_by(drv) %>%
  summarise(mean_cty = mean(cty))
  