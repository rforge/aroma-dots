%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  AffymetrixCelSet.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{AffymetrixCelSet}
\docType{class}
\alias{AffymetrixCelSet}


\title{The AffymetrixCelSet class}

\description{
 Package:  aroma.affymetrix \cr
\bold{Class AffymetrixCelSet}\cr

\code{\link[R.oo]{Object}}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[R.filesets]{FullNameInterface}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[R.filesets]{GenericDataFileSet}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{\link[aroma.core]{AromaMicroarrayDataSet}}\cr
\code{~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~+--}\code{\link[aroma.core]{AromaPlatformInterface}}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~+--}\code{\link[aroma.affymetrix]{AffymetrixFileSet}}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~~~~~~~~~~~+--}\code{AffymetrixCelSet}\cr

\bold{Directly known subclasses:}\cr
\link[aroma.affymetrix]{ChipEffectSet}, \link[aroma.affymetrix]{CnChipEffectSet}, \link[aroma.affymetrix]{ExonChipEffectSet}, \link[aroma.affymetrix]{FirmaSet}, \link[aroma.affymetrix]{ParameterCelSet}, \link[aroma.affymetrix]{QualityAssessmentSet}, \link[aroma.affymetrix]{ResidualSet}, \link[aroma.affymetrix]{SnpChipEffectSet}, \link[aroma.affymetrix]{WeightsSet}\cr

public static class \bold{AffymetrixCelSet}\cr
extends \emph{\link[aroma.affymetrix]{AffymetrixFileSet}}\cr



 An AffymetrixCelSet object represents a set of Affymetrix CEL files
 with \emph{identical} chip types.
}

\usage{
AffymetrixCelSet(files=NULL, ...)
}

\arguments{
  \item{files}{A \code{\link[base]{list}} of \code{\link{AffymetrixCelFile}}:s.}
  \item{...}{Not used.}
}

\section{Fields and Methods}{
 \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{as} \tab  -\cr
 \tab \code{\link[aroma.affymetrix:as.AffymetrixCelSet.AffymetrixCelSet]{as.AffymetrixCelSet}} \tab Coerce an object to an AffymetrixCelSet object.\cr
 \tab \code{byName} \tab  -\cr
 \tab \code{doCRMAv1} \tab  -\cr
 \tab \code{doCRMAv2} \tab  -\cr
 \tab \code{doFIRMA} \tab  -\cr
 \tab \code{doGCRMA} \tab  -\cr
 \tab \code{doRMA} \tab  -\cr
 \tab \code{\link[aroma.affymetrix:extractAffyBatch.AffymetrixCelSet]{extractAffyBatch}} \tab Extracts an in-memory AffyBatch object from the CEL set.\cr
 \tab \code{\link[aroma.affymetrix:extractFeatureSet.AffymetrixCelSet]{extractFeatureSet}} \tab Extracts CEL signals an in-memory FeatureSet object.\cr
 \tab \code{\link[aroma.affymetrix:extractMatrix.AffymetrixCelSet]{extractMatrix}} \tab Extract data as a matrix for a set of arrays.\cr
 \tab \code{getAverage} \tab  -\cr
 \tab \code{getAverageAsinh} \tab  -\cr
 \tab \code{\link[aroma.affymetrix:getAverageFile.AffymetrixCelSet]{getAverageFile}} \tab Calculates the mean and the standard deviation of the cell signal (intensity, standard deviation etc.) across the CEL set.\cr
 \tab \code{getAverageLog} \tab  -\cr
 \tab \code{\link[aroma.affymetrix:getCdf.AffymetrixCelSet]{getCdf}} \tab Gets the CDF structure for this CEL set.\cr
 \tab \code{\link[aroma.affymetrix:getChipType.AffymetrixCelSet]{getChipType}} \tab Gets the chip type for this CEL set.\cr
 \tab \code{getData} \tab  -\cr
 \tab \code{\link[aroma.affymetrix:getIntensities.AffymetrixCelSet]{getIntensities}} \tab Gets cell intensities from a set of cells and a set of arrays.\cr
 \tab \code{getPlatform} \tab  -\cr
 \tab \code{getTimestamps} \tab  -\cr
 \tab \code{getUnitGroupCellMap} \tab  -\cr
 \tab \code{\link[aroma.affymetrix:getUnitIntensities.AffymetrixCelSet]{getUnitIntensities}} \tab Gets cell signals for a subset of units and a subset of arrays.\cr
 \tab \code{getUnitNamesFile} \tab  -\cr
 \tab \code{getUnitTypesFile} \tab  -\cr
 \tab \code{justSNPRMA} \tab  -\cr
 \tab \code{\link[aroma.affymetrix:plotDensity.AffymetrixCelSet]{plotDensity}} \tab Plots the densities of all samples.\cr
 \tab \code{readUnits} \tab  -\cr
 \tab \code{\link[aroma.affymetrix:setCdf.AffymetrixCelSet]{setCdf}} \tab Sets the CDF structure for this CEL set.\cr
 \tab \code{writeSgr} \tab  -\cr
}


 \bold{Methods inherited from AffymetrixFileSet}:\cr
