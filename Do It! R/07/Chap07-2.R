# 1. 이상치 제거하기 
# 이상치가 포함된 데이터 생성 
outlier <- data.frame(sex = c(1,2,1,3,2,1),
                      score = c(5,4,3,4,2,6))
outlier

# 이상치 확인하기 
table(outlier$sex)
table(outlier$score)

# 결측 처리하기 
outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)
outlier
outlier$score <- ifelse(outlier$score>5, NA, outlier$score)
outlier
outlier %>% filter(!is.na(sex)& !is.na(score)) %>% 
  group_by(sex) %>% 
  summarise(mean_score = mean(score))

# 2. 박스플롯 -극단적인 값 
# 상자그림 만들기 
boxplot(mpg$hwy)

# 5가지 통계치(stats)
boxplot(mpg$hwy)$stats

# 결측 처리하기
mpg$hwy <- ifelse(mpg$hwy <12 | mpg$hwy>37, NA, mpg$hwy)
table(is.na(mpg$hwy))

mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy=mean(hwy, na.rm =T))
