# "종교가 있는 사람들이 이혼을 덜 할까?"
# [1] 종교 변수 검토 및 전처리하기
# 1. 변수 검토하기
class(welfare$religion)
table(welfare$religion)

# 2. 전처리
# 종교 유무 이름 부여
welfare$religion <- ifelse(welfare$religion == 1, "yes", "no")
table(welfare$religion)
qplot(welfare$religion)

# [2] 혼인 상태 변수 검토 및 전처리하기
# 1. 변수 검토하기
class(welfare$marriage)
table(welfare$marriage)

# 2. 파생변수만들기
# 이혼 여부 변수 만들기
welfare$group_marriage <- ifelse(welfare$marriage == 1, "marriage",
                                 ifelse(welfare$marriage == 3, "divorce", NA))
table(welfare$group_marriage)
table(is.na(welfare$group_marriage))
qplot(welfare$group_marriage)

# [3] 종교 유무에 따른 이혼율 분석하기 
# 1. 종교 유무에 따른 이혼율 표 만들기
religion_marriage <- welfare %>% 
  filter(!is.na(group_marriage)) %>% 
  group_by(religion, group_marriage) %>% 
  summarise(n=n()) %>% 
  mutate(tot_group = sum(n)) %>% 
  mutate(pct = round(n/tot_group*100,1))  # round()는 소수점 나타내는 함수 
religion_marriage
# 또 다른 방법
religion_marriage <- welfare %>% 
  filter(!is.na(group_marriage)) %>% 
  count(religion, group_marriage) %>% 
  group_by(religion) %>% 
  mutate(pct=round(n/sum(n)*100,1))
# dplyr의 cound() 는 집단별 빈도를 구하는 함수 

# 2. 이혼율 표 
divorce <- religion_marriage %>% 
  filter(group_marriage == "divorce") %>% 
  select(religion,pct)
divorce

# 3. 그래프 만들기
ggplot(data = divorce, aes(x= religion, y=pct))+geom_col()

# 결론 :이혼율은 종교가 있는 경우 7.2%, 종교가 없는 경우 8.3% 이므로
# 종교가 있는 사람들이 이혼을 덜 한다고 볼 수 있다.

# [4] 연령대 및 종교 유무에 따른 이혼율 분석하기 
# 1. 연령대별 이혼율 표 만들기
ageg_marriage <- welfare %>% 
  filter(!is.na(group_marriage)) %>% 
  group_by(ageg,group_marriage) %>% 
  summarise(n=n()) %>% 
  mutate(tot_group = sum(n)) %>% 
  mutate(pct = round(n/tot_group*100,1))
ageg_marriage

# 또 다른 방법 
ageg_marriage <- welfare %>% 
  filter(!is.na(group_marriage)) %>% 
  count(ageg, group_marriage) %>% 
  group_by(ageg) %>% 
  mutate(pct = round(n/sum(n)*100,1))

# 2. 연령대별 이혼율 그래프 만들기
# 초년제외, 이혼 추출
ageg_divorce <-ageg_marriage %>% 
  filter(ageg != "young" & group_marriage == "divorce") %>% 
  select(ageg,pct)
ageg_divorce
#그래프 만들기
ggplot(data = ageg_divorce, aes(x=ageg, y= pct))+ geom_col()

# 3. 연령대 및 종교 유무에 따른 이혼율 표 만들기
# 연령대, 종교 유무, 결혼 상태별 비율표 만들기
ageg_religion_marriage <-welfare %>% 
  filter(!is.na(group_marriage) & ageg != "young") %>% 
  group_by(ageg, religion, group_marriage) %>% 
  summarise(n=n()) %>% 
  mutate(tot_group = sum(n)) %>% 
  mutate(pct = round(n/tot_group*100, 1))
ageg_religion_marriage

# 연령대 및 종교 유무별 이혼율 표만들기
df_divorce <-ageg_religion_marriage %>% 
  filter(group_marriage == "divorce") %>% 
  select(ageg, religion, pct)
df_divorce

# 4.연령대 및 종교 유무에 따른 이혼율 그래프 만들기
ggplot(data = df_divorce, aes(x=ageg, y=pct, fill=religion))+
  geom_col(position = "dodge")
