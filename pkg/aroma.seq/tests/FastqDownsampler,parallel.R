library("aroma.seq")
setOption("R.filesets/parallel", "BiocParallel")

fullTest <- (Sys.getenv("_R_CHECK_FULL_") != "")
fullTest <- fullTest && (Sys.getenv("_R_CHECK_BUGGY_") != "")
fullTest <- fullTest && isPackageInstalled("ShortRead")
fullTest <- fullTest && isPackageInstalled("BatchJobs")
if (fullTest) {

# Setup (writable) local data directory structure
setupExampleData()

dataSet <- "TopHat-example"
organism <- "LambdaPhage"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Setup FASTQ set
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
fqs <- FastqDataSet$byName(dataSet, organism=organism, paired=FALSE)
print(fqs)


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Downsample
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
ds <- FastqDownsampler(fqs, subset=25, tags=c("*", "parallel"))
print(ds)

fqsS <- process(ds, verbose=-10)
print(fqsS)

# Sanity checks
stopifnot(identical(getFullNames(fqsS), getFullNames(fqs)))
fqS <- fqsS[[1]]
stopifnot(nbrOfSeqs(fqS) == getSampleSize(ds))

} # if (fullTest)
