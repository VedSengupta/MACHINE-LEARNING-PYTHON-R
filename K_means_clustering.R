library(datasets)
head(iris)
ggplot(iris,aes(Petal.Length, Petal.Width, color=Species))+geom_point()
library(ggplot2)


set.seed(20)
iriscluster <- kmeans(iris[,3:4],3,nstart = 20)
iriscluster

table(iriscluster$cluster , iris$Species)
iriscluster$cluster <- as.factor(iriscluster$cluster)

ggplot(iris,aes(Petal.Length, Petal.Width, color=iriscluster$cluster))+geom_point()
View(iris)
