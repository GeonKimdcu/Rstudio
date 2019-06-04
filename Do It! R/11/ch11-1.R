# 미국 주별 강력 범죄율 단계 구분도 만들기 
# 1.패키지 준비하기 
install.packages("ggiraphExtra") # 단계 구분도 패키지 
library(ggiraphExtra)

# 2. 미국 주별 범죄 데이터 준비하기
# USArrests 데이터 - 1973년 미국 주(state)별 강력 범죄율 정보 
str(USArrests)
head(USArrests)

# 3. tibble 패키지 설치- dplyr패키지 설치하면  자동 설치 
library(tibble)
# 행 이름을 state 변수로 바꿔 새 데이터 프레임 만들기 
crime <-rownames_to_column(USArrests, var = "state")
crime$state <- tolower(crime$state) # tolower() state의 값 소문자로 수정 
str(crime)
# str()은 객체의 구조(데이터 타입, 변수명, 변수 개수, 관측치 수)를 간략히 나타냄 

# 4. 미국 주 지도 데이터 준비
library(ggplot2)
install.packages("maps") 
# maps 패키지에 미국 주별 위경도를 나타낸 state 데이터있음 
library(maps)
state_map <- map_data("state")
# ggplot2패키지의 map_data() 이용해 데이터를 데이터 프레임 형태로 불러온다
str(state_map)

# 5. 단계 구분도 만들기
install.packages("mapproj")
library(mapproj)
ggChoropleth(data = crime,
             aes(fill = Murder,
                 map_id = state),
             map = state_map)

# 6. 인터랙티브 단계 구분도 만들기
ggChoropleth(data = crime,      # 지도에 표현할 데이터 
             aes(fill = Murder, # 색깔로 표현할 변수 
                 map_id=state), # 지역 기준 변수 
             map=state_map,     # 지도데이터
             interactive = T)   # 인터랙티브 
