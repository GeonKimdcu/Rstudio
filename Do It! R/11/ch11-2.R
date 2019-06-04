# 대한민국 시도별 인구, 결핵 환자 수 단계 구분도 만들기
# [1] 대한민국 시도별 인구 단계 구분도 만들기
# 1. 패키지 준비하기
install.packages("stringi")
install.packages("devtools")
devtools::install_github("cardiomoon/kormaps2014")
library(kormaps2014)

# 2. 대한민국 시도별 인구 데이터 준비하기 
str(changeCode(korpop1))
# kormaps2014 패키지의 changeCode()를 이용해 인코딩 UTF-8에서 CP949로 변환 

# 3. 오류 방지를 위해 변수명을 영문자로 변경
library(dplyr)
korpop1 <- rename(korpop1,
                  pop = 총인구_명,
                  name = 행정구역별_읍면동)

# 4.대한민국 시도 지도 데이터 준비
str(changeCode(kormap1))

# 5. 단계 구분도 만들기
library(ggiraphExtra)
library(ggplot2)
ggChoropleth(data = korpop1,   # 지도에 표시할 데이터
             aes(fill = pop,   # 색깔로 표현할 변수
                 map_id = code, # 지역 기준 변수
                 tooltip = name), # 지도 위에 표시할 지역명
             map = kormap1,       # 지도 데이터
             interactive = T)     # 인터랙티브

# [2] 대한민국 시도별 결핵 환자 수 단계 구분도 만들기 
str(changeCode(tbc))
# 지역별 결핵 환자 수에 대한 정보를 담고있는 tbc 데이터 
# NewPts(결핵 환자 수) 
ggChoropleth(data = tbc,
             aes(fill = NewPts,
                 map_id = code,
                 tooltip = name),
             map=kormap1,
             interactive = T)
