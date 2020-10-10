# 4. DataFrame

no <- c(1,2,3)
name <- c("hong", "lee", "kim")
pay <- c(150, 250, 300)
vemp <- data.frame(No = no, Name = name, Pay = pay)
vemp

m <- matrix(
  c(1, "hong", 150, 2, "lee", 250, 3, "kim", 300), by = T
)
memp <- data.frame(m)
memp

getwd()
txtemp <- read.table('emp.txt', header = 1, sep = "")

csvtemp <- read.csv('emp.csv', header = T)
csvtemp

help(read.csv)
name <- c("사번", "이름", "급여")
read.csv('emp2.csv', header=F, col.names = name)

df <- data.frame(x = c(1:5), y = seq(2, 10, 2), z=c('a', 'b', 'c', 'd', 'e'))
df
df$x

str(df)
ncol(df)
nrow(df)
names(df)
df[c(2:3), 1]

summary(df)
apply(df[, c(1,2)], 2, sum)
x1 <- subset(df, x>=3)
x1

y1 <- subset(df, y<=8)
xyand <- subset(df, x >=2&y<=6)
xyor <- subset(df, x>=2 | y <= 6)
y1; xyand; xyor

sid = c("A", "B", "C", "D")
score = c(90, 80, 70, 60)
subject = c("컴퓨터", "국어국문", "소프트웨어", "유아교육")

student <- data.frame(sid, score, subject)
student

mode(student)
class(student)
str(sid)
str(score)
str(subject)
str(student)

height <- data.frame(id = c(1,2), h = c(180, 175))
weight <- data.frame(id = c(1,2), w = c(80, 75))

user <- merge(height, weight, by.x = "id", by.y = "id")
user

install.packages("UsingR")
library(UsingR)
data(galton)
str(galton)
dim(galton)
head(galton, 15)

# 5. List
list <- list("lee", "이순신", 95)
list

unlist <- unlist(list) # unlist() 함수를 이용하여 리스트를 벡터구조로 변경 
unlist

num <- list(c(1:5), c(6, 10))
num

member <- list(name = c("홍길동", "유관순"), age = c(35, 25),
               address = c("한양", "충남"), gender = c("남자", "여자"),
               htype = c("아파트", "오피스텔"))
member

member$age[1] <- 45
member$id <- "hong"
member$pwd <- "1234"
member

member$age <- NULL $ age # 원소제거
member
length(member)
mode(member); class(member)

a <- list(c(1:5))
b<-list(6:10)
lapply(c(a, b), max)
sapply(c(a, b), max)

multi_list <- list(c1 = list(1,2,3),
                   c2 = list(10, 20, 30),
                   c3 = list(100, 200, 300))

# 다차원 리스트 보기
multi_list$c1; multi_list$c2; multi_list$c3

do.call(cbind, multi_list)
class(do.call(cbind, multi_list))

# 6. 문자열 처리
install.packages("stringr")
library(stringr)
str_extract("홍길동35이순신45유관순25", "[1-9]{2}")
str_extract_all("홍길동35이순신45유관순25", "[1-9]{2}")

string <- "hongkd105leess1002you25강감찬2005"
str_extract_all(string, "[a-z]{3}") # 영문 소문자가 3자 연속하는 경우 추출
str_extract_all(string, "[a-z]{3,}") # 영문 소문자가 3자 이상 연속하는 경우 추
str_extract_all(string, "[a-z]{3,5}") # 영문 소문자가 3~5자 연속하는 경우 추출

str_extract_all(string, "hong") # 해당 문자열 추출
str_extract_all(string, "25") # 해당 숫자 추출
str_extract_all(string, "[가-힣]{3}") # 연속된 3개의 한글 문자열 추출
str_extract_all(string, "[a-z]{3}") # 연속된 3개의 영문 소문자 추출
str_extract_all(string, "[0-9]{4}") # 연속된 4개의 숫자 추출

str_extract_all(string, "[^a-z]") # 영문자를 제외한 나머지 추출
str_extract_all(string, "[^a-z]{4}") # 영문자를 제외한 연속된 4글자 추출
str_extract_all(string, "[^가-힣]{5}") # 한글을 제외한 나머지 연속된 5글자 추출
str_extract_all(string,"[^0-9]{3}") # 숫자를 제외한 나머지 연속된 3글자 추출

jumin <- "123456-1234567"
str_extract(jumin, "[0-9]{6}-[1234][0-9]{6}")
str_extract_all(jumin, "\\d{6}-[1234]\\d{6}") # d{6}:숫자 6개

name <- "홍길동1234, 이순신5678, 강감찬1012"
str_extract_all(name, "\\w{7,}") # 7글자 이상의 단어(숫자 포함)만 추출 

string <- "hongkd105leess1002you25강감찬2005"
len <- str_length(string)
len

string <- "hongkd105leess1002you25강감찬2005"
str_locate(string,"강감찬")

string_sub <- str_sub(string, 1, len-7) # 이전 예제의 len 변수 사용 
string_sub
string_sub <- str_sub(string, 1, 23) # 문자열의 위치를 이용
string_sub

ustr <- str_to_upper(string_sub); ustr
str_to_lower(ustr)

string_sub
string_rep <- str_replace(string_sub, "hongkd105", "홍길동35,")
string_rep <- str_replace(string_rep, "leess1002", "이순신45,")
string_rep <- str_replace(string_rep, "you25", "유관순25,")
string_rep # 문자열 교체 후 변수의 값 

string_rep # 문자열 결합 전 변수의 값
string_c <- str_c(string_rep, "강감찬55")
string_c

string_c
string_sp <- str_split(string_c, ",")
string_sp

# 단계 1: 문자열 벡터 만들기
string_vec <- c("홍길동35", "이순신45", "유관순25", "강감찬55")
string_vec

# 단계 2: 콤마를 기준으로 문자열 벡터 합치기
string_join <- paste(string_vec, collapse = ",")
string_join
