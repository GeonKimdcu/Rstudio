#혼자서 해보기

library(dplyr)
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212), "hwy"] <- NA

# Q1.
table(is.na(mpg$drv))
table(is.na(mpg$hwy))

# Q2.
mpg %>% filter(!is.na(hwy)) %>% 
  group_by(drv) %>%
  summarise(hwy_mean = mean(hwy))
