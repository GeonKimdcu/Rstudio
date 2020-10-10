# Chapter 03

# 1. 데이터 불러오기
# 1.1 키보드 입력
# (1) scan() 함수 이용 

num <- scan()
num
sum(num)

name <- scan(what = character())
name

df = data.frame()
df = edit(df)
df

# 1.2 local file road
# (1) read.table()

student <- read.table("student.txt")
student

names(student) <- c("번호", "이름", "키", "몸무게") # 칼럼명 변경
student

student1 <- read.table("student1.txt", header = TRUE) # 칼럼명 있는 데이터 로드
student1

student_1 <- read.table(file.choose(), header = TRUE) # 탐색기 통해 파일 선택
student_1

student2 <- read.table("student2.txt", sep = ";",header = T) # 구분자가 있는 경우
student2

student3 <- read.table("student3.txt", header = T, na.strings = "-") # 특정 문자열 NA로 처리
student3

# (2) read.csv()
student4 <- read.csv("student4.txt", sep = ",", na.strings = "-")
student4

# (3) read.excel()
install.packages("readxl")
library(readxl)

st_excel <- read_excel(path = "studentexcel.xlsx", sheet = "emp2")
st_excel

str(st_excel)

# 1.3 Data road from Internet

titanic <- read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/COUNT/titanic.csv")
titanic

dim(titanic); str(titanic)
table(titanic$age); table(titanic$sex); table(titanic$survived)

head(titanic); tail(titanic)

tab <- table(titanic$survived, titanic$sex) # 교차 분할표(성별에 따른 생존 여부)
tab

barplot(tab, col = rainbow(2), main = "성별에 따른 생존 여부") # 막대 차트
