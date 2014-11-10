firstdigit = function(x) ifelse( x==0, 0, sign(x) * trunc( x / 10^floor(log10(x)) ) )

opar = par(mfrow=c(2,2))

N = 100000

for (M in c(1, 2, 3, 4)) {
   hist( firstdigit( apply( matrix(runif(M*N), M,N),2, prod ) ),
     breaks=0:9,
     ylim = c(0, 0.35), xlim=c(0,10),
     col="aquamarine",
     cex.lab=0.7,
     cex.main=0.7,
     xlab="",
     # sub=paste("M = ",M,"    N = ",N),
     probability=TRUE,
     main=sprintf("%5d first digits of products of %d uniform random values", N, M))

   ExpectedHistogram = ( log10(2:10) - log10(1:9) )

   points( 1:9 - 0.5, ExpectedHistogram, type="l", lwd=2, pch=20, col="red", add=TRUE )
   points( 1:9 - 0.5, ExpectedHistogram, type="p", lwd=2, pch=20, col="red", add=TRUE )

}

par(opar)
