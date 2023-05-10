#' Check Naming Convention rules
#'
#' Helps package creation function to reject names that do not comply.
#' @param pkg_name character name of a package.
check_pkg_name <- function(pkg_name){
  # add other rules here and make sure they return a logical
  no_caps_numebers_spaces <- grepl("^[^A-Z[:space:]0-9\\-]*$", pkg_name)
  # add up logicals by using any when we got more than one.
  no_caps_numebers_spaces
}
