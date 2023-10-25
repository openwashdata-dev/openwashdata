#' Initialize Data Package
#'
#'
#' @param pkg_dir_name character folder name of the package
#' @param path character parent directory of the package folder.
#' @importFrom usethis use_data_raw use_build_ignore proj_set proj_get proj_activate create_package
#' @export
init_data_pkg <- function(pkg_dir_name, path = NULL){
  curr_proj <- proj_get()
  cwd <- getwd()
  if(is.null(path)){
    parent_dir <- dirname(getwd())
    pkg_path <- file.path(parent_dir, pkg_dir_name)
  } else {
    pkg_path <- file.path(path, pkg_dir_name)
  }

  # The below fields argument avoids setting a default
  # author who is cumbersome to remove.
  create_package(pkg_path, fields = list("Authors@R" = NULL))

  # create folder and move bootstrap equipment inside the data pkg
  # and to add rbuildignore
  #dir.create(pkg_path)
  dir.create(file.path(pkg_path, "bootstrap"))
  bootstrap_path <- file.path(pkg_path, "bootstrap")
  p <- system.file("workflow_template.R", package = "openwashdata")
  file.copy(p, file.path(bootstrap_path, "bootstrap_pkg.R"))

  proj_set(pkg_path)
  use_build_ignore("bootstrap")
  use_data_raw(name = pkg_dir_name, open = FALSE)
  use_authors_skeleton()
  # set the project back to where we were because
  # we're spinning up a new RStudio session anyway.
  proj_set(curr_proj)
}
