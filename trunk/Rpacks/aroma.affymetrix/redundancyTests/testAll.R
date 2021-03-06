if (interactive()) {
  savehistory();
} else {
  # GLAD v1.12.0 depends on the 'tcltk' package, but that
  # cannot be loaded if there is no display.  A workaround
  # is to fake that the 'tcltk' package is loaded:
  attach(list(), name="package:tcltk");
}
library(aroma.affymetrix);
#source("init.R");

# Use special file cache for testing
options("R.cache::rootPath"="~/.Rcache,scratch");
options("R.cache::touchOnLoad"=TRUE);


args <- commandArgs(asValues=TRUE, excludeReserved=TRUE, excludeEnvVars=TRUE);
print(args);

paths <- c();
allPaths <- c("testScripts/replication/chipTypes", 
              "testScripts/system/chipTypes");
for (path in allPaths) {
  path <- Arguments$getReadablePath(path, mustExist=TRUE);
  paths0 <- list.files(path=path, full.names=TRUE);
  paths <- c(paths, paths0);
}

..pathnames <- lapply(paths, FUN=list.files, pattern="[.]R$", full.names=TRUE);
names(..pathnames) <- basename(paths);
#..pathnames <- ..pathnames[names(..pathnames)];

..chipTypes <- c("Mapping10K_Xba142",
                 "Test3",
                 "HG-U133_Plus_2",
                 "Mapping50K_Hind240,Xba240",
                 "Hs_PromPR_v02",
                 "Mapping250K_Nsp,Sty",
                 "HuEx-1_0-st-v2",
                 "GenomeWideSNP_5",
                 "GenomeWideSNP_6");

#..chipTypes <- rev(..chipTypes);
#..chipTypes <- ..chipTypes[5:6];

if (!is.null(args$chipTypes)) {
  ..chipTypes <- trim(unlist(strsplit(args$chipTypes, split=",")));
}

cat("Processing chip types:\n");
print(..chipTypes);

for (..chipType in ..chipTypes) {
  keep <- (names(..pathnames) == ..chipType);
  ..pathnamesT <- unlist(..pathnames[keep], use.names=FALSE);
  cat("PATHNAMES CHIPTYPE: \n");
  print(..pathnamesT);
  for (pathname in ..pathnamesT) {
    if (regexpr("hetero", pathname) != -1)
      next;
    if (regexpr("expectile", pathname) != -1)
      next;

    cat("** PATHNAME: ", pathname, "\n", sep="");
    tryCatch({
      source(pathname, echo=TRUE);
      cat("** PATHNAME DONE: ", pathname, "\n", sep="");
    }, error = function(ex) {
      cat("************************************************\n");
      cat("** ", rep(c(" ER", "ROR "), times=6), " **\n", sep="");
      print(ex);
      cat("************************************************\n");
      cat("** PATHNAME FAILED: ", pathname, "\n", sep="");
    });
    
    rm(list=setdiff(ls(), c("..chipType", "..chipTypes", 
                    "pathname", "..pathnames", "..pathnamesT")));
    gc();
  }
}
