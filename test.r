x <-5
y<-x+2
x
y



# this is my first R script
hello <- "hello world"

??read

testData<-c(1:10)

write.csv(testData,file="testoutput.csv", eol="\n",row.names=FALSE)


a <-available.packages()

write.csv(a,file="testoutput.csv", eol="\n",row.names=FALSE)

head(a)
str(a)
a[Package="KernSmooth"]

search()

#find.package("devtools")
#install.packages("devtools")

library(devtools)
find_rtools()

find.package("KernSmooth")
library(KernSmooth)
