#Chap 06 p.150 혼자서해보기

#Q1. 
mpg <- as.data.frame(ggplot2::mpg)
mpg_test <-mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty = mean(cty))

# Q2.
mpg_test %>% 
  arrange(desc(mean_cty))

# Q3.
mpg_test <- mpg %>%
  group_by(class) %>% 
  summarise(mean_hwy = mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>% 
  head(3)
mpg_test

# Q4.
mpg_test <- mpg %>%
  group_by(manufacturer) %>% 
  filter(class == "compact") %>% 
  summarise(n =n()) %>% 
  arrange(desc(n))
mpg_test
