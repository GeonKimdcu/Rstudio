#Chap 06 p.150 혼자서해보기

#Q1. 
mpg <- as.data.frame(ggplot2::mpg)

mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty = mean(cty))

# Q2.
mpg %>%
  group_by(class) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty))

# Q3.
 mpg %>%
  group_by(manufacturer) %>% 
  summarise(mean_hwy = mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>% 
  head(3)
 
# Q4.
 mpg %>%
  filter(class == "compact") %>% 
  group_by(manufacturer) %>% 
  summarise(count =n()) %>% 
  arrange(desc(count))

          