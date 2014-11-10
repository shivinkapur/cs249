opar = par(ask=TRUE)

data(cars)

C <- as.matrix(cars)
Cmeans <- apply(C, 2, mean)
Csds <- apply(C, 2, sd)
n <- dim(C)[1]
p <- dim(C)[2]

A <- as.matrix(C) - matrix(Cmeans, n,p, byrow=TRUE)

ATA <- t(A) %*% A / (n-1)

cov(C)
ATA - cov(C)

Ccov <- ATA       #  = cov(C)

W <- solve(Ccov)  #  = inverse(Ccov)

g <- function(xvec) {
     1/sqrt(2*pi)^2 / sqrt(det(Ccov)) *
        exp( -1/2 * (t(xvec-Cmeans) %*% W %*% (xvec-Cmeans))[1,1] )
}

npoints <- 61
points <- seq(-3,3, length=npoints)
xpoints <- points*Csds[1] + Cmeans[1]
ypoints <- points*Csds[2] + Cmeans[2]
surface <- matrix(0, npoints, npoints)
for (i in 1:npoints) {
   for (j in 1:npoints) {
      surface[i,j] <- g(c(xpoints[i],ypoints[j]))
   }
}

persp(surface, x=xpoints, y=ypoints)


contour(surface, x=xpoints, y=ypoints)

par(opar)
