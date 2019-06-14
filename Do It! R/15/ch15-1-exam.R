# ch15-1 혼자서 해보기
# dplyr 대신 R 내장 함수를 이용해 "suv" 와 "compact"의 도시 및 고속도로 통합 연비
# 평균 구하기 

mpg <- as.data.frame(ggplot2::mpg)

mpg_df <- mpg %>% 
  mutate(tot = (cty+hwy)/2) %>% 
  filter(class == "compact" | class == "suv") %>% 
  group_by(class) %>% 
  summarise(mean_tot = mean(tot))

mpg$tot <- (mpg$cty + mpg$hwy)/2
df_comp <- mpg[mpg$class == "compact",]
df_suv <- mpg[mpg$class == "suv",]

mean(df_comp$tot)
mean(df_suv$tot)
