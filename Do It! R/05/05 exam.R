# p. 123 분석도전!
# Question 1> gglpot2의 midwest 데이터를 데이터 프레임 형태로 불러온 다음 데이터의 특징을 파악하세요.
library(ggplot2)
midwest <- as.data.frame(ggplot2::midwest)
midwest
head(midwest)
tail(midwest)
dim(midwest)
str(midwest)
summary(midwest)
View(midwest)

# Question 2> poptotal 변수를 total로, popasian 변수를 asian으로 수정하세요.
library(dplyr)
midwest <- rename(midwest, total = poptotal, asian = popasian)
midwest

# Question 3> total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 백분율' 파생변수를 만들고, 히스토그램을 만들어 어떻게 분포하는지 살펴보세요. 
midwest$ratio <- midwest$asian / midwest$total * 100
midwest$ratio
hist(midwest$ratio)

# Question 4> 아시아 인구 백분율 전체 평균을 구하고, 평균을 초과하면 'large', 그외에는 'small' 을 부여하는 파생변수를 만들어 보세요.
mean(midwest$ratio)
midwest$ratio_mean <- ifelse(midwest$ratio >= mean(midwest$ratio), "large", "small")
head(midwest)

# Question 5> "large" 와 "small"에 해당하는 지역이 얼마나 되는지 빈도표와 빈도 막대 그래프를 만들어 확인해보세요. 
table(midwest$ratio_mean)
qplot(midwest$ratio_mean)
