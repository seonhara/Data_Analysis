setwd("C:\\Users\\acorn\\Desktop\\Rwork\\Part-III")
data <- read.csv("three_sample.csv", header =TRUE)
head(data)

method <- data$method
survey<- data$survey
method; survey 

#단계 3 : 기술통계량(빈도 수)
table(method, useNA="ifany") # 세 그룹 모두 관찰치 50개
table(method, survey, useNA="ifany")

#단계 4:
prop.test(c(34,37,39),c(50,50,50))
prop.test(c(34,37,39),c(50,50,50), alternative = "two.sided", conf.level = 0.95)
#귀무가설 지지

#세 교육방법에 따른 만족도에 차이가 있는지를 검정하기 위해서 95% 신뢰수준에서 
#양측검정을 실시한 결과 검정통계량 p-value값은 0.5232로 유의수준 0.05보다 크기 
#때문에 세 교육방법 간의 만족도에 차이가 있다고 볼 수 없다. 즉 「세 가지 교육방법
#에 따른 집단 간 만족율에 차이가 없다.」라는 귀무가설을 기각할 수 없다

#<X-squared 검정통계량으로 가설검정>
#신뢰수준 95%에서 df(자유도)가 2이면 X-squared 기각값(5.991)보다 X-squared 검
#정통계량(1.2955)이 더 작기 때문에 귀무가설을 기각할 수 없다. 또한 각 교육방법에 
#따른 만족도의 비율을 68%(prop 1), 74%(prop 2), 78%(prop 3)로 서로 다른 비율
#의 차이를 나타내고 있다.
