# "어떤 직업이 월급을 가장 많이 받을까?"

# [1] 직업 변수 검토 및 전처리하기
# 1.변수 검토하기
class(welfare$code_job)
table(welfare$code_job)

# 2. 전처리
library(readxl)
list_job <- read_excel("Koweps_Codebook.xlsx", col_names =T, sheet =2)
head(list_job)
dim(list_job)

# 3.left_join() 으로 job변수에 welfare 결합 
# left_join() 공통 변수를 기준으로 결합하는 것임.
welfare <- left_join(welfare, list_job, by = "code_job")
welfare %>% 
  filter(!is.na(code_job)) %>% 
  select(code_job, job) %>% 
  head(10)

# [2] 직업별 월급 차이 분석하기 
# 1. 직업별 월급 평균표 만들기- 직업이 없거나 월급이 없는 사람은 분석대상이 아니므로 제외시킴
job_income <-welfare %>% 
  filter(!is.na(job)&!is.na(income)) %>% 
  group_by(job) %>%
  summarise(mean_income = mean(income))
head(job_income)

# 2. 내림차순으로 정렬해 상위 10개 추출
top10 <- job_income %>% 
  arrange(desc(mean_income)) %>% 
  head(10)
top10

# 3. 그래프 만들기
ggplot(data =top10, aes(x=reorder(job, mean_income), y=mean_income))+
  geom_col()+
  coord_flip()
# coord_flip() 가로막대그래프로 변경 / reorder에 부호가 없기에 오름차순 정렬 

# 결론 : '금속 재료 공학 기술자 및 시험원'이 평균 845만원으로 가장 많은 월급을 받고, 그 다음으로는 '의료진료 전문가'라는 것을 알 수 있다.

# 4. 하위 10개 추출
bottom10 <-job_income %>% 
  arrange(mean_income) %>% 
  head(10)
bottom10

# 그래프 만들기
ggplot(data = bottom10, aes(x=reorder(job, -mean_income), y=mean_income))+
  geom_col()+
  coord_flip()+
  ylim(0,850)

# 결론 : '가사 및 육아 도우미'의 월급이 평균 80만원 으로 가장 적고, 그 뒤로는 '임업관련 종사자'라는 것을 알 수 있다.
#상-하위 분석 결과를 비교하면 가장많은 월급을 받는 '금속 재료 공학 기술자 및 시험원'이 '가사 및 육아 도우미'의 열 배가 넘는
#월급을 받는다는 것을 알 수 있다. 
