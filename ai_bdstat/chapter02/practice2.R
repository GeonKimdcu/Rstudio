# Chapter 02 연습문제

# Q1. 다음과 같은 벡터 객체를 생성하시오.
# 조건 1|
Vec1 <- rep("R",5 )
Vec1

# 조건 2|
Vec2 <- seq(1, 10, 3)
Vec2

# 조건 3|
Vec3 <- rep(1:10, each = 3)
Vec3

# 조건 4|
Vec4 <- c(Vec2, Vec3)
Vec4

# 조건 5|
test <- seq(-15, 25, 5)
test <- seq(25, 15, -5)
test

# 조건 6|
Vec5 <- Vec4[seq(1,34, 2)]
Vec5

# Q2. 다음과 같은 벡터를 칼럼으로 갖는 데이터프레임을 생성하시오.
name <- c("최민수", "유관순", "이순신", "김유신", "홍길동")
age <- c(55, 45, 45, 53, 15)
gender <- c(1,2,1,1,1)
job <- c("연예인", "주부", "군인", "직장인", "학생")
sat <- c(3,4,2,5,5)
grade <- c("C", "C", "A", "D", "A")
total <- c(44.4, 28.5, 43.5, NA, 27.1)

# 조건 1|
user <- data.frame(name, age, gender, job, sat, grade, total)
user

# 조건 2|
hist(user$gender)

# 조건 3|
user2 <- user[seq(2,5,2),]
user2

# Q3. Data를 대상으로 apply()를 적용하여 행/열 방향으로 조건에 맞게 통계량을 구하시오.
kor <- c(90, 85, 90)
eng <- c(70, 85, 75)
mat <- c(86, 92, 88)

# 조건 1|
score <- data.frame(kor, eng, mat)
score

# 조건 2|
apply(score, 1, max) # 행 우선
apply(score, 2, max) # 열 우선 

# 조건 3|
round(apply(score, 1, mean), 2) # 행 우선
round(apply(score, 2, mean), 2) # 열 우선 

# 조건 4|
apply(score, 1, var)
apply(score, 1, sd)


# Q4. 다음의 Data2객체를 대상으로 정규표현식을 적용하여 문자열을 처리하시오.
Data2 <- c("2017-02-05 수입 3000원",
           "2017-02-06 수입 4500원",
           "2017-02-07 수입 2500원")

library(stringr)

# 조건 1|
str_sub(Data2, 14, 19)

# 조건 2|
str_replace_all(Data2, '[0-9]{2}',"")

# 조건 3|
string_rep <- str_replace(Data2, "-", "/")
string_rep <- str_replace(string_rep, "-", "/")
string_rep

# 조건 4|
Data2 <- paste(Data2, collapse = ",")
Data2
