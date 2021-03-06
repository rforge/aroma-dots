filename <- "Mapping50K_Hind240.cdf"
filename <- "Mapping50K_Xba240.CDF"
groups <- readCdfNbrOfCellsPerUnitGroup(filename)

# Number of units read
print(length(groups))
#   59015

# Details on two units
print(groups[56:57])
# $`SNP_A-1650338`
#  C  G  C  G
#  8  8 12 12
# 
# $`SNP_A-1716667`
#  A  G  A  G
# 10 10 10 10

# Number of groups with different number of cells
print(table(unlist(groups)))
#      6     8    10    12    14    16    60
#  16348 59462 84344 59462 16348    20     4


# Number of cells per unit
nbrOfCellsPerUnit <- unlist(lapply(groups, FUN=sum))
print(table(nbrOfCellsPerUnit))
#   16    40    60
#   20 58991     4


# Number of groups per unit
nbrOfGroupsPerUnit <- unlist(lapply(groups, FUN=length))

# Details on a few units
print(nbrOfGroupsPerUnit[20:30])
# AFFX-barcodeP AFFX-barcodeQ AFFX-barcodeR AFFX-barcodeS AFFX-barcodeT
#             1             1             1             1             1
#   AFFX-601964   AFFX-656757   AFFX-721431   AFFX-737848  AFFX-1329481
#             4             4             4             4             4
#  AFFX-1375402
#             4

# Number of units for each unique number of groups
print(table(nbrOfGroupsPerUnit))
#   1     4
#  24 58991

x <- list()
for (size in unique(nbrOfGroupsPerUnit)) {
  subset <- groups[nbrOfGroupsPerUnit==size]
  t <- matrix(unlist(subset), nrow=size) 
  colnames(t) <- names(subset)
  x[[as.character(size)]] <- t
  rm(t)
}

# Check if there are any quartet units where the number
# of cells in Group 1 & 2 or Group 3 & 4 does not have
# the same number of cells.
# Group 1 & 2
print(sum(x[["4"]][1,]-x[["4"]][2,] != 0))
# 0

# Group 3 & 4
print(sum(x[["4"]][3,]-x[["4"]][4,] != 0))
# 0

