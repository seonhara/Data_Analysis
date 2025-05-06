#과제7 : 독립성 검정-카이제곱 검정
#H0: 나이와 직위는 관련이 없다.
#H1: 나이와 직위는 관련이 있다.

# 단계 1 파일 가져오기
setwd("C:\\Users\\acorn\\Desktop\\Rwork\\Part-III")
data <- read.csv("cleanData.csv",header=TRUE,fileEncoding = "CP949")
head(data)
summary(data)

# 단계2 산점도 # 연속형 변수
x<-data$position # 직위
y<-data$age3 #나이

# 단계3 전처리 : job과 포지션에서 결측치가 있음을 단계 1에서 확인함
# 변수 리코딩
# 데이터 양이 작아 결측치를 제거
plot(x)
plot(y)
plot(x,y)

data2 <- data.frame(x,y)
head(data2)
data2<-na.omit(data2)

# 단계4 크로스테이블
CrossTable(x,y,chisq = TRUE, expected = T)
# p-value가 0.05 유의수준보다 작으므로 귀무가설을 기각한다.
# 나이와 직위는 관련이 있다.

