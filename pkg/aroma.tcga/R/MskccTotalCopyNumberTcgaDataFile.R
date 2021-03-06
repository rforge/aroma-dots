setConstructorS3("MskccTotalCopyNumberTcgaDataFile", function(...) {
  this <- extend(TcgaDataFile(...), "MskccTotalCopyNumberTcgaDataFile");
  this;
})

setMethodS3("getColumnNames", "MskccTotalCopyNumberTcgaDataFile", function(this, ...) {
  # Get full column names
  fullnames <- NextMethod("getColumnNames", this, ...);

  # Split into names and tags
  parts <- strsplit(fullnames, split=",", fixed=TRUE);
  names <- sapply(parts, FUN=function(x) x[1]);
  tags <- sapply(parts, FUN=function(x) paste(x[-1], collapse=","));

  # For sample column, translate empty one into 'log2ratio'
  isSample <- (regexpr("^TCGA", names) != -1);
  tags[isSample & (tags == "")] <- "signal:Log2";

  # Recreate full column names  
  fullnames <- paste(names, tags, sep=",");
  fullnames <- gsub(",$", "", fullnames);
  
  fullnames;
})

setMethodS3("getReadArguments", "MskccTotalCopyNumberTcgaDataFile", function(this, ..., colClassPatterns=c("*"="character", "Pos$"="integer", "signal:Log2$"="double")) {
  NextMethod("getReadArguments", this, ..., colClassPatterns=colClassPatterns);
}, protected=TRUE)



setMethodS3("extractTotalLog2CopyNumbers", "MskccTotalCopyNumberTcgaDataFile", function(this, ..., drop=TRUE) {
  colClassPatterns <- c("ProbeID"="character", "signal:Log2$"="double");
  data <- readDataFrame(this, colClassPatterns=colClassPatterns, ...);
  idx <- match("ProbeID", colnames(data));
  unitNames <- data[,idx];
  data <- data[,-idx,drop=FALSE];
  names <- names(data);

  pattern <- "(.*),(signal:Log2)$";
  sampleNames <- gsub(pattern, "\\1", names);
  nbrOfSamples <- length(sampleNames);

  # Coerce to a matrix  
  data <- as.matrix(data);
  rownames(data) <- unitNames;

  # A matrix? (probably never happens /HB 2009-08-23)
  if (drop && nbrOfSamples == 1) {
    data <- as.vector(data);
  }
  
  data;
})

setMethodS3("extractTotalCopyNumbers", "MskccTotalCopyNumberTcgaDataFile", function(this, ...) {
  data <- extractTotalLog2CopyNumbers(this, ...);

  # Transform to non-logged CNs
  data <- 2*2^data;

  if (is.matrix(data)) {
    names <- colnames(data);
    names <- gsub("signal:Log2", "ratio", names, fixed=TRUE);
    colnames(data) <- names;
  }

  data;
})


