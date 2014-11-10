firstdigit = function(x) ifelse( x==0, 0, sign(x) * trunc( x / 10^floor(log10(x)) ) )

test_Benford = function(sample) { #  sample to be checked for Benford's Law
   n = length(sample)
   firstdigs = firstdigit( sample )
   ExpectedHistogram = n * ( log10(2:10) - log10(1:9) )
   ObservedHistogram = hist( firstdigs, plot=FALSE, breaks=0:9 )$counts
   chisquare_statistic = sum( (ObservedHistogram-ExpectedHistogram)^2  / ExpectedHistogram )
   nu = 9-1  #  (number of degrees of freedom) = (number of bins) - 1

   qchisq( chisquare_statistic, df = nu )
}
