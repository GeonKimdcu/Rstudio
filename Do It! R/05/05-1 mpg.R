exam <- read.csv("csv_exam.csv")

head(exam) # head() 앞에서부터 6행까지 데이터 앞부분 출력
head(exam, 10) # 앞에서부터 10행까지 출력 

tail(exam) # tail() 데이터 뒷부분 출력
tail(exam, 10) # 뒤에서부터 10행까지 출력 

View(exam) # V는 대문자! View() 는 뷰어 창에서 데이터 확인 

dim(exam) # 데이터가 몇 행, 몇 열로 구성되어있는지 확인 
#dim은 '차원'을 의미 'dimensions'

str(exam) # 데이터 속성 확인 (데이터에 들어있는 변수들의 속성 나타냄) 

summary(exam) # 요약 통계량 산출하기 

# mpg 데이터 파악하기 (ggplot2 패키지에 내장된 데이터) 
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
# ggplot2 패키지의 mpg데이터를 데이터프레임 형태로 불러오기 
# :: 더블콜론을 이용하면 특정 패키지에 들어있는 함수나 데이터 지정. 
head(mpg)
tail(mpg)
dim(mpg) # 자동차 234 종에 대한 11개변수  ##[1] 234 11 (출력결과) 
str(mpg)
summary(mpg)
