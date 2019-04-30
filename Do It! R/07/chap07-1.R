df <- data.frame(sex = c("M", "F", NA, "M", "F"),
                 score = c(5,4,3,4,NA))
df
is.na(df)     # 결측치 확인
table(is.na(df))   # 결측치 빈도 출력
table(is.na(df$sex))
table(is.na(df$score))

mean(df$score)
sum(df$score)

library(dplyr)
df %>% filter(is.na(score))
df %>% filter(!is.na(score))
df_nomiss <- df %>% filter(!is.na(score))
mean(df_nomiss$score)
sum(df_nomiss$score)

df_nomiss <-df %>% filter(!is.na(score)& !is.na(sex))
df_nomiss

df_nomiss2 <- na.omit(df)
df_nomiss2

mean(df$score, na.rm=T)
sum(df$score, na.rm= T)
exam<-read.csv("csv_exam.csv")
exam[c(3,8,15), "math"] <- NA
EXAM
exam
exam %>% summarise(mean_math = mean(math))
exam %>% summarise(mean_math = mean(math, na.rm = T))
exam %>% summarise(mean_math = mean(math, na.rm = T),
                   sum_math = sum(math, na.rm = T),
                   median_math = median(math, na.rm = T))
mean(exam$math, na.rm = T)
exam$math <- ifelse(is.na(exam$math), 55, exam$math)
table(is.na(exam$math))
mean(exam$math)
