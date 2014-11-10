UniformChiSqTest <- function(h) {
   hbins <- h$counts           # vector of bin counts in histogram h
   N <- sum(hbins)             # total of all bin counts in histogram h
   nbins <- length(hbins)      # the number of bins in h
   p <- rep( 1/nbins, nbins )  # uniform expected probability values
   ChiSqValue <- sum( (hbins - N*p)^2 / (N*p) )
   ChiSqProb <- pchisq(ChiSqValue, df = nbins-1)
   cat( "chi-squared value = ", ChiSqValue)
   cat( "probability of getting a smaller value = ", ChiSqProb )
}     

# demo whether the runif() random number generator yields a uniform histogram
demo <- function() {
   N <- 10000 
   runifHistogram <- hist(runif(N))
   UniformChiSqTest( runifHistogram )
}

