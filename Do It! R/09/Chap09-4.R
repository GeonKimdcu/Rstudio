# "어떤 연령대의 월급이 가장 많을까? "

# [1] 연령대 변수 검토 및 전처리하기
# 파생변수 만들기-연령대 
welfare <- welfare %>% 
  mutate(ageg =ifelse(age<30, "young",
                      ifelse(age<=59, "middle", "old")))
table(welfare$ageg)
qplot(welfare$ageg)

# [2] 연령대에 따른 월급 차이 분석하기
# 연령대별 월급 평균표 만들기
ageg_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg) %>% 
  summarise(mean_income = mean(income))
ageg_income

# 그래프 만들기 
ggplot(data = ageg_income, aes(x=ageg, y= mean_income))+geom_col()
# ggplot()은 막대를 변수의 알파벳 순으로 정렬하도록 기본값 설정. 
# 막대 나이순으로 정렬하기 
ggplot(data = ageg_income, aes(x=ageg, y=mean_income))+
  geom_col()+
  scale_x_discrete(limits = c("young", "middle", "old"))
# scale_x_discrete(limits = c()) 로 범주 순서 지정할 수 있음

#결론 : 중년이 280만원 정도로 가장 많은 월급 받음. 다음으로 초년 다음은 노년순서임. 