opar = par(mfrow=c(2,3))

data = rnorm(1000, mean=5.3, sd=1.2)
density_cdf = function(data,bw=0.1) { d = density(data, bw); d$x = cumsum(d$x) }

qqnorm(data, pch=20, cex=0.25, col="purple", main="Q-Q plot for normal data")
qqline(data, pch=20, cex=0.25, col="purple")

plot(ecdf(data), pch=".", col="green", main="ecdf for normal data")

plot(  density(data, bw=0.10), col="red", main="density for normal data" )
lines( density(data, bw=0.25), col="blue" )
rug(data)

qqnorm(precip, pch=20, cex=0.5, col="tomato", main="Q-Q plot for precip data")
qqline(precip, pch=20, cex=0.5, col="tomato")

plot(ecdf(precip), pch=".", col="dodgerblue", main="ecdf for precip data")

plot(  density(precip, bw=4), col="red", main="density for precip data" )
lines( density(precip, bw=8), col="blue" )
rug(precip)

par(opar)
