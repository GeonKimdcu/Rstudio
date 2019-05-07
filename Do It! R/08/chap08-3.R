# 평균 막대 그래프
library(dplyr)
library(ggplot2)
# 1. 집단별 평균표 만들기 
mpg<-as.data.frame(ggplot2::mpg)

df_mpg <- mpg %>% 
  group_by(drv) %>% 
 summarise(mean_hwy = mean(hwy))

df_mpg

# 2. 그래프 생성하기 
ggplot(data = df_mpg, aes(x = drv, y = mean_hwy))+
  geom_col()   # 막대 그래프 만드는 함수 geom_col()

# 3. 크기 순으로 정렬하기 
ggplot(data = df_mpg, aes(x=reorder(drv, -mean_hwy), y =mean_hwy))+
  geom_col()
# reorder(x축 변수, 정렬 기준으로 삼을 변수지정)    -는 내림차순 없으면 오름차순 

# 빈도 막대 그래프 만들기 
# 빈도 막대그래프는 y축 없이 지정, geom_bar() 사용
ggplot(data=mpg, aes(x=drv))+geom_bar()

ggplot(data=mpg, aes(x=hwy))+geom_bar()

# geom_col() 는 요약값을 사용 / geom_bar()는 원자료 사용 

# 혼자서 해보기 
# Q1.
df <- mpg %>% 
  filter(class=="suv") %>% 
  group_by(manufacturer) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty)) %>% 
  head(5)
df

ggplot(data=df, aes(x=reorder(manufacturer, -mean_cty), y=mean_cty)) +
  geom_col()
# Q2.
ggplot(data= mpg, aes(x=class))+
  geom_bar()
