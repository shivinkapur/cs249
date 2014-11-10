
pdf1 <- function(z) { dt(z,1) }
pdf2 <- function(z) { dt(z,2) }
pdf3 <- function(z) { dt(z,3) }
pdf4 <- function(z) { dt(z,4) }
pdf8 <- function(z) { dt(z,8) }

plot( pdf8,-5,5, col="navy", xlab="", ylab="")
curve(pdf4,-5,5, add=TRUE, col="darkgreen", ylab="")
curve(pdf3,-5,5, add=TRUE, col="orange", ylab="")
curve(pdf2,-5,5, add=TRUE, col="red", ylab="")
curve(pdf1,-5,5, add=TRUE, col="darkred", ylab="")

text(-0.25,0.15,"nu=1", col="darkred")
text( 1.75,0.25,"nu=8", col="navy")
text(-3.25,0.3,"Student's  t  density", col="darkgreen")
# title("Student's  t  density converges to the Normal density", col="darkgreen")

mtext( expression( pdf == Gamma((nu+1)/2)/(sqrt(nu ~ pi) ~ Gamma(nu/2)) ~ ~ ~ (1 + x^2/nu)^(-(nu+1)/2) ) )
