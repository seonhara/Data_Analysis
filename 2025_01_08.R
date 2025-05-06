# 과제 12
# 단일 집단 비율 검정
# H1: 프로모션 진행 결과 기존 구매비율 과 같지 않다.
# 연구가설 : 15%향상되었다.
setwd("C:\\Users\\acorn\\Desktop\\Rwork\\Part-III")
data <- read.csv("hdtv.csv", header =TRUE)
head(data)
summary(data) #결측치 없음
hist(data$buy) #이항분포

#데이터 전처리
x<- data$buy

#빈도수와 비율 계산
length(x)
table(x)

install.packages("prettyR")
library(prettyR)
freq(x) 

#가설검정: 이항 분포 비율 검정:binom.test
binom.test(c(40,10), p=0.15, alternative ="two.sided", conf.level = 0.95)
# 귀무가설: 전체 구매비율이 75%이다.
# 귀무가설을 기각각한다. p<0.05

binom.test(c(40,10), p=0.75, alternative ="greater", conf.level = 0.95)
# 크진 않다.
binom.test(c(40,10), p=0.75, alternative ="less", conf.level = 0.95)
# 작다. 