#----------------------------------------------------------------------------------------------
# stop after each plot
#----------------------------------------------------------------------------------------------

opar <- par(ask = TRUE, mfrow=c(1,2))

N <- 10000
hist((runif(N)-1/2),breaks=25, cex.lab=0.7, cex.main=0.7, col="orange",
  main=paste(N," uniform values"))

# hist(cumsum(runif(N)-1/2),breaks=25, cex.lab=0.7, cex.main=0.7, col="orange",
#   main=paste("cumsum of ",N," uniform values"))

hist(rnorm(N),breaks=25,main=paste(N," normal values"), cex.lab=0.7, cex.main=0.7, col="orange")

# hist(cumsum(rnorm(N)),breaks=25, cex.lab=0.7, cex.main=0.7, col="orange",
#   main=paste("cumsum of ",N," normal values"))


#----------------------------------------------------------------------------------------------

par(mfrow=c(2,2))

N <- 10000

for (M in 2:5)
   hist( apply(matrix(runif(M*N)-1/2,M,N), 2, sum),breaks=seq(-4,4,by=0.1), cex.lab=0.7, cex.main=0.7, col="orange",
     main=paste(N," sums of ",M," uniform values"))


#----------------------------------------------------------------------------------------------

par(mfrow=c(2,2))

N <- 10000

for (M in 2:5)
   hist( apply(matrix(rnorm(M*N),M,N), 2, sum),breaks=seq(-10,10,by=0.5), cex.lab=0.7, cex.main=0.7, col="orange",
     main=paste(N," sums of ",M," normal values"))

#----------------------------------------------------------------------------------------------

par(mfrow=c(2,2))

N <- 10000

for (M in 2:5)
   hist( apply(matrix(rnorm(M*N),M,N), 2, sum)/M,breaks=seq(-4,4,by=0.1), cex.lab=0.7, cex.main=0.7, col="orange",
     main=paste(N," averages of ",M," normal values"))

#----------------------------------------------------------------------------------------------

par(mfrow=c(2,2))

N <- 10000
hist((runif(N)-1/2)^2,breaks=25, cex.lab=0.7, cex.main=0.7, col="orange",
  main=paste(N," squared uniform values"))

hist(cumsum(runif(N)-1/2)^2,breaks=25, cex.lab=0.7, cex.main=0.7, col="orange",
  main=paste("squared cumsum of ",N," uniform values"))

hist(rnorm(N)^2,breaks=25, cex.lab=0.7, cex.main=0.7, col="orange",
  main=paste(N," squared normal values"))

hist(cumsum(rnorm(N))^2,breaks=25, cex.lab=0.7, cex.main=0.7, col="orange",
  main=paste("squared cumsum of ",N," normal values"))

#----------------------------------------------------------------------------------------------

par(mfrow=c(2,2))

N <- 10000

hist(rnorm(N)^2,breaks=seq(0,30,by=1), cex.lab=0.7, cex.main=0.7, col="orange",
  main=paste(N," squared normal values"))

hist((rnorm(N))^2+(rnorm(N))^2,breaks=seq(0,30,by=1), cex.lab=0.7, cex.main=0.7, col="orange",
  main=paste(N," sums of 2 squared normal values"))

hist((rnorm(N))^2+(rnorm(N))^2+(rnorm(N))^2,breaks=seq(0,30,by=1), cex.lab=0.7, cex.main=0.7, col="orange",
  main=paste(N," sums of 3 squared normal values"))

hist((rnorm(N))^2+(rnorm(N))^2+(rnorm(N))^2+(rnorm(N))^2,breaks=seq(0,30,by=1), cex.lab=0.7, cex.main=0.7, col="orange",
  main=paste(N," sums of 4 squared normal values"))

#----------------------------------------------------------------------------------------------

par(mfrow=c(2,2))

N <- 10000

