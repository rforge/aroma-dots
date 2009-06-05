%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  BackgroundCorrection.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{BackgroundCorrection}
\docType{class}
\alias{BackgroundCorrection}


\title{The BackgroundCorrection class}

\description{
 Package:  aroma.affymetrix \cr
\bold{Class BackgroundCorrection}\cr

\code{\link[R.oo]{Object}}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[aroma.core]{AromaTransform}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[aroma.affymetrix]{Transform}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{\link[aroma.affymetrix]{ProbeLevelTransform}}\cr
\code{~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~+--}\emph{\code{BackgroundCorrection}}\cr

\bold{Directly known subclasses:}\cr
\link[aroma.affymetrix]{GcRmaBackgroundCorrection}, \link[aroma.affymetrix]{LimmaBackgroundCorrection}, \link[aroma.affymetrix]{NormExpBackgroundCorrection}, \link[aroma.affymetrix]{OpticalBackgroundCorrection}, \link[aroma.affymetrix]{RmaBackgroundCorrection}\cr

public abstract static class \bold{BackgroundCorrection}\cr
extends \emph{\link[aroma.affymetrix]{ProbeLevelTransform}}\cr



 This class represents a background adjustment function.

}

\usage{BackgroundCorrection(..., subsetToUpdate=NULL, typesToUpdate=NULL)}

\arguments{
  \item{...}{Arguments passed to the constructor of
    \code{\link{ProbeLevelTransform}}.}
  \item{subsetToUpdate}{The probes to be updated.
    If \code{\link[base]{NULL}}, all probes are updated.}
  \item{typesToUpdate}{Types of probes to be updated.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{\link[aroma.affymetrix:process.BackgroundCorrection]{process}} \tab Processes the data set.\cr
}


 \bold{Methods inherited from Transform}:\cr
getOutputDataSet, getOutputDataSetOLD20090509, getOutputFiles

 \bold{Methods inherited from AromaTransform}:\cr
getFullName, getInputDataSet, getName, getOutputDataSet, getOutputFiles, getPath, getTags, isDone, process, setTags

 \bold{Methods inherited from Object}:\cr
asThis, $, $<-, [[, [[<-, as.character, attach, attachLocally, clearCache, clone, detach, equals, extend, finalize, gc, getEnvironment, getFields, getInstantiationTime, getStaticInstance, hasField, hashCode, ll, load, objectSize, print, save


}

\author{Ken Simpson (ksimpson[at]wehi.edu.au).}
\keyword{classes}