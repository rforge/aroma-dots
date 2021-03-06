%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  CnChipEffectSet.importFromDChip.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\name{CnChipEffectSet$importFromDChip}
\alias{CnChipEffectSet$importFromDChip}
\alias{importFromDChip.CnChipEffectSet}
\alias{CnChipEffectSet.importFromDChip}
\alias{importFromDChip,CnChipEffectSet-method}

\title{Imports copy-number estimates from a dChip result file}

\description{
 Imports copy-number estimates from a dChip result file.
 Currently only total copy-number estimates can be imported, that is
 if dChip fitted the PLM with allele A and allele B combined.
}

\usage{
## Static method (use this):
## CnChipEffectSet$importFromDChip(filename, path=NULL, combineAlleles=TRUE, cdf, ...,
##   skip=TRUE, verbose=FALSE)

## Don't use the below:
\method{importFromDChip}{CnChipEffectSet}(static, filename, path=NULL, combineAlleles=TRUE, cdf, ..., skip=TRUE,
  verbose=FALSE)
}

\arguments{
  \item{filename}{The filename of the dChip result file.}
  \item{path}{An optional path to the file.}
  \item{combineAlleles}{If \code{\link[base:logical]{TRUE}}, ...}
  \item{cdf}{An \code{\link{AffymetrixCdfFile}} object.}
  \item{...}{Not used.}
  \item{skip}{If \code{\link[base:logical]{TRUE}}, already imported arrays will be skipped.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
 Returns an \code{\link{CnChipEffectSet}}.
}

\details{
  This import method is robust and memory efficient.  One array at the
  time is imported by first writing to a temporary file which is then
  renamed to the final name, if import was successful.  (If the import
  failed, a temporary file will rename that has to be deleted manually).

  Since only one array at the time is imported, the memory overhead
  will be bounded allowing to import very large tab-delimited data files
  containing a large number of arrays.  Unfortunately, this approach
  slows down the reading substantially, because in each import all but
  one column is parsed but ignored.
}

\author{Henrik Bengtsson}

\seealso{
  For more information see \code{\link{CnChipEffectSet}}.
}
\keyword{internal}
\keyword{methods}
