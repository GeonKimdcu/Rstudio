#=================#
# 02. 데이터 가공 #
#=================#

######################
# 1.Data Exploration #
######################

## (1) head
data(tips,package="reshape")
head(tips) # 최초 6 row 조회

## (2) Summary
summary(tips)

## (3) tabplot -> 데이터가 어떻게 입체적으로 분포되어있는지 확인 
install.packages("tabplot")
library(tabplot)
tableplot(tips, cex=1.8) # 좌표포인트 크기 조절하려면 cex의 인자값 조정 

#################
# 2. 변수중요도 #
#################

## (2) klaR 패키지의 greedy.wilks
# greedy.wilks는 모델링을 정의 -> 변수를 stepwise하게 투입
# -> 의미있는 변수를 순서대로 보여줌. 
# 효율적으로 정확도를 최소한으로 희생시키면서 초기 모델링을 빨리 실행하게 해줌.
install.packages("klaR")
library(klaR)
data(wine,package="HDclassif")
head(wine)

wine$class<-factor(wine$class)
gw_obj <- greedy.wilks(class ~ ., data = wine, niveau = 0.1)
# niveau -> F테스트의 유의수준 
gw_obj

## (3) klaR 패키지의 plineplot
# plineplot은 특정변수가 주어졌을 때 class가 어떻게 분류되는지 error rate를 돌려주고 
# graphical하게 결과를 보여주는 기능을 함.

wine_impVar <- wine[, c("V7","V10","class")]
plineplot(class ~ ., data = wine_impVar, method = "lda", x = wine_impVar$V7, xlab = "V7")
# 0~1: class3 / 1~2: class2,3 / 2~3: class1,2 / 3이상: class1

summary(wine$V7)
V7_breaks<-c(0,1,2,3,6)
wine$V7_bin<-cut(wine$V7,V7_breaks)
table(wine$class,wine$V7_bin)
# 클래스별 분포가 위의 결과와 일치 

plineplot(class ~ ., data = wine_impVar, method = "lda", x = wine_impVar$V10, xlab = "V10")

summary(wine$V10)
V10_breaks<-c(1,2,4,6,8,13)
wine$V10_bin<-cut(wine$V10,V10_breaks)
table(wine$class,wine$V10_bin)

## (4) klaR 패키지의 NaiveBayes -> 변수별 분포를 그래프로 나타냄 
mN <- NaiveBayes(class ~ ., data = wine[,c(1,8,11,14,2)])
par(mfrow=c(2,2)) # 그래프를 나누기 위한 함수 가로2, 세로2
plot(mN)
par(mfrow=c(1,1))

## (5) Binning -> 분류작업 
library(party)
data(wine,package="HDclassif") # wine데이터를 이용하기 위해 HDclassif packages 설치 
wine$class<-factor(wine$class)
summary(wine$V7)
wine$V7_c <- cut(wine$V7,10)

wine_ctr<-ctree(class ~.,data=wine)
plot(wine_ctr)

wine_ctr
