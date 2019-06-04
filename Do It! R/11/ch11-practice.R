# 대한민국 시도별 노년층 비율 단계 구분도
library(ggiraphExtra)
library(ggplot2)
library(dplyr)
library(kormaps2014)
library(mapproj)

kormap1 %>% distinct(code, name1)

# 지역코드 목록 만들기
list_region <-data.frame(code_region = c(1:7),
                         map_code = c(11,31,38,37,34,33,35),
                         region = c("서울",
                                    "수도권(인천/경기)",
                                    "부산/경남/울산",
                                    "대구/경북",
                                    "대전/충남",
                                    "강원/충북",
                                    "광주/전남/전북/제주도"))
# welfare 파일 만들기 
library(foreign)
raw_welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav",
                         to.data.frame =T)
welfare<-raw_welfare
welfare <- rename(welfare,
                  sex = h10_g3, 
                  birth = h10_g4,
                  marriage = h10_g10,
                  religion = h10_g11,
                  income = p1002_8aq1,
                  code_job = h10_eco9,
                  code_region = h10_reg7)

welfare <- left_join(welfare, list_region, id="code_region")
# age 변수만들기 
welfare$birth <-ifelse(welfare$birth == 9999, NA, welfare$birth)
welfare$age <- 2015-welfare$birth +1
# ageg 연령대 변수 만들기 
welfare <- welfare %>% 
  mutate(ageg =ifelse(age<30, "young",
                      ifelse(age<=59, "middle", "old")))
# 지역별 연령대 
region_ageg <-welfare %>% 
  group_by(map_code, ageg) %>% 
  summarise(n=n()) %>% 
  mutate(tot_group = sum(n)) %>% 
  mutate(pct = round(n/tot_group*100,2))
# 지역별 노인율 
region_ageg_old <- region_ageg %>% 
filter(ageg == "old")

region_ageg_old[nrow(region_ageg_old)+1,] = list(23, "old", 1109, 3711, 29.9)
region_ageg_old[nrow(region_ageg_old)+1,] = list(32, "old", 555, 1257, 44.2)
region_ageg_old[nrow(region_ageg_old)+1,] = list(21, "old", 1124, 2785, 40.4)
region_ageg_old[nrow(region_ageg_old)+1,] = list(26, "old", 1124, 2785, 40.4)
region_ageg_old[nrow(region_ageg_old)+1,] = list(36, "old", 1233, 2922, 42.2)
region_ageg_old[nrow(region_ageg_old)+1,] = list(24, "old", 1233, 2922, 42.2)
region_ageg_old[nrow(region_ageg_old)+1,] = list(39, "old", 1233, 2922, 42.2)
region_ageg_old[nrow(region_ageg_old)+1,] = list(25, "old", 527, 1467, 35.9)
region_ageg_old[nrow(region_ageg_old)+1,] = list(22, "old", 928, 2036, 45.6)

ggChoropleth(data=region_ageg_old,
             aes(fill = pct,
                 map_id = map_code,
                 tooltip=name),
             map = kormap1,
             interactive = T)
