############################################################################
# Exports TCGA CN data files to tab-delimited files
# Author: Henrik Bengtsson
############################################################################ 
library("aroma.cn");
library("aroma.tcga");
library("R.menu");
verbose <- Arguments$getVerbose(-20, timestamp=TRUE);


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# Local functions
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
getAnnotationDataFiles <- function(ds, ...) {
  verbose && enter(verbose, "Loading unit names for source files");

  # Unit genome positions
  verbose && enter(verbose, "Unit genome positions");
  ugp <- getAromaUgpFile(ds);
  verbose && cat(verbose, "Unit genome position (UGP) file:");
  verbose && print(verbose, ugp);
  verbose && exit(verbose);

  # Unit names
  verbose && enter(verbose, "Unit genome positions");
  platform <- getPlatform(ugp);
  chipType <- getChipType(ugp);
  if (platform == "Affymetrix") {
    require("aroma.affymetrix") || throw("Package not loaded: aroma.affymetrix");
    unf <- getCdf(ugp);
  } else {
    unf <- TextUnitNamesFile$byChipType(chipType);
  }
  verbose && cat(verbose, "Filename: ", getFilename(unf));

  unitNames <- getUnitNames(unf);
  verbose && str(verbose, unitNames);
  # Sanity check
  stopifnot(length(unitNames) == nbrOfUnits(ugp));
  verbose && exit(verbose);

  verbose && exit(verbose);

  list(platform=platform, chipType=chipType, ugp=ugp, unf=unf);
} # getAnnotationDataFiles()



# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# Source and destination root directories
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
rootPath <- "cnData";
rootPath <- Arguments$getWritablePath(rootPath);
verbose && cat(verbose, "Source root path: ", rootPath);

destRootPath <- sprintf("%s,txt", rootPath);
destRootPath <- Arguments$getWritablePath(destRootPath);
verbose && cat(verbose, "Destination root path: ", destRootPath);


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Identify all data sets
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
patterns <- TcgaDccData$getDataSetPatterns();
pattern <- patterns$dataset;

dataSets <- list.files(path=rootPath, pattern=pattern);
verbose && cat(verbose, "Available data sets:");
verbose && print(verbose, dataSets);
stopifnot(length(dataSets) > 0);




# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Select tumor types
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
pattern <- sprintf("^%s.*", patterns$dataset);
types <- gsub(pattern, "\\2", dataSets);
uTypes <- sort(unique(types));

# User selected types
if (interactive()) {
  uTypes <- selectMenu(uTypes, selected=(length(uTypes) == 1),
                       title="Select type:");
} else {
  if (!is.null(args$types)) {
    uTypes <- intersect(uTypes, args$types);
  }
}

keep <- is.element(types, uTypes);
dataSets <- dataSets[keep];
stopifnot(length(dataSets) > 0);


# Human-style sorting
## try(dataSets <- gtools::mixedsort(dataSets), silent=TRUE);

tumorType <- uTypes[1];



# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Select preprocessing types
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
pattern <- sprintf("^%s,", patterns$dataset);
types <- gsub(pattern, "", dataSets);
uTypes <- sort(unique(types));

# User selected types
if (interactive()) {
  uTypes <- selectMenu(uTypes, selected=(length(uTypes) == 1), title="Select preprocessing methods:");
} else {
  if (!is.null(args$methods)) {
    uTypes <- intersect(uTypes, args$methods);
  }
}


keep <- is.element(types, uTypes);
dataSets <- dataSets[keep];
stopifnot(length(dataSets) > 0);

# Human-style sorting
## try(dataSets <- gtools::mixedsort(dataSets), silent=TRUE);


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Select data sets
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
if (interactive()) {
  dataSets <- selectMenu(dataSets, selected=(length(dataSets) == 1), title="Select dataset(s):");
}
stopifnot(length(dataSets) > 0);

