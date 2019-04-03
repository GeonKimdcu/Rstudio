install.packages("ggplot2")  # ggplot2 패키지 설치 
library("ggplot2") # ggplot2 패키지 로드 

x <- c("a", "b", "c", "a")
x
qplot(x) # 빈도 막대 그래프 출력 

# mpg 데이터는 미국 자동차 연비 관련 정보를 담음. 
qplot(data = mpg, x = hwy)
# qplot의 data 파라미터에 mpg 데이터 지정, 그래프의 x 축을 hwy로 지정
# hwy 는 자동차가 고속도로에서 1갤런에 몇 마일 가는지 나타낸 변수 

#qplot의 파라미터를 변경
# x축 cty
qplot(data = mpg, x = cty)
# x축 drv, y축 hwy
qplot(data = mpg, x =drv, y = hwy)
# x축 drv, y축 hwy, 선 그래프 형태
qplot(data=mpg, x =drv, y=hwy, geom = "line")
# x축 drv, y축 hwy, 상자 그림 형태 
qplot(data= mpg, x = drv, y =  hwy, geom = "boxplot")
# x축 drv, y축 hwy, 상자그림형태, drv별 색 표현
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot", colour = drv)

?qplot # qplot 함수 메뉴얼 출력
# 함수의 기능이 궁금할 땐 HELP 함수 활용. 물음표를 넣으면 됨. 
