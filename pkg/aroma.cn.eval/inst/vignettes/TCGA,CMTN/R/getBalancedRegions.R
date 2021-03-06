##############################################################
# sample data to get the same number of points in each state
##############################################################
setMethodS3("getBalancedRegions", "SegmentedGenomicSignalsInterface", function(this, minNbP=NULL, ..., verbose=FALSE) {
  if (is.null(minNbP)) {
    states <- getStates(this);
    minNbP <- table(states);
  }

  res <- NULL;
  states <- getUniqueStates(this);
  # Sanity check
  for (ss in seq(along=states)) {
    state <- states[ss];
    thisByState <- extractSubsetByState(this, state);
    nbUnits <- length(thisByState$y);
    if (!is.na(state)) {
      subset <- sample(nbUnits, minNbP, ...);
      thisByState <- extractSubset(thisByState, subset);
    }
    if (is.null(res)) {
      res <- thisByState;
    } else {
      append(res, thisByState);
    }
  } # for (ss ...)

  res;
})


############################################################################
# HISTORY:
# 2009-10-26
# o Resampling with replacement now allowed (implicitly through '...').
# 2009-06-30
# o Created.
############################################################################
