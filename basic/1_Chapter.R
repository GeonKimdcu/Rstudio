## a) vector
# 동일한 자료형의 값이 여러 개 연속되어 있는 것
# 하나라도 자료형이 다르면 안됨 
z <- 2020
z
print(z)
(z<-2020)

y<-c("ECG","Eric","Tim","Joshua")
y

(x<-c(2014+4,2014-4,2014*4,2014/4))

x1<-c(14,18,22)
x2<-c(26,30,34)
(x3<-c(x1,x2))


## b) 수열
z<-14:20
z

y<-20:14
y

x <- 20
14:x

# seq(시작, 종료, 간격)
seq(0.1, 1.0, 0.2)
seq(from=14,to=30,by=4)
seq(from=14,to=30,length.out=5) # length.out -> 만들어질 데이터 개수...등차수열
seq(1,2,length.out = 10)
seq(from=30,to=14,by=-4)
seq(from=30,to=14,length.out=5)

# rep 반복함수 
rep(7,times=3)
rep(7:8,times=3)
rep(7:8,each=3)

s <- 7:8
rep(s,3)
rep(s,times=3)
rep(s,each=3)


## c) 벡터에 있는 원소 선택
(z<-c(rep(2:3,times=2),rep(8:9,each=2)))
z[1]   # R은 0이아닌 '1'부터 리스트 시작 
z[5]
z[3:6]
z[c(2,4,8)]
z[-5]  # 5인덱스 삭제 
z[-c(3:6)]

# 조건문을 “[]”안에 해당 vector명을 넣고 지정하면 해당 조건을 만족하는 값을 가져올 수 있음
# z = 2 3 2 3 8 8 9 9
z>3    # 결과 값  FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE
z[z>3] # 결과 값  8 8 9 9

z%%3==0 # %%는 주어진 숫자로 나눈 나머지 나누어 떨어짐(0 = TRUE, X= FALSE)
z[z%%3==0]

z[z>=3 & z<9] # &는 and
z[z<3 | z>=9] # |는 or

# index 부여 
(z<-letters[1:20])  # 1~20까지 알파벳 행이름 붙이기 
# names(dataFrame) <- c(new variable names) 데이터 프레임 변수명 변경 
names(z)<-1:20
z

z["1"]
z[c("1","20")]


## d) Data Type과 object
# Numeric
(z<-7)
mode(z)

# Character
y<-"Charcter"
mode(y)

# Paste Characters
paste("Big","Data") # 나열된 원소 사이에 공백값을 두고 결과값 출력 
paste("Big","Data",sep="") # sep => 구분지어줌 "" => 은 공백 

z<-c("Advanced","Applied")
y<-c("Data Analytics","Big Data Analytics","BDA")

paste(z,y)
paste(z,"Data Mining")

paste(y,2014)
paste(y,2014:2015)

paste("2020","12","31")
paste("2020","12","31",sep="-") # '-'으로 구분 
paste("2020","12","31",sep="")

# Substr(문자열, 시작, 끝)
substr("AppliedBDA",8,10)
z<-"AppliedBDA"
substr(z,nchar(z)-2,nchar(z))

y<-c("Advanced","Data","Analytics")
substr(y,1,3)

# Logical
(t<-TRUE)
(t<-T)

(f<-FALSE)
(f<-F)

# 논리연산자
thisYear<-2014
thisYear==2020
thisYear!=2020

thisYear<2020
thisYear<=2020
thisYear>2020
thisYear>=2020

## Matrix
z<-c(11,21,31,12,22,32)
(mat<-matrix(z,3,2))

dim(mat)

diag(mat)  # 대각행렬  

t(mat)  # t() 전치함수...행렬이 바뀜 
mat%*%t(mat)

colnames(mat)<-c("F_col","S_col")
rownames(mat)<-c("F_row","S_row","T_row")
mat

mat[1,] #첫째 행
mat[,2] #둘째 열

mat[c(1,2),c(2)]
mat[c(1,2),c(2)] <- 2
mat

mat + 2000

## list
lst_z<-list("Wcup",2018,c(T,T,F))
lst_z

e1 <- c("Wcup","WBC")
e2 <- matrix(c(2014,2018,2022,2006,2009,2013),3,2)
e3 <- 10:1
lst_y<-list(e1=e1,e2=e2,e3=e3)
lst_y
lst_y$e1

# list 결합
lst_x<-c(lst_z,lst_y)
lst_x

# unlist
unlist(lst_x)

## data frame
rnk<-c(1,2,3,4)
team<-c("GER","ARG","NED","BRA")
wcup=data.frame(rnk,team)
wcup

# 조회
wcup[1,2]
wcup[,"team"]
wcup$team
wcup[wcup$rnk==4,]

# rbind, cbind
data(airquality)
head(airquality) # 처음 6개 observation 조회

newRow<-data.frame(Ozone=40, Solar.R=120, Wind=8, Temp=77, Month=10, Day=1)
newRow

new_aq_R<-rbind(airquality,newRow)  # rbind() 행결합 함수 
tail(new_aq_R) # 마지막 6개 observation 조회
dim(new_aq_R) 

newCol<-1:nrow(new_aq_R)
new_aq_RC<-cbind(new_aq_R,newCol)   # cbind() 열결합 함수 
head(new_aq_RC,2) # 처음 2개 observation 조회
tail(new_aq_RC,2) # 마지막 2개 observation 조회

