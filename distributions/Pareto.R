ppareto = function(x, alpha=2, k=1)  (x/k)^(-alpha)
dpareto = function(x, alpha=2, k=1)  alpha * k^alpha * x^(-alpha-1)

curve( dpareto, 1e-3, 10, col="red",  log="xy", ylab="", main="log-log plot of the Pareto distribution, with k=1")
curve( ppareto, 1e-3, 10, col="blue", log="xy", ylab="", add=TRUE, lwd=2)
curve( dpareto(x,alpha=1.5), 1e-3, 10, col="purple", log="xy", ylab="", add=TRUE)
curve( dpareto(x,alpha=1.2), 1e-3, 10, col="green", log="xy", ylab="", add=TRUE)

text(5e-3,3e2,"Pareto cdf\nalpha=2", col="blue3")
text(3e-2,1e7,"Pareto pdf\nalpha=2", col="red3")
text(2e-1,1e5,"Pareto pdf\nalpha=1.5", col="purple3")
text(1e-0,5e2,"Pareto pdf\nalpha=1.2", col="green3")

mtext( expression( pdf == alpha ~ k^alpha ~ x^(-alpha-1) ~ ~ ~ ~ ~ cdf == (x/k)^alpha ))
