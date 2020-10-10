# Chapter 01

# Q1. 현재 작업공간을 확인하고, "C:/Rwork/Part-I"으로 변경하시오.
getwd()
setwd("C:/Rwork/Part-I")
getwd()

# Q2. 다음 조건에 맞게 name, age, address 변수를 생성하고 처리하시오.
name <- "kimgeon"
age <- 24
address <- "울산"

mode(name); mode(age) ;mode(address)

is.character(name); is.character(age) ;is.character(address)

is.numeric(name); is.numeric(age); is.numeric(address)

# Q3. R에서 제공하는 women 데이터 셋을 다음과 같이 처리하시오.
data(women)

mode(women)
mode(women$height)
mode(women$weight)
class(women)

plot(women)

# Q4. R에서 제공하는 c() 함수를 이용하여 벡터를 생성하고 데이터를 처리하시오.
x <- c(1:100)
x
mean(x)

# Q5. R 프로그래밍 언어의 특징을 2가지만 기술하시오.
# 1. 인터프리터 언어
# 2. 통계 표준 플랫폼으로 다양한 기능과 더불어 우수한 그래픽 제공

