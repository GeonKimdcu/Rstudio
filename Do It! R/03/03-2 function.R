x <- c(1,2,3)  
x 
mean(x)  # 평균값 구하기
max(x) # 최댓값 구하기
min(x) # 최솟값 구하

paste(str5, collapse = ",") # 쉼표를 구분자로 str5의 단어들 하나로 합치기 
paste(str5, collapse = "!") # !를 구분자로 str5의 단어들 하나로 합치기 
# collapse 는 단어를 구분할 문자를 지정하는 기능
# paste() 는 단어를 하나로 합치기
paste(str5, collapse = " ")

#함수의 결과물로 새 변수 만들기
x_mean <- mean(x)
x_mean
str5_paste <- paste(str5, collapse = " ")
str5_paste
