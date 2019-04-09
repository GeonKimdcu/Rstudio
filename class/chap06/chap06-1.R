install.packages("dplyr")
exam <- read.csv("csv_exam.csv")
#dplyr 패키지를 통해 데이터 가공 
library(dplyr)
exam <- read.csv("csv_exam.csv")
exam

# filter() 이용해 행 추출  
exam %>% filter(class==1)   # exam에서 class가 1인 경우만 추출해 출력 
exam %>% filter(class == 2)
exam %>% filter(class!=1)   # 1반이 아닌 경우 
exam %>% filter(class !=3)
exam %>% filter(math >50)   # 수학 점수가 50점을 초과한 경우 
exam %>% filter(math <50)
exam %>% filter(english>=80)  #영어 점수가 80점 이상인 경우 
exam %>% filter(english <=80)

# 여러조건 충족하는 행 추출하기 
exam %>% filter(class == 1 & math >=50)  #1반이면서 수학 점수가 50점 이상인 경우 
exam %>% filter(class == 2 & english >= 80)
#여러 조건 중 하나 이상 충족하는 행 추출하기 
#수학점수가 90점 이상이거나 영어 점수가 90점 이상인 경우
exam %>%  filter(math >= 90 | english >= 90)
exam %>% filter(english < 90 | science < 50)
# 목록에 해당하는 행 추출하기 
exam %>% filter(class ==1 | class ==3 | class ==5)
# 1, 3, 5반에 해당하면 추출 
exam %>% filter(class %in% c(1,3,5)) # 1,3,5 반에 해당하면 추출 
# %in%기호와 c()함수를 이용해 조건 목록 입력 