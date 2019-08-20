#===========================#
# 군집분석 (Clustering) #

# 군집분석은 분류예측과 같이 타겟 값은 없는 데이터에서, 데이터 특성에 따라 집단을  
# 분리하는 방식으로 거리를 측정하여 집단의 이질성과 동질성을 평가하여 그룹화한다.

# 이질성으로 거리를 산출하고, 동질성으로 묶음으로서 집단을 구분하고, 
# 집단을 구분하는데 사용된 변수들의 집단 간 차이를 통해 profiling 하여 
# 데이터에 대한 구조적인 특성을 파악한다.

# 1. 정의
# 유사한 특성을 가진 그룹으로 나누어 집단의 특성을 도출하는 기법 

# 2. 분석 목적
# 각 집단의 프로파일링, 집단 간 차이분석, 특이집단 포착(Fraud), 군집의 결과를 
# 분류분석의 입력 변수로 투입. 

# 3. 활용 분야
# 유통사의 경우 수 많은 점포를 군집으로 나누어 군집별 전략 수립 활용
# 고객 세분화(시장 세분화 - 마케팅전략)

# 4. R을 이용한 거리 계산 

x1<-c(1,2)
x2<-c(1,3)
x3<-c(3,6)
x4<-c(4,7)
x5<-c(1,5)
x<-t(data.frame(x1,x2,x3,x4,x5))

#  유클리드 거리
euc_dist<-dist(x,method="euclidean")
euc_dist

# 체비셰프 거리 
che_dist<-dist(x,method="maximum")
che_dist

# 맨하탄 거리 
man_dist<-dist(x,method="manhattan")
man_dist

# 캔버라 거리 
can_dist<-dist(x,method="canberra")
can_dist

# 민코우스키 거리 
min_dist<-dist(x,method="minkowski")
min_dist

# 5. 계층적 군집분석(hierarchical clustering) 

# (1) 군집화 순서에 따른 분류
# 병합 방법: 가까운 관측치끼리 묶어 가는 방법, 주로 쓰임
# 분할 방법: 먼 관측치를 나누어 가는 방법 

# (2) dendrogram: 군집결과를 나무구조로 나타내 군집 간의 구조관계를 알 수 있도록 한 그래프 

# (3) 군집 간 거리 측정 방법에 따른 분류 
# 1) 최단연결법: 두 집단 간 관측치들의 거리의 최솟값을 군집 간의 거리로 정의
# 2) 최장연결법: 두 집단 간 관측치들의 거리의 최댓값을 군집 간의 거리로 정의
# 3) 평균연결법: 두 집단 간 관측치들의 거리의 평균을 군집 간의 거리로 정의
# 4) 중앙값연결법: 두 집단 관측치들의 중앙값의 거리를 군집 간의 거리로 정의 
# 5) 중심 연결법 
# 6) 와드 연결법 

# 6. R을 통한 계층적 군집화 

# 유클리드 거리를 제곱한 데이터를 가지고 최단연결법 한 결과 
sin_den<-hclust(euc_dist^2,method="single") # hclust -> 계층적 군집화 함수
plot(sin_den, main="Cluster Dendrogram - single")

# 최장연결법 
com_den<-hclust(euc_dist^2,method="complete")
plot(com_den, main="Cluster Dendrogram - complete")

# 평균연결법 
avg_den<-hclust(euc_dist^2,method="average")
plot(avg_den, main="Cluster Dendrogram - average")

# 중앙값 연결법 
med_den<-hclust(euc_dist^2,method="median")
plot(med_den, main="Cluster Dendrogram - median")

# 중심 연결법 
cen_den<-hclust(euc_dist^2,method="centroid")
plot(cen_den, main="Cluster Dendrogram - centroid")

# 와드 연결법 
war_den<-hclust(euc_dist^2,method="ward.D")
plot(war_den, main="Cluster Dendrogram - ward.D")


# 7. 비계층적 군집분석(non-hierarchical clustering)

# (1) 정해진 개수로 군집을 나누는데, 정해진 기준에 따라 
# 더 이상 개선이 되지 않을 때 까지 군집화를 진행
# 군집화 과정에서 관측치가 하나의 그룹에서 다른 그룹으로 이동되기도 한다. 
# 대표적인 예로서 k-means 군집화가 있다. 

# (2) k-means 군집화 algorithm 설명 

