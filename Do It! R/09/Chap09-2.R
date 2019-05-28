# "성별에 따라 월급이 다를까?"

# [1]성별 변수 검토 및 처리
# 1. 변수 검토하기
class(welfare$sex)  # class() 변수의 타입 파악 / numeric 숫자형 
table(welfare$sex)   # 1 은 남성/ 2는 여성   table() 빈도표 생성 

# 2. 전처리  / 이상치 확인 
table(welfare$sex)

# 이상치 결측 처리 
welfare$sex <- ifelse(welfare$sex == 9, NA, welfare$sex)
# 결측치 확인
table(is.na(welfare$sex))
# 성별 항목 이름 부여
welfare$sex <- ifelse(welfare$sex == 1, "male", "female")
table(welfare$sex)
qplot(welfare$sex)

# [2] 월급 변수 검토 및 전처리
# 1. 변수 검토하기
class(welfare$income)
summary(welfare$income)
# table()은 범주 변수일 때 / summary()는 연속 변수일 때
qplot(welfare$income)

qplot(welfare$income)+xlim(0,1000)   # x축 0~1000까지 

# 2. 전처리
# 이상치 확인
summary(welfare$income)
# 이상치 결측 처리 
welfare$income <- ifelse(welfare$income %in% c(0,9999), NA, welfare$income)
# 결측치 확인
table(is.na(welfare$income))

# [3] 성별에 따른 월급 차이 분석하기 
# 1. 성별 월급 평균표 만들기 
sex_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(sex) %>% 
  summarise(mean_income = mean(income))
sex_income

# 2. 그래프 만들기
ggplot(data= sex_income, aes(x=sex, y= mean_income)) +geom_col()
# geom_col() 는 요약표 이용 / geon_bar() 는 원자료 이용 

# 결론 : 남성의 월급이 여성의 두 배 가까이 될 정도로 많다. 