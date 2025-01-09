#과제7 : 독립성 검정-카이제곱 검정
#H0: 교육수준과 흡연율은 관련이 없다.
#H1: 교육수준과 흡연율은 관련이 있다.
# 단계 1 파일 가져오기
setwd("C:\\Users\\acorn\\Desktop\\Rwork\\Part-III")
data <- read.csv("smoke.csv",header=TRUE,fileEncoding = "CP949")
head(data)
summary(data)

# 정규성 테스트
shapiro.test(data$education)
shapiro.test(data$smoking)

# 단계 2 변수 리코딩
# education 필드
data$education2[data$education==1] <-"대졸"
data$education2[data$education==2] <-"고졸"
data$education2[data$education==3] <-"중졸"

#smoking필드
data$smoking2[data$smoking==1] <-"과다흡연"
data$smoking2[data$smoking==2] <-"보통흡연"
data$smoking2[data$smoking==3] <-"비흡연"

# 시각화 : 명목 변수 - 막대차트

ggplot(data = data, aes(x=smoking2))+geom_bar()
ggplot(data = data, aes(x=education2))+geom_bar()

#교차 분할표 작성
table(data$education2, data$smoking2)
CrossTable(data$education2, data$smoking2, chisq = TRUE)

#독립성 검정
chisq.test(data$education2, data$smoking2)
# p-value = 0.0008183 < 0.05 = 유의수준(alpha) 보다 작다. 따라서 귀무가설을 기각한다.