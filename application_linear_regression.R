#the predictor vector
x<- c(151,174,138,186,128,136,179,163,152,131)

#the response vector
y<- c(63,81,56,91,47,57,76,72,62,48)

#apply lm function
relation <-lm(y~x)    #train data  ;;; first output  then


#Find weight of a person with height 170
a<- data.frame(x= 151)
result<- predict(relation,a)
print(result) 
?lm
