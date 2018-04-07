#to load the datasets that has rows and coloumns
?anscombe
data("anscombe")
str(anscombe)
head(anscombe)
anscombe
View(anscombe)
print(anscombe$x1)
anscombe$x2
plot(anscombe$x1,anscombe$y2,xlab = "X1",ylab = "Y1",main="Linear regg")
var1<-c(1,2,3,4,5)
rm(var1)
rm(list=ls())