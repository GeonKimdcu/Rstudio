library(ggplot2)
ggplot(data = economics, aes(x=date, y = unemploy))+geom_line()

# 혼자서 해보기
# Q1.
ggplot(data = economics, aes(x=date, y = psavert)) + geom_line()
