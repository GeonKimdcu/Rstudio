var <- c(1, 2, 5, 7, 8)  #숫자 5개로 구성된 var생성
var       # var은 '변수' variable 의미

var1 <- c(1:5)   # 1~5까지 연속 값으로 var1 생성 
var1

var2 <- seq(1,5)     # 1~5까지 연속 값으로 var2 생성 
var2                # seq 는 sequence '연속'을 의미

var3 <- seq(1:5)  # seq도 콜론 사용가능 
var3

var4 <- seq(1, 10, by =2)  # 1~10까지 2 간격 연속 값으로 var4 생성 
var4              # by 파라미터 사용해서 일정한 간격을 나타냄. 

var4 <- c(1:10, by =3)   # c는 by사용불가 
var4                     # 그이유는 리스트 타입 변수이기 때문이다. 
# 1 2 3 4 5 6 7 8 9 10 by 3 이라는 결과값으로 출력 됨.
# 즉 간격을 두는 연속적인 숫자를 원하면 seq함수 사용해야 함. 

#변수 + 변수 가능/ 변수 + 숫자 가능
var1+2
var1+var2

# 문자로 된 변수 만들기
str1 <- "a"    #str은 'string' '문자열'을 뜻함. 
str1

str2 <- "text"
str2

str3 <- "Hello, World!"  #문자열, 특수문자 띄어쓰기 가능. 
str3

str4 <- c("a", "b", "c")  # c 함수 사용가능/ seq 불가능.. 
str4

str5 <- c("Hello", "world", "is", "good!")
str5

str1+2   # 문자로 된 변수로는 연산x
## Error in str1 + 2 : non-numeric argument to binary operator
## 라는 에러메시지 출력..  
