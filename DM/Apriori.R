# Apriori 예제: 기저귀와 맥주 
# 1. 데이터 로드 
x <- data.frame( beer=c(0,1,1,1,0),
                 bread=c(1,1,0,1,1),
                 cola=c(0,0,1,0,1),
                 diapers=c(0,1,1,1,1),
                 eggs=c(0,1,0,0,0),
                 milk=c(1,0,1,1,1) )

x

# 2. arules 패키지를 설치한다. (apriori함수를 이용하기위해 설치) 
install.packages("arules")
library(arules) 
trans <- as.matrix(x,"Transaction")
trans 

# 3. apriori 함수를 이용해서 연관관계를 분석한다
rules <- apriori(trans, parameter=list(supp=0.2, conf=0.6, target = "rules")) 
rules
# support: 지지도, confidence:신뢰도, lift: 향상도, count
inspect(sort(rules)) 
