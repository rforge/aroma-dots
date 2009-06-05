###########################################################################/**
# @RdocClass SnpChipEffectFile
#
# @title "The SnpChipEffectFile class"
#
# \description{
#  @classhierarchy
#
#  This class represents estimates of chip effects in the probe-level models.
# }
# 
# @synopsis
#
# \arguments{
#   \item{...}{Arguments passed to @see "ChipEffectFile".}
#   \item{mergeStrands}{Specifies if the strands are merged or not for these
#      estimates.}
# }
#
# \section{Fields and Methods}{
#  @allmethods "public"
# }
#
# @author
# 
# \seealso{
#   An object of this class is typically part of a @see "SnpChipEffectSet".
# }
#*/###########################################################################
setConstructorS3("SnpChipEffectFile", function(..., mergeStrands=FALSE) {
  this <- extend(ChipEffectFile(...), "SnpChipEffectFile",
    "cached:.cellIndices" = NULL,
    mergeStrands = mergeStrands
  );

  # Parse attributes (all subclasses must call this in the constructor).
  if (!is.null(this$.pathname))
    setAttributesByTags(this);

  this;
})


setMethodS3("clearCache", "SnpChipEffectFile", function(this, ...) {
  # Clear all cached values.
  # /AD HOC. clearCache() in Object should be enough! /HB 2007-01-16
  for (ff in c(".cellIndices")) {
    this[[ff]] <- NULL;
  }

  # Then for this object
  NextMethod(generic="clearCache", object=this, ...);
}, private=TRUE)



setMethodS3("getParameters", "SnpChipEffectFile", function(this, ...) {
  params <- NextMethod(generic="getParameters", object=this, ...);
  params$mergeStrands <- this$mergeStrands;
  params;
})


setMethodS3("getCellIndices", "SnpChipEffectFile", function(this, units=NULL, ..., force=FALSE, .cache=TRUE, verbose=FALSE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'units':
  if (is.null(units)) {
  } else if (is.numeric(units)) {
    cdf <- getCdf(this);
    units <- Arguments$getIndices(units, range=c(1, nbrOfUnits(cdf)));
  }

  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);
  if (verbose) {
    pushState(verbose);
    on.exit(popState(verbose));
  }

  verbose && enter(verbose, "getCellIndices.SnpChipEffectFile()");

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Check for cached data
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (!force || .cache) {
    chipType <- getChipType(getCdf(this));
    params <- getParameters(this);
    key <- list(method="getCellIndices", class=class(this)[1], 
                pathname=getPathname(this),
                chipType=chipType, params=params, units=units, ...);
    dirs <- c("aroma.affymetrix", chipType);
    id <- digest2(key);
  }

  if (!force) {
    # In memory?
    res <- this$.cellIndices[[id]];
    # On file?
    if (is.null(res)) {
      res <- loadCache(key=list(id), dirs=dirs);
      if (!is.null(res))
        where <- "on file";
    } else {
      where <- "in memory";
    }
    if (!is.null(res)) {
      size <- object.size(res);
      verbose && printf(verbose, "Returning value cached %s: %.1fMB\n", 
                                                   where, size/1024^2);
      verbose && exit(verbose);
      return(res);
    }
  }


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Get units in chunks
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (is.null(units))
    units <- seq(length=nbrOfUnits(cdf));

  cells <- lapplyInChunks(units, function(unitChunk) {
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Get and restructure cell indices
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
## NOTE: NextMethod() does not work from within another function
##    cells <- NextMethod("getCellIndices", this, units=unitChunk, ..., 
##                            force=force, .cache=FALSE, verbose=verbose);
    cells <- getCellIndices.ChipEffectFile(this, units=unitChunk, ..., 
                             force=force, .cache=FALSE, verbose=verbose);


    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # Merge strands?
    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    # If merging strands, we only need half the number of chip-effect 
    # parameters per unit group.  Example:
    # (a) mergeStrands=FALSE:
    #    Fit by strand and allele:        #groups=4, #chip effects=4
    #    (same but single-stranded SNP)   #groups=2, #chip effects=2
    # (b) mergeStrands=TRUE:
    #    Merge strands, fit by allele:    #groups=4, #chip effects=2
    #    (same but single-stranded SNP)   #groups=2, #chip effects=2
    if (this$mergeStrands) {
      verbose && enter(verbose, "Merging strands");
      cells <- applyCdfGroups(cells, function(groups) {
        ngroups <- length(groups);
        if (ngroups == 4) {
          .subset(groups, c(1,2));
        } else if (ngroups == 2) {
          .subset(groups, c(1,2));
        } else if (ngroups == 1) {
          .subset(groups, 1);
        } else if (ngroups > 4 && ngroups %% 2 == 0) {
          .subset(groups, c(1,2));
        } else {
          # groups[1:ceiling(ngroups/2)];
          # groups[1:round((ngroups+1)/2)];
          .subset(groups, 1:round((ngroups+1)/2));
        }
      }) # applyCdfGroups()
      verbose && printf(verbose, "Number of units: %d\n", length(cells));
      verbose && exit(verbose);
    }

    cells;
  }, chunkSize=100e3, verbose=less(verbose));

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Store read units in cache
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (.cache) {
    # In-memory or on-file cache?
    if (object.size(cells) < 10e6) { 
      # In-memory cache for objects < 10Mb.
      this$.cellIndices <- list();
      this$.cellIndices[[id]] <- cells;
      verbose && cat(verbose, "Cached in memory");
    } else {
      # On-file cache
      # Keep, in-memory cache.
      if (!is.list(this$.cellIndices))
        this$.cellIndices <- list();
      this$.cellIndices[[id]] <- NULL;
      saveCache(cells, key=list(id), dirs=dirs);
      verbose && cat(verbose, "Cached to file");
    }
  }

  verbose && exit(verbose);

  cells;
})


