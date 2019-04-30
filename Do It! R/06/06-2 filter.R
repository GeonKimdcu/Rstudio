library(dplyr)
exam <- read.csv("csv_exam.csv")
# 조건에 맞는 데이터만 추출하기 filter() 이용 
exam %>% filter(class == 1)
exam %>% filter(class == 2)
exam %>% filter(class != 1) %>% head(5)
exam %>% filter(class !=1 & class!= 2)
# 초과, 미만, 이상, 이하 조건 걸기 
exam %>% filter(math >50)
exam %>% filter(english>=50)

# 여러 조건을 충족하는 행 추출하기 
exam %>% filter(class==1 & math>=50)
exam %>% filter(class==2 & english>=80)

# 여러 조건 중 하나 이상 충족하는 행 추출하기
exam %>% filter(math>=90 | english>=90)
exam %>% filter(english<90 | science <50)

# 목록에 해당하는 행 추출하기
exam %>%  filter(class==1 | class ==2 | class==3)
exam %>%  filter(class %in% c(1,3,5))  
# %in% 매치연산자 c()함께 이용하여 조건목록 입력!

# 추출한 행으로 데이터 만들기
class1 <- exam %>% filter(class==1)
class2 <- exam %>% filter(class ==2)
mean(class1$math)
mean(class2$math)
