# 중간고사 데이터 생성
test1 <- data.frame(id = c(1, 2, 3,4, 5),
                midterm = c(60, 80, 70, 90, 85))
# 기말고사 데이터 생ㅅ
test2 <- data.frame(id = c(1,2,3,4,5),
                    final = c(70, 83, 65, 95, 80))
test1
test2

total <- left_join(test1, test2, by = "id")
total

name <- data.frame(class =c(1,2,3,4,5),
                   teacher = c("kim", "lee", "park", "choi", "jung"))
name

exam_new <-left_join(exam, name, by = "class")
exam_new

group_a <- data.frame(id = c(1,2,3,4,5),
                      test = c(60, 80,70,90,85))
group_b <- data.frame(id = c(6,7,8,9,10),
                      test = c(70, 83, 65, 95, 80))
group_a
group_b

group_all <- bind_rows(group_a, group_b)
group_all
