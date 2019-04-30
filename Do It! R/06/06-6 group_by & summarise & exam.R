library(dplyr)

exam %>% summarise(mean_math = mean(math))

exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math))

exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            median_math = median(math),
            n= n())

mpg %>%
  group_by(manufacturer, drv) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  head(10)

# 직접 해보세요!
mpg %>%
  group_by(manufacturer) %>% 
  filter(class == "suv") %>% 
  mutate(tot = (hwy + cty)/2) %>% 
  summarise(mean_tot = mean(tot)) %>% 
  arrange(desc(mean_tot)) %>% 
  head(5)

# 혼자서 해보기
mpg <- as.data.frame(ggplot2::mpg)

# Q1.
mpg_new<- mpg %>%
  group_by(class) %>% 
  summarise(mean_cty = mean(cty))
mpg_new

# Q2.
mpg_new %>% arrange(desc(mean_cty))

# Q3.
mpg %>%
  group_by(class) %>% 
  summarise(mean_hwy = mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>% 
  head(3)

# Q4.
mpg %>% 
  filter(class == "compact") %>%   // filter로 먼저 차종 추출하고 회사별로 그룹 
  group_by(manufacturer) %>% 
  summarise(compact_n = n()) %>%    // 빈도 구하는 함수n() 공백으로 놔두기! 
  arrange(desc(compact_n))
