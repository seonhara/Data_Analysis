#과제 11
#H0: 두집단은  교육방법에 따라 시험 성적에 차이가 없다.
#H1: 차이가 있다.
# 두 집단 대상으로 평균 차이 검정을 통해 평균이 같은지 다른지 검정
#데이터 : 
setwd("C:\\Users\\acorn\\Desktop\\Rwork\\Part-III")
data <- read.csv("twomethod.csv", header =TRUE)
head(data)
summary(data) #score에 결측치 발견

# 전처리
result <- subset(data, !is.na(score), c(method, score))
# method별 데이터 분리
a <- subset(result, method ==1)
b <- subset(result, method ==2)
a1<- a$score
b1<- b$score
hist(a1)
hist(b1)
# 기술 통계량
mean(result$score)
# 동질성 검정 # p-value > 0.05 : 귀무가설 지지
var.test(a1,b1)

# t -test
t.test(a1,b1, alter = "two.sided", conf.int= TRUE, conf.level = 0.95)
t.test(a1,b1, alter = "greater", conf.int= TRUE, conf.level = 0.95)
t.test(a1,b1, alter = "less", conf.int= TRUE, conf.level = 0.95)

# 검정 결과 : 교육방법에 따라 시험 성적의 차이가 없다라는 귀무가설을 지지한다.
