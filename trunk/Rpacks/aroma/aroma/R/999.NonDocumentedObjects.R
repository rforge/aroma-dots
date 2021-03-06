###########################################################################/**
# @RdocDocumentation "Non-documented objects"
#
# % Deprecated methods
# @alias getAbsolutePath.MicroarrayData
# @alias validateArgumentFileAndPath
# @alias validateArgumentFileAndPath.File
#
# % Deprecated class BFilter
# @alias BFilter
#
# % Deprecated class BMAData
# @alias BMAData
# @alias as.BMAData
# @alias as.BMAData.BMAData
# @alias as.BMAData.default
# @alias as.character.BMAData
#
# % Deprecated class TFilter
# @alias TFilter
#
# % Deprecated class TMAData
# @alias TMAData
# @alias as.character.TMAData
# @alias as.TMAData
# @alias as.TMAData.default
# @alias as.TMAData.TMAData
# @alias getColors.TMAData
# @alias getDegreesOfFreedom.TMAData
# @alias getPValues.TMAData
# @alias getSE.TMAData
# @alias getStandardError.TMAData
# @alias plot.TMAData
# @alias plotPrintorder.TMAData
# @alias plotSpatial.TMAData
# @alias plotXY.BMAData
# @alias plotXY.TMAData
# @alias topSpots.TMAData
#
# % Deprecated class Replicates
# @alias Replicates
# @alias as.character.Replicates
# @alias equals.Replicates
# @alias fromLayout.Replicates
# @alias fromType.Replicates
# @alias getGene.Replicates
# @alias getParameter.Replicates
# @alias getSpot.Replicates
# @alias hasReplicates.Replicates
# @alias highlight.Replicates
# @alias nbrOfGenes.Replicates
# @alias nbrOfReplicates.Replicates
# @alias nbrOfSpots.Replicates
# @alias set.Replicates
# @alias setParameter.Replicates
# @alias str.Replicates
# @alias text.Replicates
#
# @alias getGeneReplicateIndex
# @alias getGeneReplicateIndex.Layout
# @alias plotReplicates
# @alias plotReplicates.MicroarrayData
# @alias getReplicates
# @alias getReplicates.Layout
# @alias hasReplicates
# @alias hasReplicates.Layout
# @alias nbrOfReplicates
# @alias nbrOfReplicates.Layout
# @alias setReplicates
# @alias setReplicates.Layout
#
# % Deprecated methods of class MicroarrayData
# @alias getField
# @alias getField.MicroarrayData
# @alias set.MicroarrayData
#
# % Deprecated methods of class MAData
# @alias as.BMAData.MAData
# @alias as.TMAData.MAData
# @alias plotMvsM
#
# % Deprecated methods of class RGData
# @alias setField.RGData
#
# % Miscellaneous
# @alias [.MicroarrayArray
# @alias [<-.MicroarrayArray
# @alias addFlag
# @alias Analyzer
# @alias anonymize
# @alias anonymize.GenePixData
# @alias anonymize.ImaGeneData
# @alias anonymize.Layout
# @alias anonymize.QuantArrayData
# @alias append
# @alias append.default
# @alias append.GenePixData
# @alias append.ScanAlyzeData
# @alias append.SpotData
# @alias append.SpotfinderData
# @alias apply
# @alias apply.default
# @alias apply.GSRArray
# @alias apply.LayoutGroups
# @alias apply.MultiwayArray
# @alias applyGenewise
# @alias applyGenewise.MicroarrayData
# @alias applyGroupwise
# @alias applyGroupwise.MicroarrayData
# @alias applyPlatewise
# @alias applyPlatewise.MicroarrayData
# @alias applyPrintdipwise
# @alias applyPrintdipwise.MicroarrayData
# @alias applyPrinttipwise
# @alias applyPrinttipwise.MicroarrayData
# @alias Array
# @alias as.character.AffineModelFit
# @alias as.character.ExperimentalSetup
# @alias as.character.Filter
# @alias as.character.GeneAcceptFilter
# @alias as.character.GeneGroups
# @alias as.character.GeneRejectFilter
# @alias as.character.GSRArray
# @alias as.character.Layout
# @alias as.character.LayoutGroups
# @alias as.character.MAData
# @alias as.character.MicroarrayData
# @alias as.character.PlateGroups
# @alias as.character.PrintdipGroups
# @alias as.character.PrinttipGroups
# @alias as.character.RawData
# @alias as.character.RGData
# @alias as.character.SlideColumnGroups
# @alias as.character.SlideRowGroups
# @alias as.character.SuperGroups
# @alias as.data.frame
# @alias as.data.frame.Array
# @alias as.data.frame.ExperimentalSetup
# @alias as.data.frame.GalLayout
# @alias as.data.frame.Layout
# @alias as.DataFrame
# @alias as.DataFrame.Matrix
# @alias as.GeneReplicateSlideArray
# @alias as.GeneReplicateSlideArray.MicroarrayArray
# @alias as.GeneSlideArray
# @alias as.GeneSlideArray.MicroarrayArray
# @alias as.layout
# @alias as.Layout
# @alias as.Layout.default
# @alias as.Layout.Layout
# @alias as.MAData
# @alias as.MAData.default
# @alias as.MAData.MAData
# @alias as.matrix
# @alias as.matrix.DesignMatrix
# @alias as.matrix.GeneSlideArray
# @alias as.matrix.MicroarrayArray
# @alias as.matrix.SpotSlideArray
# @alias as.RawData
# @alias as.RawData.default
# @alias as.RawData.GenePixData
# @alias as.RawData.ImaGeneData
# @alias as.RawData.MAData
# @alias as.RawData.QuantArrayData
# @alias as.RawData.RawData
# @alias as.RawData.RGData
# @alias as.RawData.ScanAlyzeData
# @alias as.RawData.SpotData
# @alias as.RawData.SpotfinderData
# @alias as.RG
# @alias as.RGData
# @alias as.RGData.default
# @alias as.RGData.RawData
# @alias as.RGData.RGData
# @alias as.SpotSlideArray
# @alias as.SpotSlideArray.MicroarrayArray
# @alias asGSRArray
# @alias asGSRArray.default
# @alias asGSRArray.GSRArray
# @alias asGSRArray.matrix
# @alias asGSRArray.SSMatrix
# @alias asSSMatrix
# @alias asSSMatrix.default
# @alias asSSMatrix.GSRArray
# @alias asSSMatrix.matrix
# @alias asSSMatrix.SSMatrix
# %@alias backtransformAffine
# @alias boxplot.MAData
# @alias boxplot.RawData
# @alias boxplot.RGData
# %@alias calibrateMultiscan
# @alias calibrateMultiscan.RawData
# @alias changeInput
# @alias clearCache
# @alias clearCache.MicroarrayData
# @alias clearFlag
# @alias coef.AffineModelFit
# @alias com.braju.sma.dimStr
# @alias convertFieldNames
# @alias createColors
# @alias createColors.MicroarrayData
# @alias dataFrameToList
# @alias dataFrameToList.MicroarrayData
# @alias DesignMatrix
# @alias diff.MultiwayArray
# @alias dim<-.GSRArray
# @alias drawCurveFit
# @alias drawCurveFit.MAData
# @alias equals.SpotPosition
# @alias estimateMACurve
# @alias ExpressionData
# @alias extract
# @alias extract.SpotPosition
# @alias extractLayout
# @alias extractLayout.SpotData
# @alias extractLayout.SpotfinderData
# @alias findChannelBiasDifferences
# @alias findChannelBiasDifferences.RGData
# @alias findSetupFiles
# %@alias fitIWPCA
# @alias fitIWPCA.RGData
# @alias fitMultiscanAffine
# @alias fitted.AffineModelFit
# @alias flip.Matrix
# @alias fromDataFrame
# @alias fromDataFrame.Layout
# @alias fromLayout
# @alias fromSaturatedSignals
# @alias fromSSMatrix
# @alias fromSSMatrix.GSRArray
# @alias fromType
# @alias GeneReplicateSlideArray
# @alias GeneSlideArray
# @alias getA.AffineModelFit
# @alias getA.RGData
# @alias getAbscent
# @alias getAbscent.GenePixData
# @alias getAbscent.ImaGeneData
# @alias getADiagonal
# @alias getADiagonal.AffineModelFit
# @alias getAdjustedSpotVariability
# @alias getArea
# @alias getArea.ImaGeneData
# @alias getArea.QuantArrayData
# @alias getArea.ScanAlyze20Data
# @alias getArea.ScanAlyzeData
# @alias getArea.SpotData
# @alias getArea.SpotfinderData
# @alias getArrayAspectRatio
# @alias getArrayAspectRatio.GenePixData
# @alias getArrayAspectRatio.SpotData
# @alias getArrayBottom
# @alias getArrayBottom.GenePixData
# @alias getArrayBottom.SpotData
# @alias getArrayHeight
# @alias getArrayHeight.GenePixData
# @alias getArrayHeight.SpotData
# @alias getArrayLeft
# @alias getArrayLeft.GenePixData
# @alias getArrayLeft.SpotData
# @alias getArrayRight
# @alias getArrayRight.GenePixData
# @alias getArrayRight.SpotData
# @alias getArrayTop
# @alias getArrayTop.GenePixData
# @alias getArrayTop.SpotData
# @alias getArrayWidth
# @alias getArrayWidth.GenePixData
# @alias getArrayWidth.SpotData
# @alias getB
# @alias getB.AffineModelFit
# @alias getBackground
# @alias getBackground.GenePixData
# @alias getBackground.QuantArrayData
# @alias getBackground.ScanAlyze20Data
# @alias getBackground.ScanAlyzeData
# @alias getBackground.SpotData
# @alias getBackground.SpotfinderData
# @alias getBackgroundArea
# @alias getBackgroundArea.GenePixData
# @alias getBackgroundSD
# @alias getBackgroundSD.QuantArrayData
# @alias getBackgroundSD.ScanAlyze20Data
# @alias getBad
# @alias getBad.GenePixData
# @alias getBgArea
# @alias getBgArea.GenePixData
# @alias getBgArea.ImaGeneData
# @alias getBgArea.ScanAlyze20Data
# @alias getBgArea.ScanAlyzeData
# @alias getBgArea.SpotData
# @alias getBgArea.SpotfinderData
# @alias getBlank
# @alias getBlank.Layout
# @alias getBlank.MicroarrayData
# @alias getBlock
# @alias getBlock.GalLayout
# @alias getBottomEdge
# @alias getCache
# @alias getCache.MicroarrayData
# @alias getCalibratedMultiscan
# @alias getCalibratedMultiscan.RGData
# @alias getChannelNames
# @alias getChannelNames.RGData
# @alias getCircularity
# @alias getCircularity.GenePixData
# @alias getCircularity.ImaGeneData
# @alias getCircularity.ScanAlyzeData
# @alias getCircularity.SpotData
# @alias getCircularity.SpotfinderData
# @alias getCoefficients
# @alias getCoefficients.AffineModelFit
# @alias getColors.MicroarrayData
# @alias getColumn
# @alias getColumn.GalLayout
# @alias getDataFiles
# @alias getDataFiles.ExperimentalSetup
# @alias getDegreesOfFreedom
# @alias getDenseSpots
# @alias getDenseSpots.MAData
# @alias getDesignMatrix
# @alias getDesignMatrix.Analyzer
# @alias getDiameter
# @alias getDiameter.ScanAlyze20Data
# @alias getDiameter.ScanAlyzeData
# @alias getDistance
# @alias getDistance.AffineModelFit
# @alias getDistancesTo
# @alias getDuplicates
# @alias getDyesUsed
# @alias getDyesUsed.ExperimentalSetup
# @alias getExcludedSpots
# @alias getExcludedSpots.MicroarrayData
# @alias getExtra
# @alias getExtreme
# @alias getExtreme.MicroarrayData
# @alias getFieldNames
# @alias getFieldNames.GalLayout
# @alias getFirst
# @alias getFirst.PlateGroups
# @alias getFlag
# @alias getFocusPosition
# @alias getFocusPosition.GenePixData
# @alias getForeground
# @alias getForeground.GenePixData
# @alias getForeground.QuantArrayData
# @alias getForeground.ScanAlyze20Data
# @alias getForeground.ScanAlyzeData
# @alias getForeground.SpotData
# @alias getForeground.SpotfinderData
# @alias getForegroundSD
# @alias getForegroundSD.QuantArrayData
# @alias getForegroundSD.ScanAlyze20Data
# @alias getForegroundSE
# @alias getForegroundSNR
# @alias getForegroundSNR.QuantArrayData
# @alias getG
# @alias getG.MAData
# @alias getGene
# @alias getGeneDiscrepancies
# @alias getGeneDiscrepancies.MAData
# @alias getGeneGroups
# @alias getGeneGroups.Layout
# @alias getGeneIndex
# @alias getGeneIndex.Layout
# @alias getGeneReplicateSlideValues
# @alias getGeneReplicateSlideValues.default
# @alias getGeneReplicateSlideValues.GeneReplicateSlideArray
# @alias getGeneReplicateSlideValues.GeneSlideArray
# @alias getGeneReplicateSlideValues.MicroarrayArray
# @alias getGeneReplicateSlideValues.SpotSlideArray
# @alias getGeneResiduals
# @alias getGeneResiduals.MAData
# @alias getGeneSlideReplicateIndex
# @alias getGeneSlideValues
# @alias getGeneSlideValues.default
# @alias getGeneSlideValues.GeneReplicateSlideArray
# @alias getGeneSlideValues.GeneSlideArray
# @alias getGeneSlideValues.MicroarrayArray
# @alias getGeneSlideValues.SpotSlideArray
# @alias getGeneVariability
# @alias getGenewiseResiduals
# @alias getGenewiseResiduals.MAData
# @alias getGrid
# @alias getGrid.ScanAlyze20Data
# @alias getGrid.ScanAlyzeData
# @alias getGridColumn
# @alias getGridColumn.GalLayout
# @alias getGridRow
# @alias getGridRow.GalLayout
# @alias getGroups
# @alias getGroups.SuperGroups
# @alias getGroupValues
# @alias getGroupValues.LayoutGroups
# @alias getHeaderField
# @alias getHeaderField.GenePixData
# @alias getHeaderFields
# @alias getHeaderFields.GenePixData
# @alias getHistogram
# @alias getHistogram.MAData
# @alias getId
# @alias getID
# @alias getID.Layout
# @alias getImageSoftwaresUsed
# @alias getImageSoftwaresUsed.ExperimentalSetup
# @alias getInclude
# @alias getInclude.MicroarrayData
# @alias getIndex
# @alias getIndex.GeneAcceptFilter
# @alias getIndex.GeneRejectFilter
# @alias getIndex.NotFilter
# @alias getIndex.RejectFilter
# @alias getIndex0
# @alias getIndex0.FieldFilter
# @alias getIndices
# @alias getInput
# @alias getKnownHeadersWithType
# @alias getKnownHeadersWithType.GenePixData
# @alias getKnownHeadersWithType.ScanAlyze20Data
# @alias getKnownHeadersWithType.ScanAlyzeData
# @alias getLabel
# @alias getLaserOnTime
# @alias getLaserOnTime.GenePixData
# @alias getLaserPower
# @alias getLaserPower.GenePixData
# @alias getLast
# @alias getLast.PlateGroups
# @alias getLayout
# @alias getLayout.LayoutGroups
# @alias getLayout.MicroarrayArray
# @alias getLayoutFiles
# @alias getLayoutFiles.ExperimentalSetup
# @alias getLayoutGroupsByName
# @alias getLayoutGroupsByName.Layout
# @alias getLeftEdge
# @alias getLinesAveraged
# @alias getLinesAveraged.GenePixData
# @alias getLocation
# @alias getLogIntensities
# @alias getLogRatios
# @alias getM.RGData
# @alias getMaxHeight
# @alias getMaxWidth
# @alias getMOR
# @alias getMOR2003a
# @alias getNames
# @alias getNames.LayoutGroups
# @alias getNames.PlateGroups
# @alias getNames.PrintdipGroups
# @alias getNames.PrinttipGroups
# @alias getNames.SlideColumnGroups
# @alias getNames.SlideRowGroups
# @alias getNames.SuperGroups
# @alias getNotFound
# @alias getNotFound.GenePixData
# @alias getParameter
# @alias getPerimeter
# @alias getPerimeter.SpotData
# @alias getPerimeter.SpotfinderData
# @alias getPixelSize
# @alias getPixelSize.GenePixData
# @alias getPlate
# @alias getPlate.Layout
# @alias getPlateGroups
# @alias getPlateGroups.Layout
# @alias getPlateNumber
# @alias getPlateNumber.Layout
# @alias getPMTGain
# @alias getPMTGain.GenePixData
# @alias getPrintdipGroups
# @alias getPrintdipGroups.Layout
# @alias getPrintorder
# @alias getPrintorderIndices
# @alias getPrintorderIndices.PlateGroups
# @alias getPrinttipGroups
# @alias getPrinttipGroups.Layout
# @alias getProbeWeights
# @alias getProbeWeights.MicroarrayData
# @alias getPValues
# @alias getQuadruplicates
# @alias getR
# @alias getR.MAData
# @alias getRange
# @alias getRange.MAData
# @alias getRawData
# @alias "getRgn R2"
# @alias "getRgn R2.GenePixData"
# @alias getRightEdge
# @alias getRow
# @alias getRow.GalLayout
# @alias getSampleUsed
# @alias getSampleUsed.ExperimentalSetup
# @alias getScannersUsed
# @alias getScannersUsed.ExperimentalSetup
# @alias getSE
# @alias getSignal
# @alias getSignalWeights
# @alias getSignalWeights.MicroarrayData
# @alias getSizes
# @alias getSizes.PlateGroups
# @alias getSizes.PrintdipGroups
# @alias getSizes.PrinttipGroups
# @alias getSizes.SlideColumnGroups
# @alias getSizes.SlideRowGroups
# @alias getSizes.SuperGroups
# @alias getSlide
# @alias getSlide.MAData
# @alias getSlideColumnGroups
# @alias getSlideColumnGroups.Layout
# @alias getSlideName
# @alias getSlideName.MicroarrayData
# @alias getSlideNames
# @alias getSlidePairs
# @alias getSlidePairs.MicroarrayData
# @alias getSlideRowGroups
# @alias getSlideRowGroups.Layout
# @alias getSNR
# @alias getSNR.SpotData
# @alias getSNR.SpotfinderData
# @alias getSNR1
# @alias getSNR1.RawData
# @alias getSNR2
# @alias getSNR2.RawData
# @alias getSpot
# @alias getSpotColumn
# @alias getSpotColumn.ScanAlyze20Data
# @alias getSpotColumn.ScanAlyzeData
# @alias getSpotIndex
# @alias getSpotIndex.Layout
# @alias getSpotOrGeneSlideValues
# @alias getSpotOrGeneSlideValues.GeneReplicateSlideArray
# @alias getSpotOrGeneSlideValues.GeneSlideArray
# @alias getSpotOrGeneSlideValues.MicroarrayArray
# @alias getSpotOrGeneSlideValues.SpotSlideArray
# @alias getSpotPosition
# @alias getSpotPosition.MicroarrayData
# @alias getSpotRow
# @alias getSpotRow.ScanAlyze20Data
# @alias getSpotRow.ScanAlyzeData
# @alias getSpots
# @alias getSpots.LayoutGroups
# @alias getSpots.PlateGroups
# @alias getSpots.PrintdipGroups
# @alias getSpots.PrinttipGroups
# @alias getSpots.SlideColumnGroups
# @alias getSpots.SlideRowGroups
# @alias getSpots.SuperGroups
# @alias getSpotSlideValues
# @alias getSpotSlideValues.default
# @alias getSpotSlideValues.GeneReplicateSlideArray
# @alias getSpotSlideValues.GeneSlideArray
# @alias getSpotSlideValues.MicroarrayArray
# @alias getSpotSlideValues.SpotSlideArray
# @alias getSpotValue
# @alias getSpotValue.MicroarrayData
# @alias getSpotValues
# @alias getSpotValues.LayoutGroups
# @alias getSpotVariability
# @alias getSpotVariability.MAData
# @alias getStandardError
# @alias getTemperature
# @alias getTemperature.GenePixData
# @alias getTopEdge
# @alias getTreatments
# @alias getTreatments.MicroarrayData
# @alias getTriplicates
# @alias getView
# @alias getView.default
# @alias getView.GeneReplicateSlideArray
# @alias getView.GeneSlideArray
# @alias getView.MicroarrayArray
# @alias getView.MicroarrayData
# @alias getView.SpotSlideArray
# @alias getVisible
# @alias getWavelengths
# @alias getWavelengths.GenePixData
# @alias getWeights
# @alias getWeights.MicroarrayData
# @alias getWeightsAsString
# @alias getWeightsAsString.MicroarrayData
# @alias getWithinChannelPairs
# @alias getWithinChannelPairs.RawData
# @alias getWithinChannelPairs.RGData
# @alias gridSize
# @alias GSRArray
# @alias hasBootstrap
# @alias hasBootstrap.AffineModelFit
# @alias hasExcludedSpots
# @alias hasExcludedSpots.MicroarrayData
# @alias hasIds
# @alias hasIDs
# @alias hasIds.Layout
# @alias hasIDs.Layout
# @alias hasLayout
# @alias hasNames
# @alias hasNames.Layout
# @alias hasPlates
# @alias hasPlates.Layout
# @alias hasProbeWeights
# @alias hasProbeWeights.MicroarrayData
# @alias hasSignalWeights
# @alias hasSignalWeights.MicroarrayData
# @alias hasWeights
# @alias hasWeights.MicroarrayData
# @alias highlight
# @alias hist.MAData
# @alias indexOf
# @alias is.above
# @alias is.above.default
# @alias isFieldColorable
# @alias isFieldColorable.MicroarrayData
# @alias isSaturated
# @alias keepSlides
# @alias keepSpots
# @alias listFlags
# @alias listToMatrix
# @alias listToMatrix.default
# @alias lmGenewise
# @alias lmGenewise.Analyzer
# @alias loadData
# @alias loadData.SMA
# @alias loessQuantile
# @alias log
# @alias log.default
# @alias log.na
# @alias log.RGData
# @alias log.SpotData
# @alias logPreferred
# @alias logPreferred.SpotData
# @alias lowessCurve
# @alias lowessLine
# @alias lowessLine.MicroarrayData
# @alias mad
# @alias mad.default
# @alias mad.MultiwayArray
# @alias Matrix
# @alias matrixToList
# @alias matrixToList.default
# @alias mean.MultiwayArray
# @alias median
# @alias median.default
# @alias median.MultiwayArray
# @alias MicroarrayArray
# @alias MicroarrayWeights
# @alias MultiwayArray
# @alias nbrOfColumns
# @alias nbrOfDataPoints
# @alias nbrOfDataPoints.MicroarrayData
# @alias nbrOfDimensions
# @alias nbrOfDimensions.MultiwayArray
# @alias nbrOfFields
# @alias nbrOfFields.GalLayout
# @alias nbrOfGenes
# @alias nbrOfGrids
# @alias nbrOfGroups
# @alias nbrOfGroups.LayoutGroups
# @alias nbrOfGroups.PlateGroups
# @alias nbrOfGroups.PrintdipGroups
# @alias nbrOfGroups.PrinttipGroups
# @alias nbrOfGroups.SlideColumnGroups
# @alias nbrOfGroups.SlideRowGroups
# @alias nbrOfGroups.SuperGroups
# @alias nbrOfHybridizations
# @alias nbrOfHybridizations.ExperimentalSetup
# @alias nbrOfPlates
# @alias nbrOfPlates.Layout
# @alias nbrOfRows
# @alias nbrOfSlides
# @alias nbrOfSpots
# @alias nbrOfTreatments
# @alias nbrOfTreatments.MicroarrayData
# @alias ncol.GeneReplicateSlideArray
# @alias ncol.GeneSlideArray
# @alias normalizeAcrossSlides
# %@alias normalizeAffine
# @alias normalizeAffine.RawData
# @alias normalizeAffineShift
# %@alias normalizeCurveFit
# @alias normalizeGenewise
# @alias normalizeGenewise.GenePixData
# @alias normalizeGenewise.MAData
# @alias normalizeGenewise.MicroarrayData
# @alias normalizeGenewise.RawData
# @alias normalizeGenewise.RGData
# @alias normalizeGenewise.ScanAlyzeData
# @alias normalizeGenewise.SpotData
# @alias normalizeGenewise.SpotfinderData
# @alias normalizeGroupsConstant
# @alias normalizeGroupsConstant.MicroarrayData
# @alias normalizeGroupsShiftFunction
# @alias normalizeGroupsShiftFunction.MicroarrayData
# @alias normalizeLoess.RGData
# @alias normalizeLogRatioShift
# @alias normalizeLowess.RGData
# @alias normalizePlatewise
# @alias normalizePlatewise.MAData
# @alias normalizePrintorder
# @alias normalizePrintorder.MAData
# @alias normalizePrintorder.MicroarrayData
# %@alias normalizeQuantile
# @alias normalizeQuantile.MAData
# @alias normalizeQuantile.MicroarrayData
# @alias normalizeQuantile.RawData
# @alias normalizeQuantile.RGData
# @alias normalizeRobustSpline.RGData
# @alias normalizeSpatial
# @alias normalizeSpatial.MAData
# @alias normalizeSpatial.MicroarrayData
# @alias normalizeSpline.RGData
# @alias normalizeWithinSlide
# @alias normalizeWithinSlide.RawData
# @alias nrow.GeneReplicateSlideArray
# @alias nrow.GeneSlideArray
# @alias plot.MAData
# @alias plot.RawData
# @alias plot.RGData
# @alias plot3d.MAData
# @alias plot3d.MicroarrayData
# @alias plotDensity
# @alias plotDensity.MAData
# @alias plotDiporder
# @alias plotDiporder.MAData
# @alias plotDiporder.MicroarrayData
# @alias plotGene
# @alias plotGene.MicroarrayData
# @alias plotPrintorder
# @alias plotPrintorder.MAData
# @alias plotSpatial
# @alias plotSpatial.ImaGeneData
# @alias plotSpatial.MAData
# @alias plotSpatial.RawData
# @alias plotSpatial.RGData
# @alias plotSpatial3d
# @alias plotSpatial3d.GenePixData
# @alias plotSpatial3d.ImaGeneData
# @alias plotSpatial3d.MAData
# @alias plotSpatial3d.QuantArrayData
# @alias plotSpatial3d.ScanAlyzeData
# @alias plotSpatial3d.SpotData
# @alias plotSpatial3d.SpotfinderData
# @alias plotTTest
# @alias plotTTest.Analyzer
# @alias plotXY
# @alias plotXY.MAData
# @alias plotXY.RawData
# @alias plotXY.RGData
# @alias plotXY.SSMatrix
# @alias points.MicroarrayData
# @alias popView
# @alias popView.default
# @alias popView.MicroarrayArray
# @alias power
# @alias power.default
# @alias power.RGData
# @alias preferredLogBase
# @alias preferredLogBase.SpotData
# @alias print.AffineModelFit
# @alias print.ExperimentalSetup
# @alias print.MultiwayArray
# @alias ProbeWeights
# @alias prod
# @alias prod.default
# @alias prod.MultiwayArray
# % @alias projectUontoV
# @alias pushView
# @alias pushView.default
# @alias pushView.MicroarrayArray
# @alias put
# @alias put.Layout
# @alias putGene
# @alias putGene.MicroarrayData
# @alias putSlide
# @alias putSlide.MicroarrayData
# @alias qqnorm.MAData
# @alias qqnorm.MicroarrayData
# @alias qqplotTTest
# @alias qqplotTTest.Analyzer
# @alias quantile.MicroarrayData
# @alias range.MAData
# @alias range.MicroarrayData
# @alias range.RawData
# @alias range.RGData
# @alias range2
# @alias range2.MicroarrayData
# @alias read
# @alias read.MAData
# @alias read.RawData
# @alias read.RGData
# @alias read.SpotPosition
# @alias read.table
# @alias read.table.default
# @alias read.table.QuantArrayData
# @alias readAll
# @alias readAll.GenePixData
# @alias readAll.QuantArrayData
# @alias readAll.ScanAlyzeData
# @alias readAll.SpotData
# @alias readHeader
# @alias readHeader.MicroarrayData
# @alias readInternal
# @alias readInternal.ScanAlyze20Data
# @alias readInternal.ScanAlyzeData
# @alias readInternalSafe
# @alias readInternalSafe.ScanAlyzeData
# @alias readOneFile
# @alias readOneFile.GenePixData
# @alias readOneFile.ScanAlyzeData
# @alias readOneFile.SpotData
# @alias readToList
# @alias readToList.MicroarrayData
# @alias removeSlides
# @alias removeSpots
# @alias rename
# @alias rename.Layout
# @alias renameFields
# @alias renameFields.SpotData
# @alias resetProbeWeights
# @alias resetProbeWeights.MicroarrayData
# @alias resetSignalWeights
# @alias resetSignalWeights.MicroarrayData
# @alias residuals.AffineModelFit
# @alias rotate
# @alias rotate.Matrix
# %@alias rowAverages
# %@alias rowAverages.matrix
# %@alias scalarProduct
# @alias select
# @alias seq.LayoutGroups
# @alias seq.MicroarrayData
# @alias setByLayout
# @alias setByLayout.Layout
# @alias setCache
# @alias setCache.MicroarrayData
# @alias setDesignMatrix
# @alias setDesignMatrix.Analyzer
# @alias setExcludedSpots
# @alias setExcludedSpots.MicroarrayData
# @alias setExplicit
# @alias setExplicit.Layout
# @alias setExtra
# @alias setField
# @alias setField.MAData
# @alias setField.MicroarrayData
# @alias setField.RawData
# @alias setFlag
# @alias setGeneGroups
# @alias setGeneGroups.Layout
# @alias setGeneReplicateSlideValues
# @alias setGeneReplicateSlideValues.MicroarrayArray
# @alias setGeneSlideValues
# @alias setGeneSlideValues.GeneSlideArray
# @alias setGeneSlideValues.MicroarrayArray
# @alias setGroups
# @alias setGroups.SuperGroups
# @alias setHeaderField
# @alias setHeaderField.GenePixData
# @alias setId
# @alias setID
# @alias setID.Layout
# @alias setLabel
# @alias setLayout
# @alias setLayout.GenePixData
# @alias setLayout.ImaGeneData
# @alias setLayout.LayoutGroups
# @alias setLayout.QuantArrayData
# @alias setName
# @alias setParameter
# @alias setPlate
# @alias setPlate.Layout
# @alias setPlateGroups
# @alias setPlateGroups.Layout
# @alias setPrintdipGroups
# @alias setPrintdipGroups.Layout
# @alias setPrintorder
# @alias setPrintorder.Layout
# @alias setPrinttipGroups
# @alias setPrinttipGroups.Layout
# @alias setProbeWeights
# @alias setSaturated
# @alias setSignalWeights
# @alias setSignalWeights.MicroarrayData
# @alias setSlideColumnGroups
# @alias setSlideColumnGroups.Layout
# @alias setSlideName
# @alias setSlideName.MicroarrayData
# @alias setSlideNames
# @alias setSlideRowGroups
# @alias setSlideRowGroups.Layout
# @alias setSpotSlideValues
# @alias setSpotSlideValues.MicroarrayArray
# @alias setSpotSlideValues.SpotSlideArray
# @alias setTreatments
# @alias setTreatments.MicroarrayData
# @alias setView
# @alias setView.MicroarrayArray
# @alias setView.MicroarrayData
# @alias setVisible
# @alias setWeights
# @alias setWeights.MicroarrayData
# @alias shift
# @alias shiftEqualRG
# @alias shiftEqualRG.MAData
# @alias SignalWeights
# @alias SpotSlideArray
# @alias SSMatrix
# @alias str.MicroarrayArray
# @alias sum
# @alias sum.default
# @alias sum.MultiwayArray
# @alias summary.AffineModelFit
# @alias SuperGroups
# @alias swapDyes
# @alias toPrintorderMatrix
# @alias topSpots
# @alias toXYMatrix
# % @alias tr
# @alias ttest
# @alias ttest.Analyzer
# @alias unite
# @alias unloadData
# @alias unloadData.SMA
# @alias updateHeader
# @alias updateHeader.ImaGeneData
# @alias updateHeader.MicroarrayData
# @alias validateArgumentChannel
# @alias validateArgumentChannel.MicroarrayData
# @alias validateArgumentChannels
# @alias validateArgumentChannels.MicroarrayData
# @alias validateArgumentGroupBy
# @alias validateArgumentSlide
# @alias validateArgumentSlides
# @alias validateArgumentSpotIndex
# @alias validateArgumentSpotIndex.MicroarrayData
# @alias validateArgumentWeights
# @alias var
# @alias var.default
# @alias var.MultiwayArray
# @alias write
# @alias write.default
# @alias write.GalLayout
# @alias writeHeader
# @alias writeHeader.MicroarrayData
#
# % Plot functions
# %@alias plotMvsA
# %@alias plotMvsAPairs
# %@alias plotMvsMPairs
#
# \description{
#   This page contains aliases for all "non-documented" objects that 
#   \code{R CMD check} detects in this package. 
#
#   Almost all of them are \emph{generic} functions that have specific 
#   document for the corresponding method coupled to a specific class. 
#   Other functions are re-defined by \code{setMethodS3()} to 
#   \emph{default} methods. Neither of these two classes are non-documented
#   in reality.
#   The rest are deprecated methods.
# }
#
# @author
#
# @keyword internal
#*/###########################################################################

############################################################################
# HISTORY:
# 2005-02-13
# o Created to please R CMD check.
############################################################################
