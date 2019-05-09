library(ggplot2)
# 1. 배경설정하기 
# x축은 displ, y축은 hwy로 지정해 배경생성 
ggplot(data = mpg, aes(x = displ, y=hwy))

# 2. 그래프 추가하기 
# 배경에 산점도 추가 
ggplot(data = mpg, aes(x = displ, y= hwy))+
  geom_point()

# 3. 축 범위를 조정하는 설정 추가하기 
# x축 범위 3~6으로 지정 
ggplot(data = mpg, aes(x = displ, y = hwy))+
  geom_point() + xlim(3,6)
# x축 범위 3~6, y축 범위 10~30으로 지정 
ggplot(data = mpg, aes(x = displ, y = hwy))+
  geom_point() +
  xlim(3,6)+
  ylim(10,30)

# 혼자서 해보기 
# Q1.
ggplot(data = mpg, aes(x= cty, y = hwy)) +
  geom_point()

# Q2.
ggplot(data = midwest, aes(x = poptotal, y= popasian))+
  geom_point()+
  xlim(0,500000)+ylim(0,10000)
