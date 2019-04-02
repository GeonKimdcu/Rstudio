# P.113~114
df <- data.frame(var1 = c(4,3, 8),
                 var2 = c(2, 6, 1))
df

df$var_sum <- df$var1 + df$var2  #var_sum 파생변수
df

df$var_mean <- (df$var1 + df$var2)/2  # var_mean  파생변수 생성 
df

# P.115 mpg 통합 연비 변수 만들기
install.packages("ggplot2")      # P.106 참고  
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)

mpg$total <- (mpg$cty + mpg$hwy)/2  #통합 연비 변수 생성
head(mpg)

mean(mpg$total)   # 통합 연비 변수 평균

# P.116  조건문 활용
summary(mpg$total)  #요약 통계량 산출 
hist(mpg$total)     # 히스토그램 생성 

ifelse(mpg$total >= 20, "pass", "fail")
mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")  #20이상이면 pass, 아니면 fail
head(mpg, 20)    #데이터확인
table(mpg$test)   #연비 합격 빈도표 생

library(ggplot2) #ggplot2 로드 
qplot(mpg$test)  # 연비 합격 빈도 막대 그래프 생성 ..
