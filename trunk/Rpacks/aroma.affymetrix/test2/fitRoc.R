library(ROC);

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
# Local functions
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
fitRoc <- function(truth, data, ncuts=1200, cutpts=NULL, call=1, ..., .checkArgs=TRUE) {
  # Call females?
  if (call == 1) {
    # Default rule: function(x, thresh) ifelse(x > thresh, 1, 0);
    # That is, call female in case *above* threshold
  } else {
    # Complement rule: function(x, thresh) ifelse(x < thresh, 1, 0);
    # That is, call male in case *below* threshold
    truth <- 1-truth;
    data <- -data;
  }

  if (.checkArgs) {
    truth <- as.vector(truth);
    data <- as.vector(data);
    if (length(truth) != length(data)) {
      throw("Argument 'truth' and 'data' are of different lengths: ");
    }
  
    ok <- (is.finite(truth) & is.finite(data));
    truth <- truth[ok];
    data <- data[ok];
    rm(ok);
  }

  if (is.null(cutpts)) {
    probs <- seq(from=0, to=1, length=ncuts);
    cutpts <- quantile(data, probs=probs, na.rm=TRUE);
  }

  fit <- rocdemo.sca(truth=truth, data=data, cutpts=cutpts, ...);

  fit@markerLabel <- xlab;
  fit@caseLabel <- ylab;
  if (call == 0) {
    fit@cuts <- -fit@cuts;
  }

  fit;
} # fitRoc()



findTpAtFp <- function(truth, data, fpRate=0.05, nsteps=50, acc=1e-5, ..., verbose=FALSE, .checkArgs=TRUE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (.checkArgs) {
    # Argument 'verbose':
    verbose <- Arguments$getVerbose(verbose);
    if (verbose) {
      pushState(verbose);
      on.exit(popState(verbose));
    }
  }


  verbose && printf(verbose, "Data dimensions: %dx%d\n", 
                                                 nrow(data), ncol(data));

  # Vectorize
  data <- as.vector(data);
  truth <- as.vector(truth);
  if (length(truth) != length(data)) {
    throw("Argument 'truth' and 'data' are of different lengths: ", 
                                 length(truth), " != ", length(data));
  }

  ok <- (is.finite(truth) & is.finite(data));
  n <- length(ok);
  nok <- sum(ok);
  if (nok < n) {
    data <- data[ok];
    truth <- truth[ok];
  }
  bad <- which(!ok);

  res <- list(
    tpRate=NA,
    fpRate=NA,
    threshold=NA,
    acc=acc,
    tpRateRange=NA,
    fpRateRange=NA,
    thresholdRange=NA,
    excludedNAs=bad
  );

  if (nok == 0) {
    return(res);
  }


  verbose && enter(verbose, "Finding TP rate at FP rate...");  
  r <- range(data, na.rm=TRUE);

  lastR <- c(-Inf,+Inf);
  while (all(!is.na(r)) && (diff(r) > 2*acc) && !identical(r, lastR)) {  
    verbose && printf(verbose, "FP range: [%.2g,%.2g]\n", r[1], r[2]);  
    cutpts <- seq(from=r[1], to=r[2], length=nsteps);
    fit <- fitRoc(truth=truth, data=data, cutpts=cutpts, ..., .checkArgs=FALSE);
    betas <- 1-fit@spec;
    isLess <- which(fpRate <= betas);
    from <- isLess[length(isLess)];
    isMore <- which(betas <= fpRate);
    to <- isMore[1];
    lastR <- r;
    r <- cutpts[c(from,to)];
    r <- c(r[1], r[2]);  # In case length(r) == 1
    verbose && printf(verbose, "Next FP range: [%.2g,%.2g]\n", r[1], r[2]);  
  }
  verbose && exit(verbose);

  fpRateRange <- range(1-fit@spec, na.rm=TRUE);
  tpRateRange <- range(fit@sens, na.rm=TRUE);
  res$tpRateRange <- tpRateRange;
  res$fpRateRange <- fpRateRange;
  res$thresholdRange <- r;

  if (any(is.na(r))) {
    # Case a) TP rate is zero
    res$tpRate <- 0;
    res$fpRate <- fpRate;
    res$threshold <- mean(r, na.rm=TRUE);
  } else if (fpRateRange[1] == fpRateRange[2]) {
    # Case b) Exact (FP,TP) rate
    res$rho <- 0;
    res$fpRate <- fpRateRange[1];
    res$tpRate <- fit@sens[1];
    res$threshold <- r[1];
  } else {
    # Case c) Interpolate (FP,TP) rate
    rho <- (fpRate-fpRateRange[1])/(fpRateRange[2]-fpRateRange[1]);
    res$rho <- rho;
    w2 <- rho;
    w1 <- 1-w2;
    res$fpRate <- w1*fpRateRange[1] + w2*fpRateRange[2]; 
    res$tpRate <- w1*tpRateRange[1] + w2*tpRateRange[2];
    res$threshold <- r[1] + rho*(r[2]-r[1]);
  }


  res;
} # findTpAtFp()


