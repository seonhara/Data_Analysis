# 일원 분산분석(ANOVA)
#H0: 교육방법에 따른 세 집단 간 실기시험의 평균에 차이가 없다.
# 동질성분석 : 같은 분포를 띠는가
# ANOVA : 분산분석석
# TukeyHSD : 사후 검정
setwd("C:\\Users\\acorn\\Desktop\\Rwork\\Part-III")
data <- read.csv("three_sample.csv", header =TRUE)
head(data)

# 전처리: 원칙적으로 결측치 제거
data <-subset(data, !is.na(score), c(method, score))
head(data)

# 차트로 outlier 보기
plot(data$score)
barplot(data$score)
mean(data$score) #14.447525

length(data$score)
data2 <- subset(data, score <= 14)#평균 14이상 제거
length(data2$score)

# 정제된 데이터 확인
x<- data2$score
boxplot(x)
length(x)
# 세 집단 subset 작성과 기술통계량
data2$method2[data2$method==1] <-"방법1" # True시 해당 행에 적용됨
data2$method2[data2$method==2] <-"방법2"
data2$method2[data2$method==3] <-"방법3"

# 교육방법 별 빈도수 도수분포 표
table(data2$method2)

#시험 성적 평균 
y <- tapply(data2$score, data2$method2, mean) #집계함수 : 반복문없이 집계 다루는 데이터 타입(t), mean(컬럼의 모든 데이터(p1)를 읽어 그룹(p2) 별로 구함 )
y
length(y)
y<-data2$score

df <- data.frame(교육방법 = x,성적 = y)
df

# 동질성 검정
bartlett.test(score ~ method, data = data2)
# 귀무가설 지지 = 동질한 집단이다.

# 분산분석
help(aov)
result <- aov(score ~ method2, data=data2)
names(result)
summary(result)

# 결과 : p-value < 0.05이므로 3.39e-14 < alpha 이기 때문에 귀무가설을 기각한다.
# 세 교육방법간의 평균차이는 존재한다.
# F검정통계량 :43.58 >1.96이므로 귀무가설을 기각하고 연구가설이 채택 된다.

TukeyHSD(result) # 각 집단간 차이
