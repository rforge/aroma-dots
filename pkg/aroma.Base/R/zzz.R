# Allows conflicts. For more information, see library() and
# conflicts() in [R] base.
#
.conflicts.OK <- TRUE

# .onAttach (when NAMESPACE is used)
.First.lib <- function(libname, pkgname) {
  pkg <- Package(pkgname);
  assign(pkgname, pkg, pos=getPosition(pkg));
  cat(getName(pkg), " v", getVersion(pkg), " (", getDate(pkg), ")",
      " successfully loaded. See ?", pkgname, " for help.\n", sep="");
}




