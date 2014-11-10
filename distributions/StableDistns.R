plot(  dnorm,  -5,5, col="darkred", xlab="", ylab="")
curve( dcauchy,-5,5, add=TRUE, col="navy", xlab="", ylab="")

# dcauchy = function(x) 1/pi/(1+x^2)

text(0,0.15,"Cauchy", col="navy")
text(2,0.25,"Gaussian", col="darkred")

