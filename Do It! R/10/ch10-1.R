# KoNLP 사용하려면  rJava, memoise 패키지 필요 
install.packages("rJava")
install.packages("memoise")
install.packages("KoNLP")
install.packages("digest")
library(KoNLP)
library(dplyr)
useNIADic() # KoNLP 지원 
txt<-readLines("hiphop.txt") # readLines() 텍스트 파일 불러오기 
head(txt)

install.packages("stringr") # 문자처리 패키지 
library(stringr)
txt<-str_replace_all(txt, "\\W", " ")

extractNoun("대한민국의 영토는 한반도와 그 부속도서로 한다")
nouns <-extractNoun(txt)
wordcount <- table(unlist(nouns))
df_word <-as.data.frame(wordcount, stringsAsFactors = F)
df_word <-rename(df_word,
                 word = Var1,
                 freq = Freq)

df_word <- filter(df_word, nchar(word)>=2)

install.packages("wordcloud")
library(wordcloud)
library(RColorBrewer)
pal <-brewer.pal(8, "Dark2")
set.seed(1234)

wordcloud(words = df_word$word,
          freq = df_word$freq,
          min.freq = 2,
          max.words = 200,
          random.order = F,
          rot.per = .1,
          scale = c(4, 0.3),
          colors = pal)

pal <-brewer.pal(9, "Blues")[5:9]
set.seed(1234)
wordcloud(words = df_word$word,
          freq = df_word$freq,
          min.freq = 2,
          max.words = 200,
          random.order = F,
          rot.per = .1,
          scale = c(4, 0.3),
          colors = pal)

pal <-brewer.pal(9, "Accent")
set.seed(1234)
wordcloud(words = df_word$word,
          freq = df_word$freq,
          min.freq = 2,
          max.words = 200,
          random.order = F,
          rot.per = .1,
          scale = c(4, 0.3),
          colors = pal)

