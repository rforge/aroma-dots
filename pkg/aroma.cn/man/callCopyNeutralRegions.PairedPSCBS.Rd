%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  PairedPSCBS.CALL2.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{callCopyNeutralRegions.PairedPSCBS}
\alias{callCopyNeutralRegions.PairedPSCBS}
\alias{PairedPSCBS.callCopyNeutralRegions}
\alias{callCopyNeutralRegions,PairedPSCBS-method}

\title{Calls regions that are copy neutral}

\description{
 Calls regions that are copy neutral from the allele B fractions (BAF).
}

\usage{
\method{callCopyNeutralRegions}{PairedPSCBS}(fit, ...)
}

\arguments{
  \item{fit}{A \code{\link[PSCBS]{PairedPSCBS}} fit object as returned by
    \code{\link[PSCBS]{segmentByPairedPSCBS}}.}
  \item{...}{Additional arguments passed to
    \code{\link[PSCBS]{callCopyNeutral.PairedPSCBS}}.}
}

\value{
  Returns a \code{\link[PSCBS]{PairedPSCBS}} fit object
  where a column with the copy-neutral call.
}

\examples{

if (Sys.getenv("_R_CHECK_FULL_") != "" && require("PSCBS")) {

# Load example ASCN data
data <- PSCBS::exampleData("paired.chr01");

# PSCBS segmentation
fit <- segmentByPairedPSCBS(data, verbose=-10);

fit <- bootstrapTCNandDHByRegion(fit, verbose=-10);

fitC <- callCopyNeutralRegions(fit, verbose=-10);
print(fitC);

# Normalize
fitN <- normalizeBAFsByRegions(fitC, verbose=-10);

} # if (require("PSCBS"))
}

\author{Henrik Bengtsson}


\keyword{internal}
\keyword{methods}
