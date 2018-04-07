wbdc<- read.table(file.choose(),sep=',')
View(wbdc)
wbdc<- wbdc[,-1]
#k_norms algorithm
data_norm<- function(x){((x-min(x))/(max(x)-min(x)))}
wbdc_norm<- as.data.frame(lapply(wbdc[,-1],data_norm))
summary(wbdc[,2:5])
summary(wbdc_norm[,1:4])

wbdc_train <- wbdc_norm[1:450,]
wbdc_test <- wbdc_norm[451:569,]
library(class)
wbdc_pred <- knn(wbdc_train,wbdc_test,wbdc[1:450,1],k=21)
table(wbdc_pred,wbdc[451:569,1])
?predict
?seed
