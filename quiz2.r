


# Set the working directory
setwd("C:/Users/sayef/Documents/Data_Science/Projects/test-repo")

read.csv("hw1_data.csv",nrows=2)


x<-read.csv("hw1_data.csv",header = TRUE)

tail(x)


x[47,"Ozone"]



missingOzone <- is.na(x$Ozone)

missingOzone

length(subset(missingOzone,missingOzone==TRUE))


mean(x[!missingOzone,]$Ozone)

y<-x[x$Ozone>31 & x$Temp>90, ]$Solar.R

y

y<-y[!is.na(y)]


mean(y)

mean(x[x$Month==6,]$Temp)



z<-x[!missingOzone,]

z


max(z[z$Month==5,]$Ozone)

mean()

x[x$Ozone>31 & x$Temp>90, ]$Solar.R

a<-x$Ozone>31
b<-x$Temp>90
a
b
x[a&b,]

y
