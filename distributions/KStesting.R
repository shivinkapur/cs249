
data = rnorm(1000, mean=5.2, sd=1.3)
mu = mean(data)
sigma = sd(data)

z = (data - mu) / sigma
#   z = scale(r)

normality = ks.test(z,"pnorm",m=mu,sd=sigma)
normality

shapiro = shapiro.test(data)
shapiro
