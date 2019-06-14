# 15-2 변수 타입 
var1 <- c(1,2,3,1,2)           # numeric 변수 생성 
var2 <- factor(c(1,2,3,1,2))   # factor 변수 생성 

var1
var2   # Levels => 값의 범주를 의미 

class(var1)
class(var2)

# factor 변수의 값이 어떤 범주로 구성되어있는지 확인 => levels() 
levels(var1) # numeric -> NULL 
levels(var2)

# 변수 타입 바꾸기
var2 <- as.numeric(var2)     # numeric 타입으로 변환 
mean(var2)

class(var2)
levels(var2)

# 혼자서 해보기 
mpg <- as.data.frame(ggplot2::mpg)
class(mpg$drv)
mpg$drv <- as.factor(mpg$drv)
class(mpg$drv)
levels(mpg$drv)
