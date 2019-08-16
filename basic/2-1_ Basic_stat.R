#==================#
# 02. 기초통계분석 #
#==================#

###############
# 1. 기술통계 #
###############

## (4) 자료의 요약

# (b) 질적자료 요약 기법 사례
library(MASS)
data(survey)

# frequency table
table(survey$Smoke)

# pie chart
smoke<-table(survey$Smoke)
pie(smoke)

#bar chart
barplot(smoke)

# contingency table
table(survey$Sex,survey$Smoke)


# (d) 양적 자료 요약 기법 사례
data(mtcars)

# histogram
hist(mtcars$mpg)

#stem and leaf 
stem(mtcars$hp)

#line graph
library(ggplot2)
ggplot(BOD, aes(x=BOD$Time, y=BOD$demand)) + geom_line()

#scatter plot
ggplot(mtcars,aes(x=mtcars$hp, y=mtcars$wt)) + geom_point()


## (5) 자료의 요약: 중심위치
#상자도표 사례
boxplot(mtcars$disp, mtcars$hp)


## (6) 자료의 요약 사례
data(iris)
head(iris)
summary(iris)
mean(iris$Petal.Width)
median(iris$Petal.Width)
sd(iris$Petal.Width)    # standard deviation
var(iris$Petal.Width)
quantile(iris$Petal.Width, 1/4)   # 1st quadrant
quantile(iris$Petal.Width, 3/4)   # 3rd quadrant
max(iris$Petal.Width)
min(iris$Petal.Width)


###########################
# 2. Correlation Analysis #
###########################

## (5) 상관분석의 사례

library(Hmisc)   # install : install.packages(“Hmisc”)
library(ggplot2)  # install : install.packages(“ggplot2”)
data(airquality)
aq<-na.omit(airquality)
head(aq)

g <- ggplot(aq, aes(Ozone,Temp))
g + geom_point() + geom_smooth(method="lm")

# (a) cor(): 두변수
cor(aq$Ozone, aq$Temp)

# (b) cor(): dataset에 포함된 모든 변수
cor(aq[,c(1:4)])  # mtcars 

# (c) cov()
cov(aq[,c(1:4)])

# (d) 피어슨상관분석
cor(as.matrix(aq[,c(1:4)]),method="pearson")

# (e) 스피어만 서열척도 예제(2013년 프로야구 선수 기록 발췌)
Player<-c("LSY","CHW","KHS","BBH","KJH","NJW","CJ")
BT <- c(443,511,434,450,450,435,434)
H2 <- c(24,28,23,17,21,18,18)
HR <- c(13,29,16,37,22,21,28)
BB <- c(30,47,62,92,68,62,64)
SO <- c(94,91,71,96,109,70,109)
data1 <- data.frame(BT,H2,HR,BB,SO)
rownames(data1)<-Player
rcorr(as.matrix(data1), type="spearman")

# (f) 켄달  예제
cor(data1, method="kendall")

####################
# 3. 회귀분석 개념 #
####################

## (8) 단순회귀분석 사례

# regression analysis
data(cars)

# scatter plot
plot(cars$speed, cars$dist)

# correlation analysis
cor.test(cars$speed, cars$dist)

# 회귀분석 실시
m <- lm(dist~speed, data=cars)
summary(m)

# test
par(mfrow=c(2,2))
plot(m)
par(mfrow=c(1,1))

plot(cars$speed, cars$dist) # visualize regession model
abline(coef(m))


######################
# 4. 회귀분석의 종류 #
######################

## (5) 다중회귀분석 사례

# multiple linear Regression
data(iris)

# scatter plot matrix
plot(iris[,1:4])

# correlation analysis
cor(iris[,1:4])

rs <- lm( Sepal.Length~Sepal.Width + Petal.Length + Petal.Width ,data=iris)

summary(rs)

par(mfrow=c(2,2))
plot(rs)
par(mfrow=c(1,1))


############################
# 5. 최적회귀방정식의 선택 #
############################

## (4) 모델선택 사례
data(mtcars)

# forward selection
step(lm(disp~1,data=mtcars), direction="forward", scope=(~mpg+cyl+hp+drat+wt))

# backward selection
step(lm(disp~mpg+cyl+hp+drat+wt,data=mtcars), direction="backward")

# both
step(lm(disp~mpg+cyl+hp+drat+wt,data=mtcars), direction="both")
