# Scan for CEL files
files <- list.files(pattern="[.](c|C)(e|E)(l|L)$")

# Convert each to RAW file
for (file in files) {
  rawFile <- gsub("[.][^.]*$", ".raw", file)
  file.remove(rawFile)
  cel <- gtypeCelToPQ(file, verbose=TRUE)
  write.table(file=rawFile, cel, sep="\t", quote=FALSE)

  rm(file, rawFile, cel)
  gc()
}

# Clean up
rm(files)
