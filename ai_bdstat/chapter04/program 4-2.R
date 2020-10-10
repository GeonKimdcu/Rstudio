# Chapter 04
# 2. 조건문
# 2.1 if()

x <- 50; y <- 4; z<- x*y
if(x * y >= 40){
  cat("x * y의 결과는 40 이상입니다.\n")
  cat("x * y = ", z)
 } else {
  cat("x * y의 결과는 40 미만입니다. x*y =", z, "\n")
}

score <- scan()
result <- "노력"
if(score >= 80) {
  result <- "우수"
}
cat("당신의 학점은", result, score)

score <- scan()

if(score >= 90) {
  result = "A학점"
} else if(score >= 80) {
  result = "B학점"
} else if(score >= 70) {
  result = "C학점"
} else if(score >= 60) {
  result = "D학점"
} else {
  result = "F학점"
}
cat("당신의 학점은", result)
print(result)

# 2.2 ifelse()
score <- scan()

ifelse(score >= 80, "우수", "노력")
ifelse(score >= 80, "노력", "우수")

# 2.3 switch()

switch("name", id = "hong", pwd = "1234", age = 105, name = "홍길동")
empname <- scan(what ="")
empname

switch(empname, hong = 250,
       lee = 350,
       kim = 200,
       kang = 400)

# 2.4 which()
name <- c("kim", "lee", "choi", "park")
which(name == "choi")

no <- c(1:5)
name <- c("홍길동", "이순신", "강감찬", "유관순", "김유신")
score <- c(85, 78, 89, 90, 74)
exam <- data.frame(학번 = no, 이름 = name, 성적 = score)
exam

which(exam$이름 == "유관순")
exam[4,]

