library(dplyr)

exam %>% select(math) %>% head
exam %>% select(class , math, english)
exam %>%  select(-math) %>% head
exam %>% select(-math, -english) %>% head  # -이용해서 변수 제외 

#dplyr 함수 조합하기
exam %>% filter(class == 1) %>% 
  select(english)

# 혼자서 해보기

# Q1.
mpg <- as.data.frame(ggplot2::mpg)
mpg_new <- mpg %>% select(class, cty)
head(mpg_new,5)

# Q2.
mpg_suv <- mpg_new %>% filter(class == "suv")
mpg_compact <- mpg %>% filter(class == "compact")
mean(mpg_suv$cty)
mean(mpg_compact$cty)
