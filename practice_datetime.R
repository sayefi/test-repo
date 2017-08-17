x<-Sys.time()

p<-as.POSIXlt(x)

names(unclass(p))

p$sec
p$min


x <- 1:10
if(x > 5) {
  x <- 0
}


f <- function(x) {
  g <- function(y) {
    y + z
  }
  z <- 4
  x + g(x)
}

z <- 10
f(3)

x <- 5
y <- if(x < 3) {
  NA
} else {
  10
}