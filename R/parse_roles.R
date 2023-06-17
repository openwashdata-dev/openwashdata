#' Parse Roles from DESCRIPTION
#'
#' @param desc_path character path to DESCRIPTION file.
#' @param roles character vector of roles to look for.
#' @importFrom desc desc
#' @importFrom cffr cff_parse_person
parse_roles <- function(desc_path = "DESCRIPTION",
                        roles = c("aut", "cre", "ctb", "fnd")) {
  pkg <- desc(desc_path)

  # This extracts all the persons
  persons <- as.person(pkg$get_authors())

  locate_roles <- vapply(persons, function(x, r = roles) {
    any(x$role %in% roles)
  }, logical(1))

  person_roles <- persons[locate_roles]

  parse_all_roles <- lapply(person_roles, cff_parse_person)
  parse_all_roles <- unique(parse_all_roles)

  class(parse_all_roles) <- "cff"
  parse_all_roles
}
