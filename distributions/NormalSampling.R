opar <- par(ask = interactive())

#----------------------------------------------------------------------------

help(Normal)

z <- seq(-3,3, length=101)           #  z = [-3, -2.97, ..., 2.97, 3]

plot(z, dnorm(z), main="normal pdf") # normal density (pdf)


plot(z, dnorm(z), type="l", main="normal pdf") # line plot instead of point plot

plot(z, dnorm(z, mean=-2, sd=1.5), type="l" )  # change mu, sigma

#----------------------------------------------------------------------------

curve( dnorm, -3, 3 )                # semi-convenient line plot

curve( dnorm(x), -3, 3 )             # by convention "x" is the x-axis

curve( dnorm, -3, 3, col="purple" )  # purple line plot ...

#----------------------------------------------------------------------------

plot( z, pnorm(z), type="l" )        # normal distribution (cdf)

curve( pnorm, -3, 3, col="red" )                # normal cdf

curve( dnorm, -3, 3, col="blue", add=TRUE )     # superimpose normal pdf

#----------------------------------------------------------------------------

y <- seq( 0, 1, length=101 )
plot( y, qnorm(y), type="l" )        # inverse normal distribution (icdf)
                                     #   aka:  the quantile function
curve( qnorm, 0, 1, col="red" )      # inverse normal distribution (icdf)

#----------------------------------------------------------------------------

sampleSize <- 500

randSample <- rnorm(sampleSize, mean=70, sd=10)  # random normal deviates

sampleMean <- mean(randSample)       # should be about 70
sampleMean

sampleSD <- sd(randSample)           # should be about 10
sampleSD

hist( randSample, col="magenta", probability=TRUE )    # histogram
curve( dnorm(x, mean=sampleMean, sd=sampleSD), add=TRUE )
                                     # with superimposed fitted normal pdf

#----------------------------------------------------------------------------

par(opar)
