# chap 06-5
library(dplyr)
exam %>
  % mutate(total = math+english + science) %>%  # 총합 변수 추가 
head   # 일부 추출 

exam %>% 
  mutate(total = math + english + science,      # 총합 변수 추가
         mean = (math + english + science) / 3) %>% 가  # 총평균 변수 추가 
  head  # 일부 추출  
         
exam %>%
  mutate(test = ifelse(science >= 60, "pass", "fail")) %>% 
  head

exam %>% 
  mutate(total = math + english + science) %>% 
  arrange(total) %>% 
  head

# 혼자서 해보기
# Q1.
mpg <- as.data.frame(ggplot2 ::mpg)
mpg_1 <- mpg %>% 
  mutate(total =cty + hwy) %>% 
  head
mpg_1
# Q2.
mpg_1 %>% 
  mutate(mean =(cty + hwy)/2) %>% 
  head
# Q3.
mpg_1 %>% arrange(desc(mean))%>%
  head(3)
# Q4.
mpg %>%  mutate(total = cty + hwy,
                mean = (cty + hwy)/2) %>%
  arrange(desc(mean)) %>% 
  head(3)
