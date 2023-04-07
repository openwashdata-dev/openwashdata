#' An internal function to generate  citation.cff file
#'
#' @description The functions adds additional tags to the citation file
#' @keywords internal

# description -------------------------------------------------------------

# This function was the response to a GitHub issue:
# https://github.com/ropensci/cffr/issues/49

# code --------------------------------------------------------------------

# library(cffr)
#
# # Download desc
# tempdesc <- "DESCRIPTION"
#
# # Default behaviour
# default <- cff_create(tempdesc, dependencies = FALSE)
#
# length(default$authors)
#
# default
#
# # Get all persons with given roles
# # desc_path: the path to the DESCRIPTION FILE
# # roles: vector with the roles to extract
#
# parse_desc_roles <- function(desc_path = ".", roles = c("aut", "cre")) {
#   pkg <- desc::desc(desc_path)
#
#   # This extracts all the persons
#   persons <- as.person(pkg$get_authors())
#
#   locate_roles <- vapply(persons, function(x, r = roles) {
#     any(x$role %in% roles)
#   }, logical(1))
#
#   person_roles <- persons[locate_roles]
#
#   parse_all_roles <- lapply(person_roles, cff_parse_person)
#   parse_all_roles <- unique(parse_all_roles)
#
#   class(parse_all_roles) <- "cff"
#   parse_all_roles
# }
#
# # Get the persons with your desired roles
# newauth <- parse_desc_roles(
#   tempdesc,
#   roles = c("aut", "cre", "ctb", "fnd")
# )
#
# newauth
#
# # Modify the default object
# mod <- default
#
# mod$authors <- newauth
#
# length(mod$authors)
#
# newkeys <- list(
#   #"data.doi" = "https://doi.org/10.5281/zenodo.7708629",
#   "type" = "dataset"
# )
#
# modobject <- cff_create(mod, keys = newkeys)
#
# cff_validate(modobject)
#
# # Write the new object.
#
# cff_write(modobject)

