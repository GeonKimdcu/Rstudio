# Chapter 04
# 1. Operator
# 1.1 산술 연산자

num1 <- 100; num2 <- 20;
result <- num1 * num2
result

num1 / num2
num1 %% num2  # 나머지 계산

# 1.2 관계 연산자
boolean <- num1 == num2
boolean

boolean <- num1 != num2
boolean

num1 > num2
num1 >= num2
num1 < num2
num1 <= num2

# 1.3 논리 연산자
logical <- num1 >= 50 & num2 <= 10
logical

logical <- num1 >= 50 | num2 <= 10
logical

logical <- num1 >= 50
logical

logical <- !(num1 >= 50)
logical

x <- TRUE; y <- FALSE
xor(x, y)