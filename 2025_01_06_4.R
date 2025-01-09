#과제 13번번
setwd("C:\\Users\\acorn\\Desktop\\Rwork\\Part-III")
#단계1
data <- read.csv("student_height.csv",header=TRUE,fileEncoding = "CP949")
head(data)
summary(data)
height<-data$height
#기술통계량평균
##연속형 데이터라는 것을 알 수 있다.
mean(height) # 149.4

#정규성 검정
# 연속형 데이터
# 정규성 검증
shapiro.test(height)
qqnorm(data$height)
qqline(data$height, lty=1, col ='blue')


#가설검정
#H0: 모집단의 평균과 차이가 없다.
#연속형 데이터 
#단일 표본 평균차이 검정: t-test
t.test(height, mu=149.4, alter = "two.side", conf.level = 0.95)
# p-value >0.05 귀무가설을 지지한다.

