import pandas as pd
import quandl, math, datetime,time
import numpy as np
from sklearn import preprocessing, svm, model_selection
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
import matplotlib.pyplot as plt
from matplotlib import style

style.use('ggplot')

quandl.ApiConfig.api_key = 'aB1R9D1U8oz7eoienSrQ'
df = quandl.get_table('WIKI/PRICES')
#df.set_index('date', inplace=True)﻿

df=df[['adj_open','adj_high','adj_low','adj_close','adj_volume']]
df['HL_PCT']=(df['adj_high']-df['adj_low'])/df['adj_low']*100.0
df['PCT_Change']=(df['adj_close']-df['adj_open'])/df['adj_close']*100.0

df=df[['adj_close','HL_PCT','PCT_Change','adj_volume']]

forecast_col='adj_close'
df.fillna(-99999,inplace=True)

forecast_out=int(math.ceil(0.001*len(df)))
print(forecast_out)
df['label']=df[forecast_col].shift(-forecast_out)


X = np.array(df.drop(['label'],1))
X = preprocessing.scale(X)
X_lately = X[-forecast_out:]
X = X[:-forecast_out:]

df.dropna(inplace=True)


y=np.array(df['label'])
y=np.array(df['label'])

print(len(X),len(y))

X_train,X_test,y_train,y_test = model_selection.train_test_split(X,y,test_size=0.2)

clf=LinearRegression()
clf.fit(X_train,y_train)
accuracy = clf.score(X_test,y_test)
#print(accuracy)

forecast_set=clf.predict(X_lately)
print(forecast_set,accuracy,forecast_out)

last_date= df.iloc[-1].name
last_unix = last_date.to_datetime()
last_unix = time.mktime(last_unix.time_tuple())
one_day=86400
next_unix=last_unix+one_day

for i in forecast_set:
	next_date=datetime.datetime.fromtimestamp(next_unix)
	next_unix+=one_day
	df.loc[next_date]=[np.nan for  _ in range(len(df.coloumns)-1)]+[i]

df['adj_close'].plot()
df['Forecast'].plot()
plt.legend(loc=4)
plt.xlabe('Date')
plt.ylabel('Price')
plt.show()