verbose && cat(verbose, "Selected data sets:");
verbose && print(verbose, dataSets);


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Select samples to process
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Get all data sets
dsList <- lapply(dataSets, FUN=function(dataSet) {
  AromaUnitTotalCnBinarySet$byName(dataSet, chipType="*", paths=rootPath);
});

sampleNames <- lapply(dsList, FUN=getNames);
sampleNames <- sort(unique(unlist(sampleNames, use.names=FALSE)));
stopifnot(length(sampleNames) > 0);

# User selection
if (interactive()) {
  sampleNames <- selectMenu(sampleNames, selected=(length(sampleNames) == 1));
}

# Keep only samples and data sets of interest
dsList <- lapply(dsList, extract, sampleNames, onMissing="drop");
ns <- sapply(dsList, length);
dsList <- dsList[ns > 0];
stopifnot(length(dsList) > 0);

dataSets <- unname(sapply(dsList, FUN=getFullName));
verbose && cat(verbose, "Data sets to be processed:");
verbose && print(verbose, dataSets);
stopifnot(length(dataSets) > 0);

verbose && cat(verbose, "Samples to be processed:");
verbose && print(verbose, sampleNames);
stopifnot(length(sampleNames) > 0);


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Choosing data sets by chip type
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
verbose && enter(verbose, "Making sure all annotation data is available");
chipTypes <- sapply(dsList, getChipType);
uChipTypes <- sort(unique(chipTypes));
verbose && cat(verbose, "Chip types:");
verbose && print(verbose, chipTypes);

if (interactive()) {
  uChipTypes <- selectMenu(uChipTypes, selected=TRUE);
  keep <- is.element(uChipTypes, chipTypes);
  dsList <- dsList[keep];
}

stopifnot(length(dsList) > 0);

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Turn fullnames like this:
# TCGA-25-1323,01A,01D-0452-01,ref=TCGA-25-1323,10A,01D-0452-01,log2ratio,total
# into this:
# TCGA-25-1323,01Avs10A,01D-0452-01vs01D-0452-01,log2ratio,total
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
fcn <- MscnExport$getFullNameTranslator();
dsList <- lapply(dsList, FUN=setFullNamesTranslator, fcn);
print(dsList);

# Example
ds <- dsList[[1]];
print(getFullNames(ds, translate=FALSE));
print(getFullNames(ds));

# Sanity check
verbose && enter(verbose, "Making sure there are no unrecognized files");
for (kk in seq(along=dsList)) {
  ds <- dsList[[kk]];
  verbose && enter(verbose, sprintf("Data set #%d ('%s') of %d", 
                                   kk, getFullName(ds), length(dsList)));
  s <- getFullNames(ds, translate=FALSE);
  t <- getFullNames(ds);
  stopifnot(!any(s == t));
  verbose && exit(verbose);
}
verbose && exit(verbose);




# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Export each data set
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
verbose && enter(verbose, "Exporting data sets");


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Export each to text file
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
for (kk in seq(along=dsList)) {
  ds <- dsList[[kk]];
  dataSet <- getFullName(ds);
  platform <- getPlatform(ds);
  chipTypeF <- getChipType(ds);
  chipType <- getChipType(ds, fullname=FALSE);
  verbose && enter(verbose, sprintf("Data set #%d ('%s') of %d", 
                                            kk, dataSet, length(dsList)));

  # Output data set path
  path <- file.path(destRootPath, dataSet, chipType);
  path <- Arguments$getWritablePath(path);
  verbose && cat(verbose, "Output path: ", path);

  ad <- NULL;
  for (ii in seq(ds)) {
    df <- getFile(ds, ii);
    sampleName <- getName(df);
    verbose && enter(verbose, sprintf("Data file #%d ('%s') of %d", 
                                        ii, sampleName, nbrOfFiles(ds)));

    # Generate the output pathname
    fullname <- getFullName(df);
    filename <- sprintf("%s.data.txt", fullname);
    pathname <- Arguments$getWritablePathname(filename, path=path, 
                                                       mustNotExist=FALSE);

    # Is it already exported?
    pathnameGz <- sprintf("%s.gz", pathname);
    if (isFile(pathname) || isFile(pathnameGz)) {
      verbose && cat(verbose, "Already exported.");
      verbose && exit(verbose);
      next;
    }

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Write to a temporary file
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    verbose && enter(verbose, "Allocating temporary file");
    pathnameT <- sprintf("%s.tmp", pathname);
    pathnameT <- Arguments$getWritablePathname(pathnameT, mustNotExist=TRUE);
    verbose && cat(verbose, "Temporary pathname: ", pathnameT);
    verbose && exit(verbose);


    verbose && cat(verbose, "Data file to be exported:");
    verbose && print(verbose, df);

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Get annotation data
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Annotation data
    if (is.null(ad)) {
      ad <- getAnnotationDataFiles(ds, verbose=less(verbose,5));
      verbose && cat(verbose, "Loaded annotation data files:");
      verbose && print(verbose, ad);
    }


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Generate file header
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    verbose && enter(verbose, "Generating file header");
    pairName <- sprintf("%s,%s", sampleName, getTags(df)[1]);
    verbose && cat(verbose, "Tumor-normal pair: ", pairName);

    hdr <- NULL;
    hdr <- c(hdr, sprintf("sampleName: %s", sampleName));
    hdr <- c(hdr, sprintf("pairName: %s", pairName));
    hdr <- c(hdr, sprintf("fullName: %s", fullname));
    hdr <- c(hdr, sprintf("sourceFile: %s", getFilename(df)));
    hdr <- c(hdr, sprintf("sourceChecksum: %s", getChecksum(df)));
    value <- format(Sys.time(), "%Y-%m-%d %H:%M:%S", usetz=TRUE);
    hdr <- c(hdr, sprintf("createdOn: %s", value));
    author <- "Henrik Bengtsson, UC Berkeley";
    hdr <- c(hdr, sprintf("createdBy: %s", author));
    hdr <- c(hdr, sprintf("platform: %s", platform));
    hdr <- c(hdr, sprintf("chipType: %s", chipTypeF));
    tags <- getTags(df);
    typeOfSignals <- tags[length(tags)-1];
    hdr <- c(hdr, sprintf("typeOfSignal: %s", typeOfSignals));
    hdr <- c(hdr, sprintf("nbrOfUnits: %s", nbrOfUnits(df)));
    columnTypes <- c("character", "double");
    columnTypesStr <- paste(columnTypes, collapse="\t");
    hdr <- c(hdr, sprintf("columnTypes: %s", columnTypesStr));
    columnNames <- c("unitName", pairName);
    columnNamesStr <- paste(columnNames, collapse="\t");
    hdr <- c(hdr, sprintf("columnNames: %s", columnNamesStr));
    hdr <- paste("# ", hdr, sep="");
    verbose && cat(verbose, hdr, sep="\n");

    verbose && exit(verbose);
  

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Generate data table
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    verbose && enter(verbose, "Generating data table");

    unitNames <- getUnitNames(ad$unf);
    verbose && cat(verbose, "Unit names:");
    verbose && str(verbose, unitNames);

    values <- df[,1,drop=TRUE];
    # Exporting all missing values as "NA" (not NaN).
    values[is.na(values)] <- NA;
    verbose && cat(verbose, "Signals:");
    verbose && str(verbose, values);

    # Sanity check: Don't allow infinite values
    if (any(is.infinite(values))) {
      throw("Detected infinite values: ", sum(is.infinite(values)));
    }

    # Sanity check
    stopifnot(length(values) == length(unitNames));

    verbose && exit(verbose);


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Write to file
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    verbose && enter(verbose, "Writing file");

    verbose && enter(verbose, "Writing file header");
    cat(file=pathnameT, hdr, sep="\n", append=FALSE);
    verbose && exit(verbose);

    verbose && enter(verbose, "Writing data section");
    cat(file=pathnameT, columnNamesStr, sep="\n", append=TRUE);

    # Rounding results
    nbrOfDecimals <- 4L;
    verbose && cat(verbose, "Number of decimals: ", nbrOfDecimals);
    fmtstr <- sprintf("%%.%df", nbrOfDecimals);
    valuesS <- sprintf(fmtstr, values);

    data <- paste(unitNames, valuesS, sep="\t");
    cat(file=pathnameT, data, sep="\n", append=TRUE);
    verbose && exit(verbose);

    verbose && exit(verbose);


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Rename temporary file
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    verbose && enter(verbose, "Renaming temporary file");
    file.rename(pathnameT, pathname);
    if (isFile(pathnameT)) {
      throw("Failed to rename temporary file: ", pathnameT, " -> ", pathname);
    }
    if (!isFile(pathname)) {
      throw("Failed to rename temporary file: ", pathnameT, " -> ", pathname);
    }
    verbose && exit(verbose);


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Generating MD5 checksum
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    verbose && enter(verbose, "Loading output data file");
    dfOut <- TabularTextFile(pathname);
    verbose && print(verbose, dfOut);
    verbose && exit(verbose);

    verbose && enter(verbose, "Generating MD5 checksum");
    writeChecksum(dfOut);
    verbose && cat(verbose, "MD5 checksum: ", getChecksum(dfOut));
    verbose && exit(verbose);


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Validating content
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    verbose && enter(verbose, "Validating exported data");
    tolerance <- 2*10^-nbrOfDecimals;
    verbose && printf(verbose, "Tolerance: 2*10^%d\n", nbrOfDecimals);

    verbose && enter(verbose, "Reading output signals");
    data <- readDataFrame(dfOut, colClasses=c("NULL", "double"));
    valuesOut <- data[,1,drop=TRUE];
    verbose && exit(verbose);

    verbose && enter(verbose, "Asserting that values are the same");
    stopifnot(length(valuesOut) == length(values));
    res <- all.equal(valuesOut, values, tolerance=tolerance);
    if (!isTRUE(res)) {
      verbose && cat(verbose, "***WARNING START***");
      verbose && print(verbose, res);
      verbose && cat(verbose, "***WARNING STOP***");
      # stopifnot(res);
    }
    rm(data, valuesOut);
    verbose && exit(verbose);
  
    verbose && exit(verbose);

    verbose && exit(verbose);
  } # for (ii ...)


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Making sure that it is possible to lead the data set
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  verbose && enter(verbose, "Loading exported data set");
  pattern <- "[.]data[.]txt(|.gz)$";
  dsOut <- GenericDataFileSet$byPath(path, pattern=pattern);
  verbose && print(verbose, dsOut);
  verbose && exit(verbose);


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Compress
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  verbose && enter(verbose, "Compressing output data set");
  for (ii in seq(dsOut)) {
    df <- getFile(dsOut, ii);
    sampleName <- getName(df);
    verbose && enter(verbose, sprintf("Data file #%d ('%s') of %d", 
                                  ii, sampleName, nbrOfFiles(dsOut)));

    # Generate the output pathname
    if (getFileType(df) != "gz") {
      gzip(df, verbose=verbose);
    } else {
      verbose && cat(verbose, "Already compressed");
    }

    verbose && exit(verbose);
  } # for (ii ...)

  dsOut <- GenericDataFileSet$byPath(path, pattern=pattern);
  verbose && print(verbose, dsOut);
  verbose && exit(verbose);

  verbose && print(verbose, list.files(getPath(dsOut)));

  verbose && exit(verbose);
} # for (kk ...)
verbose && exit(verbose);


############################################################################
# HISTORY:
# 2010-03-08
# o BUG FIX: The chip-type directory name was the full chip type.
# o Now signals are exported with 4 decimals (instead of 5).
# 2010-01-21
# o Updated to export TCGA OV data.
# 2009-10-20
# o Updated to use findDataSets2().
# 2009-10-03
# o Updated to export new MSCN OV results.
# 2009-05-06
# o Created.
############################################################################
