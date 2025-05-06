setwd("C:\\Users\\acorn\\Desktop\\Rwork\\Part-III")
data <- read.csv("cleanDescriptive.csv",header=TRUE,fileEncoding = "CP949")
head(data)
str(data)

x<-data$level2 #학력수준
y<-data$pass2 #진학여부

summary(x)
# 문자열이지만 명목형 데이터일 때
# 변경시 as.factor(x) -> 도수 분포표로 나온다.
x<-factor(x)
summary(x) #factor형만 보여줌

# 도수 분포표로 보기
table(x)

# dataframe 구조로 보기
result<- data.frame(Level = x, Pass = y)
head(result)
#####################################
# 교차분석 : 카이제곱 분포를 따르는지 확인
# 귀무가설 : 기대치 = 관측치= 카이제곱분포를 따른다.
table(result) # factor가 아니더라도 적용가능

#시각화 도구 설치
#install.packages("gmodels") # 이름 식별 "" 필요
library(gmodels)# 사용할 때마다 모듈을 "" 제외하고 올린다. 메모리에 올린다.
# CrossTable() 제공
#install.packages("ggplot2")
library(ggplot2)
CrossTable(x,y, chisq=TRUE) #카이제곱 값 = (O-E)^2/ E^2
# 0<chi^2
# p-0.05 < 0.25 : 25% 귀무가설 지지 주장
# 대학원졸과 부모의 학력 수준은 차이가 없다.