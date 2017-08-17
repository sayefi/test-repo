

source("pollutantmean.r")

## for data analysis changing the direcotry
setwd("C:/Users/sayef/Documents/Data_Science/Projects/Air_pollusion")


x<-pollutantmean("specdata", "sulfate", 1:10)
x
x<-pollutantmean("specdata", "nitrate", 70:72)
x
x<-pollutantmean("specdata", "sulfate", 34)
x

x<-pollutantmean("specdata", "nitrate")
x

source("complete.r")

abc<-complete("specdata",4:10)

abc

x<-4
class(x)

x<-c(4,TRUE)
class(x)

x<-list(2,"a","b",TRUE)
y<-x[[2]]
length(y)
y

x<-c(1:4)
x
y<-2

x+y

# Set the working directory
setwd("C:/Users/sayef/Documents/Data_Science/Projects/test-repo")


## Reading from file
con<-file("hw1_data.csv","r")
quiz1_data<-read.csv(con)
close(con)
quiz1_data

## print column names of the dataset
names(quiz1_data)

## print first 2 rows
head(quiz1_data,2)

## number of observations
nrow(quiz1_data)

## print last 2 rows
tail(quiz1_data,2)

## value of Ozone in 47th row
quiz1_data[47,"Ozone"]

## number of missing values in ozone column
nrow(quiz1_data[is.na(quiz1_data$Ozone),])

## mean of the Ozone column in this dataset
mean(quiz1_data[!is.na(quiz1_data$Ozone),]$Ozone)


## Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?
solar<-quiz1_data[quiz1_data$Ozone>31 & quiz1_data$Temp>90,]
mean(solar[!is.na(solar$Solar.R),]$Solar.R)

## What is the mean of "Temp" when "Month" is equal to 6?
temp<-quiz1_data[quiz1_data$Month==6,]
mean(temp$Temp)
mean(temp[!is.na(temp$Temp),]$Temp)

## What was the maximum ozone value in the month of May 
temp<-quiz1_data[quiz1_data$Month==5,]
max(temp[!is.na(temp$Ozone),]$Ozone)

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
