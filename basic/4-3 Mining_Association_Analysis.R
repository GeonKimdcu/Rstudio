#========================================#
# 연관성 분석(Association Analysis) #

# 연관성 분석은 동시 또는 순차적으로 발생하는 이벤트 패턴을 파악하는 방법으로 
# 구매나 사건의 발생에 대한 패턴분석을 하는데 사용됨.

# 1. 정의
# 데이터 간의 관계에서 조건과 반응을 연결하는 분석으로 장바구니 분석
# (Market Basket Analysis), 혹은 서열분석(Sequence Analysis)이라고도 함.

# 2. 활용 분야
# 마트의 특정 상품 간의 연관성을 통한 상품 디스플레이 방안 도출, 여행지 간 연관성을 
# 이용한 특정 상품의 마케팅 대상 고객 선정, 제조 설비의 품질 분석 등이 있다. 

# 3. 용어 정의

# (1) 지지도(Support)=(item1과 item2가 동시에 포함된 거래 건수) / 전체 거래 건수 
# 분석하고자 하는 전체 거래 건수 중 관심대상인 item이 어느 정도 있는지 보기 위한 
# 측도로 사전적으로 분석의 대상이 의미가 있는지 가늠할 수 있다.
# 따라서 일정 수준 이상이 팔리는 상품이어야 분석의 의미가 있다. 

# (2) 신뢰도(Confidence)
# = (item1과 item2가 동시에 포함된 거래 건수) / (item1이 포함된 거래 건수)
# item1을 사는 사람이 item2를 산다는 규칙이 어느 정도 확률도 존재하는지에 대한 
# 측도이다.

# (3) 향상도(Lift) 
# = (item1을 포함한 거래 중 item2도 포함된 거래의 비율) /item2를 포함한 거래의 비율
# item2를 구매하는 확률보다는 item1을 구매했을 때 
# item2를 구매하는 확률이 어느 정도로 높은지를 나타냄.
# item 1 (선행사건) / item 2 (후행사건)

# 4. R을 이용한 연관 분석 

## (1) arules 

# (a) data load
install.packages("arules")
library(arules)
data(Groceries)

str(Groceries)
table(Groceries@data@i)
table(Groceries@data@Dim)
head(Groceries@itemInfo)
summary(Groceries)
inspect(head(Groceries)) # 연관 규칙 발견 함수 

length(Groceries)
nrow(Groceries)
ncol(Groceries)

# (b) apriori function 규칙 도출 
G_arules<-apriori(Groceries, parameter=list(support=0.01, confidence=0.3))
# 최소support와 최소confidence 지정하여 비즈니스적으로 의미 없는 내용이 산출 X
summary(G_arules)
str(G_arules)
inspect(head(G_arules)) # 위 함수보다 훨씬 보기 용이하게 만들어줌 
# confidence는 매우 높더라도 support가 너무 낮으면 실제 적용될 수 있는지 고민해야함
summary(G_arules@quality$lift)

# (c) 125개의 도출된 규칙 중에서 특정조건에 만족하는 규칙을 뽑거나 내림차순으로 정리
(G_arules_yogurt <- subset(G_arules, subset = rhs %in% "yogurt" & lift > 2))
inspect(G_arules_yogurt)
inspect(G_arules_yogurt@lhs)

# 활용방안 

# 설정: lhs에 해당하는 제품을 구매하고, yogurt를 구매하지 않는 고객에 대해 
# yogurt 할인 쿠폰이 영수증과 함께 인쇄

# 효과: G_arules_yogurt 규칙에 언급된 상품을 구매하는 1%(Support)의 고객 중 
# 약 70%(1-confidence)고객에게 할인권 발행 -> 할인권을 이용해 yogurt를 
# 구매할 가능성이 일반적인 경우보다 2배(Lift>2) 높음

(G_arules_root_vegetables <- subset(G_arules, subset = rhs %in% "root vegetables" & lift > 2))
inspect(G_arules_root_vegetables)

# confidence 중심으로 높은 순 출력 
inspect(head(sort(G_arules_yogurt, by = "confidence"), n = 3))
inspect(head(sort(G_arules_yogurt, by = "support"), n = 3))


## (2) arulesSequences 순차연관성 분석 

# (a) data load & 탐색 
install.packages("arulesSequences")
library(arulesSequences) # arules의 추가기능 , C++의 원활한 환경 지원 
data(zaki)
? zaki
str(zaki)

summary(zaki)
inspect(head(zaki))
as(zaki,"data.frame")

length(zaki)
ncol(zaki)

# (b) cspade function -> 순차연관규칙 도출 
z_arules_Seq <- cspade(zaki, parameter = list(support=0.4),control=list(verbose=TRUE))
# parameter은 support 0.4에 해당하는 값을 뽑아주는 역할 
str(z_arules_Seq)
summary(z_arules_Seq)
as(z_arules_Seq,"data.frame")

## (3) arulesViz packages load 

# (a) 시각화 
install.packages("arulesViz")
library(arulesViz)
G_arulesViz<-apriori(Groceries, parameter=list(support=0.005, confidence=0.3))

G_arulesViz
inspect(head(G_arulesViz,by="confidence"))

plot(G_arulesViz)

#interactive Mode와 축 바꾸기 
plot(G_arulesViz,interactive=TRUE)
plot(G_arulesViz, measure=c("support", "lift"), 
     shading="confidence", 
     interactive=TRUE)

# Interactive mode 목록 설명 

# inspect: 화면에서 두 번 클릭으로 박스를 만들고 inspect를 클릭하면,
# 박스 내 존재하는 observation의 list를 보여줍니다 

# filter: 그래프의 우측 shading으로 표시된 항목(lift)에 대해 filter 적용. 
# filter를 클릭한 후, lift의 filter 대상을 클릭하면 
# 그 값의 이상에 해당하는 항목만 보여줌

# zoom in: 그래프 내의 observation에 대해 두 번 클릭으로 박스를 지정하고,
# zoom in을 클릭하면 해당 부분만을 나타내도록 zoom in

# zoom out: zoom in 혹은 filter를 적용하기 바로 전 단계로 zoom out

# end: interactive 그래프 모드의 종료 


# (d) 참고: 모델 subset :
G_arulesViz_sub1 <- G_arulesViz[quality(G_arulesViz)$confidence > 0.5]
G_arulesViz_sub1

# (e) 모델 시각화1: 규칙의 matrix화, lift만을 measure로 하여 시각화 

# 도출된 규칙에 대해 성과의 측면이 아닌, 
# item 측면에서 어느 item이 효과가 있는지를 시각화 함. 
plot(G_arulesViz_sub1, method="matrix", measure="lift")

# (f) 모델 시각화2: 규칙의 matrix화, lift와 confidence를 measure로 하여 시각화
plot(G_arulesViz_sub1, method="matrix", measure=c("lift", "confidence"))

# (g) 모델 시각화3: 규칙의 3차원 matrix화, lift를 한 축으로 하여 시각화
plot(G_arulesViz_sub1, method="matrix3D", measure="lift")

# (h) 모델 시각화4: 모델시각화 그룹옵션으로 시각화 
plot(G_arulesViz_sub1, method="grouped")

# (i) 모델 시각화5: lift 상위 10개에 대해 그래프 옵션으로 시각화
G_arulesViz_sub2 <- head(sort(G_arulesViz, by="lift"),10)
plot(G_arulesViz_sub2, method="graph", control=list(type="items"))
