AwfulRandSeed <- 314159265

AwfulRand <- function() {
    AwfulRandSeed <<- ((2^18+1) * AwfulRandSeed  +  1)  %%  (2^35)
    AwfulRandSeed / (2^35)
}

dAwful <- function(N) {
  AwfulStuff <- matrix(nr=1,nc=N)
  for(i in 1:N) AwfulStuff[i] <- AwfulRand()
  AwfulStuff
}

NPoints <- 50000
AwfulPoints <- dAwful(NPoints)
NBins <- 100
hist(AwfulPoints,breaks=(0:NBins)/NBins)
AwfulHistogram <- table(trunc( NBins * AwfulPoints ))
TestResult <- chisq.test(AwfulHistogram)
TestResult
str(TestResult)
TestResult$p.value
