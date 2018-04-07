import pandas as pd
import quandl, math
import numpy as np
from sklearn import preprocessing, svm
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split

quandl.ApiConfig.api_key = 'aB1R9D1U8oz7eoienSrQ'
df=quandl.get_table("WIKI/PRICES",paginate=True)

df=df[['adj_open','adj_high','adj_low','adj_close','adj_volume']]
df['HL_PCT']=(df['adj_high']-df['adj_low'])/df['adj_low']*100.0
df['PCT_Change']=(df['adj_close']-df['adj_open'])/df['adj_close']*100.0

df=df[['adj_close','HL_PCT','PCT_Change','adj_volume']]

forecast_col='adj_close'
df.fillna(-99999,inplace=True)

forecast_out=int(math.ceil(0.01*len(df)))
print(forecast_out)
df['label']=df[forecast_col].shift(-forecast_out)

df.dropna(inplace=True)

X=np.array(df.drop(['label'],1))
y=np.array(df['label'])
X=preprocessing.scale(X)
y=np.array(df['label'])

print(len(X),len(y))

X_train,X_test,y_train,y_test =train_test_split(X,y,test_size=0.2)

clf=LinearRegression()
clf.fit(X_train,y_train)
accuracy = clf.score(X_test,y_test)
print(accuracy)