#=============================#
# 02. Social Network Analysis #
#=============================#

######################
# 2. R을 이용한 분석 #
######################

## (1) igraph를 이용한 분석

# (a) vertex(node)와 edge(선)로 이루어진 graph 생성
library(igraph) # 서로 연관이 있는 데이터들을 연결해서 표현해주는 그래프 
set.seed(2020)
ex1<-graph.empty() + vertices(letters[1:13], color="green") # vertices = vertex 
ex1 <- ex1 + vertices(letters[14:26], color="yellow")
ex1 <- ex1 + edges(sample(V(ex1), 80, replace=TRUE), color="blue")

# (b) 40개의 edge와 만드는 Vertex Sequence 80개 비교
head(E(ex1))
set.seed(2020)
sample(V(ex1), 80, replace=TRUE)

# (c) ex1의 관계를 그래프로 표시
plot(ex1)

# (d) vertex와 edge의 속성 변경
V(ex1)$color <- sample( c("skyblue", "pink"), vcount(ex1), rep=TRUE)
E(ex1)$color<-"grey"
plot(ex1)

# (e) vertex의 색상이 pink인 것끼리의 edge는 "pink"로 변환, skyblue인 것끼리의 edge는 skyblue로 변환
pk <- V(ex1)[ color == "pink" ]
E(ex1)[ pk %--% pk ]$color <- "pink"
skbl <- V(ex1)[ color == "skyblue" ]
E(ex1)[ skbl %--% skbl ]$color <- "skyblue"
plot(ex1)

# (f) edge의 방향성 제거
ex1_und<-as.undirected(ex1, mode='collapse')
plot(ex1_und)

# (g) edge의 weight 속성을 이용한 color 속성 변환
ex2 <- graph.lattice( c(10,10) )
set.seed(2020)
plot(ex2)

head(E(ex2))
E(ex2)$weight <- runif(ecount(ex2))
E(ex2)$color <- "grey"
E(ex2)[ weight > 0.8 ]$color <- "red"

set.seed(2020)
plot(ex2)

set.seed(2020)
plot(ex2, vertex.size=2, vertex.label=NA, layout=layout.kamada.kawai,edge.width=2+3*E(ex2)$weight)

# (h) graph의 measure (1)
average.path.length(ex2)
diameter(ex2)
ex2 <- rewire.edges( ex2, prob=0.05 )
average.path.length(ex2)
diameter(ex2)
transitivity(ex2) # clustring coefficient
degree.distribution(ex2) 

hist(degree(ex2))
plot(degree.distribution(ex2))

# (i) graph의 measure (2)
library(sna)
install.packages("foreign")
library(foreign)
ex3 <- read.dta("data/orgmat.dta")
str(ex3)

ex3<-as.matrix(ex3)
gplot(ex3)

degree(ex3)
pstar(ex3,effects=c("indegree"))
pstar(ex3,effects=c("outdegree"))
evcent(ex3)
betweenness(ex3)
closeness(ex3)
geodist(ex3)


## (2) facebook을 이용한 SNA 

# (a) a) id 등록 및 App 만들기
# https://developers.facebook.com/apps 에 접속하여 developer로 등록하고, app 생성 후 아래 수행

# (b) 인증서 받기
# 패키지 설치 및 인증서 저장
install.packages("Rfacebook")
install.packages("Rook")
library(Rfacebook)
library(Rook) 

fb_oauth=fbOAuth(app_id="2399387223670328", app_secret="4cae5772e301fba24d4800d31c9a8271")


# 위 스크립트 실행 후 지시에 따라 수행

save(fb_oauth, file="fb_oauth")    

# fb_oauth 파일 열기
load("fb_oauth")

# (c) Data 추출
# 내 정보 가져오기
me<-getUsers("me",token=fb_oauth)
# 에러 발생시 아래 사이트 지시에 따라 임시 토큰 발급받기
# http://www.analyticsvidhya.com/blog/2014/07/facebook-analyst/
token<-"EAAiGOt8lPjgBAITI28pyjqK4RDlZAUxi44CNFwwou6ZB1T5YEIItBaMi3aezczvm9ZAPxAiDZBX4FHb4PrblOt9uo4nSvxGzsPVjvjgy5MDSzmQarxDZCrcYj61lTuvlejteLa4iwRGNe7P0JwrnSCaOudyzBcCfNOhOO9O4DiFBXQ7QDyvJV8ZBcD75l7wJlQydc5iL2zzAZDZD" # input your temporary token
me<-getUsers("me",token=token)
me

# 친구 목록 불러오기
my_friends<-getFriends(token=fb_oauth,simplify=TRUE)
head(my_friends,n=10)

# 친구 정보 불러오기
my_friends_info<-getUsers(my_friends$id, token=fb_oauth,private_info=TRUE)
colnames(my_friends_info)
head(my_friends_info)

# (d) 관계 Data 추출 및 시각화
# 관계 data 추출
install.packages("igraph")
library(igraph)
a<-getNetwork(token=fb_oauth,format="edgelist",verbose=TRUE)
head(a)

# 관계 시각화
a2<-data.frame(a)
a3 <- graph.data.frame(a2)
a3$layout <- layout.fruchterman.reingold(a3)
ini<-function(x) substr(x,1,2)
V(a3)$name<-sapply(V(a3)$name,ini)
plot(a3,edge.arrow.size=0.1,vertex.size=1)

V(a3)$label<-NA 
V(a3)$width<-0.1 
plot(a3,edge.arrow.size=.3,vertex.size=1)

# 특정 친구 추출
dfa<-data.frame(a)
head(dfa)
hi<-grep("-----",dfa$X1)
hi2<-grep("-----",dfa$X1)
hi3<-grep("-----",dfa$X1)
k<-dfa[hi,]
j<-dfa[hi2,]
y<-dfa[hi3,]
kj<-rbind(k,j,y)
b<-data.frame(kj)
b2 <- graph.data.frame(b)
b2$layout <- layout.fruchterman.reingold(b2)
V(b2)$name<-sapply(V(b2)$name,ini)
plot(b2,edge.arrow.size=.3,vertex.size=1)