# n개의 관측치에 대해 k개의 군집으로 나눈 경우,
# 1) 임의로 k의 중심을 정해 각 관측치를 가장 가까운 중심에 묶어 첫 번째 군집을 만듦
# 2) 각 군집에 대해 군집 내 관측치의 거리를 계산하여 새로운 중심점을 구함
# 3) 새로 정한 중심점에 대해 각 관측치를 가까운 중심점으로 다시 묶어 군집을 재정의
# 4) 재정의된 군집이 이전 군집과 일치할 때까지 2)와 3)을 반복. 

# (3) 비계층적 군집방법의 종류
# 1) k-meansclustering  (Centroid-based clustering)
# 2) Expectation-Maximization (EM) clustering (Distribution-based clustering)
# 3) Density-based clustering
# 4) Fuzzy clustering: numeric variable만 가능, NA가 허용,
#                      관측치 개수/2개 까지 군집화 가능 

# 8. R을 이용한 비계층적 군집화 

## (1) k-means
install.packages("HDclassif")
library(HDclassif)
data(wine)
(k_wine <- kmeans(wine[,-c(1)],3))
# 첫 번째 cloumn 'class'는 clustering에서 제외. 군집의 개수는 3으로 시도 

table(k_wine$cluster,wine$class)

# wine data의 V1, V13 열만을 고르고, 색깔은 kmeans를 통한 군집별로 색깔을 입히며, 별표는 center를 나타냄.
plot(wine[,c("V1","V13")], col=k_wine$cluster)
points(k_wine$centers[,c("V1","V13")],col=1:3,pch=8,cex=2)

# scale함수를 사용해서, 변수 간의 척도를 표준화시키고 군집화한다. 
wine_s<-scale(wine[,-c(1)])
(k_wine_s <- kmeans(wine_s,3))

table(k_wine_s$cluster,wine$class)

plot(wine_s[,c("V1","V13")], col=k_wine_s$cluster)
points(k_wine_s$centers[,c("V1","V13")],col=1:3,pch=8,cex=2)

k_wine_res<-wine
k_wine_res$clst_s<-k_wine_s$cluster

table(k_wine_res$clst_s)

ind<-which(k_wine_res$clst_s==1)
summary(k_wine_res[ind,])

table(k_wine_res[ind,"class"])

## (2) pam
install.packages("cluster")
library(cluster)
(pam_wine <- pam(wine[,-c(1)],3))

table(pam_wine$cluster,wine$class)

plot(wine[,c("V1","V13")], col=pam_wine$cluster)
points(pam_wine$medoids[,c("V1","V13")],col=1:3,pch=8,cex=2)

pam_wine_s <- pam(wine_s,3)
table(pam_wine_s$cluster,wine$class)

plot(wine_s[,c("V1","V13")], col=pam_wine_s$cluster)
points(pam_wine_s$medoids[,c("V1","V13")],col=1:3,pch=8,cex=2)

## (3) Density-based Clustering
# observation끼리 뭉쳐 있는 것을 하나의 cluster로 정의. 다양한 모양을 할 수 있음.
install.packages("fpc")
library(fpc)
# eps = 거리 
(den_wine_s <- dbscan(wine_s, eps=2.6, MinPts=10, scale=TRUE))

table(den_wine_s$cluster,wine$class)

(den_wine_s1 <- dbscan(wine_s, eps=2.5, MinPts=8, scale=TRUE))

table(den_wine_s1$cluster,wine$class)

str(den_wine_s1)

plot(den_wine_s,wine_s[,c("V1","V13")])

## (4) Fuzzy Clustering
# 각 cluster에 속할 확률을 계산해줌 
install.packages("cluster")
library(cluster)
set.seed(2014)
f1<-cbind(rnorm(10, -5, 0.5), rnorm(10, -5, 0.5))
f2<-cbind(rnorm(10, 5, 0.5), rnorm(10, 5, 0.5))
f3<-cbind(rnorm(5, 0.5*1.67, 0.5), rnorm(5, 0.5*1.67, 0.5))
f<-rbind(f1,f2,f3)
fuz_f_2<-fanny(f,2)
(fuz_f_3 <- fanny(f,3))

plot(fuz_f_2)
plot(fuz_f_3)

# 9. R의 k-means clustering에서 적정한 cluster 수 찾기 
wss<-0
for(i in 1:15) wss[i]<-kmeans(wine_s,centers=i)$tot.withinss
plot(1:15,wss,type="b",xlab="Number of Cluster", ylab="Within group sum of squares")
# x축명은 군집개수, y축명은 분산합이고, x축은 1~15까지, 세로축은 wss이다. 
