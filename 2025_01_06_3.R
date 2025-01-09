#단계 1
#install.packages("XLConnect")
library(ggplot2)
library(XLConnect)
setwd("C:\\Users\\acorn\\Desktop\\Rwork\\Part-III")
#단계2
data <- read.csv("response.csv",header=TRUE,fileEncoding = "CP949")
head(data)
summary(data)

#단계3
# job 필드
data$job2[data$job==1] <-"학생"
data$job2[data$job==2] <-"직장인"
data$job2[data$job==3] <-"주부"

# response 필드
data$response2[data$response==1] <-"무응답"
data$response2[data$response==2] <-"낮음"
data$response2[data$response==3] <-"높음"
# 시각화 : 명목 변수 - 막대차트
ggplot(data = data, aes(x=job2))+geom_bar()
ggplot(data = data, aes(x=response2))+geom_bar()


#단계4
table(data$job2, data$response2)
chisq.test(data$job2, data$response2)

#단계5
#유의수준 0.05에서 x2값이 58.208, 자유도(df) 4, 그리고 유의확률(p-value) 6.901e-12을 
#보이고 있다. 즉 58.208 이상의 카이제곱 값이 얻어질 확률이 6.901e-12라는 것을 보여주
#고 있다. 이 값은 유의수준 0.05보다 작기 때문에 귀무가설을 기각한다. 따라서 
#'교육방법에 따른 만족도에 차이가 있다.' 라고 말할 수 있다