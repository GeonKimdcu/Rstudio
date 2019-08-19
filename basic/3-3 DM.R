#==============================#
# 03. 기초 분석 및 데이터 관리 #
#==============================#

# 1. Missing Data 처리
# 해당 변수의 대푯값을 imputation, 변수간의 관계를 이용한 imputation이 있다. 
# imputation -> 결측값 대체 

# 확인
# NA: Not Available(값이 없음) / NaN: Not a Number(불가능한 값) ex) infinite, 0/0

# 확인법: NA로 입력 / is.na()로 확인 
# Tip) Missing Data를 제외하느냐, 대체하느냐 또 어떻게 대체하느냐가 중요함.
# missing을 대체한다는 것은 예측력을 높여줄 수도 있음. but 정확도가 떨어질 수도 있음

# 2. Missing Data 확인 및 제외 방법 


Final4_team <- c("GER","ARG","NED","BRA",NA) # 입력 
is.na(Final4_team) # 확인 방법

Final4<-data.frame(team=c("GER","ARG","NED","BRA","GER","BRA","ARG","NED"),
                   stage=c(rep("F",2),rep("34",2),rep("QF",4)),
                   res=c("1","0","0","3","1","7","0(2)","0(4)"))
Final4 # rep -> 값을 반복해줌 

Final4[Final4$stage=="QF","res"] <- NA # 대체 방법
Final4

mean(as.numeric(as.character(Final4$res)))
mean(as.numeric(as.character(Final4$res)), na.rm=T) # na.rm =T는 NA값 제외 

Final4[!complete.cases(Final4),] # NA가 들어있는 행만을 출력 
# complete.cases -> 행에 누락된 데이터가 없는(NA가 존재하지 않는)지를 확인해주는 함수
# 없다면 TRUE / 있다면 FALSE

# 3. Amelia를 이용한 Missing Data 처리 #

install.packages("Amelia")
library(Amelia)
data(africa) # 아프리카 6개국의 정치와 경제 변수 Data
head(africa)

# trade에 5개의 NA 존재 / gdp_pc에 2개의 NA 존재
summary(africa)

# 변수들의 관계를 이용한 imputation
# m: 몇 개의 imputation dataset을 만들지 결정하는 값 
# ts: 시계열에 대한 정보(연도) 
# cs: cross-sectional 분석에 포함될 정보(국가, country)
a.out <- amelia(africa, m = 3, ts = "year", cs = "country")

# imputation 전
missmap(a.out)

# imputation 후
africa$trade <- a.out$imputation[[3]]$trade
missmap(africa)

# 4. Outlier Detection #

## (6) outlier가 있는 row를 파악할 수 있는 방법
install.packages("DMwR")
library(DMwR)
data(wine,package="HDclassif")
head(wine)

wine_od <- wine[,c(8,11,14,2)]
outlier.scores <- lofactor(wine_od, k = 5) # local outlier factor
# lofactor은 샘플의 밀도를 측정해 가장 밀도에서 벗어나는 데이터
# 즉, LOF값이 가장 큰 데이터를 이상치로 추정 
plot(density(outlier.scores))

outliers <- order(outlier.scores, decreasing = T)[1:5]
print(outliers) # 이상치가 존재하는 row의 번호 출력 

summary(wine_od)

n <- nrow(wine_od)
labels <- 1:n
labels[-outliers] <- "." # outlier을 제외한 모든 값들을 " . " 으로 대체 
biplot(prcomp(wine_od), cex = 0.8, xlabs = labels)

pch <- rep(".", n)
pch[outliers] <- "+"
col <- rep("black", n)
col[outliers] <- "red" # outlier만 빨간 점으로 찍힘 
pairs(wine_od, pch = pch, col = col)
