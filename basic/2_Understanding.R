#====================#
# 01.통계분석의 이해 #
#====================#

###############
# 7. Sampling #
###############
# sample() 표본추출 함수 
sample(1:100,5) # 비복원추출(default) - 랜덤으로 1~100까지 5개 숫자 추출  
sample(1:100,5,replace=T) # 복원추출이므로 같은 숫자 5개 나올 수도 있음 
sample(1:100,5,replace=T,prob=1:100) # 가중치 부여 표본이 뽑힐 확률 부여 

install.packages("sampling")  # 데이터변환 - 개수축소 패키지 
library(sampling)
data(iris)

# 비복원 층화추출 - 층별로 다른 수의 표본 추출 
x<-strata(c("Species"),size=c(2,2,2),method="srswor",data=iris)
# srswor =  simple random sampling without replacement 비복원 단순 임의 추출 
getdata(iris,x)

# 복원 층화추출
x<-strata(c("Species"),size=c(2,2,2),method="srswr",data=iris)
# srswr = 복원 단순 임의 추출 
getdata(iris,x)

# 그룹별로 데이터에 대한 기술통계량을 구하거나, 정렬하거나, 
# 표본을 추출할 때에 유용한 함수를 제공하는 패키지
install.packages("doBy")
library(doBy)

# 계통 샘플 추출
x<-data.frame(x=1:100)
sampleBy(~1, frac=.3, data=x,systematic=T) # 그룹별로 표본추출하기
## 사용법 : sampleBy(formula=, frac=, replace=, systematic=, data=)
## formula는 다양한 형태의 수식을 지정
## frac은 추출한 표본의 비율이며, 기본은 10%
## replace은 복원추출 여부를 의미하며, TRUE는 복원, FALSE는 비복원
## systematic은 계통추출 여부를 의미하며, TRUE는 계통추출, FALSE는 임의추출

## 계통추출 : 모집단의 모든 요소에 일련번호를 붙이고, 처음 하나의 표본을 임의추출하고, ## 일정한 간격으로 추출하는 방법이다. 


###############
# 9. 확률분포 #
###############난수 'random number'
# 난수발생: 평균이 10 이고, 표준편차가256인 정규분포 5개 난수 발생
rnorm(5, mean=10, sd=256)

# 확률계산: 평균이 0 이고, 표준편차가 1인 표준정규분포에서 X<=0의 확률
pnorm(0,mean=0,sd=1)

# 표준정규분포에서 누적확률이 0.9인 x
qnorm(0.9, mean=0,sd=1)

# 표준정규분포에서 누적확률이 0.95인 x
qnorm(0.95, mean=0,sd=1)

# 표준정규분포에서 누적확률이 0.99인 x
qnorm(0.99, mean=0,sd=1)

# 확률밀도함수: 표준정규분포 확률밀도함수에서 x=0의 확률
dnorm(0, mean=0, sd=1)
dnorm(0)

# 표준정규분포 그리기
plot(density(rnorm(100000,0,1)))


#########################
# 11.추정과 검정의 사례 #
#########################
# (1) 단일 표본 평균에 대한 추정 및 검정사례
x<-rnorm(1000)
x
t.test(x)

# (2) 2개 표본 평균에 대한 추정 및 검정 사례
data(sleep)
sleep # 최면성 약물을 10명의 환자에게 투여했을 때 수면 시간의 증가를 기록 
# 두 모집단의 모평균 차이에 대한 추정과 검정 : t-test
# 방법 1 : x ~ factor, data = data.frame // var.equal => 등분산 검정 
t.test(extra~group, data=sleep, paired=F, var.equal=T)
t.test(extra~group, data=sleep, paired=T, var.equal=T)

# (3) 기타 사례
# 이표본분산 - 두 모집단으로부터의 표본으로부터 분산을 구해 두 모집단의 분산이 
# 동일한지를 알아보는 방법
data(iris)
var.test(iris$Sepal.Width,iris$Sepal.Length) #  꽃받침 너비와 길이에 대한 분산비교 
# var.test() 두 집단의 분산비 σ1/σ2에 대한 가설 검정을 수행
# p-value = 3.595e-14 => 0에 한없이 가까워지는 수 두 표본의 분산은 같지 않다.  
# (귀무가설 기각) 

# 일표본비율 => 두 모집단의 모비율 차이에 대한 추정과 검정
# yes/no, success/failure로 구분이 되는 범주형 변수에 대해 집단 간 차이가 있는지 확인 
prop.test(42,100)
# prob.test(x, n, alternative = c("two.sided", "less", "greater"), conf.level= 0.95)
# x => Number of events / n => Number of trials / conf.level 95% 신뢰구간 

# 예제 )  A회사 직장인 500명과 B회사 직장인 600명을 대상으로 조사를 한 결과,     #
# A회사 직장인의 흡연율은 33%, B회사 직장인의 흡연율은 41%로 나타났다.           #
# 그러면 A회사와 B회사 직장인의 흡연율(proportion of smokers)에는 차이가 있다고  #
# 할 수 있는지 유의수준 (significance level) 5% 에서 검정하시오.                 #

#귀무가설 Ho : A회사와 B회사의 흡연율은 차이가 없다 (p1 - p2 = 0)
#대립가설 H1 : A회사와 B회사의 흡연율은 차이가 있다 (p1 - p2 != 0)

# prop <- c(0.33, 0.41)   => proportion of events
# n <- c(500, 600)        =>number of trials
# x <- prop*n             =>number of events

binom.test(42,100) # 이항검정을 수행하고 결과를 알려주는 R언어 함수

# 이표본비율(귀무가설: 성공,실패의 확률이 같다)
prop.test(c(44,55),c(100,90))

# 상관계수 검정: 양측검정에서 0.05이하면 귀무가설 기각
cor.test(c(1,2,3,4,5),c(1,0,3,4,5),method="pearson")

# 독립성 검정
install.packages("survey")
library(survey)
library(MASS)
s.tab<-xtabs(~Sex+Exer,data=survey) # 분할표
s.tab
chisq.test(s.tab)  # 카이제곱 검정 

# 정규분포의 값인지 검정
shapiro.test(rnorm(1000))

# 정규분포인지 검정
ks.test(rnorm(100),runif(100))