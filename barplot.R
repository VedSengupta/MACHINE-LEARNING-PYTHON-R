#convert Tabuler data to row or coloumn

#load data
?UCBAdmissions
data("UCBAdmissions")
str(UCBAdmissions)
View(UCBAdmissions)

#get marginal frequency fom original table
margin.table(UCBAdmissions,1) #admit
margin.table(UCBAdmissions,2) #gender
margin.table(UCBAdmissions,3) #Dept
margin.table(UCBAdmissions)

#save memorial as new table
admit.dept<- margin.table(UCBAdmissions,3)
str(admit.dept)
barplot(admit.dept)
admit.dept
prop.table(admit.dept)  #to get the percccentage
round(prop.table(admit.dept),2) #to get percentage upto two decimals
round(prop.table(admit.dept),2)*100 #to get the exact percentage
rm(list = ls())






      
