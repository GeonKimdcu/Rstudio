# 1.결측치 찾기 
# 결측치가 포함된 데이터 프레임 생성 & 출력  
df <-data.frame(sex = c("M", "F", NA, "M", "F"),
                score = c(5,4,3,4,NA))
df

# 결측치 확인
is.na(df)  # FALSE는 결측치X TRUE는 결측치o 

#결측치 빈도 출력
table(is.na(df))

# 어떤 변수에 결측치가 있는지 확인 
table(is.na(df$sex))
table(is.na(df$score))

# 결측치가 포함된 데이터를 함수에 적용하면 정상적인 연산x  
mean(df$sex)
sum(df$score)

# 2. 결측치 제거하기
# 결측치 있는 행 추출 
library(dplyr)
df %>% filter(is.na(score))

# 결측치 있는 행 제거 
df %>%  filter(!is.na(score)) # score 결측치 제거 

# 결측치 없는 데이터 프레임 만들기 
df_nomiss <- df %>% filter(!is.na(score))
df_nomiss
mean(df_nomiss$score)
sum(df_nomiss$score)

# 여러변수 동시에 결측치 없는 데이터 추출 
df_nomiss<-df %>% filter(!is.na(sex)&!is.na(score))
df_nomiss

# 결측치 하나라도 있으면 제거하기 
df_nomiss2 <- na.omit(df)
df_nomiss2

# 3. 함수의 결측치 제외기능 이용하기 
# na.rm 파라미터 사용 
mean(df$score, na.rm = T)
sum(df$score, na.rm = T)

# CSV파일 불러들여서 일부 값 결측치로 바꾸기 
exam <- read.csv("csv_exam.csv")
exam[c(3,8,15), "math"] <- NA   # 3,8,15 행의 math에 NA할당 
exam

exam %>% summarise(mean_math = mean(math))
exam %>% summarise(mean_math = mean(math, na.rm = T))
exam %>% summarise(mean_math = mean(math, na.rm =T),
                   sum_math = sum(math, na.rm = T),
                   median_math = median(math, na.rm = T))

# 4. 평균값으로 결측치 대체하기 
mean(exam$math, na.rm = T)

exam$math <- ifelse(is.na(exam$math), 55, exam$math)
table(is.na(exam$math))
exam
mean(exam$math)

