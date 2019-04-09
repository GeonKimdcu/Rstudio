english <- c(90, 80, 60, 70) # 영어점수 변수 생성
english

math <- c(50,60,100,20) # 수학점수 변수 생성 
math

# english, math로 데이터 프레임 생성해서 df_midterm에 할당 
df_midterm <- data.frame(english, math)
df_midterm

class <- c(1, 1, 2, 2)
class

df_midterm <- data.frame(english, math, class)
df_midterm
# 분석하기
mean(df_midterm$english) # df_midterm의 english 로 평균 산출 
mean(df_midterm$math)  # df_midterm의 math로 평균 산출 

# 데이터프레임 한번에 만들기
df_midterm <- data.frame(english = c(90,80,60,70),
                         math = c(50, 60, 100, 20),
                         class = c(1, 1, 2, 2))
df_midterm

# 혼자서 해보기
Q1.  데이터프레임 출력
df_sales <- data.frame(fruit = c("사과", "딸기", "수박"),
                       price = c(1800, 1500, 3000),
                       sold = c(24, 38, 13))
df_sales
# Q2 과일과격 평균/ 판매량 평균
mean(df_sales$price)
mean(df_sales$sold)
