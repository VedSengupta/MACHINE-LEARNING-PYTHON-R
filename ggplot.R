#load ggplot2 package
library(ggplot2)

?iris
data("iris")
str(iris)
View(iris)

ggplot(data=iris)
ggplot(data = iris,aes(x=Petal.Length, y=Sepal.Length))
ggplot(data = iris,aes(x=Petal.Length, y=Sepal.Length))+geom_point()


#Asthetics
ggplot(data = iris,aes(x=Petal.Length,y=Sepal.Length,col =Species))+geom_point()

ggplot(data = iris,aes(x=Petal.Length,y=Sepal.Length,col = Species,shape = Species))+geom_point()
