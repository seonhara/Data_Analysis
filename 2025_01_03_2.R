# 두 집단 평균 검정(독립 표본 T 검정)
# H0: mu_A = mu_B 귀무가설
# H1: mu_A != mu_B 연구가설
# 교육생 150명

# 독립표본평균 계산
# 전처리 :outlier 제거, 변수의 평균 계산
setwd("C:\\Users\\acorn\\Desktop\\Rwork\\Part-III")
data <- read.csv("two_sample.csv", header=TRUE)
head(data)

summary(data)

result <- subset(data, !is.na(score), c(method, score))
result
length(result$score)

# 데이터 분리
a <- subset(result,method ==1)
b <- subset(result,method ==2)
# 교육방법에서 점수 추출
a1 <- a$score
b1 <- b$score

# 기술통계량
length(a1)
length(b1)
mean(a1)
mean(b1)

shapiro.test(a1)# 0.05 <0.7 정규성 만족
shapiro.test(b1)# 0.008546 <0.05 정규성불만족 
# 동질성검정 : 균등하게 sampling 되었는가(등분산), 편중되게 sampling 되었는가(이분산)
# H0 : 두 집단 간 분포의 모양이 동질적이다.
var.test(a1,b1)
# p-value = 0.3002 > 0.05 귀무가설을 채택한다.

# 독립집단 평균 차이검정
# 양측검정
t.test(a1, b1)
# p-value = 0.0411 < 0.05 
# H0: mu_A = mu_B 귀무가설을 기각한다.
# H1: mu_A != mu_B 채택
# 결론: 두 집단 간 평균에 차이가 있다.

# 단측검정
t.test(a1,b1, alter="greater", confint =True, conf.level = 0.95)
# a1을 기준으로 비교 : 
# H0 : a1 < b1
# a1이 b1보다 크지 않다를 채택 p-value = 0.97 > 0.05
t.test(a1,b1, alter ="less", confint = True, conf.level = 0.95)
# a1을 기준으로 비교 : a1이 b1보다 작다. p-value = 0.02 < 0.05
qqnorm(a1)
qqline(a1,lty=1, color = "red"")





