%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  AromaUnitGenotypeCallSet.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{AromaUnitGenotypeCallSet}
\docType{class}
\alias{AromaUnitGenotypeCallSet}


\title{The AromaUnitGenotypeCallSet class}

\description{
 Package:  aroma.core \cr
\bold{Class AromaUnitGenotypeCallSet}\cr

\code{\link[R.oo]{Object}}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.filesets]{FullNameInterface}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[R.filesets]{GenericDataFileSet}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{\link[R.filesets]{GenericTabularFileSet}}\cr
\code{~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~+--}\code{\link[aroma.core]{AromaTabularBinarySet}}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~+--}\code{\link[aroma.core]{AromaUnitSignalBinarySet}}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~~~~~~+--}\code{\link[aroma.core]{AromaUnitCallSet}}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+--}\code{AromaUnitGenotypeCallSet}\cr

\bold{Directly known subclasses:}\cr
\cr

public static class \bold{AromaUnitGenotypeCallSet}\cr
extends \link[aroma.core]{AromaUnitCallSet}\cr



 An AromaUnitGenotypeCallSet object represents a set of
 \code{\link{AromaUnitGenotypeCallFile}}s with \emph{identical} chip types.
}

\usage{
AromaUnitGenotypeCallSet(...)
}

\arguments{
  \item{...}{Arguments passed to \code{\link{AromaUnitCallSet}}.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{byName} \tab  -\cr
 \tab \code{extractGenotypes} \tab  -\cr
}


 \bold{Methods inherited from AromaUnitCallSet}:\cr
byPath, extractCallArray, extractCalls, extractGenotypeMatrix, findByName, findUnitsTodo

 \bold{Methods inherited from AromaUnitSignalBinarySet}:\cr
byName, findByName, getAromaFullNameTranslatorSet, getAromaUgpFile, getChipType, getPlatform, validate, writeDataFrame

 \bold{Methods inherited from AromaTabularBinarySet}:\cr
getDefaultFullName, getRootName, setAttributesBy, setAttributesBySampleAnnotationFile, setAttributesBySampleAnnotationSet, setAttributesByTags

 \bold{Methods inherited from GenericTabularFileSet}:\cr
extractMatrix, calculateAverageColumnAcrossFiles

 \bold{Methods inherited from GenericDataFileSet}:\cr
[, [[, anyDuplicated, anyNA, append, appendFiles, appendFullNamesTranslator, appendFullNamesTranslatorByNULL, appendFullNamesTranslatorByTabularTextFile, appendFullNamesTranslatorByTabularTextFileSet, appendFullNamesTranslatorBydata.frame, appendFullNamesTranslatorByfunction, appendFullNamesTranslatorBylist, as.character, as.list, byName, byPath, c, clearCache, clearFullNamesTranslator, clone, copyTo, dsApply, dsApplyInPairs, duplicated, equals, extract, findByName, findDuplicated, getChecksum, getChecksumFileSet, getChecksumObjects, getDefaultFullName, getFile, getFileClass, getFileSize, getFiles, getFullNames, getNames, getOneFile, getPath, getPathnames, getSubdirs, gunzip, gzip, hasFile, indexOf, is.na, na.omit, nbrOfFiles, resetFullNames, seq, setFullNamesTranslator, sortBy, unique, update2, updateFullName, updateFullNames, validate, getFullNameTranslatorSet, getParentName

 \bold{Methods inherited from FullNameInterface}:\cr
appendFullNameTranslator, appendFullNameTranslatorByNULL, appendFullNameTranslatorByTabularTextFile, appendFullNameTranslatorByTabularTextFileSet, appendFullNameTranslatorBycharacter, appendFullNameTranslatorBydata.frame, appendFullNameTranslatorByfunction, appendFullNameTranslatorBylist, clearFullNameTranslator, clearListOfFullNameTranslators, getDefaultFullName, getFullName, getFullNameTranslator, getListOfFullNameTranslators, getName, getTags, hasTag, hasTags, resetFullName, setFullName, setFullNameTranslator, setListOfFullNameTranslators, setName, setTags, updateFullName

 \bold{Methods inherited from Object}:\cr
$, $<-, [[, [[<-, as.character, attach, attachLocally, clearCache, clearLookupCache, clone, detach, equals, extend, finalize, getEnvironment, getFieldModifier, getFieldModifiers, getFields, getInstantiationTime, getStaticInstance, hasField, hashCode, ll, load, objectSize, print, save, asThis


}

\author{Henrik Bengtsson}
\keyword{classes}
