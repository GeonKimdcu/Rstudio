install.packages("dplyr")  #디플라이어
library(dplyr)  #library는 로드를 뜻함
df_raw <- data.frame(var1 = c(1,2,1),
                     var2 = c(2,3,2))
df_raw

df_new <- df_raw    # 복사하기
df_new     #출력
df_new <- rename(df_new, v2 = var2)   
df_new  #var를 v2로 수정

#Q1. ggplot2 패키지의  mpg데이터를 사용할 수
#있도록 불러온뒤 복사본을 만드세요. 
install.packages("ggplot2")
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
#ggplot2의 mpg 데이터를 데이터 프레임
#형태로 불러오기
df_mpg <- mpg #복사
df_mpg
#Q2.복사본 데이터를 이용해
#열을 수정하기
df_mpg <- rename(df_mpg, city = cty)
df_mpg <- rename(df_mpg, highway = hwy)
df_mpg


