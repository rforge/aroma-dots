############################################################################
# Author: Henrik Bengtsson
#
# Usage:
#  library("aroma.tcga"); library("R.menu");
#  launchMenu(aroma.tcga, "testScripts/system/");
#
# Description:
# 1. Identifies all data sets available.
# 2. User selects data sets by (i) tumor type, (ii) center, 
#    (iii) preprocessing method, and finally by (iv) name.
# 3. User selects samples.
# 4. Segmentation.
############################################################################
if (interactive()) savehistory();
library("aroma.tcga");
library("aroma.cn");
library("R.menu");
verbose <- Arguments$getVerbose(-20, timestamp=TRUE);

patterns <- TcgaDccData$getDataSetPatterns();

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Identify all tumor-normal CN data sets
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
rootPaths <- c("rawCnData", "cnData", "smoothCnData");
rootPaths <- sapply(rootPaths, Arguments$getReadablePath, mustExist=FALSE);
keep <- sapply(rootPaths, FUN=isDirectory);
rootPaths <- rootPaths[keep];
stopifnot(length(rootPaths) > 0);

if (interactive()) {
  ans <- textMenu(names(rootPaths));
  rootPath <- rootPaths[ans];
} else {
  rootPath <- rootPaths[1];
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Identify all tumor-normal CN data sets
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
rootPath <- Arguments$getReadablePath(rootPath, mustExist=TRUE);
pattern <- patterns$dataset;
dataSets <- list.files(path=rootPath, pattern=pattern);
verbose && cat(verbose, "Available data sets:");
verbose && print(verbose, dataSets);
stopifnot(length(dataSets) > 0);


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Select tumor types
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
pattern <- sprintf("^%s,.*", patterns$dataset);
types <- gsub(pattern, "\\2", dataSets);
uTypes <- sort(unique(types));

# User selected types
if (interactive()) {
  uTypes <- selectMenu(uTypes, selected=(length(uTypes) == 1),
                       title="Select type:");
}

keep <- is.element(types, uTypes);
dataSets <- dataSets[keep];
stopifnot(length(dataSets) > 0);


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Select centers
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
pattern <- sprintf("^%s,.*", patterns$dataset);
centers <- gsub(pattern, "\\1", dataSets);
uCenters <- sort(unique(centers));

# User selected types
if (interactive()) {
  uCenters <- selectMenu(uCenters, selected=(length(uCenters) == 1), title="Select centers:");
}

keep <- is.element(centers, uCenters);
dataSets <- dataSets[keep];
stopifnot(length(dataSets) > 0);


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Select preprocessing types
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
pattern <- sprintf("^%s,", patterns$dataset);
types <- gsub(pattern, "", dataSets);
uTypes <- sort(unique(types));

# User selected types
if (interactive()) {
  uTypes <- selectMenu(uTypes, selected=(length(uTypes) == 1), title="Select preprocessing method:");
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


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Chromosomes
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
chromosomes <- 1:24;
if (interactive()) {
  chromosomes <- selectMenu(chromosomes, selected=(length(chromosomes) == 1), title="Select chromosomes:");
}
stopifnot(length(chromosomes) > 0);


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Process data set by data set
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
for (kk in seq(along=dsList)) {
  ds <- dsList[[kk]];
  verbose && enter(verbose, sprintf("Data set #%d ('%s') of %d", 
                                 kk, getFullName(ds), length(dsList)));

  # Drop missing files
  ds <- extract(ds, !is.na(getPathnames(ds)));

  # WORKAROUND: Until CopyNumberChromosomalModel accepts CN *ratios*,
  # we have to create a dummy file containing all log2ratio=0.
  chipType <- getChipType(ds, fullname=FALSE);
  path <- file.path("rawCnData", "CONSTANT,log2ratio", chipType);
  path <- Arguments$getWritablePath(path);
  pathname <- Arguments$getReadablePathname("zeros,log2ratio,total.asb", path=path, mustExist=FALSE);
  if (!isFile(pathname)) {
    df <- getFile(ds, 1);
    copyFile(getPathname(df), pathname);
    dfR <- newInstance(df, pathname);
    dfR[,1] <- 0;
  }
  df <- getFile(ds, 1);
  dfR <- newInstance(df, pathname);
  rm(pathname, df);

  if (getPlatform(ds) == "Affymetrix") {
    library("aroma.affymetrix");
  }

  cbs <- CbsModel(ds, dfR);
  cbs$.paired <- FALSE;   # AD HOC; to prevent extra "paired" tag.
  verbose && print(verbose, cbs);

  ce <- ChromosomeExplorer(cbs, zooms=2^(0:2));
  print(ce);
  
  process(ce, chromosomes=chromosomes, verbose=verbose);

  verbose && exit(verbose);
} # for (ii ...)



############################################################################
# HISTORY:
# 2010-01-06
# o Created.
############################################################################
