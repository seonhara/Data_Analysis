# 래깅(Lagging): 시계열 데이터 분석에서 사용하는 개념으로 과거의 값을 현재 예측을 위한 피처로 사용하는 것
# 필요한 이유: 일반 머신러닝 모델은 순서나 시간 의존성을 모르기 때문에 시간 의존성을 피처 엔지니어링을 통해 직접 입력해줘야한다.
# 래깅은 시계열의 자기 상관성을 모델이 이해할 수 있게 해준다.

import pandas as pd
import lightgbm as lgb
from sklearn.metrics import mean_squared_error
from sklearn.model_selection import train_test_split
import matplotlib.pyplot as plt
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.font_manager as fm
import matplotlib as mpl

# 한글 폰트 설정 (예: 나눔고딕)
plt.rcParams['font.family'] = 'NanumGothic'

# 또는 사용 가능한 시스템 폰트 직접 지정
# 경로 확인: fm.findSystemFonts()
# fm.FontProperties(fname='폰트 경로')

# 마이너스 깨짐 방지
mpl.rcParams['axes.unicode_minus'] = False

# 예시용: OpenML 등에서 받을 수 있는 데이터라고 가정
# 실제 데이터셋: 'household_power_consumption.txt' 혹은 Kaggle 데이터 사용 가능
# 여기선 간단한 시계열 예제 생성
date_range = pd.date_range(start='2021-01-01', periods=200, freq='H')
power_usage = pd.Series(200 + 10 * np.sin(np.linspace(0, 20, 200)) + np.random.normal(0, 5, 200))
df = pd.DataFrame({'timestamp': date_range, 'power': power_usage})
df.set_index('timestamp', inplace=True)

# Lag 피처 생성
for lag in range(1, 25):  # 과거 24시간
    df[f'lag_{lag}'] = df['power'].shift(lag)

df = df.dropna()

# 학습 데이터 구성
X = df.drop(columns='power')
y = df['power']

X_train, X_test, y_train, y_test = train_test_split(X, y, shuffle=False, test_size=0.2)

model = lgb.LGBMRegressor()
model.fit(X_train, y_train)

y_pred = model.predict(X_test)
rmse = mean_squared_error(y_test, y_pred, squared=False)
print(f"💡 RMSE: {rmse:.2f}")

# 결과 시각화
plt.figure(figsize=(12, 4))
plt.plot(y_test.values, label='True')
plt.plot(y_pred, label='Predicted')
plt.legend()
plt.title("전력 사용량 예측 결과")
plt.show()
