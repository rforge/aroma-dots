%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  ArrayExplorer.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{ArrayExplorer}
\docType{class}
\alias{ArrayExplorer}


 \title{The ArrayExplorer class}

 \description{
  Package:  aroma.affymetrix \cr
\bold{Class ArrayExplorer}\cr

\code{\link[R.oo]{Object}}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[aroma.affymetrix]{Explorer}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\emph{\code{ArrayExplorer}}\cr

\bold{Directly known subclasses:}\cr
\cr

public abstract static class \bold{ArrayExplorer}\cr
extends \emph{\link[aroma.affymetrix]{Explorer}}\cr


 }

 \usage{ArrayExplorer(csTuple=NULL, ...)}

 \arguments{
   \item{csTuple}{An \code{\link{AffymetrixCelSet}} object.}
   \item{...}{Not used.}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{addColorMap} \tab  -\cr
 \tab \code{getAlias} \tab  -\cr
 \tab \code{getAsteriskTags} \tab  -\cr
 \tab \code{getColorMaps} \tab  -\cr
 \tab \code{\link[aroma.affymetrix:getDataSet.ArrayExplorer]{getDataSet}} \tab Gets the data set.\cr
 \tab \code{getSetTuple} \tab  -\cr
 \tab \code{nbrOfChipTypes} \tab  -\cr
 \tab \code{\link[aroma.affymetrix:process.ArrayExplorer]{process}} \tab Generates image files, scripts and dynamic pages for the explorer.\cr
 \tab \code{setAlias} \tab  -\cr
 \tab \code{\link[aroma.affymetrix:setArrays.ArrayExplorer]{setArrays}} \tab Sets the arrays.\cr
 \tab \code{setColorMaps} \tab  -\cr
}


 \bold{Methods inherited from Explorer}:\cr
addIncludes, addIndexFile, display, getAlias, getArrays, getAsteriskTags, getFullName, getIncludePath, getMainPath, getName, getNameOfInput, getParallelSafe, getPath, getReportPathPattern, getSampleLayerPrefix, getSubname, getTags, getTagsOfInput, getTemplatePath, nbrOfArrays, process, setAlias, setArrays, setParallelSafe, setReportPathPattern, setSubname, setup, splitByReportPathPattern

 \bold{Methods inherited from Object}:\cr
asThis, $, $<-, [[, [[<-, as.character, attach, attachLocally, clearCache, clone, detach, equals, extend, finalize, gc, getEnvironment, getFields, getInstantiationTime, getStaticInstance, hasField, hashCode, ll, load, objectSize, print, save


 }

 \author{Henrik Bengtsson (\url{http://www.braju.com/R/})}
\keyword{classes}