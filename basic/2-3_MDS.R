#===================#
# 04.다차원 척도법 => 2-3차원의 특정 위치에 관측치를 배치해 눈에 보기 쉽게 척도화한 것 #===================#

##################
# 3. R 분석 사례 #
##################

## (1) 전통적 다차원척도법
# Classical MDS은 Numeric data로만 이루어 짐.
# cmdscale 함수 사용 (stats 패키지) 

# (a) 사례1. watervoles

# Load the 'watevoles' data.
install.packages("HSAUR")
library(HSAUR)
data(watervoles, package = "HSAUR")
watervoles # 영국 14개 지역의 물쥐의 13개 특성 발현 비율 data 

# cmdscale 함수 적용...Matrix데이터들의 값을 거리로 생각하고, 2차원상으로 나타냄 
voles_mds <- cmdscale(watervoles)
voles_mds

# cmdscale 함수 적용(eig option)
# eig = eigenvalue... 일종의 고유값 생성
vole_mds <- cmdscale(watervoles, eig = TRUE)
vole_mds

# Assign names (dimension numbers) to the result vectors.
Dim1 <- voles_mds [,1]
Dim2 <- voles_mds [,2]

# Visualization
plot(Dim1, Dim2, type="n", xlab="",xlim=range(Dim1)*1.2, ylab="",ylim=range(Dim2)*1.2, main="cmdscale(watervoles)")
segments(-1, -0, 1, 0, lty="dotted") # segments => 나눠주는 역할 / 좌표점선 이어줌 
segments(0, -1, 0, 1, lty="dotted")  # dotted => 점선으로 표시 
text(Dim1, Dim2, rownames(voles_mds), cex=0.8) # 이름 띄어줌 

# Visualization with different markers and color.
plot(Dim1, Dim2, type="n", xlab="",xlim=range(Dim1)*1.2, ylab="",ylim=range(Dim2)*1.2, main="cmdscale(watervoles)")
segments(-1, -0, 1, 0, lty="dotted")
segments(0, -1, 0, 1, lty="dotted")
text(Dim1, Dim2, rownames(voles_mds), cex=0.8, col="red") # 글자 색 추가 


# (b) 사례2. 친족

# data load
library(foreign)
kinship.1 <- read.spss("http://www.unt.edu/rss/class/Jon/R_SC/Module9/MDS/kinship_dat.sav", use.value.labels=TRUE, max.value.labels=Inf, to.data.frame=TRUE)

kinship.1

# 'sourceid' 변수 제외
kinship.2 <- kinship.1 [1:15, 1:15]
kinship.2

# distance matrix 형태로 변환
kin.dist <- dist(kinship.2)
kin.dist

# 'cmdscale' 함수 적용
mds2 <- cmdscale(kin.dist)
mds2     # Returns the 2 dimensional vector values.

# 3차원 결과 도출 option 적용
mds3 <- cmdscale(kin.dist, k = 3)
mds3     # Returns the 3 dimensional vector values.

# 2차원 결과 시각화
plot(mds2)

Dim1 <- mds2[,1]
Dim2 <- mds2[,2]
plot(Dim1, Dim2, type="n", xlab="", ylab="", main="cmdscale(kin.dist)")
segments(-1500, -0, 1500, 0, lty="dotted")
segments(0, -1500, 0, 1500, lty="dotted")
text(Dim1, Dim2, colnames(kinship.2), cex=0.8, col="red")

# 3차원 결과 시각화
library(scatterplot3d)
scatterplot3d(mds3, color="dark blue", pch=1, main="Multidimensional Scaling 3-D Plot", sub="Three Dimensional Solution", grid=TRUE, box=TRUE)
mds3

## (2) 비계량적 다차원척도법(NonMetric MDS) numeric이 아닌 data를 포함 

# data load
library(MASS)
data(swiss) # 스위스 47개 불어권 도시에서의 demographic 정보/출산율 저하 data수집 
summary(swiss)
nrow(swiss)

# distance matrix로 변환
swiss.dist <- dist(swiss)

# isoMDS 함수 적용
swiss.mds <- isoMDS(swiss.dist)
swiss.mds

# 결과만 출력
swiss.mds$points
summary(swiss.mds$points)

# 시각화(기본)
plot(swiss.mds$points, type = "n")
text(swiss.mds$points, labels = as.character(1:nrow(swiss)))

# 시각화(segment와 text 포함)
plot(swiss.mds$points, type = "n")
segments(-75, -0, 55, 0, lty="dotted")
segments(0, -75, 0, 35, lty="dotted")
text(swiss.mds$points, labels = row.names(swiss), col = "red")
