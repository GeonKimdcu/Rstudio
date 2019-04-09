# chap06-2 <혼자서해보기>
# Q1.
mpg<-as.data.frame(ggplot2::mpg)
install.packages("ggplot2")
library(ggplot2)
install.packages("dplyr")
library(dplyr)

test <- mpg %>% select(class, cty)
head(test)

test_suv <- test %>% filter(class == "suv")
test_compact <- test %>% filter(class=="compact")

mean(test_suv$cty)
mean(test_compact$cty)
