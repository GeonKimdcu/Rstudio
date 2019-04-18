# chap06 분석 도전! 
library(ggplot2)
library(dplyr)
midwest <- as.data.frame(ggplot2::midwest)
# Q1.
midwest <- midwest %>% mutate(ratio_child = (poptotal - popadults) / poptotal * 100)
midwest
# Q2.
 midwest %>% arrange(desc(ratio_child)) %>% 
  select(county, ratio_child) %>% 
  head(5)
midwest
# Q3.
midwest <- midwest %>% mutate(ratio_child_grade = ifelse(ratio_child >= 40, "large",
                                    ifelse( ratio_child >= 30, "middle","small")))
midwest
# ratio가 40 이상인 경우에서 거짓이라면 그다음 ifelse는 40미만을 포함하고있음
# 그래서 30이상만 적어야 함.
table(midwest$ratio_child_grade)

# Q4.
midwest %>% mutate(ratio_asian = popasian/ poptotal * 100) %>% 
  arrange(ratio_asian) %>% 
  select(state, county,ratio_asian) %>% 
  head(10)

