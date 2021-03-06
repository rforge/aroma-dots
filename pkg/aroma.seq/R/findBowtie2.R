findBowtie2 <- function(..., command=c("bowtie2", "bowtie2-align", "bowtie2-build", "bowtie2-inspect")) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'command':
  command <- match.arg(command);

  versionPattern <- c("-version"=".*version ([0-9.]+).*");
  findExternal(command=command, versionPattern=versionPattern, ...);
} # findBowtie2()


queryBowtie2 <- function(what=c("support:fastq.gz"), ...) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'what':
  what <- match.arg(what);

  bin <- findBowtie2();
  ver <- attr(bin, "version");

  res <- FALSE;
  if (is.null(ver)) ver <- NA;

  if (what == "support:fastq.gz") {
    perl <- findPerl();
    suppressWarnings({
    resT <- system2(perl, args='-e "use POSIX; mkfifo(\'/tmp/aroma.seq-bowtie2-query\', 0700);"', stdout=TRUE, stderr=TRUE);
    });
    resT <- paste(resT, collapse="\n");
    supported <- (regexpr("POSIX::mkfifo not implemented", resT) == -1L);
    res <- supported;
    if (!supported) {
      why <- sprintf("Your bowtie2 (v%s) does not support reading gzipped FASTQ files on this platform (%s)", ver, .Platform$OS.type);
      attr(res, "why") <- why;
    }
  }

  attr(res, "version") <- ver;

  res;
} # queryBowtie2()


############################################################################
# HISTORY:
# 2013-07-18
# o BUG FIX: queryBowtie2("support:fastq.gz") did not always
#   return a logical.
# 2013-06-25
# o Added queryBowtie2().
# 2013-04-01
# o BUG FIX: findBowtie2() was incorrectly hardwired to 'bowtie2-align'.
# o Now findBowtie2() sets attribute 'version', iff possible.
# 2012-09-27
# o Now looking for bowtie2-align instead of bowtie2, because the latter
#   is a perl script calling the former.
# 2012-09-24
# o Created.
############################################################################
