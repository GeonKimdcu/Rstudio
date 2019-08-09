# 단순 선형 회구
head(cars)

plot(dist~speed, data = cars)
model <-lm(dist~speed, cars)  # lm()는 회귀분석에 이용되는 함수 
model

coef(model)[1]
coef(model)[2]

# 주행속도 speed 와 제동거리 dist 사이의 회귀식 
speed <- cars[,1]
pred <- 3.932 * speed - 17.579
pred

compare <- cbind(pred, cars[,2], abs(pred-cars[,2]))
compare

plot(dist~speed, data = cars)
abline(coef(model))
