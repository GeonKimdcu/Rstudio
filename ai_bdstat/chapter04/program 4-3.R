# Chapter 04
# 3. loop
# 3.1 for()

i <- c(1:10)
for(n in i) {
  print(n * 10)
  print(n)
}

i <- c(1:10)
for(n in i)
  if(n %% 2 == 0) print(n)

i <- c(1:10)
for(n in i) {
  if (n%%2==0) {
    next # 다음 문장으로 skip, 반복문 계속
  }else {
    print(n)
  }
}

name <- c(names(exam))
for(n in name) {
  print(n)
}

score <- c(85, 95, 98)
name <- c("홍길동", "이순신", "강감찬")
i <- 1
for(s in score) {
  cat(name[i], "->", s, "\n")
  i <- i + 1
}

# 3.2 while()
i = 0
while(i < 10) {
  i <- i + 1
  print(i)
}
