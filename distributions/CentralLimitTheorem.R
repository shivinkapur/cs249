#  The Central Limit Theorem

randomSum  <-  function(NumberOfSummands)  sum(runif(NumberOfSummands))

testCentralLimitTheorem <- function(NumberOfUniformValuesToAdd,NObservations) {
   Obs <- matrix(NObservations,1)
   for (i in 1:NObservations)  Obs[i] <- randomSum(NumberOfUniformValuesToAdd)
   hist( Obs, probability=TRUE )
   # now overlay a normal distribution, fitted to the data
   mu    <- mean(Obs)
   sigma <- sd(Obs)
   curve( dnorm(x, mean=mu,sd=sigma), add=TRUE )
}

par(mfrow=c(1,3))

for (N in c(2,3,4))  testCentralLimitTheorem( N, 5000 );

