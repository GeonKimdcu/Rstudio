# R 내장 함수로 데이터 추출하기 
library(dplyr)
exam <- read.csv("csv_exam.csv")

# 행 인덱스 추출 
exam[]
exam[1,]
exam[1:2,]
exam[exam$class == 1,]
exam[exam$class == 1 & exam$math >= 50,]

# 열 추출 
exam[,1]
exam[,1:3]
exam[, "class"]
exam[, c("class", "math", "english")]

# 동시 추출
exam[1,3]
exam[5, "english"]
exam[exam$math >= 50, "english"]

# dplyr과 내장 함수 차이
# Q. 수학점수 50점 이상, 영어 점수 80 이상인 학생들을 대상으로 각 반의 전 과목
# 총평균을 구하라.
# 내장 함수 코드 
exam$tot <- (exam$math + exam$english + exam$science) / 3
aggregate(data = exam[exam$math >= 50 & exam$english >= 80,], tot~class, mean)

# dplyr
exam %>% filter(math >= 50 & english >= 80) %>% 
  mutate(tot = (math+english+science)/3) %>% 
  group_by(class) %>% 
  summarise(mean = mean(tot))
