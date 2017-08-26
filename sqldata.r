

## Not required - RMySQL rather post errors as it will try to connect
## database in localhost

#install.packages("RMySQL")
#library(RMySQL)


## Load sqldf package
#install.packages("sqldf")
library(sqldf)

## brief testing
sqldf("select * from iris limit 5")

## Loading file
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl,"data/acsdata.csv")
list.files("./data")


acs<-read.csv("data/acsdata.csv")



#str(acs)

## alternative way of loading file ...not very efficient
#acs<-sqldf::read.csv.sql("data/acsdata.csv","select * from file")



head(sqldf("select pwgtp1 from acs where AGEP < 50"))

sqldf("select distinct AGEP from acs")
