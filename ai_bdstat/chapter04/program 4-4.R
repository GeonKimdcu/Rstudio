# Chapter 04
# 4. function
# 4.1 사용자 정의 함수

f1 <- function() {
  cat("매개변수가 없는 함수")
}
f1()

f3 <- function(x, y) {
  add <- x + y
  return(add)
}

add <- f3(10, 20)
add

# 4.2 기술통계량을 계산하는 함수 정의
test <- read.csv("test.csv", header = T)
test

summary(test)
table(test$A)

data_pro <- function(x) {
  for(idx in 1:length(x)) {
    cat(idx, "번째 칼럼의 빈도 분석 결과")
    print(table(x[idx]))
    cat("\n")
  }
  
  for(idx in 1:length(x)) {
    f <- table(x[idx])
    cat(idx, "번째 칼럼의 최대값/최소값\n")
    cat("max = ", max(f), "min = ", min(f), "\n")
  }
}

data_pro(test)



# 4.3 피타고라스와 구구단 함수 정의

pytha <- function(s, t) {
  a <- s^2 - t^2
  b <- 2*s*t
  c <- s^2 + t^2
  cat("피타고라스 정리: 3개의 변수: ", a, b, c)
}

pytha(2, 1)


gugu <- function(i, j) {
  for(x in i) {
    cat("**", x, "단 ** \n")
    for(y in j) {
      cat(x, "*", y, "=", x*y, "\n")
    }
    cat("\n")
  }
}

i <- c(2:9)
j <- c(1:9)

gugu(i, j)


# 4.4 결측치 포함 자료의 평균 계산 함수 정의

data <- c(10, 20, 5, 4, 40, 7, NA, 6, 3, NA, 2, NA)

na <- function(x) {
  print(x)
  print(mean(x, na.rm = T))
  
  data = ifelse(!is.na(x), x, 0)
  print(data)
  print(mean(data))
  
  data2 = ifelse(!is.na(x), x, round(mean(x, na.rm = TRUE), 2))
  print(data2)
  print(mean(data2))
}

na(data)

# 4.5 몬테카를로 시뮬레이션 함수 정의
coin <- function(n) {
  r <- runif(n, min = 0, max = 1)
  result <- numeric()
  for(i in 1:n) {
    if(r[i] <= 0.5)
      result[i] <- 0 #  앞면 
    else
      result[i] <- 1  # 뒷면
  }
  return(result)
}

coin(10)


montaCoin <- function(n) {
  cnt <- 0
  for(i in 1:n) {
    cnt <- cnt + coin(1)
  }
  result <- cnt / n
  return(result)
}

montaCoin(10)
montaCoin(30)
montaCoin(100)
montaCoin(1000)
montaCoin(10000)
