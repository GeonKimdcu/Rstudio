# " 성별 월급차이는 연령대별로 다를까? "

# [1] 연령대 및 성별 월급 차이 분석하기
# 1. 연령대 및 성별 월급 평균표 만들기 
sex_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg, sex) %>%
  summarise(mean_income = mean(income))
sex_income  

# 2. 그래프 만들기
ggplot(data= sex_income, aes(x = ageg, y = mean_income, fill = sex))+
  geom_col()+
  scale_x_discrete(limits = c("young", "middle", "old"))
# fill 로 범주 만들기 

# 각 성별의 월급이 연령대 막대에 함께 표현되어있어 차이 비교하기 어려움. 그래서 geom_col(position = "dodge")로 막대를 분리할 수 있음 
ggplot(data = sex_income, aes(x=ageg, y= mean_income, fill = sex))+
  geom_col(position = "dodge")+
  scale_x_discrete(limits = c("young", "middle", "old"))

# 결론 : 초년은 차이가 없으나 중년부터 크게 벌어지기 시작함. 남성이 166만원 가량 더 많은 것을 알 수 있다.  노년에는 차이가 줄어들지만 여전히 남성의 월급이 92만원 가량 더 많다. 

# [2] 나이 및 성별 월급 차이 분석하기
# 성별 연령별 월급 평균표 만들기
sex_age <-welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(age,sex) %>% 
  summarise(mean_income = mean(income))

head(sex_age)

# 그래프 만들기
ggplot(data=sex_age, aes(x = age, y=mean_income, col = sex))+geom_line()
# aes() 의 col 파라미터에 sex지정해 성별에 따른 다른 색으로 표현 

# 결론 : 남성의 워급은 50세 전후까지 지속적으로 증가하다가 급격하게 감소하는 반면, 여성은 30세 전후까지 약간 상승하다가 그 이후로는 지속적으로 완만하게 감소한다는 것을 알 수 있다.