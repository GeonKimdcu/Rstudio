data("iris")
head(iris)
library(rgl)
install.packages("devtools")
library(devtools)
install_github("vqv/ggbiplot")

install.packages("Rcpp")
library(ggbiplot)
pcadata <- princomp(iris[,1:4], cor=T, scores=T) 

plot(pcadata, type='l') 
summary(pcadata) 

ggbiplot(pcadata,groups = iris$Species) 
plot(pcadata$loadings[,1:2] ,col=c('black','blue','red','green'), pch=16)
legend('topleft',   c('Sepal.Length','Sepal.Width','Petal.Length','Petal.Width'),
         text.col=c('black','blue','red','green')) 
