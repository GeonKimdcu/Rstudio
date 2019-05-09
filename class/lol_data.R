# 데이터 다운로드
# 웹페이지에 테이블 형식으로 있는 자료를 XML 패키지를 사용해서 R로 다운

install.packages("XML")
library(XML)
Sys.setlocale("LC_ALL","English")
df <- readHTMLTable("http://lol.inven.co.kr/dataninfo/match/playerList.php",
                    header=T) 
str(df)

# 데이터 프레임 형식으로 변환
# 두 개의 데이터 프레임 중 첫 번째 제거
df <- df[[2]]
str(df)
View(df)

# 변수 이름 바꾸기
# name, cmp, result, k, d, a, kda, help 로 변경
df <- df[, -c(1, 2, 5)] 
names(df) <- c("name", "cmp", "result", "k", "d", "a", "kda", "help") 
str(df)

# 변수 유형 바꾸기
# 4~7열 Factor를 숫자로 변경, name 열 문자로 변경, help열 숫자로 변경
str(df) 
df[, 4:7] <- sapply(df[, 4:7], function(a){as.numeric(as.character(a))})
# sapply(데이터 프레임, 함수) : 데이터 프레임 여러 변수에 함수 명령어 동시 적용  (결과는 벡터 또는 행렬)
# Ex) sapply()함수를 활용하여 Cars93의 27개 변수 각각의 속성(class)를 알아보려면...
# sapply(Cars93, class) 을 실행하면 됨. 하지만 만약 sapply()함수를 사용하지 않는다면,
#- class(Cars93$Manufacturer); class(Cars93$Model); class(Cars93$Type);   ...(중략).... ; class(Cars93$Make)
# function은 사용자 정의 함수이다.  function_name <- function(arg_1, arg_2, ...) { 함수본문 }

df$name <- as.character(df$name)
df$help <- as.numeric(sub("%", "", df$help))/100

# 변수 분리하기
# name에서 team 분리
temp <- as.data.frame(do.call(rbind, strsplit(df$name, ' (?=[^ ]+$)', perl=TRUE))) 
str(temp)
df$name <- temp$V2
df$team <- temp$V1
View(df)

# 막대 그래프 그리기
# team count, team kda 그래프
library(ggplot2)
ggplot(df, aes(x=team))+geom_bar(fill="dark blue")
mean.df<-as.data.frame(tapply(df$kda, df$team, mean))
mean.df$team<-rownames(mean.df) 
names(mean.df)<-c("kda", "team")
mean.df
ggplot(mean.df, aes(team, kda))+geom_bar(stat="identity")
