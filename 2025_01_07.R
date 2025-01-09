# chapter 7 집단간 차이 분석
# 7.2단일 집단 검정
setwd("C:\\Users\\acorn\\Desktop\\Rwork\\Part-III")
data <- read.csv("one_sample.csv", header =TRUE)
head(data)

x<- data$survey
summary(x)
length(x)# 1차원
table(x) # 범주형으로 바꿈
# 기준(y=기준 확률) = 1

#비율값 보기
install.packages("prettyR")
library(prettyR)
freq(x)
binom.test(c(136, 14), p=0.8) # 만족 : 136 p: 80% 만족율, conf.level=0.025  앞뒤 편차 인정
binom.test(c(136, 14), p=0.8, alternative="two.sided", conf.level=0.95)

# 단측 검정-귀무가설은 같고 대립가설만 다르다.
binom.test(c(136,14), p=0.8, alternative="greater", conf.level=0.95)
# 귀무가설 : 0.8이다.
# 대립 가설 : 0.8보다 크다. 대립가설 지지!
binom.test(c(136,14), p=0.8, alternative="less", conf.level=0.95)
# 대립 가설 : 0.8보다 작다. 기각

# ‘기존 2016년도 고객 불만율에 비해서 2017년도 CS교육 후 불만율이 더 낮다.’라는 방향성
#(greater)이 있는 연구가설을 검정한 결과 검정통계량 p-value값은 0.0003179으로 유의
#수준 0.05보다 작기 때문에 기존 만족율 보다 80% 이상의 효과를 얻을 수 있다고 볼 
#수 있다. 결과적으로 기존 20% 보다 불만율이 낮아졌다고 할 수 있다. 따라서 귀무가
#설이 기각되고, 연구가설이 채택된다.(CS교육에 효과가 있다고 볼 수 있다.)