# 09-1 '한국복지패널데이터' 분석 준비하기

# foreign 패키지를 이용하면 SPSS, SAS 등 통계분석 소프트웨어 파일 불러올 수 있음. 
install.packages("foreign")
library(foreign)    # SPSS 파일 불러오기
library(dplyr)      # 전처리
library(ggplot2)    # 시각화
library(readxl)     # 엑셀 파일 불러오기

# read.spss() 이용해 복지패널데이터 불러오기 
raw_welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav",
                         to.data.frame =T)
# to.data.frame = T는 데이터프레임 형태로 변환하는 기능 
welfare <- raw_welfare   # 복사본 만들기

# 데이터 컴토하기
head(welfare) # welfare 데이터 앞부분 
tail(welfare) # welfare 데이터 뒷부분 
View(welfare) # welfare 데이터 뷰어 창에서 확인 
dim(welfare)  # 차원 
str(welfare)  # 속성 
summary(welfare) # 요약 통계량 

# 변수명 바꾸기  rename(df명, 신규 변수명 = 기존 변수명) 
welfare <- rename(welfare,
                  sex = h10_g3, 
                  birth = h10_g4,
                  marriage = h10_g10,
                  religion = h10_g11,
                  income = p1002_8aq1,
                  code_job = h10_eco9,
                  code_region = h10_reg7)

