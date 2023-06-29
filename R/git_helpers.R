#' Add git to the Data Package Skeleton
#'
#' Initialize a git repository convenience wrapper
#'
#' @param user.name character user name. Defaults to NULL, using global defaults.
#' @param user.email character user name. Defaults to NULL, using global defaults.
#' @importFrom usethis use_git use_git_config
#' @export
init_git <- function(user.name = NULL,
                     user.email = NULL){
  if(is.null(user.name)){
    usr_tbl <- git_config_global()
    user.name <- as.character(usr_tbl[1,2])
  }

  if(is.null(user.email)){
    usr_tbl <- git_config_global()
    user.email <- as.character(usr_tbl[2,2])
  }


  use_git()


}

#' Push Data Package to openwashdata on GitHub
#'
#' Pushes and a data package to the opendata GitHub repository. Note that you
#' will need an openwasdata personal access token to do so.
#'
#' @importFrom gh gh_whoami
#' @importFrom usethis create_github_token use_github
#' @importFrom gitcreds gitcreds_set
#' @export
push_package <- function(){
  tkn <- gh_whoami()
  if(is.null(tkn)){
    create_github_token()
    gitcreds_set()
  } else {
    message("GitHub Personal Access Token (PAT) already exists and set.")
  }
  use_github("openwashdata", protocol = "ssh")
}



