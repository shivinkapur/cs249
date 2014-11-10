Zipf = read.csv("ZipfData.csv",header=TRUE)
n = 500
rank= 1:n
frequency = Zipf[1:n,1]
word = Zipf[1:n,2]

plot( log10(rank), log10(frequency),
   main=sprintf("log10(rank) vs. log10(frequency) for\n the top %d words in The Wind in the Willows",n),
   xlim=c(0,2.75), cex.main=1.25, cex.lab=1.05, cex=1.5, pch=20, col="forestgreen", mgp = c(3,2,0) )
lines( log10(rank), log10(frequency), type="S", col="magenta")  # staircase plot
text(  log10(rank), log10(frequency), labels = word, pos=4, offset = 0.5, cex = 0.35 , col= "blue")

linfit = lm( log10(frequency) ~ log10(rank) )
abline(linfit, col="green")   # plot the linear model fit in green
