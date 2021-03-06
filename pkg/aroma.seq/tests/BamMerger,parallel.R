library("aroma.seq")
setOption("R.filesets/parallel", "BiocParallel")

fullTest <- (Sys.getenv("_R_CHECK_FULL_") != "")
fullTest <- fullTest && isCapableOf(aroma.seq, "bowtie2")
fullTest <- fullTest && isPackageInstalled("BiocParallel")
fullTest <- fullTest && isPackageInstalled("BatchJobs")
if (fullTest) {

setupExampleData()
dataSet <- "TopHat-example"
organism <- "LambdaPhage"
fa <- FastaReferenceFile$byOrganism(organism)
fqs <- FastqDataSet$byName(dataSet, organism=organism)
bams <- doBowtie2(fqs, reference=fa, verbose=-20)
print(bams)

bams <- setFullNamesTranslator(bams, function(names, ...) {
  sprintf("SampleA,%s", names)
})
print(getFullNames(bams))

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Setting up BamMerger:s
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
bm <- BamMerger(bams, groupBy="name", tags=c("*", "parallel"))
print(bm)
groups <- getGroups(bm)
print(groups)


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Merging
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
bamsM <- process(bm, verbose=-20)
print(bamsM)


} # if (fullTest)
