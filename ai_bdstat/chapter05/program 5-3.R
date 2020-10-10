# Chapter 05
# 3. 연속변수 시각화
# 3.1 상자 그래프 시각화

boxplot(VADeaths, range = 0) # notch = FALSE

boxplot(VADeaths, range = 0, notch = T)
abline(h = 37, lty = 3, col = "red")

summary(VADeaths)

# 3.2 히스토그램 시각화
data(iris)
names(iris)

str(iris)

head(iris)

summary(iris$Sepal.Length)

hist(iris$Sepal.Length, xlab = "iris$Sepal.Length", col = "magenta",
     main = "iris 꽃바침 길이 Histogram", xlim = c(4.3, 7.9))

summary(iris$Sepal.Width)

hist(iris$Sepal.Width, xlab = "iris$Sepal.Width", col = "mistyrose",
     main = "iris 꽃받침 너비 Histogram", xlim = c(2.0, 4.5))

par(mfrow = c(1,2))
hist(iris$Sepal.Width, xlab = "iris$Sepal.Width",
     col = "green", main = "iris 꽃받침 너비 Histogram:빈도수", xlim = c(2.0, 4.5))

hist(iris$Sepal.Width, xlab = "iris$Sepal.Width",
     col = "mistyrose", freq = F,
     main = "iris 꽃받침 너비 Histogram: 확률 밀도", xlim = c(2.0, 4.5))

lines(density(iris$Sepal.Width), col = "red")

par(mfrow = c(1,1))
hist(iris$Sepal.Width, xlab = "iris$Sepal.Width", col = "mistyrose",
     freq = F, main = "iris 꽃받침 너비 Histogram",
     xlim = c(2.0, 4.5))

lines(density(iris$Sepal.Width), col = "red")

x <-seq(2.0, 4.5, 0.1)
curve(dnorm(x, mean = mean(iris$Sepal.Width),
            sd = sd(iris$Sepal.Width)),
      col = "blue", add=T)

# 3.3 산점도 시각화
price <- runif(10, min = 1, max = 100)
plot(price, col = "red")

par(new = T)
line_chart = 1:100
plot(line_chart, type = "l", col = "red", axes = F, ann = F)
text(70, 80, "대각선 추가", col = "blue")

par(mfrow = c(2,2))
plot(price, type = 'l') # 실선
plot(price, type = "o") # 원형과 실선
plot(price, type = "h") # 직선
plot(price, type = "s") # 꺽은선

par(mfrow = c(2,2))
plot(price, type = "o", pch = 5)
plot(price, type = "o", pch = 15)
plot(price, type = "o", pch = 20, col = "blue")
plot(price, type = "o", pch = 20, col = "orange", cex = 1.5)


# 3.4 중첩 자료 시각화
x <- c(1,2,3,4,2,4)
y <- rep(2, 6)
x;y

table(x, y)
plot(x, y)

xy.df <- as.data.frame(table(x, y))
xy.df

plot(x, y, pch = "@", col = "blue",
     cex = 0.5*xy.df$Freq,
     xlab = "x 벡터 원소", ylab = "y 벡터 원소")

library(UsingR)
data(galton)

galtonData <- as.data.frame(table(galton$child, galton$parent))
head(galtonData)

names(galtonData) = c("child", "parent", "freq")
head(galtonData)
parent <- as.numeric(galtonData$parent)
child <- as.numeric(galtonData$child)

plot(parent, child, pch = 21, col = "blue", bg = "green",
     cex = 0.2 * galtonData$freq,
     xlab = "parent", ylab = "child")

# 3.5 변수 간의 비교 시각화
attributes(iris)
pairs(iris[iris$Species == "virginica", 1:4])

pairs(iris[iris$Species == "setosa", 1:4])

install.packages("scatterplot3d")
library(scatterplot3d)

iris_setosa = iris[iris$Species == 'setosa',]
iris_versicolor = iris[iris$Species == 'versicolor',]
iris_virginica = iris[iris$Species == 'virginica',]

d3 <- scatterplot3d(iris$Petal.Length,
                    iris$Sepal.Length,
                    iris$Sepal.Width,
                    type = 'n')

d3$points3d(iris_setosa$Petal.Length,
            iris_setosa$Sepal.Length,
            iris_setosa$Sepal.Width,
            bg = 'orange', pch = 21)

d3$points3d(iris_versicolor$Petal.Length,
            iris_versicolor$Sepal.Length,
            iris_versicolor$Sepal.Width,
            bg = 'blue', pch = 23)

d3$points3d(iris_virginica$Petal.Length,
            iris_virginica$Sepal.Length,
            iris_virginica$Sepal.Width,
            bg = 'green', pch = 25)