fitTpDensity <- function(C, M, fpRate=0.01, ..., d=NULL) {
  if (is.null(d)) {
    d <- rep(NA, nrow(M));
  }

  jjs <- which(is.na(d));

  # Done?
  if (length(jjs) == 0)
    return(d);

  # Remove dimnames and translate to make things faster
  dimnames(C) <- NULL;
  dimnames(M) <- NULL;
  C <- t(C);
  M <- t(M);

  for (jj in jjs) {
    if (jj %% 100 == 0)
      print(c(mm, jj, fpRate));
    d[jj] <- .subset2(findTpAtFp(C[,jj], M[,jj], fpRate=fpRate, ..., .checkArgs=FALSE), "tpRate"); 

  } # for (mm in ...)

  # Return updates
  d;
} # fitTpDensity()



findSmoothingForTpAtFp <- function(truth, data, x, fpRate=0.05, minTpRate=0.95, nstepsR=2, accTp=0.001, accR=0.01, ..., verbose=FALSE, .checkArgs=TRUE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (.checkArgs) {
    # Argument 'verbose':
    verbose <- Arguments$getVerbose(verbose);
    if (verbose) {
      pushState(verbose);
      on.exit(popState(verbose));
    }
  }

  # Reorder data by position
  o <- order(x);
  x0 <- x[o];

  data0 <- data[o,];
  truth0 <- truth[o,];
  n <- nrow(truth0);

  hTp <- matrix(0, nrow=1, ncol=3);

  h <- c(1,5,10);
  lastR <- Inf;  
  iter <- 1;
  while (diff(range(h)) > accR) {
    verbose && enter(verbose, sprintf("Iteration #%d", iter));
    verbose && printf(verbose, "minTpRate: %.4f\n", minTpRate);
    verbose && printf(verbose, "accTpRate: %.4f\n", accTp);
    verbose && printf(verbose, "Levels: %s\n", paste(h, collapse=","));

    idxs <- getBlockAverageMap(n=n, h=h[2]);
    hApprox2 <- attr(idxs, "hApprox");
    data <- blockAvg(data0, idxs);
    truth <- blockAvg(truth0, idxs);

    fit <- findTpAtFp(truth, data, fpRate=fpRate, ..., verbose=less(verbose), .checkArgs=TRUE);
    tpRate2 <- fit$tpRate;
    verbose && printf(verbose, "tpRate @ %.4f (~%.4f): %.4f\n", h[2], hApprox2, tpRate2);

    if (!h[2] %in% hTp[,1]) {
      t <- c(h[2], hApprox2, tpRate2);
      hTp <- rbind(hTp, t);
      o <- order(hTp[,1]);
      hTp <- hTp[o,];
    }

    if (tpRate2 > minTpRate) {
      # All done?
      if (abs(tpRate2-minTpRate) < accTp)
        break;
      hUse <- h[1];
    } else {
      hUse <- h[3];
    }

    idxs <- getBlockAverageMap(n=n, h=hUse);
    hApprox <- attr(idxs, "hApprox");
    data <- blockAvg(data0, idxs);
    truth <- blockAvg(truth0, idxs);

    fit <- findTpAtFp(truth, data, fpRate=fpRate, ..., verbose=less(verbose), .checkArgs=TRUE);
    tpRate <- fit$tpRate;
    verbose && printf(verbose, "tpRate @ %.4f (~%.4f): %.4f\n", hUse, hApprox, tpRate);

    if (!hUse %in% hTp[,1]) {
      t <- c(hUse, hApprox, tpRate);
      hTp <- rbind(hTp, t);
      o <- order(hTp[,1]);
      hTp <- hTp[o,];
    }

    if (tpRate > minTpRate) {
      # All done?
      if (abs(tpRate-minTpRate) < accTp)
        break;
    }

    if (tpRate2 > minTpRate) {
      h <- c(h[1], h[2]);
      # Approximate estimate; need adjustment 10% of boundary?
      if (tpRate > minTpRate)
        h[1] <- h[1] - 0.05*diff(h);
    } else {
      h <- c(h[2], h[3]);
      # Approximate estimate; need adjustment 10% of boundary?
      if (tpRate < minTpRate)
        h[2] <- h[2] + 0.05*diff(h);
    }
    h <- c(h[1], (h[1]+h[2])/2, h[2]);

    print(hTp);

    iter <- iter + 1;
    verbose && exit(verbose);
  } # while(...)

  hTp;
} # findSmoothingForTpAtFp()



