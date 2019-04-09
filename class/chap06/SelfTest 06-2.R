# < 혼자서 해보기 >
# Q1.
mpg<-as.data.frame(ggplot2::mpg)
install.packages("dplyr")
library(dplyr)
install.packages("ggplot2")
library(ggplot2)
displ1 <- mpg %>% filter(displ<=4)
displ1
displ2 <- mpg %>% filter(displ>=5)

mean(displ1$hwy)
mean(displ2$hwy)

# Q2.
audi <- mpg %>% filter(manufacturer == "audi")
toyota <- mpg %>% filter(manufacturer == "toyota")

mean(audi$cty)
mean(toyota$cty)

# Q3.
mpg_manufacturer <- mpg %>% filter(manufacturer %in% c("chevrolet", "ford", "honda"))
mean(mpg_manufacturer$hwy)