for (M in c(3,7,11,15))
   hist( apply(matrix(rnorm(M*N)^2,M,N), 2, sum),breaks=seq(0,60,by=1), cex.lab=0.7, cex.main=0.7, col="orange",
     main=paste(N," sums of ",M," squared normal values"))


par(opar)
#----------------------------------------------------------------------------------------------

opar <- par(mfrow=c(2,2))

T <- 70000

for (N in 2:5)
   hist( apply(matrix(rnorm(N*T),N,T), 2, sum),
     breaks=seq(-12,12,by=0.5),
     cex.lab=0.7, cex.main=0.7,
     xlab=paste("hist(apply(matrix(rnorm(",N,"*",T,"),",N,",",T,"),2,sum)"),
     col="red", main=paste(T," sums of ",N," normal values"))

par(opar)

#----------------------------------------------------------------------------------------------

opar <- par(mfrow=c(2,2))

T <- 70000

for (N in c(2,3,5,7)) # 2:5)
   hist( apply(matrix(rnorm(N*T),N,T), 2, mean),
	breaks=seq(-3.5,3.5,by=0.1),
	col="red",
	# ylim=c(0,2500),
        cex.lab=0.7, cex.main=0.7,
        xlab=paste("hist(apply(matrix(rnorm(",N,"*",T,"),",N,",",T,"),2,mean)"),
	main=paste(T," averages of ",N," normal values"))

par(opar)


#----------------------------------------------------------------------------------------------

opar <- par(mfrow=c(2,2))

T <- 30000

hist(rnorm(T)^2,
  breaks=seq(0,30,by=0.75),
  col="yellowgreen",
  cex.lab=0.7,
  cex.main=0.7,
  main=paste(T," squared normal values"))

hist(rnorm(T)^2+rnorm(T)^2,
  breaks=seq(0,30,by=0.75),
  col="yellowgreen",
  cex.lab=0.7,
  cex.main=0.7,
  main=paste(T," sums of 2 squared normal values"))

hist(rnorm(T)^2+rnorm(T)^2+rnorm(T)^2,
  breaks=seq(0,30,by=0.75),
  col="yellowgreen",
  cex.lab=0.7,
  cex.main=0.7,
  main=paste(T," sums of 3 squared normal values"))

hist(rnorm(T)^2+rnorm(T)^2+rnorm(T)^2+rnorm(T)^2,
  breaks=seq(0,30,by=0.75),
  col="yellowgreen",
  cex.lab=0.7,
  cex.main=0.7,
  main=paste(T," sums of 4 squared normal values"))

par(opar)


#----------------------------------------------------------------------------------------------

opar <- par(mfrow=c(2,2))

T <- 25000

for (N in c(4,7,11,16))
   hist( apply(matrix(rnorm(N*T)^2,N,T), 2, sum),
	breaks=seq(0,60,by=1),
	col="red",
	# ylim=c(0,6000),
        cex.lab=0.7,
        cex.main=0.7,
        xlab=paste("hist(apply(matrix(rnorm(",N,"*",T,")^2,",N,",",T,"),2,sum)"),
	main=paste(T," sums of ",N," squared normal values"))

par(opar)

#----------------------------------------------------------------------------------------------

opar <- par(mfrow=c(2,2))

T <- 70000

within.bounds <- function (A,B,x) {
  y = x
  y[x <= A] = A
  y[x >= B] = B
  y
}

for (N in c(2,3,4,8)) {
   observations <- matrix(rnorm(N*T),N,T)
   averages <- matrix( apply(observations, 2, mean),N,T, byrow=TRUE)
   stddevs <- matrix( apply(observations, 2, sd),N,T, byrow=TRUE)
   stderrs <- stddevs / sqrt(N)
   hist( within.bounds(-4,4, averages/stderrs),
     breaks=seq(-4,4,by=0.1),
     col="red",
     main=paste("avg/stderr for {",N," normal values}"))
}

