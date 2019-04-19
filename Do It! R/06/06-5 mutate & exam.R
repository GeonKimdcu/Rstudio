library(dplyr)

exam %>%
  mutate(total = math + english + science) %>% 
  head

exam %>% 
  mutate(total = math + english + science,
         mean = total/3) %>% 
  head

exam %>% 
  mutate(test = ifelse(science >= 60, "pass", "false")) %>%
  head

exam %>% 
  mutate(total = math + english + science) %>% 
  arrange(total) %>% 
  head

# 혼자서 해보기

# Q1.
mpg_new <- mpg %>% 
  mutate(total = hwy + cty)
mpg_new

# Q2.
mpg_new <- mpg_new %>% 
  mutate(total_mean = total/2)
mpg_new

# Q3.
mpg_new %>% 
  arrange(desc(total_mean)) %>% 
  head(3)

# Q4.
mpg %>% mutate(total = cty+hwy,
               total_mean = (cty+hwy)/2) %>% 
  arrange(desc(total_mean)) %>% 
  head(3)
