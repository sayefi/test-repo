## URL
##https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv

fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl,"data/acsdata1.csv")
list.files("./data")


acs<-read.csv("data/acsdata1.csv")

table(is.na(acs$ACR))

agricultureLogical<-which(acs$ACR==3 & acs$AGS==6)
#agricultureLogical<-which(acs$ACR>1 & acs$AGS==6)
#agricultureLogical<-which(acs$AGS==6)



head(agricultureLogical,3)
# res<-acs[agricultureLogical,]
# 
# head(res[,c("AGS","ACR")],10)
# 
# 
# 
# # table(is.na(acs$AGS))
# #
# table(res$AGS,res$ACR)
# #
# # table(agricultureLogical)


## --------------------------------------------

install.packages("jpeg")  

library(jpeg)

## URL
#https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg


fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(fileUrl,"data/fjeff.jpg",mode="wb")
list.files("./data")


img <- readJPEG("data/fjeff.jpg", native = TRUE)

quantile(img,c(.30,.80))


## --------------------------------------------
## URL GDP data
##https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv

## URL education data
##https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv

## Install dplyr package
#install.packages("dplyr")
library(dplyr)


fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl,"data/gdp.csv")

fileUrl<-
     "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl,"data/edu_country.csv")

list.files("./data")
edu<-read.csv("data/edu_country.csv")

gdp<-read.csv("data/gdp.csv",skip=5,header=FALSE,stringsAsFactors = FALSE)
#colnames(gdp)

gdp<-select(gdp,V1,V2,V4,V5)

#gdp<-subset(gdp,select=c(V1,V2,V4,V5))

gdp<-rename(gdp,coutrycode=V1,rank=V2,countryname=V4,gdpinmill=V5)

gdp$rank<-as.numeric(gdp$rank)

#table(gdp$V1,gdp$V2)
gdp<-filter(gdp,rank<=190)

#gdp<-filter(gdp,V1!="")

# gdp<-rename(gdp,coutrycode=V1,rank=V2,countryname=V4,gdpinmill=V5)
# 
# gdp<-gdp %>% select(V1,V2,V4,V5) %>% filter(V1!="",V2!="") %>% 
#      rename(ccode=V1,rank=V2,countryname=V4,gdpinmill=V5) 

     
# names(gdp)
# names(edu)

mergedData<-merge(edu,gdp,by.x="CountryCode",by.y = "coutrycode")



mergedData<-arrange(mergedData,desc(rank))

nrow(mergedData)
mergedData[13,"countryname"]

##-----------------------------------------------

tapply(mergedData$rank,mergedData$Income.Group,mean)

##----------------------------------------------------

#rankquantile<-quantile(mergedData$rank,seq(0,1,.20))

x<-cut(mergedData$rank,
    breaks=quantile(mergedData$rank,
                    probs=seq(0, 1, by=0.2), na.rm=T),
    include.lowest= TRUE, labels=1:5)

mergedData<-mutate(mergedData,
                   rankquantile=cut(mergedData$rank,
                    breaks=quantile(mergedData$rank,
                    probs=seq(0, 1, by=0.2), na.rm=T),
                    include.lowest= TRUE, labels=1:5))

table(mergedData$Income.Group,mergedData$rankquantile)


