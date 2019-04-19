library(dplyr)

test1 <- data.frame(id = c(1,2,3,4,5),
                    midterm = c(60,80,70,90,85))
test2 <- data.frame(id = c(1,2,3,4,5),
                    final = c(70,83,65, 95, 80))
total <- left_join(test1, test2, by = "id")
total

name <- data.frame(class = c(1,2,3,4,5),
                   teacher = c("kim", "lee", "park", "chol", "jung"))
name
exam_new <- left_join(exam, name, by = "class")
exam_new

group_a <- data.frame(id = c(1,2,3,4,5),
                      test= c(60, 80, 70, 90, 85))
group_b <- data.frame(id = c(6,7,8,9,10),
                      test = c(70, 83, 65, 95, 80))
group_all <- bind_rows(group_a, group_b)
group_all

# 혼자서 해보기

fuel <- data.frame(fl = c("c", "d", "e", "p", "r"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)
fuel

# Q1.
 mpg <- left_join(mpg, fuel, by = "fl")
mpg
# Q2.
mpg %>% select(model, fl, price_fl) %>% 
  head(5)
