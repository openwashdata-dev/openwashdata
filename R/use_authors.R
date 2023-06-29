#' Read Authors from a CSV File and Add Authors to DESCRIPTION
#'
#' Use a specifically formatted .csv file to read in authors and their properties
#' and add them to the current project's DESCRIPTION file. This is implies that
#' the current project is an openwashdata data package skeleton.
#'
#' @param f character file location of the authors .csv file
#' @param quiet logical should the function be quiet about the number of authors
#' found in the csv file? Defaults to FALSE.
#' @importFrom usethis use_author
#' @importFrom dplyr rowwise
#' @importFrom readr read_csv
#' @export
use_authors_from_csv <- function(f = "bootstrap/authors.csv", quiet = FALSE){
  a <- read_csv(f, col_types = "cccc")
  n <- a |>
    rowwise() |>
    transmute(df = use_author(given = first_name,
                              family = last_name,
                              email = email,
                              role = role,
                              comment = ifelse(is.na(orcid),
                                               '',
                                               orcid)
                              )
              ) |>
    nrow()
  if(!quiet){
    message(
      sprintf("%d authors added to the DESCRIPTION file.", n)
    )
  }
}

#' Create a Simple Skeleton to Conveniently Gather Author Information
#'
#'
#' @param dest character full path to authors skeleton file. Defaults to NULL.
#' @importFrom readr write_csv
#' @importFrom dplyr tibble
#' @export
use_authors_skeleton <- function(dest = NULL){
  if(is.null(dest)){
    dest <- file.path(proj_get(),"bootstrap","authors.csv")
  } else {
    dest
  }
  tbl <- tibble(
    first_name = character(),
    last_name = character(),
    email = character(),
    role = character(),
    orcid = character()
  )
  write_csv(tbl, file = dest)
}
