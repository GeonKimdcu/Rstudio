# 분석도전
midwest <- as.data.frame(ggplot2::midwest)
# Q1.
midwest <- midwest %>% 
  mutate(ratio_minor = (poptotal-popadults)/poptotal*100)
midwest
# Q2.
midwest %>% select(county, ratio_minor) %>% 
  arrange(desc(ratio_minor)) %>% head(5)

# Q3.
midwest <- midwest %>% mutate(grade = ifelse(ratio_minor>=40, "large",
                                  ifelse(ratio_minor>=30, "middle", "small")))

# Q4.
midwest %>% mutate(ratio_asian = popasian / poptotal *100) %>% 
  arrange(ratio_asian) %>% 
  select(state, county, ratio_asian) %>% 
  head(10)
