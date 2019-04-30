# 06-2 혼자서 해보기

# Q1.
mpg <- as.data.frame(ggplot2::mpg)
library(dplyr)

mpg_a <- mpg %>% filter(displ <=4)
mean(mpg_a$hwy)
mpg_b <- mpg %>% filter(displ >=5)
mean(mpg_b$hwy)

# Q2.
mpg_audi <- mpg %>% filter(manufacturer == "audi")
mean(mpg_audi$cty)
mpg_toyota <- mpg %>% filter(manufacturer == "toyota")
mean(mpg_toyota$cty)

# Q3.
mpg_test2 <- mpg %>% filter(manufacturer %in% c("chevrolet", "ford", "honda"))
mean(mpg_test2$hwy) 
# filter(class %in% c(1,2,3)) 과 같은 형식 
