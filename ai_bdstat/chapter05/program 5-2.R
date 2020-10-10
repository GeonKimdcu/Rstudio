# Chapter 05
# 2. 이산변수 시각화
# 2.1 막대 차트 시각화
# (1) 세로 막대 차트
chart_data <- c(305, 450, 320, 460, 330, 480, 380, 520)
names(chart_data) <- c("2018 1분기", "2019 1분기",
                      "2018 2분기", "2019 2분기",
                      "2018 3분기", "2019 3분기",
                      "2018 4분기", "2019 4분기")

str(chart_data)
chart_data

barplot(chart_data, ylim=c(0, 600),
        col = rainbow(8),
        main = "2018년도 vs 2019년도 매출현황 비교")

help("barplot")

barplot(chart_data, ylim = c(0, 600),
        ylab = "매출액(단위: 만원)",
        xlab = "년도별 분기 현황",
        col = rainbow(8),
        main = "2018년도 vs 2019년도 매출현황 비교")

# (2) 가로 막대 차트
barplot(chart_data, xlim = c(0, 600), horiz = T,
        ylab = "매출액(단위: 만원)",
        xlab = "년도별 분기 현황",
        col = rainbow(8),
        main = "2018년도 vs 2019년도 매출현황 비교")

barplot(chart_data, xlim=c(0, 600), horiz=T,
        ylab = "매출액(단위: 만원)",
        xlab = "년도별 분기 현황",
        col = rainbow(8),space = 1, cex.names = 0.8,
        main = "2018년도 vs 2019년도 매출현황 비교")

barplot(chart_data, xlim = c(0, 600), horiz = T,
        ylab = "매출액(단위: 만원)",
        xlab = "년도별 분기 현황",
        col = rep(c(2,4), 4), space = 1, cex.names = 0.8,
        main = "2018년도 vs 2019년도 매출현황 비교")

barplot(chart_data, xlim = c(0, 600), horiz = T,
        ylab = "매출액(단위: 만원)",
        xlab = "년도별 분기 현황",
        col = rep(c("red", "green"), 4), space = 1, cex.names = 0.8,
        main = "2018년도 vs 2019년도 매출현황 비교")

# (3) 누적 막대 차트
data(VADeaths)
VADeaths

str(VADeaths)

mode(VADeaths)

par(mfrow = c(1, 2))
barplot(VADeaths, beside = T, col = rainbow(5),
        main = "미국 버지니아주 하위계층 사망비율")
legend(19, 71, c("50-54", "55-59", "60-64", " 65-69", "70- 74"),
       cex = 0.8, fill = rainbow(5))

barplot(VADeaths, beside = F, col = rainbow(5))
title(main = "미국 버지니아주 하위계층 사망비율", font.main = 4)
legend(3.8, 200, c("50-54", "55-59", "60-64", "65-69", "70-74"),
       cex = 0.8, fill = rainbow(5))

# 2.2 점 차트 시각화
help(dotchart)

par(mfrow = c(1,1))
dotchart(chart_data, color = c("blue", "red"),
         lcolor = "black", pch = 1:2,
         labels = names(chart_data),
         xlab = "매출액",
         main = "분기별 판매현황: 점차트 시각화",
         cex = 1.2)

# 2.3 원형 차트 시각화
help(pie)

par(mfrow = c(1,2))
pie(chart_data, labels = names(chart_data), col = rainbow(8), cex = 1.2, clockwise = F)
title("2018~2019년도 분기별 매출현황")

pie(chart_data, labels = names(chart_data), col = rainbow(8), cex = 1.2, clockwise = T)
title("2018~2019년도 분기별 매출현황")

par(mfrow = c(1,1))
plot(price, type = "o", pch = 20, col = "green",
     cex = 2.0, lwd = 3)
