setwd("C:\\Users\\acorn\\Desktop\\Rwork\\Part-III")
data <- read.csv("two_sample.csv", header =TRUE)

x<- data$method
y <- data$survey

table(x)
table(y) 
table(x, y, useNA="ifany") # useNA="ifany" : 결측치 까지 출력
prop.test(c(110,135),c(150,150), alternative="two.sided", conf.level=0.95)
#PT 교육방법과 코딩 교육방법에 따른 만족도에 차이가 있는지를 검정하기 위해서 
#95% 신뢰수준에서 양측검정을 실시한 결과 검정통계량 p-value값은 0.0003422로 유
#의수준 0.05보다 작기 때문에 두 교육방법 간의 만족도에 차이가 있다고 볼 수 있다. 
#즉 「두 가지 교육방법에 따라 교육생의 만족율에 차이가 있다.」 라는 연구가설이 채
#택된다.

#검정통계량은 X-squared = 6.8237, df = 1, p-value = 0.0003422이며, 95% 신뢰
#수준에서 신뢰구간은 -0.25884941 -0.07448392이고, 첫 번째 교육방법의 비율은 
#0.7333333, 두 번째 교육방법의 비율은 0.9000000으로 나타났다. 
