data("mtcars")
View(mtcars)
install.packages("caTools")
library(caTools)
split <-sample.split(mtcars,splitRatio = 0.7)
split

training <- subset(mtcars,split=="TRUE")
testing <- subset(mtcars,split=="FALSE")
testing

model <- glm(vs ~ wt+disp,training,family="binomial")
model
model
data <- data.frame(wt=3.170,disp=351)
answer <-predict(model,data,type="response")
answer