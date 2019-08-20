#===============================#
# 분류분석 (Classification) #
# 이미 정의된 유한한 범주를 분류하는 분석으로, CRM에서 캠페인에 반응할 고객과 
# 반응하지 않을 고객으로 분류하거나 부실기업 예측 등에 활용. 

# 분류예측하고자 하는 타겟 값을 0 또는 1, A 또는 B, C로 설정하고 
# 입력변수들을 이용하여 타겟을 분류예측하는 패턴을 파악하는 방법. 

# 1. 잘 정의된 변수와 충분한 training set을 확보하는 것이 분석의 성공에 key factor이다.

# 2. 활용 분야 
# (1) CRM 캠페인 반응할 고객 분류
# (2) 금융기관 대출 고객의 대출한도액 분류, 카드사 고객의 우량, 불량 분류
# (3) 다수의 범주형 변수의 병합을 통한 범주 축소, 연속형 변수의 이산화
# (4) 주식의 상승 및 하락 예상 종목 분류, 부실기업 예측 등 

# 3. 모형과 R패키지
# (1) 의사결정나무(Decision Tree): party, rpart, randomForest
# (2) 최근접 이웃(Nearest Neighborhood): kknn
# (3) 신경망 분석(Neural Network): nnet
# (4) 지지도벡터기계(Support Vector Machine): e1071
# (5) caret(Classification And Regression Tree): caret
# (6) 베이지안 정리(Bayesian Theorem): LearnBayes

# 4. party패키지 분석사례 
#############################

# (a) data load
install.packages("HDclassif")
library(HDclassif)
data(wine)터
# 이탈리아의 3가지의 다른 품종으로 만들어진 와인에 대해
# 13가지 구성요소로 화학분석한 data
head(wine)
str(wine)

# (b) 목적 변수 범주화와 구성 확인 
wine$class<-factor(wine$class)
table(wine$class)

# (c) data 분리 - 7:3으로 train set과 validation set으로 분리 
set.seed(2020) # 난수 생성에 초기값 지정 
ind<-sample(2,nrow(wine),replace=TRUE, prob=c(0.7,0.3))
table(ind)

tr_wine<-wine[ind==1,]
val_wine<-wine[ind==2,]

str(tr_wine)

# (d) party package load 
install.packages("party")
library(party)

# (e) Training model
mdl_party<-ctree(class~., data=tr_wine)
# mdl_party에 class를 타겟으로 하고, 나머지 변수를 투입변수로 하여 모델 개발하는 공식 
str(mdl_party)

mdl_party@tree # model (text)

mdl_party@where # node of train set

mdl_party@get_where(newdata=val_wine) # node of validation set

# (f) Visulization 위 내용을 시각화 
plot(mdl_party)
plot(mdl_party,terminal_panel = node_barplot)
# 해석 : ROOT NODE가 V7(1)이 되고, NODE는 V7(1), V11(2), V1(5), V6(7), 
# NOde3, 4, 6, 8, 9이고, 잎은 Node3, 4, 6, 8, 9이 된다.

# Node8에 대한 설명은, 
# train set에서 V7>1.39, V1>13.03, V6<=2.45인 8개 항목이 Node 8에 속해있고, 8개 중  
# class가 1인 것이 0.5*8= 4개, class가 2인 것이 0.375*8=3개, 3인 것이 0.125*8=1개이다.
# 즉, 이 잎에 속한 개체는 모두 class 1로 분류되며, 전체 잎들 중에 가장 분류가 제대로 
# 안된 leaf라고 할 수 있다. 반면 다른 리프는 대체적으로 잘 분류되었음.

plot(mdl_party,type = "simple")
plot(mdl_party,terminal_panel = node_terminal)

# (g) performance check - train set
res_tr<-table(predict(mdl_party),tr_wine$class) # predict를 이용해 분류결과 확인가능 
res_tr/sum(res_tr)

# Accuracy 정확성 계산 
sum(diag(res_tr))/sum(res_tr)

# precision 정밀도 계산 
res_tr[1,1]/sum(res_tr[1,])
res_tr[2,2]/sum(res_tr[2,])
res_tr[3,3]/sum(res_tr[3,])

# detect rate(sensitivity) 탐지율 계산 
res_tr[1,1]/sum(res_tr[,1])
res_tr[2,2]/sum(res_tr[,2])
res_tr[3,3]/sum(res_tr[,3])

# (h) performance - validation set
res_val<-table(predict(mdl_party,newdata=val_wine),val_wine$class)
res_val/sum(res_val)

# Accuracy
sum(diag(res_val))/sum(res_val)

# precision
res_val[1,1]/sum(res_val[1,])
res_val[2,2]/sum(res_val[2,])
res_val[3,3]/sum(res_val[3,])

# detect rate
res_val[1,1]/sum(res_val[,1])
res_val[2,2]/sum(res_val[,2])
res_val[3,3]/sum(res_val[,3])

### 모델 평가
# Confusion Matrix
# party 패키지를 이용한 wine data분석에서 사용한 res_tr과 res_val을 도출한 결과가  
# Confusion Matrix를 이용한 모델 평가로 table(A,B)에서 A가 row를 형성하여 예측 값이 
# row로 들어가며, B는 실제 값으로 column에 들어간다. Confusion Matrix를 통해 
# accruracy, precision, detect rate등이 정확성 지표를 도출할 수 있다. 
