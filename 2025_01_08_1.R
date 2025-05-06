data()
help(iris)
str(iris)
install.packages("psych")
library(psych)
# 회귀분석 : y 는 연속형이어야한다. -> 수치 예측
# 선형성 파악() : y변수 : Sepal.Length(꽃받침의 길이)
# x변수 : Petal.Length
# 가설 : 꽃받침의 길이가 꽃받침의 넓이나 꽃잎 넓이, 길이에 영향을 받는다.
summary(iris)

# EDA
# 결측치 시각화
cp_iris<- iris
cp_iris[sample(1:150,30),1] <- NA
install.packages("Amelia")
library(Amelia)
missmap(cp_iris)

cp_iris<- iris
dim(cp_iris)
cp_iris[sample(1:150,30),1] <- NA
#단순대치법
cp_iris<- cp_iris[complete.cases(cp_iris),]
dim(cp_iris)

#평균대치법
meanValue <-mean(cp_iris$Sepal.Length, na.rm=T )
cp_iris$Sepal.Length[is.na(cp_iris$Sepal.Length)] <- meanValue

#중앙값
install.packages("DMwR2")
library(DMwR2)
cp_iris[sample(1:150,30),1] <- NA
cp_iris<- centralImputation(cp_iris)

# knn방법
cp_iris[sample(1:150,30),1] <- NA
cp_iris<- knnImputation(cp_iris,k=10)

# 다중 대치법
cp_iris[sample(1:150,30),1] <- NA
iris_imp <- amelia(cp_iris, m=3, cs="Species")

# 산점도, 독립성, 상관계수구하기
# 변수별 산점도
plot(iris$Sepal.Width,iris$Sepal.Length, col = iris$Species)
plot(iris$Petal.Length,iris$Sepal.Length, col = iris$Species) #꽃잎 길이와 선형관계인듯 보임
plot(iris$Petal.Width,iris$Sepal.Length, col = iris$Species) #꽃잎 넓이와 선형관계인듯 보임

# ~: 틸드 기준으로 앞종속 변수로 사용한다.
pairs(~ iris$Sepal.Length+iris$Sepal.Width + iris$Petal.Length + iris$Petal.Width, data= iris, col = iris$Species)


shapiro.test(iris$Sepal.Length) # Y는 정규성을 따른다.


qqnorm(iris$Sepal.Length)
qqline(iris$Sepal.Length)
data <- data.frame(c(iris$Sepal.Width, iris$Petal.Length, iris$Petal.Width),iris$Sepal.Length)

# 히스토그램
hist(iris$Sepal.Length)
hist(iris$Sepal.Width)
# 기술 통계량 구하기
mu_SW <- mean(iris$Sepal.Width)
mu_PL <- mean(iris$Petal.Length)

mu_PW <- mean(iris$Petal.Width)
mu_SW; mu_PL; mu_PW

# 아웃라이어 확인
boxplot(iris$Sepal.Width) # 아웃라이어 발견
boxplot(iris$Petal.Legnth)
boxplot(iris$Petal.Width)

# 아웃라이어를 제거할 것인가? 구분해서 하나 해보자 -의미 없는 거같다.
iris_Sepal.Width_2 <- subset(iris$Sepal.Width, iris$Sepal.Width < 4 )
boxplot(iris_Sepal.Width_2)

# 변수별 평균 검정시행
# 두 집단 평균 검정
t.test(iris$Sepal.Width, iris$Sepal.Length, alter = "two.sided", conf.int=TRUE, conf.level = 0.95)
# p <0.05 : 두 집단간 평균에 차이가 있다.

# 세집단 이상의 평균 검정 : F 검정

# 상관관계 확인하기
# 상관관계그림으로 확인하기
# 상관계수 보기
cor(iris$Sepal.Width, iris$Sepal.Length)
corr.test(iris[-5]) # 5번째만 빼고 남은 4개 칼럼만 사용/ species-명목형 -피어슨 상관계수 못구함  

install.packages("corrgram")
library(corrgram)
corrgram(iris[-5], upper.panel = panel.conf)
corrgram(iris[-5], lower.panel = panel.conf)

install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)
chart.Correlation(iris[-5], histogram = ,pch="+")
cor(iris[-5], method ="spearman")

# 회귀분석
help(lm)
# ~ 앞 종속변수 뒤 독립변수
result <-lm(Sepal.Length~Sepal.Width+Petal.Length+Petal.Width, data = iris)
result
summary(result)
plot(result)
# 최적의 w 값을 찾는다.
# 잔차 제곱의합 = cost function  가장 적은 것을 찾는다. 
