#importing data from csv file
library(datasets)
library(ggplot2)

trends.csv<-read.csv("E:/Programming Languages/R/Health-News-Tweets/cbchealth_csv.csv",header = TRUE)
head(trends.csv)
View(trends.csv)

ggplot(trends.csv,aes(Tweet_id,Tweet_Time, color=Tweet))+geom_point()

#spliting into train and test
ind <- sample(2,nrow(trends.csv), replace = TRUE,prob = c(0.7,0.3))
train <- trends.csv[ind==1,]
test <-trends.csv[ind==2,]
head(train)
head(test)

#training 
results<-lm(Tweet_Time~Tweet_id,train)
summary(results)
coef(results)

#predicting
pred <-predict(results,test)
pred.csv<-pred
View(pred.csv)
head(pred)
head(test)


?lapply( )
