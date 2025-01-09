# 대응표본 T 검정
# a1:교수법프로그램적용전
# b1:교수법프로그램적용 후
# H0: a1_mu = b1_mu
# H1: a1_mu != b1_mu

setwd("C:\\Users\\acorn\\Desktop\\Rwork\\Part-III")
data <- read.csv("paired_sample.csv", header =TRUE)
head(data)
summary(data)

# 결측치를 제거하여 subset 생성
result <- subset(data, !is.na(after), c(before, after))
result
x <- result$before
y <- result$after
x; y

# 기술 통계량 계산
length(x)
length(y)
mean(x)
mean(y)
# 정규성 검정
shapiro.test(x) # 0.05 <0.09 귀무가설 채택 = 정규성 따름
shapiro.test(y) # 0.05 >0.01 귀무가설기각 정규성안따름

# 동질성 검정
#H0 : 두집단이 동질적이다.
var.test(x,y, paried =TRUE) #0.7 > 0.05 두 두집단이 동질적이다.

# 대응 두집단 평균 차이 검정
t.test(x,y,paird=TRUE)
# p-value 0.05 > 2.2e-16 귀무가설을 기각한다.
# 단측 검정
t.test(x, y, paired=TRUE,alter="greater",conf.int=TRUE, conf.level=0.95) 
# p-value : 1 >0.05 : 귀무가설을 채택한다.
t.test(x, y, paired=TRUE,alter="less",conf.int=TRUE, conf.level=0.95)
# H1: x < y이다. 
# p-value < 2.2e-16 -> x을 기준으로 비교 : x가 y보다 적다.