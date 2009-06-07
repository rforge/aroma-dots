%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  Explorer.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{Explorer}
\docType{class}
\alias{Explorer}


 \title{The Explorer class}

 \description{
  Package:  aroma.core \cr
\bold{Class Explorer}\cr

\code{\link[R.oo]{Object}}\cr
\code{~~|}\cr
\code{~~+--}\emph{\code{Explorer}}\cr

\bold{Directly known subclasses:}\cr
\cr

public abstract static class \bold{Explorer}\cr
extends \link[R.oo]{Object}\cr


 }

 \usage{Explorer(tags="*", ...)}

 \arguments{
   \item{tags}{A \code{\link[base]{character}} \code{\link[base]{vector}} of tags to be added to the output path.}
   \item{...}{Not used.}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{addIncludes} \tab  -\cr
 \tab \code{\link[aroma.core:display.Explorer]{display}} \tab Displays the explorer in the default browser.\cr
 \tab \code{\link[aroma.core:getAlias.Explorer]{getAlias}} \tab Gets the alias of the output set.\cr
 \tab \code{\link[aroma.core:getArrays.Explorer]{getArrays}} \tab Gets the names of the arrays.\cr
 \tab \code{getAsteriskTags} \tab  -\cr
 \tab \code{getFullName} \tab  -\cr
 \tab \code{\link[aroma.core:getName.Explorer]{getName}} \tab Gets the name of the explorer.\cr
 \tab \code{getPath} \tab  -\cr
 \tab \code{getReportPathPattern} \tab  -\cr
 \tab \code{\link[aroma.core:getTags.Explorer]{getTags}} \tab Gets the tags of the explorer.\cr
 \tab \code{getTagsOfInput} \tab  -\cr
 \tab \code{\link[aroma.core:nbrOfArrays.Explorer]{nbrOfArrays}} \tab Gets the total number of arrays.\cr
 \tab \code{\link[aroma.core:process.Explorer]{process}} \tab Generates image files, scripts and dynamic pages for the explorer.\cr
 \tab \code{\link[aroma.core:setAlias.Explorer]{setAlias}} \tab Sets the alias of the output set.\cr
 \tab \code{\link[aroma.core:setArrays.Explorer]{setArrays}} \tab Sets the arrays.\cr
 \tab \code{setReportPathPattern} \tab  -\cr
 \tab \code{setSubname} \tab  -\cr
 \tab \code{setup} \tab  -\cr
 \tab \code{splitByReportPathPattern} \tab  -\cr
}


 \bold{Methods inherited from Object}:\cr
asThis, $, $<-, [[, [[<-, as.character, attach, attachLocally, clearCache, clone, detach, equals, extend, finalize, gc, getEnvironment, getFields, getInstantiationTime, getStaticInstance, hasField, hashCode, ll, load, objectSize, print, save


 }

 \section{Output directory structure}{
   The \emph{main directory} of an Explorer report is
    \code{reports/<name>/<subname>/}.
   The \code{<name>} is typically the same as the name of the input
   data set, and the \code{<subname>} is typically the tags of ditto.
   This main directory is where main HTML document is stored.

   For each chip type, real or "virtual" (combined), there is a
   subdirectory with the same name as the chip type, i.e.
    \code{reports/<name>/<subname>/<chiptype>/}.

   For each chip type directory, there are set of subdirectories each
   specifying a so called \emph{image layer}, e.g. an image layer
   showing the raw data, another containing the estimates of a model
   fit and so on.  Path format:
    \code{reports/<name>/<subname>/<chiptype>/<image layer>/}.
   In this directory all image files are stored, e.g. PNG files.

   In some cases one do not want to all input tags to become part of the
   subname, but instead for instance use those to name the image layer(s).
   In such cases one has to override the default names.
 }

 \author{Henrik Bengtsson (\url{http://www.braju.com/R/})}
\keyword{classes}