fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(fileUrl,"data/quizdata.csv")
list.files("./data")


fData<-read.csv("data/quizdata.csv",sep=" ",skip = 3,header = TRUE)

fData<-read.fwf("data/quizdata.csv",skip=4,widths=c(12, 7, 4, 9, 4, 9, 4, 9, 4))

sum(fData$V4)

