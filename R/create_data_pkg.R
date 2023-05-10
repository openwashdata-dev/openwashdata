
#' Create a New openwashdata Dataset R Package.
#'
#' This function creates a new data R package with the specified name and author information.
#' It automatically creates a git repository and remote git data repository within the openwashdata
#' GitHub organization. Note that the functions requires a GitHub account that
#' has write access to the openwashdata GitHub organization as well as up and running RSA
#' key pair authentication with GitHub set up. Personal access tokens will be
#' created in the process though.
#'
#'
#' @param pkg_name The name of the package to create.
#' @param user.name The name of the package author.
#' @param user.email The email address of the package author.
#' @param location The location where the package should be created.
#' @param open A logical value indicating whether to open the package directory in a new window.
#' @importFrom gert git_init git_config_global
#' @importFrom usethis create_package proj_set proj_get create_github_token use_github use_git_config
#' @importFrom gitcreds gitcreds_set
#' @importFrom gh gh_whoami
#' @export
#' @examples
#' create_data_pkg("my_package", "John Doe", "johndoe@example.com")
create_data_pkg <- function(pkg_name,
                            location = NULL,
                            pkg_license = use_ccby_license(),
                            open = FALSE
                            ){
  if(!check_pkg_name(pkg_name)){
    message("
The suggested package name does not comply with openwashdata naming conventions.
Make sure to use lowercase letters without numbers or whitespaces only.")
    stop("stopping... No package generated.")
  }

  if(is.null(location)){
    pkg_path <- file.path(dirname(getwd()), pkg_name)
  } else {
    pkg_path <- pkg_name
  }

  # basic pkg
  create_package(pkg_path, open = open)
  proj_set(pkg_path)
  # needs a project to be set.... as most usethis things...
  pkg_license







  # maybe store things to status environment
  # walk through datasteps
  # citation process separately.
  # github push probably separate process




}


add_git <- function(user.name = NULL,
                    user.email = NULL,
                    open = FALSE){
  if(is.null(user.name)){
    usr_tbl <- git_config_global()
    user.name <- as.character(usr_tbl[1,2])
  }

  if(is.null(user.email)){
    usr_tbl <- git_config_global()
    user.email <- as.character(usr_tbl[2,2])
  }

  proj_set(pkg_path)
  use_git_config(
    scope = "project",
    user.name = user.name,
    user.email = user.email
  )
  use_git()
}


push_package <- function(){
  tkn <- gh_whoami()
  if(is.null(tkn)){
    create_github_token()
    gitcreds_set()
  } else {
    message("GitHub Personal Access Token (PAT) already exists and set.")
  }
  use_github("openwashdata", protocol = "ssh")
  proj_set(cwd)
}



