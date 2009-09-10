###########################################################################/**
# @RdocClass PrincipalCurveNormalization
#
# @title "The PrincipalCurveNormalization class"
#
# \description{
#  @classhierarchy
# }
# 
# @synopsis
#
# \arguments{
#  \item{...}{Arguments passed to @see "AbstractCurveNormalization".}
#  \item{subset}{A @double in (0,1] specifying the fraction of the 
#    \code{subsetToFit} to be used for fitting.  Since the fit function
#    for this class is rather slow, the default is to use a 1/20:th
#    of the default data points.}
# }
#
# \section{Fields and Methods}{
#  @allmethods "public"
# }
#
# \author{Henrik Bengtsson}
#*/########################################################################### 
setConstructorS3("PrincipalCurveNormalization", function(..., subset=1/20) {
  # Arguments 'subset':
  subset <- Arguments$getDouble(subset, range=c(0,1));

  extend(AbstractCurveNormalization(...), "PrincipalCurveNormalization",
    .subset = subset
  );
})


setMethodS3("getSubsetToFit", "PrincipalCurveNormalization", function(this, ...) {
  units <- NextMethod("getSubsetToFit", this, ...);

  n <- length(units);
  subset <- this$.subset;

  subset <- sample(n, size=subset*n);
  units <- units[subset];

  units;
}, protected=TRUE)


setMethodS3("fitOne", "PrincipalCurveNormalization", function(this, theta, ...) {
  fitPrincipalCurve(theta, ...);
}, protected=TRUE)

setMethodS3("backtransformOne", "PrincipalCurveNormalization", function(this, theta, fit, ...) {
  backtransformPrincipalCurve(theta, fit=fit, ...);
}, protected=TRUE)



############################################################################
# HISTORY:
# 2009-07-15
# o Created.
############################################################################ 