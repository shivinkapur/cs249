pdf1 <- function(z) { dchisq(z,1) }
pdf2 <- function(z) { dchisq(z,2) }
pdf3 <- function(z) { dchisq(z,3) }
pdf4 <- function(z) { dchisq(z,4) }
pdf5 <- function(z) { dchisq(z,5) }
pdf6 <- function(z) { dchisq(z,6) }
pdf8 <- function(z) { dchisq(z,8) }

plot( pdf2, 0,8, col="darkgreen", xlab="", ylab="")
curve(pdf1, 0,8, add=TRUE, col="navy", ylab="")
curve(pdf3, 0,8, add=TRUE, col="purple", ylab="")
curve(pdf4, 0,8, add=TRUE, col="orange", ylab="")
curve(pdf5, 0,8, add=TRUE, col="red", ylab="")
curve(pdf8, 0,8, add=TRUE, col="darkred", ylab="")

text( 0.95,0.45,"nu=1", col="navy")
text( 1.35,0.32,"nu=2", col="darkgreen")
text( 6.95,0.15,"nu=8", col="darkred")
text( 6.00,0.4,"Chi-squared density", col="darkgreen")
# title("Chi-squared densities", col="darkgreen")

mtext( expression( pdf == 1/(2^(nu/2) ~ Gamma(nu/2)) ~ ~ ~ x^(nu/2-1) ~ e^(-x/2) ) )
