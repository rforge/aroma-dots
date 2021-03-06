###########################################################################/**
# @RdocClass BamDataSet
#
# @title "The BamDataSet class"
#
# \description{
#  @classhierarchy
#
#  An BamDataSet object represents a set of @see "BamDataFile":s.
# }
#
# @synopsis
#
# \arguments{
#   \item{files}{A @list of @see "BamDataFile":s.}
#   \item{...}{Arguments passed to @see "R.filesets::GenericDataFileSet".}
# }
#
# \section{Fields and Methods}{
#  @allmethods "public"
# }
#
# @author "HB"
#*/###########################################################################
setConstructorS3("BamDataSet", function(files=NULL, ...) {
  extend(GenericDataFileSet(files=files, ...), c("BamDataSet", uses("AromaSeqDataFileSet")));
})


setMethodS3("getOrganism", "BamDataSet", function(this, ...) {
  organism <- directoryItem(this, "organism");
  organism <- Arguments$getCharacter(organism, length=c(1L, 1L));
  organism;
}, protected=TRUE);


setMethodS3("getDepth", "BamDataSet", function(this, ...) {
  path <- getPath(this, absolute=FALSE);
  parts <- unlist(strsplit(path, split="/", fixed=TRUE));
  nparts <- length(parts);
  depth <- nparts - 2L;
  depth <- Arguments$getInteger(depth, range=c(0,Inf));
  depth;
}, protected=TRUE);


setMethodS3("findByName", "BamDataSet", function(static, name, tags=NULL, organism=NULL, ..., paths="bamData", pattern="[.](bam|BAM)$") {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'organism':
  if (!is.null(organism)) {
    organism <- Arguments$getCharacter(organism);
  }

  NextMethod("findByPath", subdirs=organism, paths=paths, pattern=pattern);
}, static=TRUE)


setMethodS3("byPath", "BamDataSet", function(static, ..., pattern="[.](bam|BAM)$") {
  NextMethod("byPath", pattern=pattern);
}, static=TRUE)


setMethodS3("byName", "BamDataSet", function(static, name, tags=NULL, organism=NULL, ..., verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'organism':
  if (!is.null(organism)) {
    organism <- Arguments$getCharacter(organism);
  }

  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }


  verbose && enter(verbose, "Setting up ", class(static)[1L], " by name");

  verbose && cat(verbose, "Organism: ", organism);

  suppressWarnings({
    paths <- findByName(static, name, tags=tags, organism=organism,
                                                   firstOnly=FALSE, ...);
  })
  if (is.null(paths)) {
    path <- file.path(paste(c(name, tags), collapse=","), organism);
    throw("Cannot create ", class(static)[1], ".  No such directory: ", path);
  }

  verbose && cat(verbose, "Paths to possible data sets:");
  verbose && print(verbose, paths);

  # Record all exception
  exList <- list();

  res <- NULL;
  for (kk in seq_along(paths)) {
    path <- paths[kk];
    verbose && enter(verbose, sprintf("Trying path #%d of %d", kk, length(paths)));
    verbose && cat(verbose, "Path: ", path);

    tryCatch({
      suppressWarnings({
        res <- byPath(static, path=path, ..., verbose=verbose);
      });
    }, error = function(ex) {
      exList <<- append(exList, list(list(exception=ex, path=path)));

      verbose && cat(verbose, "Data set could not be setup for this path, because:");
      verbose && cat(verbose, ex$message);
    });

    if (!is.null(res)) {
      if (length(res) > 0) {
        verbose && cat(verbose, "Successful setup of data set.");
        verbose && exit(verbose);
        break;
      }
    }

    verbose && exit(verbose);
  } # for (kk ...)

  if (is.null(res)) {
    exMsgs <- sapply(exList, FUN=function(ex) {
      sprintf("%s (while trying '%s').",
                   ex$exception$message, ex$path);
    });
    exMsgs <- sprintf("(%d) %s", seq_along(exMsgs), exMsgs);
    exMsgs <- paste(exMsgs, collapse="  ");
    msg <- sprintf("Failed to setup a data set for any of %d data directories located. The following reasons were reported: %s", length(paths), exMsgs);
    verbose && cat(verbose, msg);
    throw(msg);
  }

  verbose && exit(verbose);

  res;
}, static=TRUE)


############################################################################
# HISTORY:
# 2013-11-11
# o BUG FIX: BamDataSet$byPath() would include also SAM files.
# 2013-11-09
# o Added static findByName() and byName() for BamDataSet.
# o Added getOrganism() to BamDataSet.
# 2012-09-25
# o Added getDepth().
# 2012-06-28
# o Created.
############################################################################
