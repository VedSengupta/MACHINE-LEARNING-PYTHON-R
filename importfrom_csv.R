#importing data from csv file

trends.txt<- read.table("E:/Big Data/R/test1.txt",header=TRUE,sep="\t")
str(trends.txt)
View(trends.txt)
plot(trends.txt$Age,trends.txt$S.no)

#importing data from csv file
trends.csv<-read.csv("E:\Big Data\R\data.csv",header = TRUE)
str(trends.csv)
View(trends.csv)
head(trends.csv$sector)
head(trends.csv$year)
head(trends.csvpopulation)
plot(trends.csv$Age,trends.csv$Gender,xlab = 'age')
?cor