# for (N in c(5,7,11,17)) {
#   observations <- matrix(rnorm(N*T),N,T)
#   averages <- matrix( apply(observations, 2, mean),N,T, byrow=TRUE)
#   stddevs <- matrix( apply(observations, 2, sd),N,T, byrow=TRUE)
#   stderrs <- stddevs / sqrt(N)
   # hist( (observations-averages)/stddevs,
   #  breaks=seq(-4,4,by=0.1),
   #  col="red",
   #  main=paste("(x-avg)/stddev for ",N," normal values x"))
#}

par(opar)


#----------------------------------------------------------------------------------------------

opar <- par(mfrow=c(2,2))

N <- 70000

for (M in 2:5)
   hist( apply(matrix(runif(M*N),M,N),2,sum),
     breaks=seq(0,5,by=0.1),
     col="green",
     cex.lab=0.9,
     xlab=paste("hist(apply(matrix(runif(",M,"*",N,"),",M,",",N,"),2,sum)"),
     # sub=paste("M = ",M,"    N = ",N),
     cex.main=0.95,
     main=paste(N," sums of ",M," uniform random values"))

par(opar)

#----------------------------------------------------------------------------------------------

opar <- par(mfrow=c(2,2))

N <- 70000
Nbins <- 50

for (M in c(2,3,5,7)) # 2:5)
   hist( apply(matrix(runif(M*N),M,N), 2, mean),
	breaks=seq(0,1,by=1/Nbins),
	col="green",
	#  ylim=c(0, N*M/Nbins * ? ),
        cex.lab=0.9,
        xlab=paste("hist(apply(matrix(runif(",M,"*",N,"),",M,",",N,"),2,mean)"),
        cex.main=0.8,
	main=paste(N," averages of ",M," uniform random values"))

par(opar)


#----------------------------------------------------------------------------------------------

opar <- par(mfrow=c(2,2))

N <- 70000

hist(runif(N)^2,
  breaks=seq(0,4,by=0.1),
  col="orange",
  cex.lab=0.8,
  cex.main=0.8,
  main=paste(N," squared uniform random values"))

hist(runif(N)^2+runif(N)^2,
  breaks=seq(0,4,by=0.1),
  col="orange",
  cex.lab=0.8,
  cex.main=0.8,
  main=paste(N," sums of 2 squared uniform random values"))

hist(runif(N)^2+runif(N)^2+runif(N)^2,
  breaks=seq(0,4,by=0.1),
  col="orange",
  cex.lab=0.8,
  cex.main=0.8,
  main=paste(N," sums of 3 squared uniform random values"))

hist(runif(N)^2+runif(N)^2+runif(N)^2+runif(N)^2,
  breaks=seq(0,4,by=0.1),
  col="orange",
  cex.lab=0.8,
  cex.main=0.8,
  main=paste(N," sums of 4 squared uniform random values"))

par(opar)


#----------------------------------------------------------------------------------------------

opar <- par(mfrow=c(2,2))

N <- 70000

for (M in c(4,7,11,16))
   hist( apply(matrix(runif(M*N)^2,M,N), 2, sum),
	breaks=seq(0,12,by=0.25),
	col="red",
	# ylim=c(0,5000),
        cex.lab=0.9,
        xlab=paste("hist(apply(matrix(runif(",M,"*",N,")^2,",M,",",N,"),2,sum)"),
        cex.main=0.8,
	main=paste(N," sums of ",M," squared uniform random values"))

par(opar)

#----------------------------------------------------------------------------------------------

opar <- par(mfrow=c(2,2))

N <- 10000

for (M in c(5,30,60,180)) {
   observations <- matrix(runif(M*N),M,N)
   averages <- matrix( apply(observations, 2, mean), M,N, byrow=TRUE)
   stddevs  <- matrix( apply(observations, 2, sd),   M,N, byrow=TRUE)
   hist( (observations-averages)/stddevs,
          breaks=seq(-4,4,by=0.1),
          col="green",
          cex.main=0.8,
          main=paste("(x-avg)/stddev for ",M," uniform random values x"))
}

par(opar)

