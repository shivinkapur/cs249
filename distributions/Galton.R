library(psych)

# parent height vs child height:  928 x 2 table
data(galton)

# Galton, F. (1886). "Regression towards mediocrity in hereditary stature".
# The Journal of the Anthropological Institute of Great Britain and Ireland 15: 246-263. 
# doi:10.2307/2841583 -- JSTOR 2841583.

describe(galton)

plot(galton)

# Regression to the mean:  following an extreme random event, the next random event is likely to be less extreme.

ellipses(galton, add=TRUE, smooth=FALSE)
  #, lm=TRUE)  # add a linear model through the data

#  Ellipse dimensions are calculated from the correlation r between the x and y variables and are scaled as sqrt(1+r) and sqrt(1-r).
#  See the source for ellipses

