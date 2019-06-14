# 실업자 수와 개인 소비 지출의 상관관계
# cor.test()이용해 상관분석 
economics <- as.data.frame(ggplot2::economics)
cor.test(economics$unemploy, economics$pce)
# p-value < 2.2e-16 < 유의수준 0.05보다 작으므로 통계적으로 유의하다.
# sample estimates: cor 0.6139997 상관계수 0.61 정비례관계

# 상관행렬 히트맵 만들기
# mtcars <- 자동차 32종의 11개 속성에 대한 정보를 담고 있는 데이터
# cor() 이용해 상관행렬 만들기 
head(mtcars)

car_cor <- cor(mtcars) # 상관행렬 생성 
round(car_cor, 2) # 소수점 셋째 자리에서 반올림해 출력 

# 히트맵 패키지
install.packages("corrplot")
library(corrplot)

corrplot(car_cor)
# 상관계수 클수록 원의 크기가 크고 색깔이 진화 
# 상관계수 양수 -> 파랑 / 음수 -> 빨강 

# 히트맵 원 -> 상관계수 표현 
corrplot(car_cor, method = "number")

# 색상코드목록 생성 col 파라미터에 지정 
col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", 
                          "#4477AA"))
corrplot(car_cor,
         method = "color",       # 색깔로 표현 
         col = col(200),         # 색상 200개 선정 
         type = "lower",         # 왼쪽 아래 행렬만 표시 
         order = "hclust",       # 유사한 상관계수끼리 군집화 
         addCoef.col = "black",  # 상관계수 색깔 
         tl.col = "black",       # 변수명 색깔 
         tl.srt = 45,            # 변수명 45도 기울임 
         diag = F)               # 대각외 행렬 제외 
