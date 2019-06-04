# tree 패키지 이용 
df<-read.csv('http://www-bcf.usc.edu/~gareth/ISL/Heart.csv')
str(df)
head(df)

install.packages("rpart")
library(rpart)
install.packages("caret")
library(caret)

set.seed(1000)   #reproducability setting
intrain<-createDataPartition(y=df$AHD, p=0.7, list=FALSE)
train<-df[intrain, ]
test<-df[-intrain, ] 

install.packages("tree")
library(tree)
treemod<-tree(AHD~. , data=train)
plot(treemod)
text(treemod) 

# rpart 패키지 이용 
library(rpart)
rpartmod<-rpart(AHD~. , data=train, method="class") # train 데이터 사용 
plot(rpartmod)  # 트리 모양 그림 생김 
text(rpartmod)  # 트리모양에 글자 추가 됨 

printcp(rpartmod)  # 텍스트로 cp값 나타냄. 분산 파악 
plotcp(rpartmod)   # 시각화로 cp값 나타냄. 분산 파악 

# 가지치기 
ptree<-prune(rpartmod, cp= rpartmod$cptable[which.min(rpartmod$cptable[,"xerror"]),"CP"])
# xerror값이 가장 낮은 값으로 설정 
plot(ptree) # 트리 모양 그림 생김 
text(ptree) # 트리모양에 글자 추가 됨

# rpart 모델로 test셋의 AHD를 예측하고 정확성을 평가 
rpartpred<-predict(ptree, test, type='class') 
install.packages("e1071")
library(e1071) # confusionMatrix로 정확성 예측하기 위해 "e1071" 패키지 필요 
confusionMatrix(rpartpred, test$AHD) # 정확성 예측 

# party 패키지
install.packages("party")
library(party)
partymod<-ctree(AHD~., data=train)
plot(partymod) 
partypred<-predict(partymod, test)
confusionMatrix(partypred, test$AHD) 
