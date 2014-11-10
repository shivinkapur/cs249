# Simulate rolling a pair of dice many times.

Die <- function(uniformX) 1+trunc(6*uniformX)

Nrolls <- 50000
Die1  <- Die(runif(Nrolls));
Die2  <- Die(runif(Nrolls));
Total <- Die1 + Die2;
hist(Total, col="violet", breaks=1:12,
     main=paste("Outcome of ",Nrolls," Dice Rolls."))
