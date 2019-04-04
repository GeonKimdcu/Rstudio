df_raw <- data.frame( var1 = c(1, 2, 1),
                      var2 = c(2, 3, 2))
df_raw

# rename() 함수를 사용하기 위해서는 dplyr 패키지 설치해야함.
# dplyr 은 데이터를 원하는 형태로 가공할 때 사용하는 패키지. 
install.packages("dplyr")
library(dplyr)

# 데이터 프레임 복사본 만들기 
df_new_raw <- df_raw
df_new_raw

# 변수명 바꾸기 
df_new_raw <- rename(df_new_raw, v1 = var1) # var1을 v1로 수정 
df_new_raw <- rename(df_new_raw, v2 = var2) # var2를 v2로 수
df_new_raw

# 혼자서 해보기
#Q1. ggplot2()패키지의 mpg 데이터를 사용할 수 있도록 불러온 후 복사본 생성 
library(ggplot2)
df_mpg <- as.data.frame(ggplot2::mpg)
df_new_mpg <- df_mpg
df_new_mpg
# Q2. cty는 city로, hwy는 highway로 변수명 수정 
df_new_mpg <- rename(df_new_mpg, city=cty, highway = hwy)
df_new_mpg
# Q3. (P.112 혼자해보기 참고) 아래와 같은 결과물이 출력(head() 사용했음)
head(df_new_mpg)
