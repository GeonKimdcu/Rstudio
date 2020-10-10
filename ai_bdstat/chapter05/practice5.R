# Chapter 05
# 연습문제
# Q1.
data("iris3") # 3차원 배열 

# 조건 1|
attributes(iris3) # iris3 data set columns 확인

# 조건 2|
str(iris3) # iris3 structure 확인 

# 조건 3|
plot(iris3, main = "전체 데이터 셋의 분포현황")
plot(iris3[,c(3,1), 1], main = "iris3 Setosa 분포 현황")
plot(iris3[,c(4,2), 2], main = "iris3 Versicolor 분포 현황")
plot(iris3[,c(2,3), 3], main = "iris3 Virginica 분포 현황")


# Q2.
# 조건 1|
plot(iris[,1], iris[,3])
plot(iris$Sepal.Length, iris$Petal.Length, col = "red")

# 조건 2|
plot(iris[, 1], iris[,3], col=iris[,5])
names(iris)
plot(iris$Sepal.Length, iris$Petal.Length, col = iris$Species)

# 조건 3|
plot(iris$Sepal.Length, iris$Petal.Length, col = iris$Species)
title(main = "iris 데이터 테이블 산포도 차트")

# 조건 4|
getwd()
setwd("C:/Rwork/output")
jpeg("iris.jpg", width = 720, height = 480)
plot(iris$Sepal.Length, iris$Petal.Length, col = iris$Species)
title(main = "iris 데이터 테이블 산포도 차트")
dev.off() # 작업 종료 후 사진 저장 완료
