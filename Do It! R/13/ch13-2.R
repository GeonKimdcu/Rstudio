# t검정 - 두 집단의 평균 비교
# compact자동차와 suv자동차의 도시 연비 t 검정 
mpg <- as.data.frame(ggplot2::mpg) 

library(dplyr)
mpg_diff <- mpg %>% select(class, cty) %>% 
  filter(class %in% c("compact", "suv"))

head(mpg_diff)
table(mpg_diff$class)

# t.test() 이용해 t검정 
t.test(data = mpg_diff, cty~class, var.equal = T)
# Y ~ X (class별 cty 차이검정 ) var.equal =T (등분산 검정)
# p-value < 2.2e-16  => 유의수준  0.05보다 작으므로 통계적으로 유의하다.

# 일반 휘발유(r)와 고급 휘발유(p)의 도시 연비 t 검정
mpg_diff2 <-mpg %>% 
  select(fl, cty) %>% 
  filter(fl %in% c("r", "p"))

table(mpg_diff2$fl)

t.test(data = mpg_diff2, cty~fl, var.equal = T)
# p-value = 0.2875 > a 유의수준 0.05보다 크므로 통계적으로 유의하지 않다. 