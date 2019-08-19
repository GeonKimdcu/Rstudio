#=================#
# 03. 시계열 분석  => 시간의 흐름에 따라 관찰된 데이터
#=================#

##################
# 2. 시계열 모형 #
##################

## (5) R을 이용한 시계열 분석 사례 # 

# (a) Fitting an AR model

# data load
data(lynx) # 캐나다 스라소니 수에 대한 데이터 
head(lynx)

# data 탐색
ts.plot(lynx)  # 시계열 데이터로 변환 ts...

# acf 자기상관함수 
acf(lynx)
#  동일한 변수에서 얻어지는 연속적인 관측값들 사이의 상호 연관 관계를 나타내는 척도

# log transformation 비정상성 제거하기
ts.plot(log(lynx))
acf(log(lynx))

# pacf  편자기상관함수 ..두 변수 사이의 순수한 상관계수를 구하는 척도
acf(log(lynx),type="partial") 

# AR model 생성
llynx.ar <- ar.yw(log(lynx))  # AIC을 사용해 모델의 차수 결정 

# 결과 확인
names(llynx.ar) # 생성된 오브젝트의 구성요소 확인 
llynx.ar$order.max

ts.plot(llynx.ar$aic, main="AIC for Log(Lynx)")
llynx.ar$order
llynx.ar$ar

# Visualization
ts.plot(log(lynx) - llynx.ar$resid)
lines(log(lynx), col=2) # AR모델은 검정색 선  / 원본데이터 붉은색 선 => 정확도 비교 

# (b) Fitting an ARIMA model in R

# data load
install.packages("fpp")
library(fpp)
data(elecequip) # 유럽 16개국의 컴퓨터와 같은 전기, 광학제품 제조량에 대한 데이터

# data 탐색
eeadj <- seasadj(stl(elecequip, s.window="periodic"))
# stl => seasonal component를 분해 / seasadj => 계절적 요인을 조정한 데이터 도출 
plot(eeadj)

# 모델 선택
tsdisplay(diff(eeadj),main="")
# tsdisplay 함수를 통해 1차 차분한 후 정상성 확인
# PACF로부터 lag확인 결과 / AR(3)정도가 적합 
# 이를 확인하기 위해 유사한 ARIMA Order의 AIC값 확인 

fit_310 <- Arima(eeadj, order=c(3,1,0))
fit_410 <- Arima(eeadj, order=c(4,1,0))
fit_210 <- Arima(eeadj, order=c(2,1,0))
fit_311 <- Arima(eeadj, order=c(3,1,1))
fit_310$aic;fit_410$aic;fit_210$aic;fit_311$aic;
#fit_210이 AIC값이 가장 높음 / p = 2, d = 1, q = 0

# 잔차 확인
Acf(residuals(fit_311)) # 잔차가 white noise임을 확인 
Box.test(residuals(fit_311), lag=24, fitdf=4, type="Ljung")
# p-value = 0.4273 => 귀무가설 채택 

# 모델을 이용한 예측
plot(forecast(fit_311))

# (c) auto.arima와 비교

# auto.arima가 위의 과정과 같은 결과를 얻는 것을 확인
library(forecast)
fit_eeadj<-auto.arima(eeadj)
plot(forecast(fit_eeadj))
summary(fit_eeadj)
summary(fit_311)
#매우 흡사/ 위와 같은 결과 예측 

# AR Model의 data lynx를 auto.arima에 적용
fit_lynx<-auto.arima(lynx)
plot(lynx-fit_lynx$residuals)
lines(lynx, col=2)
summary(fit_lynx)


# (d) 분해시계열(decompose)

# data load
library(zoo)
kospi<-read.csv("kospi.csv")
str(kospi)

# time series 생성
kospi_ts<-ts(kospi$close,frequency=250)
kospi_decomp<-decompose(kospi_ts)
plot(kospi_decomp)
str(kospi_decomp)