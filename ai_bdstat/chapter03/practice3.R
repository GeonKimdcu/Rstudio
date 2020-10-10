# Chapter 03 연습문제

# Q1. 본문에서 작성한 titanic 변수를 다음과 같은 단계를 통해서 
# "titanic.csv"파일로 저장한 후 파일을 불러오시오.

# [step 1]
write.csv(titanic, "C:/Rwork/output/titanic.csv", row.names = F, quote = F)

# [step 2]
titanicData <- read.csv("C:/Rwork/output/titanic.csv")
titanicData

str(titanicData)

# [step 3]
head(titanicData[-c(1,3)])

# Q2. R에서 제공하는 CO2 데이터 셋을 대상으로 다음과 같은 단계로 파일에 저장하시오.

# [step 1]
data("CO2")
library(dplyr)
nonchilled <- CO2 %>% filter(Treatment == "nonchilled")
write.csv(nonchilled, "CO2_df1.csv", row.names = F)

# [step 2]
chilled <- CO2 %>% filter(Treatment == "chilled")
write.csv(chilled, "CO2_df2.csv", row.names = F)

# 저장 
save(titanic, file = "titanic.rda")
save(nonchilled, file = "nonchilled.rda")
save(chilled, file = "chilled.rda")
