opar = par(mfrow=c(1,1), ask=TRUE)

N = 1000

xwalk = cumsum(rnorm(N))
ywalk = cumsum(rnorm(N))

plot(xwalk, ywalk, type="l")
title("Brownian motion:  2D random walk with normal random steps")

#-----------------------------------------------------------------------------

par(mfrow=c(2,1))

lambda = 10  # any positive constant you want

N = 1000

Nlambda = N * lambda

brown1 = cumsum(rnorm(N))

brown2 = cumsum(rnorm(Nlambda))

brown3 = brown2 * sqrt(lambda)


plot(1:N, brown1, type="l", col="blue")
title(paste("Brown noise"))

plot(1:Nlambda, brown3, type="l", col="green")
title(paste("more Brown noise, x-axis scaled by lambda = ",lambda))

points(1:Nlambda, brown2, type="l", col="red")

# title(paste("more Brown noise, x-axis scaled by lambda = ",lambda,", y-axis scaled by sqrt(lambda) = ",sqrt(lambda)))

#-----------------------------------------------------------------------------

xsteps = diff(xwalk)
ysteps = diff(ywalk)

hist( xsteps, col="red" )
hist( ysteps, col="magenta" )

par(opar)