# subset(x = 데이터프레임, 벡터, 매트릭스, subset=조건 , 
#select = 열을 가지고 있는 데이터 프레임만 가능)
subset(airquality,select=c(Ozone,Solar.R,Wind,Temp),subset=(Wind>12.0 & Temp>80.0))
subset(airquality,select=c(Ozone,Solar.R,Wind,Temp),subset=(Wind>20.0 | Temp>95.0))

# merge(df1, df2, by="df1와 df1의 공통된 열의 이름")
# 어떤 기준에 따라 데이터를 결합하느냐에 따라서 여러 종류로 나뉨
# Inner join / Left Ourter join / Right Ourter join / Full Outter join 
aq_1<-subset(airquality,select=c(Ozone,Wind,Month,Day),subset=(Wind>12.0 & Temp>80.0),sort =F) # sort 주어진 값정렬  F => 오름차순 T=> 내림차순 
aq_1
aq_2<-subset(airquality,select=c(Solar.R,Temp,Month,Day),subset=(Wind>12.0 & Temp>80.0),sort = F)
aq_2
mrg_aq<-merge(aq_1,aq_2,by=c("Month","Day"),sort = F)
mrg_aq

mrg_aq$Ozone==aq_1$Ozone
mrg_aq$Solar.R==aq_2$Solar.R

# grep(조회할 문자패턴, data)
# Source: http://www.amstat.org/publications/jse/v17n1/datasets.mclaren.html

amstat_movie<-read.delim("http://www.amstat.org/publications/jse/datasets/movietotal.dat.txt", sep = "\t")
amstat_movie$MOVIE<-as.character(amstat_movie$MOVIE) # 문자형으로 변환
grep("in",amstat_movie$MOVIE, ignore.case=F) # "in"이 포함된 observation의 위치
amstat_movie[grep("in",amstat_movie$MOVIE, ignore.case=F),"MOVIE"]
amstat_movie[grep("in",amstat_movie$MOVIE, ignore.case=T),"MOVIE"]
# ignore.case => 패턴에서 대소문자 무시 


## e) 자료형, 데이터 구조 변환하기
z<-"2.78"
z
class(z)
as.numeric(z)

as.numeric("z")
# 문자를 숫자로 변환하려 시도하였으나 불가하여 NA로 돌려줌.

y<-2.78
y

class(y)
as.character(y)

as.numeric(TRUE)
as.numeric(F)

## 날짜로 변환(as.Date)
x<-"2020-01-01"
x
class(x)
x1<-as.Date(x)
x1
class(x1)

w<-"01/31/2020"
w1<-as.Date(w,format="%m/%d/%Y")
w1

# format(날짜,포맷)
# as.character()

as.Date("31/01/2020",format="%d/%m/%Y")
format(Sys.Date(),format="%d/%m/%Y")
format(Sys.Date(),'%a')
format(Sys.Date(),'%b')
format(Sys.Date(),'%B')
format(Sys.Date(),'%d')
format(Sys.Date(),'%m')
format(Sys.Date(),'%y')
format(Sys.Date(),'%Y')


## f) Missing data
z<-0/0   # 결과값 NaN => 수학적으로 정의 되지 않는 값을 의미 
z
is.nan(z) 
is.na(z)

y<-log(0)
y # 결과값 -Inf => 무한대 
is.finite(y) # 숫자 중에 NA, NaN, Inf, -Inf를 제외한 것
is.nan(y)
is.na(y)

x<-NA
is.na(x)
is.nan(x)

w<-c(1:3,NA)
w
is.na(w)


## g) 벡터의 기본 연산
z<-c(1,3,5,7,9,11,20)
z*z

(y<-z+z^2)
(x<-1+z+z^3)

mean(z)
median(z)
sd(z)   # 표준편차 
var(z)  # 분산 
sum((z-mean(z))^2)/(length(z)-1)

cor(z,y)  # 상관계수 함수 
cor(z,x)


## h) 파일 읽기 등
rank<-c(1,2,3,4)
team<-c("GER","ARG","NED","BRA")
wcup=data.frame(rank,team)

# write.csv(변수이름, “지정할 파일이름.csv”)
# read.csv("저장된 파일이름.csv")
write.csv(wcup,"wcup.csv")
w_cup<-read.csv("wcup.csv")
str(w_cup)
w_cup$team<-as.character(w_cup$team)

tm<-as.vector(w_cup$team)
rk<-as.vector(w_cup$rank)

team==tm
rank==rk

# save(변수이름, file="지정할 데이터 파일이름.Rdata")
# load("저장된 파일이름.Rdata")
save(rank,team,file="wcup.rdata")
load("wcup.rdata")

# rm(object 명)
rm(team,tm)
# rm(list=ls()) # 모두 지우기

# summary
summary(w_cup) # 열별 data 요약

# install.packages("package명"): package설치
install.packages("party")

# library(package명): package를 memory에 load
library(party)

# vignette(“알고싶은 package이름”): party에 대한 tutorial pdf파일
vignette("party")

# q(): R 종료

# setwd(): 파일이나 데이터, script등을 저장하거나 불러오기할 때 working directory를 기준으로 가져옴. 이러한 작업폴더를 지정하는 명령
# getwd(): 현재의 working directory를 알려주는 명령어

# ? 명령어: 해당 명령어에 대한 help 보기. 현재 library가 load된 패키지가 제공하는 help만 검색

# ?? 명령어: 해당 명령어에 대한 web을 통한 일반 검색