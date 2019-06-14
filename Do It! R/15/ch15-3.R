# 데이터 구조 
# 1.벡터
a <- 1
b <- "hello"

# 2. 데이터 프레임
x1 <- data.frame(var1 = c(1,2,3),
                 var2 = c("a", "b", "c"))

# 3. 매트릭스
x2 <- matrix(c(1:12), ncol = 2)
x2

# 4. 어레이
x3 <- array(1:20, dim = c(2, 5, 2))
x3

# 5. 리스트
x4 <- list(f1 = a,     # 벡터
           f2 = x1,    # 데이터 프레임 
           f3 =  x2,   # 매트릭스 
           f4 = x3)    # 어레이 
x4

mpg <- ggplot2::mpg
x <- boxplot(mpg$cty)
 