import pandas as pd
import yfinance as yf
import xgboost as xgb
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error
import matplotlib.pyplot as plt
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

# 주가 데이터 다운로드 (애플 주식 예시)
data = yf.download('AAPL', start='2022-01-01', end='2023-01-01')
df = data[['Close']].copy()

# 래깅 피처 생성
for lag in range(1, 6):  # 5일간의 래깅
    df[f'lag_{lag}'] = df['Close'].shift(lag)

df.dropna(inplace=True)

X = df.drop(columns='Close')
y = df['Close']

# 훈련/테스트 분리
X_train, X_test, y_train, y_test = train_test_split(X, y, shuffle=False, test_size=0.2)

model = xgb.XGBRegressor(objective='reg:squarederror')
model.fit(X_train, y_train)

y_pred = model.predict(X_test)
rmse = mean_squared_error(y_test, y_pred, squared=False)
print(f"📉 주가 예측 RMSE: {rmse:.2f}")

# 결과 시각화
plt.figure(figsize=(12, 4))
plt.plot(y_test.values, label='True')
plt.plot(y_pred, label='Predicted')
plt.legend()
plt.title("AAPL 종가 예측 결과")
plt.show()