as, as.AffymetrixFileSet, byPath, getDefaultFullName

 \bold{Methods inherited from AromaPlatformInterface}:\cr
getAromaPlatform, getAromaUgpFile, getPlatform, getUnitAnnotationDataFile, getUnitNamesFile, getUnitTypesFile, isCompatibleWith

 \bold{Methods inherited from AromaMicroarrayDataSet}:\cr
as.AromaMicroarrayDataSetList, as.AromaMicroarrayDataSetTuple, getAromaFullNameTranslatorSet, getAverageFile, getChipType, getDefaultFullName, getPlatform, setAttributesBy, setAttributesBySampleAnnotationFile, setAttributesBySampleAnnotationSet, validate

 \bold{Methods inherited from GenericDataFileSet}:\cr
[, [[, anyDuplicated, anyNA, append, appendFiles, appendFullNamesTranslator, appendFullNamesTranslatorByNULL, appendFullNamesTranslatorByTabularTextFile, appendFullNamesTranslatorByTabularTextFileSet, appendFullNamesTranslatorBydata.frame, appendFullNamesTranslatorByfunction, appendFullNamesTranslatorBylist, as.character, as.list, byName, byPath, c, clearCache, clearFullNamesTranslator, clone, copyTo, dsApply, dsApplyInPairs, duplicated, equals, extract, findByName, findDuplicated, getChecksum, getChecksumFileSet, getChecksumObjects, getDefaultFullName, getFile, getFileClass, getFileSize, getFiles, getFullNames, getNames, getOneFile, getPath, getPathnames, getSubdirs, gunzip, gzip, hasFile, indexOf, is.na, na.omit, nbrOfFiles, resetFullNames, seq, setFullNamesTranslator, sortBy, unique, update2, updateFullName, updateFullNames, validate, getFullNameTranslatorSet, getParentName

 \bold{Methods inherited from FullNameInterface}:\cr
appendFullNameTranslator, appendFullNameTranslatorByNULL, appendFullNameTranslatorByTabularTextFile, appendFullNameTranslatorByTabularTextFileSet, appendFullNameTranslatorBycharacter, appendFullNameTranslatorBydata.frame, appendFullNameTranslatorByfunction, appendFullNameTranslatorBylist, clearFullNameTranslator, clearListOfFullNameTranslators, getDefaultFullName, getFullName, getFullNameTranslator, getListOfFullNameTranslators, getName, getTags, hasTag, hasTags, resetFullName, setFullName, setFullNameTranslator, setListOfFullNameTranslators, setName, setTags, updateFullName

 \bold{Methods inherited from Object}:\cr
$, $<-, [[, [[<-, as.character, attach, attachLocally, clearCache, clearLookupCache, clone, detach, equals, extend, finalize, getEnvironment, getFieldModifier, getFieldModifiers, getFields, getInstantiationTime, getStaticInstance, hasField, hashCode, ll, load, objectSize, print, save, asThis


}

\examples{\dontrun{
  for (zzz in 0) {

# Find any dataset
path <- NULL
if (is.null(path))
  break

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Define a dataset object based on all CEL files in a directory
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
ds <- AffymetrixCelSet$fromFiles(path)
print(ds)

# Keep at most three arrays for this example
ds <- extract(ds, 1:min(3,nbrOfArrays(ds)))
print(ds)

} # for (zzz in 0)
rm(zzz)

}}

\seealso{
  \code{\link{AffymetrixCelFile}}.
}

\author{Henrik Bengtsson}
\keyword{classes}
