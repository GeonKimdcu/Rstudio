#Q1
install.packages("ggplot2")
install.packages("dplyr")
library(ggplot2)
midwest
midwest <- as.data.frame(ggplot2::midwest)
midwest
str(midwest)
head(midwest)
tail(midwest)
View(midwest)
dim(midwest)
summary(midwest)
#Q2
library(dplyr)
midwest <- rename(midwest, total = poptotal)
midwest <- rename(midwest, asian = popasian)
midwest
#Q3
midwest$percentage <- (midwest$asian/midwest$total)*100
midwest
hist(midwest$percentage)
#Q4
mean(midwest$percentage)
midwest$test <- ifelse(midwest$percentage >= mean(midwest$percentage), "large", "small")
midwest 
#Q5..
table(midwest$test)
qplot(midwest$test)