#importing data from csv file
library(datasets)
library(ggplot2)

trends.csv<-read.csv("E:/Big Data/R/data.csv",header = TRUE)
head(trends.csv)

ggplot(trends.csv,aes(year, population, color=sector))+geom_point()

#spliting into train and test
ind <- sample(2,nrow(trends.csv), replace = TRUE,prob = c(0.7,0.3))
train <- trends.csv[ind==1,]
test <-trends.csv[ind==2,]
head(train)
head(test)

#training 
results<-lm(population~year,train)
summary(results)
coef(results)

#predicting
pred <-predict(results,test)
head(pred)
head(test)
 

