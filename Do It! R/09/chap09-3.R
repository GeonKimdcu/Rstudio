class(welfare$birth)
summary(welfare$birth)
qplot(welfare$birth)

summary(welfare$birth)
table(is.na(welfare$birth))

welfare$age <-2015-welfare$birth+1
summary(welfare$age)
qplot(welfare$age)

age_income <-welfare %>% filter(!is.na(income) & sex == "male") %>% 
  group_by(age) %>% 
  summarise(mean_income = mean(income))
head(age_income)

ggplot(data = age_income, aes(x=age, y=mean_income))+geom_line()


