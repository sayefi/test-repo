## URL - https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv

fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl,"data/acsdata2.csv","curl")
list.files("./data")

acs<-read.csv("data/acsdata2.csv")

elementnames<-names(acs)

splitted<-strsplit(elementnames,"wgtp")

splitted[123]

## --------------------------------------------------------

library(dplyr)

gdp<-read.csv("data/gdp.csv",skip=5,header=FALSE,stringsAsFactors = FALSE)
#colnames(gdp)

gdp<-select(gdp,V1,V2,V4,V5)

#gdp<-subset(gdp,select=c(V1,V2,V4,V5))

gdp<-rename(gdp,coutrycode=V1,rank=V2,countryname=V4,gdpinmill=V5)

gdp$rank<-as.numeric(gdp$rank)

#table(gdp$V1,gdp$V2)
gdp<-filter(gdp,rank<=190)

gdpmil<-gsub(",", "",gdp$gdpinmill)

head(gdpmil)

mean(as.numeric(gdpmil))

## -------------------------------------------------------------------

grep("^United",gdp$countryname)

## -------------------------------------------------------------------

edu<-read.csv("data/edu_country.csv")

mergedData<-merge(edu,gdp,by.x="CountryCode",by.y = "coutrycode")

fisEndJune<-grep("[Jj]une 30",mergedData$Special.Notes,value=TRUE)

length(fisEndJune)

## -------------------------------------------------------------------

install.packages("quantmod")
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

sampleDates <-as.Date(sampleTimes,"%Y-%m-%d")


length(grep("2012",format(sampleDates,"%Y %A")))

length(grep("2012 Monday",format(sampleDates,"%Y %A")))

# 
# format(sampleDates,"%Y %A")
# 
# nrow(sampleDates[format(sampleDates,"%Y")=="2012"])
# 
# format(sampleDates,"%Y")=="2012"
