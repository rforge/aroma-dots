%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  htseqCount.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{htseqCount}
\alias{htseqCount.default}
\alias{htseqCount}

\title{Calls the htseq-count executable to count input reads on features}

\description{
 Calls the htseq-count executable to count input reads on features.
}

\usage{
\method{htseqCount}{default}(pathnameS, gff, orderedBy=c("none", "position", "name"),
  sortByName=c("always", "auto"), optionsVec=c(`-s` = "no", `-a` = "10"), ...,
  pathnameD=NULL, command="htseq-count", verbose=FALSE)
}

\arguments{
  \item{pathnameS}{An input BAM or SAM file containing aligned reads.}
  \item{gff}{The gene feature file, in GFF/GTF format}
  \item{orderedBy}{A \code{\link[base]{character}} string specifying how the input file has
   been sorted, if at all.}
  \item{sortByName}{A \code{\link[base]{character}} string specifying when the BAM/SAM file
   should be sorted by name.}
  \item{optionsVec}{A named \code{\link[base]{character}} \code{\link[base]{vector}} of options to htseq-count.}
  \item{...}{(Not used)}
  \item{pathnameD}{(optional) destination file to save htseq-count output.}
  \item{command}{A \code{\link[base]{character}} string specifying the name of the executable.}
  \item{verbose}{See \code{\link[R.utils]{Verbose}}.}
}

\value{
  Returns what \code{\link{systemHTSeqCount}}() returns.
}

\section{Backward compatibility}{
  \code{htseq-count} (< 0.6.0) requires (i) a SAM file as input
  that (ii) is sorted by name.  However, this method will take of that
  internally, iff needed.  That is, it will created a temporary SAM
  file that is sorted by query name before passing it to \code{htseq-count}.
}

\references{
 [1] S Anders, TP Pyl, W Huber,
     HTSeq - A Python framework to work with high-throughput sequencing data.
     bioRxiv 2014. doi: 10.1101/002824.\cr
}

\author{Taku Tokuyasu, Henrik Bengtsson}


\keyword{internal}
