
opar <- par(ask = interactive())

#----------------------------------------------------------------------------

help(Uniform)

z <- seq( -2, 2, length=101 )        #  z = [-2, -1.98, ..., 1.98, -2]

plot(z, dunif(z))                    # uniform density (pdf)

plot(z, dunif(z), type="l")          # line plot instead of point plot

plot(z, dunif(z, min=-2, max=1.5), type="l" )  # change mu, sigma

#----------------------------------------------------------------------------

curve( dunif, -2, 2 )                # semi-convenient line plot

curve( dunif(x), -2, 2 )             # by convention "x" is the x-axis

curve( dunif, -2, 2, col="purple" )  # purple line plot ...

#----------------------------------------------------------------------------

plot( z, punif(z), type="l" )        # uniform distribution (cdf)

curve( punif, -2, 2, col="red" )                # uniform cdf

curve( dunif, -2, 2, col="blue", add=TRUE )    # superimpose uniform pdf

#----------------------------------------------------------------------------

y <- seq( -2, 2, length=101 )
plot( y, qunif(y), type="l" )        # inverse uniform distribution (icdf)
                                     #   aka:  the quantile function
curve( qunif, -2, 2, col="red" )     # inverse uniform distribution (icdf)

#----------------------------------------------------------------------------

sampleSize <- 500

randSample <- runif(sampleSize, min=-3, max=2)  # random uniform deviates

sampleMin <- min(randSample)         # should be about -3
sampleMin

sampleMax <- max(randSample)         # should be about 2
sampleMax

hist( randSample, col="magenta", density = TRUE )    # histogram
curve( dunif(x, min=sampleMin, max=sampleMax), add=TRUE  )
                                     # with superimposed fitted uniform pdf

#----------------------------------------------------------------------------

par(opar)
