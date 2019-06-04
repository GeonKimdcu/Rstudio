install.packages("stringi")
install.packages("devtools")
devtools::install_github("cardiomoon/kormaps2014")
library(kormaps2014)


list_region <- data.frame(code_region = c(1:7),
                          map_code = c(11,31,38,37,34,33,35),
                          region = c("서울",
                                     "수도권(인천/경기)",
                                     "부산/경남/울산",
                                     "대구/경북",
                                     "대전/충남",
                                     "강원/충북",
                                     "광주/전남/전북/제주도"))

welfare<- left_join(welfare, list_region, id="code_region")
region_ageg <-welfare %>% 
  group_by(map_code, ageg) %>% 
  summarise(n=n()) %>% 
  mutate(tot_group = sum(n)) %>% 
  mutate(pct=round(n/tot_group*100,2))

region_ageg_old <- region_ageg %>% filter(ageg == "old")

region_ageg_old[nrow(region_ageg_old)+1,] = list(23, "old", 1109, 3711, 29.9)
region_ageg_old[nrow(region_ageg_old)+1,] = list(32, "old", 555, 1257, 44.2)
region_ageg_old[nrow(region_ageg_old)+1,] = list(21, "old", 1124, 2785, 40.4)
region_ageg_old[nrow(region_ageg_old)+1,] = list(26, "old", 1124, 2785, 40.4)
region_ageg_old[nrow(region_ageg_old)+1,] = list(36, "old", 1233, 2922, 42.2)
region_ageg_old[nrow(region_ageg_old)+1,] = list(24, "old", 1233, 2922, 42.2)
region_ageg_old[nrow(region_ageg_old)+1,] = list(39, "old", 1233, 2922, 42.2)
region_ageg_old[nrow(region_ageg_old)+1,] = list(25, "old", 527, 1467, 35.9)
region_ageg_old[nrow(region_ageg_old)+1,] = list(22, "old", 928, 2036, 45.6)

str(changeCode(kormap1))
korpop1 <-rename(korpop1,
                 pop = 총인구_명,
                 name = 행정구역별_읍면동)
str(changeCode(kormap1))

install.packages("ggiraphExtra")
library(ggiraphExtra)
install.packages("mapproj")
library(mapproj)



ggChoropleth(data = region_ageg_old,
              aes(fill = pct,
                  map_id = map_code,
                  tooltip = name),
              map=kormap1,
              interactive = T)
