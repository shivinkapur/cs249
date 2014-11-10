
opar <- par( ask=TRUE )

plot(  dlnorm, 0, 5, col="red" ,
	main="function(x) dlnorm(x, mean=0, sd=1)" )

par(opar)
opar <- par( ask=TRUE, mfrow=c(2,2) )

#-------------------------------------------------------------------------------

dlognormal <- function(x) dlnorm(x, meanlog=0, sdlog=1)

plot( dlognormal, 0.0001, 10, col="red" )

plot( dlognormal, 0.0001, 1000, log="x",
      col="red", xlab="x (log scale)" )

plot( dlognormal, 0.0001, 1000, log="y",
      col="red", ylab="dlognormal(x) (log scale)" )

plot( dlognormal, 0.0001, 1000, log="xy",
      col="red", xlab="x (log scale)", ylab="dlognormal(x) (log scale)" )

#-------------------------------------------------------------------------------

N <- 10000

for (M in 2:5)
   hist( log( apply(matrix(rlnorm(M*N),M,N), 2, prod) ),
	col = "cyan",
	breaks=seq(-10,10,by=0.5),
	main=paste(N," products of ",M," lognormal values"))

#-------------------------------------------------------------------------------

par(opar)

