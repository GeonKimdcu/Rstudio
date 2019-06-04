# 데이터준비
UniversalBank <- read.csv("UniversalBank.csv", header = T, stringsAsFactors = F)
# 불필요한 속성 제거 
UniversalBank <- UniversalBank[ , -c(1,5)]
# 데이터 확인 
str(UniversalBank)
head(UniversalBank)


# 60% 데이터는 train, 40% 데이터는 test로 구분하기
library(rpart)
library(caret)
set.seed(1000)   #reproducability setting 
intrain<-createDataPartition(y=UniversalBank$Personal.Loan, p=0.6, list=FALSE)  
train<-UniversalBank[intrain, ]
test<-UniversalBank[-intrain, ] 
# 의사결정나무 분석 
UniversalBank_mod<-rpart(Personal.Loan~., data = train, method="class")
plot(UniversalBank_mod)
text(UniversalBank_mod) 

# 교차검정 에러율로 모델 선택 
printcp(UniversalBank_mod) # 텍스트 형 
plotcp(UniversalBank_mod)  # 시각화 형

# 가지치기
test<-test[complete.cases(test),]
bank_tree<-prune(UniversalBank_mod, cp= UniversalBank_mod$cptable[which.min(UniversalBank_mod$cptable[,"xerror"]),"CP"])
plot(bank_tree)
text(bank_tree) 

# 예측 및 모델평가
library(e1071)
UniversalBank_part<-predict(bank_tree, test, type='class')

test$Personal.Loan <- as.factor(test$Personal.Loan)
levels(test$Personal.Loan) <- levels(UniversalBank_part)

confusionMatrix(UniversalBank_part, test$Personal.Loan) 


class(UniversalBank_part)
class(test$Personal.Loan)
str(test)
levels(UniversalBank_part)
levels(test$Personal.Loan)
