# Chapter 02

# 1.Vector
c(1:20) # combine value 함수
1:20    # c() 함수와 동일
c(1,2,3,4,5)  # c(1:5)와 동일

seq(1, 10, 2)  # sequence value 함수 -> 1부터 10까지 2씩 증가

rep(1:3, 3)  # replicate value 함수
rep(1:3, each = 3)  # each는 각 자료가 반복할 횟수를 지정

x <- c(1,3,5,7)
y <- c(3, 5)
union(x, y)   # x와 y의 합집합
setdiff(x, y)  # x에는 있는데, y에는 없는 값(1, 7)
intersect(x, y)  # x와 y에 공통으로 있는 값(3, 5)

v1 <- c(33, -5, 20:23, 12, -2:3)
v2 <- c("홍길동", "이순신", "유관순")
v3 <- c(T, TRUE, FALSE, T, TRUE, F, T)
v1;v2;v3

v4 <- c(33, 05, 20:23, 12, "4")   # 자료형이 혼합된 경우
v4   # 데이터가 문자형으로 변형된다.

v1; mode(v1); class(v1)  # numeric
v2; mode(v2); class(v2)  # character
v3; mode(v3); class(v3)  # logical

age <- c(30, 35, 40)
age
names(age) <- c("홍길동", "이순신", "강감찬") # 칼럼명 지정
age
age <- NULL # 벡터 객체를 메모리에서 제거(NULL값 대입)

a <- c(1:50)  # 벡터 객체 생성
a[10:45]      # 10에서 45사이의 벡터 원소 출력
a[19: (length(a) - 5)] # 10부터의 벡터 전체 길이에서 5를 뺸 길이(45)만큼 출력

a[1,2]  # 잘못된 첨자를 사용하는 경우

v1 <- c(13, -5, 20:23, 12, -2:3)  # 벡터 객체 생성 
v1[1]  # 벡터 객체의 1번째 원소 출력
v1[c(2,4)] # 벡터 객체의 2번째 원소와 4번째 원소 출력
v1[c(3:5)]  # 벡터 객체의 3~5번째 원소 출력
v1[c(4, 5:8, 7)]  # 콤마와 세미콜론으로 v1 벡터 객체의 원소 출력
v1[-1]; v1[-c(2,4)]; v1[-c(2:5)]; v1[-c(2, 5:10, 1)]

install.packages("RSADBE")
library(RSADBE)

data(Severity_Counts) # RSADBE 패키지에서 제공되는 데이터셋 가져오기
str(Severity_Counts) # 데이터셋 구조보기
Severity_Counts  # 데이터셋 보기

# 2. Matrix
m <- matrix(c(1:5))
m   # 열을 기준으로 행렬 객체가 만들어진다.

m <- matrix(c(1:10), nrow = 2) # 열 우선으로 2행 2열의 행렬 객체 생성
m

m <- matrix(c(1:11), nrow = 2)  # 열 우선으로 2행 2열의 행렬 객체 생성
m

m <- matrix(c(1:10), nrow = 2, byrow = T)  # byrow = T 행우선
m

x1 <- c(5, 40, 50:52)
x2 <- c(30, 5, 6:8)
mr <- rbind(x1, x2)  # 행 묶음으로 matrix 객체 생성
mr

mc <- cbind(x1, x2)  # 열묶음으로 matrix 객체 생성
mc

m3 <- matrix(10:19, 2) # 10개 데이터를 2행으로 하여 행렬 객체 생성
m4 <- matrix(10:20, 2) # error 발생 : 데이터 개수가 홀수

m3
mode(m3); class(m3)

m3[1,]
m3[,5]
m3[2,3]
m3[1, c(2:5)]
x <- matrix(c(1:9), nrow = 3, ncol = 3)
x
length(x) # 행렬 객체의 전체 원소 개수를 반
ncol(x); nrow(x) # 열 수와 행 수를 반

apply(x, 1, max)
apply(x, 1, min)
apply(x, 2, mean)

f <- function(x) {
  x*c(1,2,3)
}
result <- apply(x, 1, f)
result

result <- apply(x, 2, f)
result

colnames(x) <- c("one", "two", "three")
x

vec <- c(1:12)
arr <- array(vec, c(3,2,2))
arr
arr[,,1]
arr[,,2]

library(RSADBE)
data("Bug_Metrics_Software")
str(Bug_Metrics_Software)

Bug_Metrics_Software
