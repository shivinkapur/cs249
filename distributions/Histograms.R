# Histograms in R
#
# Displaying two histograms, of uniform and normal random values.
#  (using runif(1000) and rnorm(1000)).
#
par(mfrow=c(2,1))

add_parameters = function(x) mtext(sprintf("Mean = %6.3f   Median = %6.3f   Stddev = %6.3f",mean(x),median(x),sd(x)), col="blue")

x <- runif(1000)
hist(x, col="green",main="Histogram of values from runif(1000)")
add_parameters(x)

x <- rnorm(1000)
hist(x, col="magenta", lwd=2, main="Histogram of values from rnorm(1000)")
add_parameters(x)
