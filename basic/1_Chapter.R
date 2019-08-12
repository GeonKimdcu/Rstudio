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