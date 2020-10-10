# Chapter 04
# 연습문제

# Q1
name <- c("유관순", "홍길동", "이순신", "신사임당")
gender <- c("F", "M", "M", "F")
price <- c(50, 65, 45, 75)

# 조건 1|
client <- data.frame(name, gender, price)
client

# 조건 2|
result <- ifelse (client$price >= 65, 'Best', 'Normal')
result

# 조건 3|
table(result)

# Q2.
# Vector 데이터 준비
install.packages("stringr")
library(stringr)
EMP <- c("2014홍길동220", "2002이순신300", "2010유관순260")

emp_pay <- function(x) {
  pay <- str_sub(x, 8, )
  pay <- as.numeric(pay)
  name <- str_extract_all(x, "[가-힣]{3}")
  name <- unlist(name)
  cat("전체 급여 평균 : ", mean(pay),'\n')
  cat("평균 이상 급여 수령자", '\n')
  
  for (i in c(1:3)) {
    if (pay[i] >= mean(pay)) {
      cat(name[i], "=>", pay[i],'\n')
    }
    i <- i+1
  }
}
emp_pay(EMP)


# Q3.
# 조건 | 함수 f(x) = x^3 + 4 평균 변화율
# delta_X = 3 - 1 = 2
# delta_Y = f(3)- f(1) = 31 - 5 = 26
# 26/2 = 13

f <- function(x) {
  y = x**3 + 4
}


averageRateofChange <- function(a, b) {
  delta_X <- b - a
  delta_Y <- f(3) - f(1)
  cat(delta_Y / delta_X)
}

averageRateofChange(1, 3)


# Q4.
install.packages("RSADBE")
library('RSADBE')
data('Bug_Metrics_Software')

rowSums(Bug_Metrics_Software[,,2]) # 행 단위 합계
colMeans(Bug_Metrics_Software[,,2]) # 열 단위 평균
apply(Bug_Metrics_Software[,,2], 2, summary) # column 단위 요약 통계량 

# Q5. 중심극한 정리
# 모집단에서 표본이 충분히 크다면(n >= 30), 이 표본평균의 분포는 정규분포에 근사한다 

CLT.plot <- function(r.dist, n, ...) {
  means <- double()
  
  # 사이즈 n의 샘플을 500회 생성하여 표본평균을 계산
  for(i in 1:1000) means[i] = mean(r.dist(n,...))
  
  # 표본평균을 표준화
  std.means <- scale(means)
  
  # 플롯의 파라미터 설정(2개의 플롯을 한 화면에)
  par(mfrow = c(1, 2))
  
  # 히스토그램과 표본의 밀도
  hist(std.means, prob = T, col = "light grey",
       border = "grey", main  = NULL, ylim = c(0, 0.5))
  lines(density(std.means))
  box()
  
  # 표준정규분포 곡선
  curve(dnorm(x, 0, 1), -3, 3, col = 'blue', add = T)
  
  # Q-Q plot
  qqnorm(std.means, main="", cex = 0.8)
  abline(0, 1, lty=2, col = "red")
  par(mfrow = c(1,1))
}

# 대표적인 비대칭 분포 - 1. 카이제곱 분포
CLT.plot(rchisq, n = 1, df = 1)
CLT.plot(rchisq, n = 10, df = 1)
CLT.plot(rchisq, n = 50, df = 1)

# 대표적인 이산형 분포의 하나인 이항분포
CLT.plot(rbinom, n = 1, size = 10, p=.5)
CLT.plot(rbinom, n = 10, size = 10, p=.5)
CLT.plot(rbinom, n = 50, size = 50, p=.5)
