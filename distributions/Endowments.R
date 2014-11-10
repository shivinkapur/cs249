E = read.csv("Endowments.csv",header=TRUE)  # use abbreviated university names

ranks = E[,1]
names = E[,2]
endowments = E[,4] * 1000

n = 700
n = 500
n =  50
n =  25  # consider only the top 25 universities
n = 100

rank = ranks[1:n]
endowment = endowments[1:n]
name = names[1:n]

plot( (rank), (endowment), cex.main=1.25, cex.lab=1.05, cex=1.25, pch=20, col="red", mgp = c(3,2,0),
   xlim=c(1,25),
   main=paste("(rank) vs (endowment) for the Top ", n, " Universities\n[2008 NACUBO University Endowment Rankings]") )
lines( (rank), (endowment), type="S", col="magenta")  # add staircase for dramatic effect

text( (rank), (endowment), labels = name, pos=4, offset = 0.5, cex = 0.5 , col= "blue")

rank2 = (rank)^2

linfit = lm( (endowment) ~ (rank) )
abline(linfit, col="green")   # plot the linear model fit in green

#######  This produces a terrible fit; can you find a better model?


