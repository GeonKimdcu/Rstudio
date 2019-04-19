library(dplyr)

exam %>% arrange(math)   // 오름차순( 낮은 값 -> 높은 값) 
exam %>% arrange(desc(math))   // 내림차순( 높은 값 -> 낮은 값)
exam %>% arrange(class, math)

# 혼자서 해보기

# Q1.
mpg <- as.data.frame(ggplot2::mpg)
mpg %>% filter(manufacturer == "audi") %>%
  arrange(desc(hwy)) %>% 
  head(5)
