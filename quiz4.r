set.seed(1)
rpois(5, 2)



set.seed(10)
x <- rep(0:1, each = 5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e


set.seed(100)
x<-rnorm(1000,10,5)

plot(x)


set.seed(10)
e<-rnorm(1000,5,2)

plot(e)


y<-5+2*x+e
plot(x,y)

z<-lm(y~x)
z


plot(z)


