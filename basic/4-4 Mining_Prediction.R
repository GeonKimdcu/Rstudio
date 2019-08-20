#===========================#
# 예측 분석 (Prediction) #

# 예측분석은 분류예측 방식을 연속형 값에 적용하는데 회귀분석과는 달리 
# 연속적인 값을 하나하나 예측하는 것이 아니라, 집단별로 평균값을 예측한다. 

# 1. 정의 

# 관찰 대상의 변수를 이용하여 연속적인 값을 에측하는 분석으로 분류 분석이 범주를 예측하는데 비해 예측분석은 연속적인 수치를 예측한다. 
# 활용분야: 금융기관 고객의 소득수준, 자녀의 키 등 연속적인 결과 값에 대한 예측 

# 2. party package load
install.packages("HDclassif")
install.packages("party")
library(HDclassif)
library(party)
data(wine)

str(wine)
table(wine$class)

# 난수 초기값 설정 
set.seed(2020)

# ind에 랜덤복원추출을 0.7, 0.3으로 두 set으로 나눈다. 
ind<- sample(2, nrow(wine), replace = TRUE, prob = c(0.7, 0.3))
# sample(replace = T ...복원추출 / F...비복원추출 )
table(ind)
ind

tr_wine <-wine[ind==1,]
val_wine <-wine[ind==2,]

mdl_party <- ctree(class~., data = tr_wine)
plot(mdl_party) # o -> outlier 이상치 
plot(mdl_party, type = "simple")

res_tr <- table(predict(mdl_party), tr_wine$class)
res_tr
# 결과 1, 2에서 outlier 있음. 
