#chap 06-7 혼자서 해보기

fuel <- data.frame(fl = c("c", "d", "e", "p", "r"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)
fuel

mpg <- as.data.frame(ggplot2::mpg)

# Q1.
mpg <- left_join(mpg, fuel, by ="fl")

# Q2  .
mpg %>% select(model, fl, price_fl) %>% head(5)
