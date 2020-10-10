# Chapter 03

# 2. 데이터 저장하기
# 2.1 화면(콘솔) 출력

x <- 10; y <- 20; z <- x*y
cat("x*y의 결과는 ",z,"입니다.\n") #  "\n"은 줄 바꿈을 위한 제어문자
cat("x*y=",z)

print(z) # 변수 또는 수식만 출력 가능

# 2.2 파일 저장
# (1) sink() 함수 이용

library(RSADBE)
data(Severity_Counts)       # 데이터 셋 가져오기
sink("severity.txt")        # 저장할 파일 open
severity <- Severity_Counts  # 데이터 셋을 변수에 저장
severity                     # 변수 출력: 콘솔에 출력되지 않고, 파일에 저장
sink()                       # Open된 파일 Close

# (2) write.table()
titanic
write.table(titanic, "titanic.txt", row.names = F)

titanic_df <- read.table(file = "titanic.txt", sep = "", header = T)
titanic_df

# (3) write.csv()
st.df <- st_excel

# 행번호와 따옴표 제거하여 stdf.csv 파일로 저장
write.csv(st.df, "stdf.csv", row.names = F, quote = F) # quote = F 는 따옴표 제거

# (4) write_xlsx()
install.packages("writexl")
library(writexl)

write_xlsx(x = st.df, path="st_excel.xlsx", col_names = T)
