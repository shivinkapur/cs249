#-----------------------------------------------------------------------------
# if interactive, stop after each plot
#-----------------------------------------------------------------------------
if (dev.cur() <= 1) get(getOption("device"))()
opar <- par(ask = interactive()
        && (.Device %in% c("X11","GTK","gnome","windows","Macintosh")))
opar <- c(opar, par(bg = "white"))
#-----------------------------------------------------------------------------

#  Varieties of noise:  white, brown, and other...

#  Constants

n <- 1024
t <- 1:n
nb <- n/16

#---------------------------------------------------------------

WhiteNoise <- rnorm(n)
plot( t, WhiteNoise, type="l", main="WhiteNoise = normal random values")

#---------------------------------------------------------------

WhiteNoiseHist <- hist(WhiteNoise, breaks=nb,
          main="the histogram of white noise is (by definition) normal")
WhiteNoiseHist$breaks
WhiteNoiseHist$counts
WhiteNoiseHist$density

#---------------------------------------------------------------

plot(2:(n/2), log10(abs(fft(WhiteNoise)))[2:(n/2)], type="l",
   main="the Fourier transform of white noise is uniform")

#---------------------------------------------------------------

plot(t,cumsum(WhiteNoise),
   type="l", main="The integral of White noise is Brown noise")

#---------------------------------------------------------------

N <- 1000

xwalk <- cumsum(rnorm(N))
ywalk <- cumsum(rnorm(N))

plot(xwalk, ywalk, type="l")
title("Brownian motion:	 random walk with normal random steps")

#---------------------------------------------------------------

BrownNoise <- xwalk

plot(2:(n/2), log10(abs(fft(BrownNoise)))[2:(n/2)], type="l",
   main="the Fourier transform of Brown noise behaves like 1/f^2")

#---------------------------------------------------------------

randPhase <- function() exp(2 * pi * 1i * runif(1))

PinkSpectrum <- rnorm(n)
for (f in 1:n)
  PinkSpectrum[f] <- 1/f * PinkSpectrum[f] * randPhase()

plot(2:(n/2), log10(abs(PinkSpectrum[2:(n/2)])), type="l",
   main="Pink Noise has a 1/f spectrum")

PinkNoise <- abs(fft(PinkSpectrum, inverse=TRUE))
plot(2:(n/2), PinkNoise[2:(n/2)], type="l",
   main="Pink Noise is 1/f noise")

#---------------------------------------------------------------

tryOther <- function(exponent) {
   
   OtherSpectrum <- rnorm(n)
   for (f in 1:n)
     OtherSpectrum[f] <- 1/f^exponent * OtherSpectrum[f] * randPhase()
   
   plot(2:(n/2), log10(abs(OtherSpectrum[2:(n/2)])), type="l",
      main=paste("Spectrum of 1/f^(",exponent,") Noise"))
   
   OtherNoise <- abs(fft(OtherSpectrum, inverse=TRUE))
   plot(2:(n/2), OtherNoise[2:(n/2)], type="l",
      main=paste("1/f^(",exponent,") Noise"))
}

tryOther(0.5)

tryOther(1.5)

tryOther(2.5)

par(opar)
