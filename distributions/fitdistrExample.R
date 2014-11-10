par(mfrow=c(2,1))
library(MASS)

x = rlnorm(10000, meanlog = 3, sdlog = 1)

resulting_fit = fitdistr(x, "lognormal")
resulting_fit

xmu = resulting_fit$estimate[1]
xsd = resulting_fit$estimate[2]

hist(x, probability=TRUE, breaks=200, col="magenta", ylim=c(0,0.04), xlim=c(0,100),
    main="fit of lognormal data using fitdistr")
curve(dlnorm(x, meanlog=xmu, sdlog = xsd), lwd=2, col="blue", add=TRUE)
mtext(sprintf("meanlog =%6.3f  sdlog =%6.3f", xmu, xsd ))

# easier still:

mlog = mean(log(x))
slog = sd(log(x))

hist(x, probability=TRUE, breaks=200, col="springgreen", ylim=c(0,0.04), xlim=c(0,100),
    main="fit of lognormal data using mean(log(x)) and sd(log(x))")
curve(dlnorm(x, meanlog=mlog, sdlog = slog), lwd=2, col="forestgreen", add=TRUE)
mtext(sprintf("meanlog =%6.3f  sdlog =%6.3f", mlog, slog ))
