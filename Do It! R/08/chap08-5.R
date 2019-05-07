ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()

# 혼자서 해보기
# Q1.
library(dplyr)
df_2 <- mpg %>% 
  filter(class %in% c("compact", "subcompact", "suv"))

ggplot(data = df_2, aes(x=class, y=cty)) + geom_boxplot()
