data(cars)
cars
m <- lm(dist ~ speed, cars)
summary(m)
# 변량이 하나 일 때 : Multiple R-squared
par(mfrow=c(2,2))
# 잔차가 등분산성이 없을 때 : 데이터 자체가 선형적이지 못해서 
plot(m) # 빨간 색 -잔차들의 합계
# 여러 그래프
