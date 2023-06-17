
#' Create a New openwashdata Dataset R Package Skeleton.
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
#' @param pkg_title character package headline.
#' @param description character what the package does.
#' @param maintainer call to utils::person(), see examples on how to format the arg.
#' @param location The location where the package should be created.
#' @param boolean should a basic README.md file be added? Defaults to TRUE.
#' #' @param boolean should a basic raw data folder be added? Defaults to TRUE.
#' @param open A logical value indicating whether to open the package directory in a new window.
#' @importFrom gert git_init git_config_global
#' @importFrom usethis create_package proj_set proj_get create_github_token use_github use_git_config
#' @importFrom gitcreds gitcreds_set
#' @importFrom gh gh_whoami
#' @export
create_data_pkg <- function(pkg_name,
                            pkg_title,
                            description = NULL,
                            maintainer,
                            location = NULL,
                            pkg_license = use_ccby_license(),
                            readme_md = TRUE,
                            use_data_raw = TRUE,
                            open = FALSE
                            ){
  if(!check_pkg_name(pkg_name)){
    message("
The suggested package name does not comply with openwashdata naming conventions.
Make sure to use lowercase letters without numbers or whitespaces only.")
    stop("stopping... No package generated.")
  }

  current_wd <- getwd()

  if(is.null(location)){
    pkg_path <- file.path(dirname(getwd()), pkg_name)
  } else {
    pkg_path <- file.path(location, pkg_name)
  }

  # basic pkg
  create_package(pkg_path,
                 fields = list(Title = pkg_title,
                               Description = description,
                               "Authors@R" = maintainer,
                               License = pkg_license),
                 open = open)
  proj_set(pkg_path)
  if(readme_md){
    use_readme_md()
  }
  if(use_data_raw){
    use_data_raw()
  }

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



