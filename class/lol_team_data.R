library(XML)
Sys.setlocale("LC_ALL","English")
df_team <- readHTMLTable("http://lol.inven.co.kr/dataninfo/match/teamTotal.php",
                    header=T) 
str(df_team)

df_team <- df_team[[2]]
str(df_team)
View(df_team)

df_team <- df_team[, -c(7:13)]
names(df_team) <- c("순위", "팀명", "total", "win", "lose", "승률") 
str(df_team)
View(df_team)

library(dplyr)
df_team <- df_team %>% 
  group_by(팀명) %>% 
  arrange(desc(승률)) %>% head(5)
df_team
library(ggplot2)
ggplot(data = df_team, aes(x=팀명, y= 승률))+geom_col()
