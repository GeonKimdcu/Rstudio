library(readxl)
list_job<- read_excel("Koweps_Codebook.xlsx", col_names = T, sheet =2)
head(list_job)
dim(list_job)

library(dplyr)     # left_join() 함수를 사용하기 위해선 dplyr 패키지 필요!
welfare <- left_join(welfare, list_job, by = "code_job")  # by 대신 id사용가능 
welfare %>% 
  filter(!is.na(code_job)) %>% 
  select(code_job, job) %>% 
  head(10)

job_income <- welfare %>% 
  filter(!is.na(job) & !is.na(income)) %>% 
  group_by(job) %>% 
  summarise(mean_income = mean(income))

head(job_income)

top10<- job_income %>% 
  arrange(desc(mean_income)) %>% 
  head(10)

top10

library(ggplot2)
ggplot(data = top10, aes(x = reorder(job, mean_income), y= mean_income))+geom_col()+
  coord_flip() # 막대가 회전되었기 때문에 reorder로 오름차순해도 큰값이 맨위로 옴 

bottom10 <- job_income %>% 
  arrange(mean_income) %>% 
            head(10)

bottom10

ggplot(data= bottom10, aes(x=reorder(job, -mean_income),
                           y= mean_income))+
  geom_col()+    # 막대그래프 함수
  coord_flip()+  # 막대 오른쪽으로 90도 회전 
  ylim(0,850)
