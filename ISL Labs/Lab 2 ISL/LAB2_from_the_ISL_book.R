#-----------------------------------------------------------

import rpy2 as Rpy


# [ISL] book -- Chapter 2 Lab: Introduction to R


# Basic Commands

#-----------------------------------------------------------

x <- c(1,3,2,5)
x
print(x)
x = c(1,6,2)
x
print(x)

#-----------------------------------------------------------

y = c(1,4,3)
length(x)
length(y)
x+y

print(length(x))
print(length(y))
print(x+y)

#-----------------------------------------------------------



#-----------------------------------------------------------

?matrix
x=matrix(data=c(1,2,3,4), nrow=2, ncol=2)
print(x)
x=matrix(c(1,2,3,4),2,2)
print(x)

#-----------------------------------------------------------

print(matrix(c(1,2,3,4),2,2,byrow=TRUE))
print(sqrt(x))
print(x^2)

#-----------------------------------------------------------

x = rnorm(50)
y = x + rnorm(50,mean=50,sd=.1)
print(cor(x,y))

#-----------------------------------------------------------

set.seed(1303)
print( rnorm(50) )

#-----------------------------------------------------------

set.seed(3)
y=rnorm(100)
stats = data.frame( mu = mean(y), variance = var(y), stddev = sd(y), sigma = sd(y) )
print(stats)


# Graphics

#-----------------------------------------------------------

x=rnorm(100)
y=rnorm(100)
plot(x,y)
plot(x,y,pch=20, xlab="this is the x-axis",ylab="this is the y-axis",main="Plot of X vs Y")
## pdf("Figure.pdf")
plot(x,y,pch=16, col="green")
## dev.off()

#-----------------------------------------------------------

x=seq(1,10)
x
x=1:10
x
x=seq(-pi,pi,length=50)
y=x
print(y)

f=outer(x,y,function(x,y)cos(y)/(1+x^2))
dim(f)

opar = par(mfrow=c(1,2));
contour(x,y,f);
contour(x,y,f,nlevels=45,add=T);
par(opar)
    

#-----------------------------------------------------------

fa=(f-t(f))/2
contour(x,y,fa,nlevels=15)
image(x,y,fa)

#-----------------------------------------------------------

opar = par(mfrow=c(3,2))
persp(x,y,fa)
persp(x,y,fa,theta=30)
persp(x,y,fa,theta=30,phi=20)
persp(x,y,fa,theta=30,phi=30)
persp(x,y,fa,theta=30,phi=60)
persp(x,y,fa,theta=30,phi=80)
par(opar)


# Indexing Data

#-----------------------------------------------------------

A=matrix(1:16,4,4)

print( A )
print( A[2,3] )
print( A[c(1,3),c(2,4)] )
print( A[1:3,2:4] )

#-----------------------------------------------------------

A=matrix(1:16,4,4)

print( A[1:2,] )
print( A[,1:2] )
print( A[1,] )
print( A[-c(1,3),] )
print( A[-c(1,3),-c(1,3,4)] )
print( dim(A) )


# Loading Data

#-----------------------------------------------------------

# Auto=read.table("Auto.data")
Auto=read.csv("Auto.csv")
print( dim(Auto) )
print( Auto[1:3,] )
print( Auto[33:35,] )

#-----------------------------------------------------------

fix?  #  Round an array of floats element-wise to nearest integer towards zero.

#-----------------------------------------------------------

Auto=read.csv("Auto.csv", header=TRUE, na.strings="?")
print( Auto[33:35,] )

fix(Auto)
print( Auto[33:35,] )

Auto = na.omit(Auto)
print( Auto[33:35,] )

print( dim(Auto) )
print( names(Auto) )


# Additional Graphical and Numerical Summaries


#-----------------------------------------------------------

attach(Auto)

plot(cylinders, mpg, pch=20, col="darkgreen")
plot(Auto$cylinders, Auto$mpg, pch='+', col=")

#-----------------------------------------------------------


# plot(cylinders, mpg)
# plot(cylinders, mpg, col="red")

plot(cylinders, mpg, col=c("red","blue"), pch=16)
cylinders=as.factor(cylinders)

# plot(cylinders, mpg, col="red", varwidth=T)
# plot(cylinders, mpg, col="red", varwidth=T,horizontal=T)
plot(cylinders, mpg, col="red", varwidth=T, xlab="cylinders", ylab="MPG")

#-----------------------------------------------------------


hist(mpg)
hist(mpg,col=2)
hist(mpg,col=2,breaks=15)
pairs(Auto)
pairs(~ mpg + displacement + horsepower + weight + acceleration, Auto)
plot(horsepower,mpg)
identify(horsepower,mpg,name)
summary(Auto)
summary(mpg)

#-----------------------------------------------------------


