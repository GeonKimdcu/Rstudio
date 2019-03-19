#Q 시험 점수 변수 만들고 출력하기
x <- c(80, 60, 70, 50, 90)
#Q2. 전체평균구하기
mean(x)
#Q3. 전체 평균 변수 만들고 출력하기
x_mean <- mean(x)
x_mean


# 데이터 입력해 데이터프레임만들기
#1.변수만들기
english <-c(90, 80, 60, 70)   #영어 점수변수생성
english
math <- c(50, 60, 100, 20)  #수학점수 변수 생성
math
#2.데이터 프레임 만들기
# english, math 로 데이터 프레임 생성해서 df_midterm에 할당
df_midterm <- data.frame(english, math)
df_midterm

# 3. 학생의 반에 대한 정보 추가된 데이터 프레임 만들기
class <-c(1, 1, 2, 2)
class

df_midterm <- data.frame(english, math, class)
df_midterm

mean(df_midterm$english)

won <- c(1800, 1500, 3000)
sold <- c(24, 38, 13)
won
sold
df_fruit <- data.frame(won, sold)
df_fruit

mean(df_fruit$won)
mean(df_fruit$sold)

# 혼자서 해보기p88
# 데이터 프레임 한번에 만들기
df_fruit <- data.frame(won = c(1800, 1500, 3000),
                       sold = c(24, 38, 13))
df_fruit

# 과일과격 평균, 판매량 평균
mean(df_fruit$won)
mean(df_fruit$sold)