scanTpAtFp <- function(truth, data, x, hs=seq(from=1,to=10,by=0.1), hTp=NULL, ..., shifts=0, verbose=FALSE, .checkArgs=TRUE) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (.checkArgs) {
    # Argument 'verbose':
    verbose <- Arguments$getVerbose(verbose);
    if (verbose) {
      pushState(verbose);
      on.exit(popState(verbose));
    }
  }

  verbose && enter(verbose, "Calculating TP rates for different amount of smoothing");

  # Reorder data by position
  o <- order(x);
  x0 <- x[o];

  data0 <- data[o,];
  truth0 <- truth[o,];
  n <- nrow(truth0);

  verbose && printf(verbose, "Data dimensions: %dx%d\n", nrow(data0), ncol(data0));
  if (!identical(dim(data0), dim(truth0)))
    throw("Internal error: ");

  if (is.null(hTp)) {
    hTp <- matrix(NA, nrow=length(hs), ncol=5);
    hTp[,1] <- hs;
    colnames(hTp) <- c("h", "hApprox", "xMean", "xMedian", "tpRate");
  } else {
    hs <- hs[!(hs %in% hTp[,1])];
    # Expand hTp for these new ones
    t <- matrix(NA, nrow=length(hs), ncol=5);
    t[,1] <- hs;
    hTp <- rbind(hTp, t);
    rm(t);
    o <- order(hTp[,1]);
    hTp <- hTp[o,];
    rm(o);
  }

  # Skip already existing ones.

  for (kk in seq(along=hs)) {
    h <- hs[kk];

    verbose && enter(verbose, sprintf("Iteration #%d of %d", kk, length(hs)));
    verbose && printf(verbose, "h: %.4f\n", h);
    if (h > 1) {
      data <- truth <- c();
      for (s in shifts) {
        idxs <- getBlockAverageMap(n=n, h=h, s=s);
        data <- rbind(data, blockAvg(data0, idxs));
        truth <- rbind(truth, blockAvg(truth0, idxs));
      }
#      x <- x / length(shifts);
#      data <- data / length(shifts);
#      truth <- truth / length(shifts);
      x <- blockAvg(x0, idxs);
      hApprox <- attr(idxs, "hApprox");
    } else {
      hApprox <- h;
      x <- x0;
      data <- data0;
      truth <- truth0;
    }
    
    fit <- findTpAtFp(truth, data, ..., verbose=less(verbose), .checkArgs=FALSE);
    tpRate <- fit$tpRate;

    dx <- diff(as.vector(x));

    rr <- which(h == hTp[,1]);
    hTp[rr,] <- c(h, hApprox, mean(dx, na.rm=TRUE), median(dx, na.rm=TRUE), tpRate);
    verbose && print(verbose, hTp);

    verbose && exit(verbose);
  } # while(...)

  gc <- gc();
  verbose && print(verbose, gc);

  verbose && exit(verbose);

  hTp;
} # scanTpAtFp()

############################################################################
# HISTORY:
# 2007-04-15
# o Added scanTpAtFp().
# 2007-04-14
# o Added interpolation in findTpAtFp().
# o Removed gc() from fitRoc().
# o Added findTpAtFp() to locate TP rate for given FP rate.
# 2007-03-2x
# o Added fitRoc().
# o Created.
############################################################################
