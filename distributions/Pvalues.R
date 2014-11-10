opar <- par(ask = TRUE)

##  Fitting a normal density to a given histogram
##
##  Write a program that, given a histogram (a sequence of integer counts,
##  i.e., "bin" values), finds the average and standard deviation statistics
##  of the histogram (assuming that the integer index of each bin is its
##  x-axis coordinate), and and then plots the histogram superimposed with the
##  normal density having these statistics as its mu and sigma parameters.

sampleSize <- 500
randomSample <- rnorm(sampleSize, mean=-3, sd=2) ## random normal deviates

superimposedNormal <- function(Data) {
  Hist <- hist( Data, col="magenta", probability=TRUE )
  mu <- mean(Data)
  sigma <- sd(Data)
  curve( dnorm(x, mean=mu, sd=sigma), add=TRUE )
}

superimposedNormal(randomSample)


##
##  Understanding the tails of the Normal distribution (and how grades work)
##
##  Let f(x) be the normal (Gaussian) density (with mu=0 and sigma=1).
##  Let F(x) be the corresponding normal probability distribution.
##
##  Write a program that, given a probability p, finds x such that:
##    a. F(x)         = p. ("p percent of the population are below x sigmas")
##                         (aka: "a score of x is the p"th percentile")
##    b. F(x) - F(-x) = p. ("p percent of the population are inside x sigmas")
##
##    Using your program, find x such that:
##       F(x) = 0.95     F(x) - F(-x) = 0.95  
##       F(x) = 0.99     F(x) - F(-x) = 0.99
##       F(x) = 0.999    F(x) - F(-x) = 0.999
##       F(x) = 0.9999   F(x) - F(-x) = 0.9999
##

p <- qnorm(0.95)
cat("p = ",p,"  pnorm(p) = ", pnorm(p), "\n")

p <- qnorm(0.99)
cat("p = ",p,"  pnorm(p) = ", pnorm(p), "\n")

p <- qnorm(0.999)
cat("p = ",p,"  pnorm(p) = ", pnorm(p), "\n")

p <- qnorm(0.9999)
cat("p = ",p,"  pnorm(p) = ", pnorm(p), "\n")


## if  F(x) - F(-x) = p,   then  F(x) - F(0) = p/2,  i.e.,  F(x) - 1/2 = p/2.
## Thus,  F(x) = 1/2 + p/2.   So:   x = F^(-1)((1+p)/2)

x <- qnorm((1 + 0.95)/2)
cat("x = ",x,"  pnorm(x) - pnorm(-x) = ", pnorm(x) - pnorm(-x), "\n")

x <- qnorm((1 + 0.99)/2)
cat("x = ",x,"  pnorm(x) - pnorm(-x) = ", pnorm(x) - pnorm(-x), "\n")

x <- qnorm((1 + 0.999)/2)
cat("x = ",x,"  pnorm(x) - pnorm(-x) = ", pnorm(x) - pnorm(-x), "\n")

x <- qnorm((1 + 0.9999)/2)
cat("x = ",x,"  pnorm(x) - pnorm(-x) = ", pnorm(x) - pnorm(-x), "\n")


##
##    Given a sequence of increasing probability values p_1 < p_2 < ... < p_k
##    we can find the sequence F(p_1) < F(p_2) < ... < F(p_k).
##    These are called the "quantiles" F(p) corresponding to the percentiles p.
##    See e.g. the quantile() function in R.
##
##  Write a program that, given a real value x, finds a probability p such that:
##    a. F(x)         = p. ("p percent of the population are below x sigmas")
##                         (aka: "a score of x is the p'th percentile")
##    b. F(x) - F(-x) = p. ("p percent of the population are inside x sigmas")
##
##    Using this program, find p values such that:
##       F(1) = p        F(1) - F(-1) = p
##       F(2) = p        F(2) - F(-2) = p
##       F(3) = p        F(3) - F(-3) = p
##       F(4) = p        F(4) - F(-4) = p
##       F(6) = p        F(6) - F(-6) = p
##

cat("pnorm(1) = ", pnorm(1), "\n")
cat("pnorm(2) = ", pnorm(2), "\n")
cat("pnorm(3) = ", pnorm(3), "\n")
cat("pnorm(4) = ", pnorm(4), "\n")
cat("pnorm(6) = ", pnorm(6), "\n")

cat("pnorm(1) - pnorm(-1) = ", pnorm(1) - pnorm(-1), "\n")
cat("pnorm(2) - pnorm(-2) = ", pnorm(2) - pnorm(-2), "\n")
cat("pnorm(3) - pnorm(-3) = ", pnorm(3) - pnorm(-3), "\n")
cat("pnorm(4) - pnorm(-4) = ", pnorm(4) - pnorm(-4), "\n")
cat("pnorm(6) - pnorm(-6) = ", pnorm(6) - pnorm(-6), "\n")



##  Confidence intervals
##
##  If we know the true standard deviation sigma of a distribution,
##  we can use the Normal distribution to test whether a given sample mean xbar
##  is significantly different from a given expected value mu.
##
##    Pr[ -p <= z < p ]  = F(p) - F(-p)   (e.g. Pr[ -1.96 <= z < 1.96 ] = .95)
##
##  So, if the xbar values are normally distributed with true mean mu and 
##  true standard deviation sigma, the standard error of the xbar estimates
##  is sigma/sqrt(N):
##
##   Pr[ -p  <=  (xbar - mu)/(sigma/sqrt(N))  <  p ]  =  F(p) - F(-p)
##
##  or
##
##  Pr[ xbar - p sigma/sqrt(N) <= mu < xbar + p sigma/sqrt(N) ] =  F(p) - F(-p)
##
##
##  If we do not know the true standard deviation of a distribution,
##  but we have a computed estimate (often denoted "s" instead of "sigma"),
##  we can use the Student t-distribution to test whether a given
##  sample mean is significantly different from a given expected value.
##  This is essentially like the above, but instead of the normal
##  distribution F(p), we use the t distribution  t(p,N).
##  See the R functions  TDist()  and  t.test().
##

help(TDist)

help(t.test)

##  
##  Hypothesis testing in general
##
##  help.search("test")
##

help.search("test")

help(chisq.test)

par(opar)
