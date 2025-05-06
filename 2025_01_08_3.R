setwd("C:\\Users\\acorn\\Desktop\\Rwork\\data")
data <- read.csv("advertising.csv", header =TRUE)
head(data)
summary(data)

#탐색적분석 및 시각화
#히스토그램
hist(data$TV)
hist(data$Radio)
hist(data$Newspaper)
hist(data$Sales)

#산점도
plot(data$TV, data$Radio, col = rainbow(2))
plot(data$Newspaper, data$Sales, col = rainbow(2))
pairs(data$Sales~data$TV+data$Radio+data$Newspaper, col= rainbow(2))

#박스플랏
par(mfrow=c(2,2))
boxplot(data$TV, main= "TV", col = rainbow(1))
boxplot(data$Radio, main= "Radio", col = rainbow(1))
boxplot(data$Newspaper, main= "Newspaper", col = rainbow(1))
boxplot(data$Sales, main= "Sales", col = rainbow(1))

# 정규성 파악
shapiro.test(data$Sales)# 정규성을 띤다.
shapiro.test(data$Newspaper)# 정규성을 띠지 않는다.

# 상관계수 및 유의성 검정
install.packages("psych")
library(psych)
corr.test(data[-5])
# Sales와 다른 변량의 상관관계가 크지 않아 보인다. P-값이 > 0.05이므로 귀무가설을 지지한다. News paper는 p-value< 0.05이므로 귀무가설을 기각한다. 세일즈와 상관관계가 가장 낮아보인다
install.packages("corrgram")
library(corrgram)
corrgram(data[-5])
corrgram(data[-5], upper.panel = panel.conf)
corrgram(data[-5], lower.panel = panel.conf)
# 변수별 평균 검정
# P<0.05 : 두 변량의 평균이 같지 않다.
t.test(data$Newspaper, data$TV, alter = "two.sided", conf.int=TRUE, conf.level = 0.95)
install.packages("corrgram")
library(corrgram)

#상관계수
install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)
chart.Correlation(data[-5], histogram = ,pch="+")
cor(data[-5], method ="spearman")

# 회귀검정
# 설명력 낮은 Newspaper 제거
result <-lm(data$Sales~data$TV+data$Radio, data = data)
result
summary(result)
length(data$Sales)
plot(result)
#회귀 분석 결과 : 예상대로 잔차들 중 가장 적은 영향을 미치는 것은  Newpaper였다.
#회귀식은 Sales = 4.625+ 0.0544TV + 0.107Radio  이 나왔다.
#회귀 모형 진단
# 1. 회귀 계수들이 유의미한가? 회귀계수 t값과 유의확률 : 0.05보다 작아서 귀무가설을 기각하므로 유의미하다.
# 2. 모형이 얼마나 설명력을 갖는가? 변량이 여러개이므로 adjusted R^2 값이 0.9 인것이 주목한다.대략 90%의 실측치를 회귀 모형으로 설명했다는 의미이다.
# 3. 각 변량들이 잔차를 기준으로 통계적으로 유의미한가? F-분포 값 : 0.95에 해당하는 값보다 훨씬 크다.
# 귀무가설 기각, p<2.2e-16이므로 각 변량들은 모두 필요하다.

# 잔차 그래프를 통해 살펴보면, Q-Q plot을 보니 정규성을 띠는 것을 알수 있고 
# 특별히 튀는 값도 많지 않다.