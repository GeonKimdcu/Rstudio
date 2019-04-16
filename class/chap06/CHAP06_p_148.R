library(dplyr)
exam %>% summarise(mean_math = mean(math))  # math 평균 산

exam %>% 
  group_by(class) %>%                # class 별로 분리
  summarise(mean_math = mean(math))   #  math 평균 산출

exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math),     
            sum_math = sum(math),
            median_math = median(math),    # math 중앙값
            n =n())                 # 학생 수

mpg %>% 
  group_by(manufacturer, drv) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  head(10)

# dplyr 조합하기
mpg %>% 
  group_by(manufacturer) %>%      # 회사별로 분리
  filter(class == "suv") %>%     # suv 추출
  mutate(total = (cty+hwy)/2) %>%    # 통합 연비 변수 생성
  summarise(mean_total = mean(total)) %>%    # 통합 연비 평균 산출
  arrange(desc(mean_total)) %>%    # 내림차순 정렬
  head(5)   # 1~5위 까지 출력`
