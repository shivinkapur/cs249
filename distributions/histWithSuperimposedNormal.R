
histWithSuperimposedNormal <- function(Data) {
  Hist <- hist( Data, col="magenta", probability=TRUE )
  mu <- mean(Data)
  sigma <- sd(Data)
  curve( dnorm(x, mean=mu, sd=sigma), col="blue", add=TRUE )
  mtext( sprintf("mu = %6.3f,   sigma = %6.3f", mu, sigma) )
}

histWithSuperimposedNormal(  rnorm( 10000, mean=5.2, sd=3.1 ) )
