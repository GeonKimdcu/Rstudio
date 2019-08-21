################################
# chapter 2. R을 이용한 시각화 # 

## 01. ggplot2
install.packages("ggplot2")
library(ggplot2)
data(iris)
names(iris)
qplot(x=Sepal.Width, y=Petal.Length, data=iris, geom="point")

install.packages("Lock5Data")
library(Lock5Data)
data(SleepStudy)
names(SleepStudy)

ggplot(SleepStudy, aes(x=Drinks))+geom_bar()
ggplot(SleepStudy, aes(x=Drinks))+geom_histogram(binwidth=2,aes(y=..density..))

ggplot(SleepStudy, aes(x=ClassYear,y=Drinks))+geom_boxplot()
str(SleepStudy)
ggplot(SleepStudy, aes(x=factor(ClassYear),y=Drinks))+geom_boxplot()
ggplot(SleepStudy, aes(x=factor(ClassYear),y=Drinks))+geom_boxplot()+coord_flip()

ggplot(SleepStudy, aes(x=Drinks))+geom_density()


## 02. d3
install.packages("d3Network")
install.packages("RCurl")
library(d3Network)
library(RCurl)

Source <- c("A", "A", "A", "A", "B", "B", "C", "C", "D")
Target <- c("B", "C", "D", "J", "E", "F", "G", "H", "I")
NetworkData <- data.frame(Source, Target)
ericOpenHtml <- function(filename) {
  if (Sys.info()["sysname"]=="windows") {
    shell.exec(filename)
  } else {
    system(paste("open",filename)) # mac case
  }
}

d3SimpleNetwork(NetworkData, width = 400, height = 250,file="test1.html")
ericOpenHtml("test1.html")


#######################
# chapter 3. 공간분석 #
#######################
install.packages("ggmap")
install.packages("lubridate")
install.packages("RJSONIO")
library(ggmap)
library(lubridate)
# Satellite Map
mapImageData1 <- get_googlemap(location=c(lon=126.97947, lat=37.54893),color="color",source="google",maptype="satellite",zoom=10)
ggmap(mapImageData1,extent="device",ylab="Latitude",xlab="Longitude")

# Terrain Map
mapImageData1 <- get_googlemap(location=c(lon=126.97947, lat=37.54893),color="color",source="google",maptype="terrain",zoom=10)
ggmap(mapImageData1,extent="device",ylab="Latitude",xlab="Longitude")

# Various Maps
ggmap(get_googlemap(center='korea',zoom=7,maptype='roadmap'),extent='device')
ggmap(get_googlemap(center='korea',zoom=7,maptype='hybrid'),extent='device')

# earthquake in korea
eq<-read.table("eq.txt",sep="\t",header=T,stringsAsFactors=F)
head(eq)
eq$latitude<-unlist(strsplit(eq$latitude," "))[seq(from=1,to=nrow(eq),by=2)]
eq$latitude<-as.double(eq$latitude)
eq$longitude<-unlist(strsplit(eq$longitude," "))[seq(from=1,to=nrow(eq),by=2)]
eq$longitude<-as.double(eq$longitude)

eq$date<-ymd_hm(eq$date) # this may not be working, but it doesn't matter. Go ahead!
eq$year<-substr(eq$date,1,4)
head(eq)
ggmap(get_googlemap(center='korea',zoom=7,maptype='terrain'),extent='device')+geom_point(aes(x=longitude,y=latitude,size=power),data=eq, alpha=0.7)

# map with address
getGeoCode <- function(gcStr){
  library("RJSONIO")
  gcStr<-gsub(' ','%20',gcStr) # Encode URL Parameters
  # Open Connection
  connectStr<-paste('http://maps.google.com/maps/api/geocode/json?sensor=false&address=',gcStr,sep="")
  con <- url(connectStr)
  data.json <- fromJSON(paste(readLines(con),collapse=""))
  close(con)
  # Flatten the received JSON
  data.json <- unlist(data.json)
  if (data.json["status"]=="OK") {
    lat <- data.json["results.geometry.location.lat"]
    lng <- data.json["results.geometry.location.lng"]
    gcodes <- c(lat,lng)
    names(gcodes) <- c("Lat","Lng")
    return(gcodes)
  }
}

geoCodes <- getGeoCode("Palo Alto, California")
geoCodes

geoCodes <- getGeoCode("Seoul, South Korea")
geoCodes

geoCodes <- getGeoCode("Jongro Tower, Seoul, South Korea")
geoCodes

geoCodes <- getGeoCode("Jeju, South Korea")
geoCodes

# 아래 한글 코드는 Windows에서는 실행이 되지 않음.
geoCodes <- getGeoCode("옥수동 성동구 서울 대한민국")
geoCodes

geoCodes <- getGeoCode("금호동4가 성동구 서울 대한민국")
geoCodes


########################################
# chapter 4. shiny의 기본구성과 Layout #
########################################

## 02. shiny 맛보기 - hello_shiny
library(shiny)
setwd("./shiny_sample")
runApp("hello_shiny")

## 03. shiny 만들기 - Joshua Application
runApp("shinyApp")

setwd("../")
