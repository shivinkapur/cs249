# Histograms in R
#
# Displaying two histograms, of uniform and normal random values.
#  (using runif(1000) and rnorm(1000)).
#

par(mfrow=c(2,1))

mention_parameters = function(x) mtext(sprintf("Mean = %6.3f   Median = %6.3f   Stddev = %6.3f",mean(x),median(x),sd(x)), col="blue")

x <- runif(1000)
hist(x, col="green",main="Histogram of values from runif(1000)")
mention_parameters(x)

x <- rnorm(1000)
hist(x, col="magenta", lwd=2, main="Histogram of values from rnorm(1000)")
mention_parameters(x)

#------------------------------------------------------------------------------------------------

histWithSuperimposedNormal <- function(Data) {
  Hist <- hist( Data, col="magenta", probability=TRUE )
  mu <- mean(Data)
  sigma <- sd(Data)
  curve( dnorm(x, mean=mu, sd=sigma), col="blue", add=TRUE )
  mtext( sprintf("mu = %6.3f,   sigma = %6.3f", mu, sigma) )
}

histWithSuperimposedNormal(  rnorm( 10000, mean=5.2, sd=3.1 ) )

#------------------------------------------------------------------------------------------------

approx_exp = function(x, n)  (1 + x/n)^n

# > approx_exp(-3^2/2,100000)
# [1] 0.01110787
# > approx_exp(-3^2/2,100000) * 1/sqrt(2*pi)
# [1] 0.0044314
# > dnorm(-3)
# [1] 0.004431848

#  find information on any distribution
?Distributions

pdf1 <- function(z) { dt(z,1) }
pdf2 <- function(z) { dt(z,2) }
pdf3 <- function(z) { dt(z,3) }
pdf4 <- function(z) { dt(z,4) }
pdf8 <- function(z) { dt(z,8) }

plot( pdf8,-5,5, col="navy", xlab="", ylab="")
curve(pdf4,-5,5, add=TRUE, col="darkgreen", ylab="")
curve(pdf3,-5,5, add=TRUE, col="orange", ylab="")
curve(pdf2,-5,5, add=TRUE, col="red", ylab="")
curve(pdf1,-5,5, add=TRUE, col="darkred", ylab="")

text(-0.25,0.15,"nu=1", col="darkred")
text( 1.75,0.25,"nu=8", col="navy")
text(-3.25,0.3,"Student's  t  density", col="darkgreen")
# title("Student's  t  density converges to the Normal density", col="darkgreen")

mtext( expression( pdf == Gamma((nu+1)/2)/(sqrt(nu ~ pi) ~ Gamma(nu/2)) ~ ~ ~ (1 + x^2/nu)^(-(nu+1)/2) ) )
plot(  dnorm,  -5,5, col="darkred", xlab="", ylab="")
curve( dcauchy,-5,5, add=TRUE, col="navy", xlab="", ylab="")

# dcauchy = function(x) 1/pi/(1+x^2)

text(0,0.15,"Cauchy", col="navy")
text(2,0.25,"Gaussian", col="darkred")


#------------------------------------------------------------------------------------------------

opar <- par( ask=TRUE )

plot(  dlnorm, 0, 5, col="red" ,
	main="function(x) dlnorm(x, mean=0, sd=1)" )

par(opar)

#-------------------------------------------------------------------------------

opar <- par( ask=TRUE, mfrow=c(2,2) )

dlognormal <- function(x) dlnorm(x, meanlog=0, sdlog=1)

plot( dlognormal, 0.0001, 10, col="red" )

plot( dlognormal, 0.0001, 1000, log="x",
      col="red", xlab="x (log scale)" )

plot( dlognormal, 0.0001, 1000, log="y",
      col="red", ylab="dlognormal(x) (log scale)" )

plot( dlognormal, 0.0001, 1000, log="xy",
      col="red", xlab="x (log scale)", ylab="dlognormal(x) (log scale)" )


N <- 10000

for (M in 2:5)
   hist( log( apply(matrix(rlnorm(M*N),M,N), 2, prod) ),
	col = "cyan",
	breaks=seq(-10,10,by=0.5),
	main=paste(N," products of ",M," lognormal values"))


par(opar)

#-------------------------------------------------------------------------------

pdf1 <- function(z) { dchisq(z,1) }
pdf2 <- function(z) { dchisq(z,2) }
pdf3 <- function(z) { dchisq(z,3) }
pdf4 <- function(z) { dchisq(z,4) }
pdf5 <- function(z) { dchisq(z,5) }
pdf6 <- function(z) { dchisq(z,6) }
pdf8 <- function(z) { dchisq(z,8) }

plot( pdf2, 0,8, col="darkgreen", xlab="", ylab="")
curve(pdf1, 0,8, add=TRUE, col="navy", ylab="")
curve(pdf3, 0,8, add=TRUE, col="purple", ylab="")
curve(pdf4, 0,8, add=TRUE, col="orange", ylab="")
curve(pdf5, 0,8, add=TRUE, col="red", ylab="")
curve(pdf8, 0,8, add=TRUE, col="darkred", ylab="")

text( 0.95,0.45,"nu=1", col="navy")
text( 1.35,0.32,"nu=2", col="darkgreen")
text( 6.95,0.15,"nu=8", col="darkred")
text( 6.00,0.4,"Chi-squared density", col="darkgreen")
# title("Chi-squared densities", col="darkgreen")

mtext( expression( pdf == 1/(2^(nu/2) ~ Gamma(nu/2)) ~ ~ ~ x^(nu/2-1) ~ e^(-x/2) ) )

