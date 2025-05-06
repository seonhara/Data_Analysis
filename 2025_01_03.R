getwd()#현재 작업 디렉토리

setwd("C:\\Users\\acorn\\Desktop\\Rwork\\Part-III")
data <- read.csv("one_sample.csv", header =TRUE)
head(data)

#모수추정 -t분포
str(data)

#H0:양치기 개의 평균심박수 모평균 : 115
#H1: 모평균은 115가 아니다.

sample <- c(93, 109, 110, 89, 112, 117)

# 귀무가설이 맞다는 전제하에서 T분포를 따르는지 확인
# = 정규성을 따르는 지 확인
# 평균 = 0, 편차 = 1
# 0.25 < 0.2 : 95% 신뢰구간 안에 있다. 20%안에 있다. 
shapiro.test(sample)
#20% 정도 정규 범위 안에 있다.
hist(sample)
qqnorm(sample)
qqline(sample, lty =1, col = 'red')


#내가 가진 데이터가 mu로부터 파생된 t분포를 따르는지  확인
t.test(sample, mu=200)
x<- data$time
head(x)
summary(x)
mean(x)
mean(x, na.rm = T) # 결측치 제외
x<- na.omit(x)
mean(x1)
shapiro.test(x1) # 0.9672 >0.05 정규분포를따름
hist(x1)
qqnorm(x1)
qqline(x1, lty=1, col ='blue')

# 평균검정(표본1, 표본2-대응, 독립)
# 단측 검정
# H1: mu < 5.2
# 양측 검정을 해야한다.
t.test(x1,mu=5.2,alternative = c("two.sided"))
