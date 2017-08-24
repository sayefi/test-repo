
## Downloading a txt file

fileUrl<-"https://opendata.arcgis.com/datasets/ae49d66495ad40c996a5866cb9626d91_0.csv"
download.file(fileUrl,"data/building permits.csv","curl")
list.files(".")


## same file in Jason

fileUrl<-"https://opendata.arcgis.com/datasets/ae49d66495ad40c996a5866cb9626d91_0.geojson"
download.file(fileUrl,"data/building permits.json","curl")
list.files(".")



if(!file.exists("data"))
     dir.create("data")




fileUrl<-"https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,"data/cameras.csv","curl")
list.files("./data")



cameraData<-read.table("data/cameras.csv",sep=",",header=TRUE)
head(cameraData)


# Quiz
# 1 Prcess csv using data.table 
install.packages("data.table")
find.package("data.table")
library(data.table)


fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl,"data/dataloadq1.csv","curl")
list.files("./data")

df<-read.csv("data/dataloadq1.csv")
df$VAL<-as.numeric(df$VAL)
df<-df[complete.cases(df$VAL),]
nrow(df[df$VAL==24,])
df[,c(1,2)]

df$VAL
str(df)

DT<-fread("data/dataloadq1.csv")
DT[,list(RT,SERIALNO)]
DT[,list(RT,VAL)]

DT[,.N,by=VAL]


# 3 Reading xl
library(rJava)

install.packages("xlsx")
find.package("xlsx")
library(xlsx)

fileUrl<-
     "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl,"data/gov_NGAP.xlsx","curl")
list.files("./data")

dat<-read.xlsx("data/gov_NGAP.xlsx",sheetIndex = 1,header = TRUE,
                  rowIndex = 18:23,colIndex = 7:15)
sum(dat$Zip*dat$Ext,na.rm=T)

# 4 number of restaurants in zipcode 21231
## read from xml
install.packages("XML")
find.package("XML")
library(XML)
library(data.table)

fileUrl<-
     "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
fileUrl<-
     "https://www.w3schools.com/xml/simple.xml"
download.file(fileUrl,"data/restaurants.xml","curl")
list.files("./data")

doc<-xmlTreeParse("data/restaurants.xml",useInternal=TRUE)

rootNode<-xmlRoot(doc)
xmlName(rootNode)
names(rootNode)

restaurants<-as.data.frame(xpathSApply(rootNode,"//name",xmlValue))
restaurants<-cbind(restaurants,as.vector(xpathSApply(rootNode,"//zipcode",xmlValue)))

colnames(restaurants)<-c("Name","Zipcode")
str(restaurants)
head(restaurants)

DT<-data.table(restaurants)
DT<-DT[DT$Zipcode==21231,]
DT[,.N]

# 5
library(data.table)


fileUrl<-
     "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl,"data/fss_pid.csv","curl")
list.files("./data")

DT<-fread("data/fss_pid.csv")

tables()

## works - 0sec but based on tapply
tapply(DT$pwgtp15,DT$SEX,mean)
system.time(tapply(DT$pwgtp15,DT$SEX,mean))

## doesnt work
rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]

## works0.03sec 
mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
system.time({mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)})

## works -0sec --best result based on data.table
DT[,mean(pwgtp15),by=SEX]
system.time(DT[,mean(pwgtp15),by=SEX])

## doesn't work
mean(DT$pwgtp15,by=DT$SEX)

# works - 0sec - but based on sapply
sapply(split(DT$pwgtp15,DT$SEX),mean)
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
