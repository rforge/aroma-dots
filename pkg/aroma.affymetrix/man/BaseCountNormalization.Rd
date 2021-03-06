%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  BaseCountNormalization.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{BaseCountNormalization}
\docType{class}
\alias{BaseCountNormalization}


\title{The BaseCountNormalization class}

\description{
 Package:  aroma.affymetrix \cr
\bold{Class BaseCountNormalization}\cr

\code{\link[R.oo]{Object}}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[aroma.core]{ParametersInterface}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[aroma.core]{AromaTransform}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{\link[aroma.affymetrix]{Transform}}\cr
\code{~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~+--}\code{\link[aroma.affymetrix]{ProbeLevelTransform}}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~+--}\code{\link[aroma.affymetrix]{ProbeLevelTransform3}}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~~~~~~+--}\code{\link[aroma.affymetrix]{AbstractProbeSequenceNormalization}}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+--}\code{BaseCountNormalization}\cr

\bold{Directly known subclasses:}\cr
\cr

public static class \bold{BaseCountNormalization}\cr
extends \emph{\link[aroma.affymetrix]{AbstractProbeSequenceNormalization}}\cr



 This class represents a normalization method that corrects for systematic
 effects in the probe intensities due to differences in the number of
 A, C, G, and T:s in the probe sequences.
}

\usage{
BaseCountNormalization(..., model=c("robustSmoothSpline", "lm"), bootstrap=FALSE)
}

\arguments{
  \item{...}{Arguments passed to the constructor of
    \code{\link{AbstractProbeSequenceNormalization}}.}
  \item{model}{A \code{\link[base]{character}} string specifying the model used to fit
    the base-count effects.}
  \item{bootstrap}{If \code{\link[base:logical]{TRUE}}, the model fitting is done by bootstrap in
    order to save memory.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\emph{No methods defined}.


 \bold{Methods inherited from AbstractProbeSequenceNormalization}:\cr
fitOne, getAromaCellSequenceFile, getParameters, getTargetFile, indexOfMissingSequences, predictOne, process

 \bold{Methods inherited from ProbeLevelTransform3}:\cr
getAsteriskTags, getCellsTo, getCellsToFit, getCellsToUpdate, getParameters, getUnitsTo, getUnitsToFit, getUnitsToUpdate, writeSignals

 \bold{Methods inherited from ProbeLevelTransform}:\cr
getRootPath

 \bold{Methods inherited from Transform}:\cr
getOutputDataSet, getOutputFiles

 \bold{Methods inherited from AromaTransform}:\cr
as.character, findFilesTodo, getAsteriskTags, getExpectedOutputFiles, getExpectedOutputFullnames, getFullName, getInputDataSet, getName, getOutputDataSet, getOutputDataSet0, getOutputFiles, getPath, getRootPath, getTags, isDone, process, setTags

 \bold{Methods inherited from ParametersInterface}:\cr
getParameterSets, getParameters, getParametersAsString

 \bold{Methods inherited from Object}:\cr
$, $<-, [[, [[<-, as.character, attach, attachLocally, clearCache, clearLookupCache, clone, detach, equals, extend, finalize, getEnvironment, getFieldModifier, getFieldModifiers, getFields, getInstantiationTime, getStaticInstance, hasField, hashCode, ll, load, objectSize, print, save, asThis


}

\section{Requirements}{
  This class requires that an aroma probe sequence file is available
  for the chip type.
}

\author{Henrik Bengtsson}
\keyword{classes}
