df <- data.frame(var1 = c(4, 3, 8),
                 var2 = c(2, 6, 1))
df

# 변수 + 변수 => 새로운 변수 생성 
df$var_sum <- df$var1 + df$var2 # var_sum 파생변수 생성 
df

df$var_mean <- (df$var1 + df$var2)/2 # var_mean 파생변수 생성 
df
# mpg 통합 연비 변수 만들기 
mpg$total <- (mpg$cty + mpg$hwy)/2
head(mpg)

mean(mpg$total) # 통합 연비 변수 평균 

# 조건문을 활용해 파생변수 만들기
# 1, 기준값 정하기 
summary(mpg$total)  # summary()를 통해 평균과 중앙값 확인 (기준정하기) 
hist(mpg$total)  # 히스토그램 생성 

# 2. 합격 판정 변수 만들기 
mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")
# 20 이상이면 pass, 그렇지 않으면 fail 부여 
head(mpg, 20)

# 3. 빈도표로 합격 판정 자동차 수 살펴보기
table(mpg$test) # 연비 합격 빈도표 생성 

# 4. 막대그래프로 빈도 표현하기
qplot(mpg$test)

# 중첩 조건문
# total을 기준으로 A, B, C 등급 부여
mpg$grade <- ifelse(mpg$total >= 30, "A",
                    ifelse(mpg$total >=20, "B", "C"))
head(mpg, 20)

table(mpg$grade)
qplot(mpg$grade)