setMethodS3("mergeStrands", "SnpChipEffectFile", function(this, ...) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Local functions
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  mergeStrandsMatrix <- function(y, ...) {
    n <- nrow(y);
    if (n == 2) {
      y[1,] <- colMeans(y[1:2,,drop=FALSE], na.rm=TRUE);
      y[2,] <- NA;
      attr(y, "groups") <- 1;
    } else if (n == 4) {
      y[1,] <- colMeans(y[1:2,,drop=FALSE], na.rm=TRUE);
      y[3,] <- colMeans(y[3:4,,drop=FALSE], na.rm=TRUE);
      y[c(2,4),] <- NA;
    } else if (n > 4 && n %% 2 == 0) {
      # All other even-numbered groups
      odd <- seq(from=1, to=n, by=2);
      for (idx in odd) {
        y[idx,] <- colMeans(y[idx:(idx+1),,drop=FALSE], na.rm=TRUE);
      }
      even <- seq(from=2, to=n, by=2);
      y[even,] <- NA;
    }
    y;
  }

  if (this$mergeStrands) {
    throw("Strands have already been merged for this ", class(this)[1]);
  }

  cfM <- mergeGroups(this, fcn=mergeStrandsMatrix, ...);
  cfM$mergeStrands <- TRUE;
  
  cfM;
}, protected=TRUE)



setMethodS3("readUnits", "SnpChipEffectFile", function(this, ..., force=FALSE, cache=TRUE, verbose=FALSE) {
  # Argument 'verbose':
  verbose <- Arguments$getVerbose(verbose);

  # Check for cached data
  key <- list(method="readUnits", class=class(this)[1], 
              mergeStrands=this$mergeStrands, ...);
  id <- digest2(key);
  res <- this$.readUnitsCache[[id]];
  if (!force && !is.null(res)) {
    verbose && cat(verbose, "readUnits.SnpChipEffectFile(): Returning cached data");
    return(res);
  }

  # Retrieve the data
  res <- NextMethod("readUnits", this, ..., force=TRUE, cache=FALSE, verbose=verbose);

  # Store read units in cache?
  if (cache) {
    verbose && cat(verbose, "readUnits.SnpChipEffectFile(): Updating cache");
    this$.readUnitsCache <- list();
    this$.readUnitsCache[[id]] <- res;
  }

  res;
})


############################################################################
# HISTORY:
# 2008-02-22
# o Updated getCellIndices() and mergeStrands() to handle any even-numbered
#   unit groups beyond two and four groups.
# 2007-01-20
# o Added mergeStrands().
# 2007-01-07
# o Now getCellIndices() caches large objects to file and small in memory.
# 2006-12-18
# o BUG FIX: getCellIndices() would return a single group instead of two,
#   for a single-stranded SNP when mergeStrands=TRUE.  See for instance
#   unit SNP_A-1780520 in the Mapping250K_Nsp chip.
# 2006-11-28
# o Added readUnits() to override caching mechanism of superclasses.
# 2006-09-17
# o Added an in-memory cache for getCellIndices().
# 2006-09-12
# o Updated.  Now the names of the groups reflects the allele names as 
#   expected.
# 2006-09-11
# o Created.
############################################################################