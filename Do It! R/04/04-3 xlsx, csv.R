install.packages("readxl") # 엑셀파일을 불러오는 기능 제공 
library(readxl)

df_exam <- read_excel("excel_exam.xlsx") # 엑셀파일을 불러와 df_exam에 할당 
df_exam     # ()괄호안에 파일명 넣고 확장자까지 기입 . 큰 따옴표 필수! 

mean(df_exam$english)
mean(df_exam$science)

# 엑셀파일 첫 번째 행이 변수명이 아닐 때..
df_exam_novar <- read_excel("excel_exam_novar.xlsx")
df_exam_novar
df_exam_novar <- read_excel("excel_exam_novar.xlsx", col_names = F)
df_exam_novar    # col_names = F 파라미터 설정하면 첫 번째 행을 변수명이 아닌 데이터로 인식해오고, 변수명은 'X__숫자' 로 자동 지정  
df_exam_novar <- read_excel("excel_exam_novar.xlsx", col_names = T)
df_exam_novar  # col_names = F 는 거짓/ T는 진실  col_names 는 열이름을 가져올 것인가? 라는 질문을 뜻함. 

#엑셀파일에 시트가 여러 개 있다면? 
#엑셀 파일의 세 번째 시트에 있는 데이터 불러오기 
df_exam_sheet <- read_excel("excel_exam_sheet.xlsx", sheet = 3)
df_exam_sheet

# CSV 파일 불러오기
df_csv_exam <- read.csv("csv_exam.csv") # read_excel은 언더바/ read.csv 는 점 
df_csv_exam
#첫 번째 행에 변수명이 없는 csv 파일을 불러올때는 header = F 사용
#문자가 들어있는 파일 불러올 때는 stringAsFactors = F
df_csv_exam1 <- read.csv("csv_exam.csv", stringsAsFactors = F)
df_csv_exam1

# 데이터프레임만들기
df_midterm1 <- data.frame(english = c(90, 80, 70, 50),
                          korean = c(100, 89, 97, 99),
                          social = c(87, 66, 90, 60))
df_midterm1

# 만든 데이터프레임 csv 파일로 저장하기 
write.csv(df_midterm1, file = "df_midterm1.csv")
# R 내장함수 write.csv() 괄호안에 저장할 데이터 프레임명 지정
# file 파라미터에 파일명 지정 

# 데이터프레임을 RData 파일로 저장하기 
save(df_midterm1, file = "df_midterm1.rda")
# load 함수는 파일 불러오기 
load("df_midterm1.rda")
df_midterm1
# rm() 이용하면 데이터 삭제 
rm(df_midterm1)
df_midterm1
# 삭제했기 때문에 not found 뜸
