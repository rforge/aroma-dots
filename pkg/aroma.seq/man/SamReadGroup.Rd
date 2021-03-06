%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  SamReadGroup.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{SamReadGroup}
\docType{class}
\alias{SamReadGroup}


\title{The SamReadGroup class}

\description{
 Package:  aroma.seq \cr
\bold{Class SamReadGroup}\cr

\code{logical}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.oo]{BasicObject}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{SamReadGroup}\cr

\bold{Directly known subclasses:}\cr
\cr

public static class \bold{SamReadGroup}\cr
extends \link[R.oo]{BasicObject}\cr



 A SamReadGroup object represents a SAM Read Group.
}

\usage{
SamReadGroup(id=NULL, sample=NULL, library=NULL, platform=NULL, platformUnit=NULL,
  sequencingCenter=NULL, description=NULL, runDate=NULL, flowOrder=NULL,
  keySequence=NULL, program=NULL, predictedInsertSize=NULL, ...)
}

\arguments{
 \item{id}{Specifies the \code{ID} read group field.}
 \item{sample}{Specifies the \code{SM} read group field.}
 \item{library}{Specifies the \code{LB} read group field.}
 \item{platform}{Specifies the \code{PL} read group field.}
 \item{platformUnit}{Specifies the \code{PU} read group field.}
 \item{sequencingCenter}{Specifies the \code{CN} read group field.}
 \item{description}{Specifies the \code{DS} read group field.}
 \item{runDate}{Specifies the \code{DT} read group field.}
 \item{flowOrder}{Specifies the \code{FO} read group field.}
 \item{keySequence}{Specifies the \code{KS} read group field.}
 \item{program}{Specifies the \code{PG} read group field.}
 \item{predictedInsertSize}{Specifies the \code{PI} read group field.}
 \item{...}{Additional named arguments, including two-letter read
   group keys for the above, e.g. 'SM'.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{asSamList} \tab  -\cr
 \tab \code{asString} \tab  -\cr
 \tab \code{byScanBamHeader} \tab  -\cr
 \tab \code{hasDescription} \tab  -\cr
 \tab \code{hasID} \tab  -\cr
 \tab \code{hasLibrary} \tab  -\cr
 \tab \code{hasPlatform} \tab  -\cr
 \tab \code{hasPlatformUnit} \tab  -\cr
 \tab \code{hasRunDate} \tab  -\cr
 \tab \code{hasSample} \tab  -\cr
 \tab \code{hasSequencingCenter} \tab  -\cr
 \tab \code{isEmpty} \tab  -\cr
 \tab \code{merge} \tab  -\cr
 \tab \code{validate} \tab  -\cr
}


 \bold{Methods inherited from BasicObject}:\cr
$, $<-, [[, [[<-, as.character, attach, detach, equals, extend, getFields, getInstantiationTime, hasField, hashCode, isReferable, objectSize, print, asThis

 \bold{Methods inherited from logical}:\cr
as.data.frame, as.raster, whichVector


}

\author{Henrik Bengtsson}

\references{
 [1] The SAM Format Specification Working Group,
     \emph{The SAM Format Specification}, Sept 7, 2011.\cr
 [2] \emph{Collected FAQs about BAM files: What's the meaning
           of the standard read group fields?}, GATK Forums,
     Mar 2013. \url{http://goo.gl/PWv8MX} \cr
}
\keyword{classes}
