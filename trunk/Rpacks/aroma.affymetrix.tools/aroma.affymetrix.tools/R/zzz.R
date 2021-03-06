# Allows conflicts. For more information, see library() and
# conflicts() in [R] base.
.conflicts.OK <- TRUE


.First.lib <- function(libname, pkgname) {
  pi <- utils::packageDescription(pkgname);
  packageStartupMessage(pkgname, " v", pi$Version, " (", 
    pi$Date, ") successfully loaded. See ?", pkgname, " for help.");
}
