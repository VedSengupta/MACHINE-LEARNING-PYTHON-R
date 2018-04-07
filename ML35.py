import matplotlib.pyplot as plt
from matplotlib import style
style.use('ggplot')
import numpy as nm
from sklearn.cluster import KMeans
from sklearn import preprocessing,cross_validation
import pandas as pd
#import tensorflow as tf
 
'''
Pclass Passenger Class (1 = 1st; 2 = 2nd; 3 = 3rd)
survival Survival (0 = No; 1 = Yes)
name Name
sex Sex
age Age
sibsp Number of Siblings/Spouses Aboard
parch Number of Parents/Children Aboard
ticket Ticket Number
fare Passenger Fare (British pound)
cabin Cabin
embarked Port of Embarkation (C = Cherbourg; Q = Queenstown; S = Southampton)
boat Lifeboat
body Body Identification Number
home.dest Home/Destination
'''
df=pd.read_excel('titanic.xls')
df.drop(['name','body'],1,inplace=True)
#print (df.head())

df.convert_objects(convert_numeric=True)
df.fillna(0,inplace=True)

def handle_non_numerical_data(df):
	coloumns=df.coloumns.values

	for coloumn in coloumns:	
		text_digit_vals={}
		def convert_to_int(val):
			return text_digit_vals[val]
		if df[coloumn].dtype != np.int64 and df[coloumn].dtype != np.float64:
			coloumn_contents = df[coloumn].values.tolist()
			unique_elements = set(coloumn_contents)
			x=0
			for unique in unique_elements:
				if unique not in text_digit_vals:
					text_digit_vals[unique]=x
					x+=1
			df[coloumn]=list(map(convert-to_int,df[coloumn]))
	return df
df=handle_non_numerical_data(df)
print(df.head())