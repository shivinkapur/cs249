n = 100

x = rnorm(n)  # sample of random points
x = sort(x)

F = pnorm  #  distribution we think x should follow

curve( F,   -3, 3, type="l", col="red", main="idea behind the K-S test: x's quantiles must approximate F" )
points( c(-3,x,+3), c(+0,(1:n)/n,+1), type="s", pch=20 )
