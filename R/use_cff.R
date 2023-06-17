#' Add cff CITATION File
#'
#' This function adds a .cff file in usethis fashion
#' @export
#' @importFrom cffr cff_create cff_validate cff_write
use_cff <- function(){
  default <- cff_create("DESCRIPTION",
                        dependencies = FALSE)
  a <- parse_roles()
  mod <- default
  mod$authors <- a
  newkeys <- list(
    "type" = "dataset"
  )
  modobject <- cff_create(mod, keys = newkeys)
  cff_validate(modobject)
  cff_write(modobject)
}
