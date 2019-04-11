library(dplyr)
exam <- read.csv("csv_exam.csv")
exam %>% arrange(math)  # math 오름차순 정렬 
# 높은 값-> 낮은 값으로 내림차순 정렬 시 desc() 적용  
exam %>% arrange(desc(math))  # math 내림차순 정렬 
exam %>% arrange(class, math)  # class 및 math 오름차순 정렬 

#chap 06-4 혼자서 해보기 
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
mpg
mpg_audi <- mpg %>% filter(manufacturer == "audi")
head(mpg_audi)
mpg_audi %>% arrange(desc(hwy))
head(mpg_audi %>% arrange(desc(hwy)),5)
