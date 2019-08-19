#========================#
# 04. Parallel 처리 방안 -> 병렬처리 패키지 
#========================#

# for Windows
install.packages("doParallel")
library(doParallel)
registerDoParallel(cores=3) # 코어의 수를 설정 

# for Mac
install.packages("doMC")
library(doMC)
registerDoMC(cores=3)