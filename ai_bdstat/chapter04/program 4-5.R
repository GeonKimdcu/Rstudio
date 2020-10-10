# Chapter 04
# 5. 주요 내장함수
# 5.1 기술통계량 처리 관련 내장함수

install.packages("RSADBE")
library(RSADBE)

data("Bug_Metrics_Software")
Bug_Metrics_Software

rowSums(Bug_Metrics_Software[,,1])
rowMeans(Bug_Metrics_Software[,,1])
colSums(Bug_Metrics_Software[,,1])
colMeans(Bug_Metrics_Software[,,1])

seq(-2, 2, by = .2)
vec <- sample(1:100, 20, replace = T) # 복원추출 사용
vec
max(vec)
range(vec)
mean(vec)
median(vec)
sum(vec)
sd(rnorm(10)) # 정규분포 자료 10개(랜덤 추출)를 대상으로 표준편차 구하기
table(vec)
rank(vec)
summary(vec)
vec
order(vec, decreasing = F) # 내림차순
sort(vec)


n <- 100
rnorm(n, mean = 0, sd = 1)

hist(rnorm(n, mean = 0, sd = 1))

n <- 1000
runif(n, min = 0, max = 10)
hist(runif(n, min = 0, max = 10))

n <- 20
rbinom(n, 1, prob = 1/2)
rbinom(n, 2, 0.5)
rbinom(n, 10, 0.5)
n <- 1000
rbinom(n, 5, prob = 1/6)

rnorm(5, mean = 0, sd = 1)
set.seed(123)
rnorm(5, mean = 0, sd = 1)
set.seed(123)
rnorm(5, mean = 0, sd = 1)
set.seed(345)
rnorm(5, mean = 0, sd = 1)

# 5.2 수학 관련 내장함수

vec2 <- 1:10
prod(vec2)
factorial(10)
abs(-5)
sqrt(16)
cumsum(vec2)
log(10)
log10(10)

# 5.3 행렬연산 관련 내장함수

x <- matrix(1:9, nrow = 3, ncol = 3, byrow = T)
y <- matrix(1:3, nrow = 3)
x
y
ncol(x)
nrow(x)
t(x)

cbind(x, 1:3)
rbind(x, 10:12)
diag(x)
det(x)
apply(x, 1, sum)
apply(x, 2, mean)
svd(x)
eigen(x)
x %*% y

# 5.4 집합연산 관련 내장함수
x <- c(1,3,5,7,9)
y <- c(3, 7)

union(x, y)
setequal(x, y)
intersect(x, y)
setdiff(x, y)
5 %in% y