setMethodS3("exportTotal", "MskccTotalCopyNumberTcgaDataFile", function(this, dataSet, unf, samplePatterns=NULL, ..., rootPath="totalAndFracBData", maxNbrOfUnknownUnitNames=0, force=FALSE, verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'dataSet':
  dataSet <- Arguments$getCharacter(dataSet);

  # Argument 'unf':
  unf <- Arguments$getInstanceOf(unf, "UnitNamesFile");

  # Argument 'samplePatterns':
  if (!is.null(samplePatterns)) {
    samplePatterns <- sapply(samplePatterns, FUN=function(s) {
      Arguments$getRegularExpression(s);
    });
  }

  # Argument 'rootPath':
  rootPath <- Arguments$getWritablePath(rootPath);

  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }

  verbose && enter(verbose, "Exporting ", class(this)[1]);

  chipType <- getChipType(unf, fullname=FALSE);
  
  path <- file.path(rootPath, dataSet, chipType);
  path <- Arguments$getWritablePath(path);
  verbose && cat(verbose, "Exporting to path: ", path);

  # Tags added to each exported file data file
  tags <- c("log2ratio", "total");

  # Unit indices (to be inferred)
  units <- NULL;

  # Export total signals
  allColumnNames <- getColumnNames(this);
  pattern <- ",signal:Log2$";
  columnNames <- grep(pattern, allColumnNames, value=TRUE);
  verbose && cat(verbose, "Columns to be processed:");
  verbose && print(verbose, columnNames);

  for (cc in seq(along=columnNames)) {
    columnName <- columnNames[cc];

    verbose && enter(verbose, sprintf("Exporting column #%d ('%s') of %d", 
                     cc, columnName, length(columnNames)));

    # Sample name of exported data file
    sampleName <- gsub(pattern, "", columnName);

    fullname <- paste(c(sampleName, tags), collapse=",");
    verbose && cat(verbose, "Exported full name: ", fullname);

    filename <- sprintf("%s.asb", fullname);
    pathname <- file.path(path, filename);
    verbose && cat(verbose, "Export pathname: ", pathname);
    # Nothing to do?
    if (!force && isFile(pathname)) {
      verbose && cat(verbose, "Column already exported. Skipping.");
      verbose && exit(verbose);
      next;
    }
    # Export to a temporary file
    pathnameT <- sprintf("%s.tmp", pathname);
    if (isFile(pathnameT)) {
      throw("Temporary file already exists: ", pathnameT);
    }

    # Read data
    verbose && enter(verbose, "Reading column data");
    columnIdx <- match(columnName, allColumnNames);
    verbose && printf(verbose, "Column index: %d ('%s')\n", columnIdx, columnName);
    data <- readColumns(this, column=columnIdx, colClass="double")[,1,drop=FALSE];
    verbose && str(verbose, data);
    verbose && summary(verbose, data);
    verbose && exit(verbose);

    # Map unit indices
    if (is.null(units)) {
      verbose && enter(verbose, "Mapping unit names to indices");
      colClassPatterns <- c("ProbeID"="character");
      unitNames <- readDataFrame(this, colClassPatterns=colClassPatterns)[,1];
      verbose && cat(verbose, "Unit names:");
      verbose && str(verbose, unitNames);

      verbose && print(verbose, unf);
      units <- indexOf(unf, names=unitNames);
      verbose && cat(verbose, "Units:");
      verbose && str(verbose, units);

      # Sanity check
      missing <- unitNames[is.na(units)];
      n <- length(missing);
      if (n > 0) {
        if (n > 3) missing <- c(missing[1:2], "...", missing[n]);
        missing <- paste(missing, collapse=", ");
        msg <- sprintf("Detected %s unknown unit names: %s", n, missing);
        verbose && cat(verbose, msg);
        if (n > maxNbrOfUnknownUnitNames) throw(msg);
      }
      verbose && exit(verbose);
    }

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    # Dropping unknown units
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    if (anyMissing(units)) {
      keep <- which(!is.na(units));
      units <- units[keep];
      data <- data[keep,,drop=FALSE];
      rm(keep);
    }

    # Drop attributes
    data <- as.vector(data);

    verbose && enter(verbose, "Generating 'srcFile' footer");
    srcFile <- list(
      filename = getFilename(this),
      filesize = getFileSize(this),
      checksum = getChecksum(this),
      column = columnIdx,
      columnName = columnName,
      valuesChecksum = digest(data)
    );
    verbose && str(verbose, srcFile);
    verbose && exit(verbose);

    on.exit({
      if (!is.null(pathnameT) && isFile(pathnameT)) {
        file.remove(pathnameT);
      }
    }, add=TRUE);

    verbose && enter(verbose, "Allocating temporary file");
    df <- AromaUnitTotalCnBinaryFile$allocateFromUnitNamesFile(unf, 
                                            filename=pathnameT, path=NULL);

    footer <- readFooter(df);
    footer$srcFile <- srcFile;
    writeFooter(df, footer);
    verbose && exit(verbose);

    verbose && enter(verbose, "Write signals");
    df[units,1] <- data;
    verbose && exit(verbose);
    
    verbose && enter(verbose, "Renaming temporary file");
    # Rename temporary file
    file.rename(pathnameT, pathname);
    if (isFile(pathnameT) || !isFile(pathname)) {
      throw("Failed to rename temporary file: ", pathnameT, " -> ", pathname);
    }
    pathnameT <- NULL;
    verbose && exit(verbose);

    # Validate
    df <- AromaUnitTotalCnBinaryFile(pathname);
    verbose && cat(verbose, "Exported data file:");
    verbose && print(verbose, df);

    verbose && exit(verbose);
  } # for (cc ...)

  ds <- AromaUnitTotalCnBinarySet$byPath(path);
  verbose && print(verbose, ds);

  verbose && exit(verbose);

  invisible(ds);
})


############################################################################
# HISTORY:
# 2010-01-06
# o CLEAN UP: No need for assign NAs when allocating new files; this is now
#   always the default way (in aroma.core v1.4.1).
# 2010-01-05
# o Added getColumnNames() for MskccTotalCopyNumberTcgaDataFile that
#   detects empty column names and replaces them with a default name.
# 2010-01-03
# o Created from HarvardTotalCopyNumberTcgaDataFile.R.
############################################################################
