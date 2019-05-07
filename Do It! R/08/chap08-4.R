# 시계열 그래프 만들기 
library(ggplot2)

# ggplot2 패키지 내 들어있는 economics 데이터 이용 ( 미국의 경제지표를 월별로 나타낸 데이터 )
# geom_line()는 선 그래프를 나타냄.
ggplot(data = economics, aes(x=date, y = unemploy))+geom_line()

# 혼자서 해보기
# Q1.
# psavert(개인 저축률)
ggplot(data = economics, aes(x=date, y = psavert)) + geom_line()
