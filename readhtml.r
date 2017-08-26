con=url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlcode<-readLines(con)
close(con)

head(htmlcode)
str(htmlcode)
result<-data.frame()

result<-rbind(result,c(10,nchar(htmlcode[10])))
result<-rbind(result,c(20,nchar(htmlcode[20])))
result<-rbind(result,c(30,nchar(htmlcode[30])))
result<-rbind(result,c(100,nchar(htmlcode[100])))


colnames(result)<-c("Line no","count")

result


