# 두 그룹이 서로 만족도에 차이가 있는가
# H0: 성별간 만족도 차이가 없다.

setwd("C:\\Users\\acorn\\Desktop\\Rwork\\Part-III")
data <- read.csv("two_sample.csv", header =TRUE)
head(data)

gender<- data$gender
survey<- data$survey
gender;survey

data2 <- data.frame(gender,survey)
head(data2)

# 정규분포
shapiro.test(survey)
# 정규성을 띠지 않는다.
# 히스토그램
mean(survey)#0.81
hist(survey)
qqnorm(survey)

# 두 집단 비율 검정 : prop.test()
summary(data2)# 결측치 없음

# 기술 통계량
table(survey)
table(gender)
table(gender,survey)

# 두 집단 비율차이 검정
prop.test(c(138,107),c(174,126), alternative = "two.sided", conf.level = 0.95)

# 결론 : p-value=0.2765 > 0.05 이므로 귀무 가설을 지지한다.
# 검정통계량 해설: X-squared : 1.184, df =1, p-value : 0.2765이고 95%신뢰수준에서 0.7931 남성, 0.8492063 여성으로나타났다.
#카이제곱 검정에서 1.184보다 기각 값 3.841보다 작으므로 귀무가설을 기각할 수 없다. 