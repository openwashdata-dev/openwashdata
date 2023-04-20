#' Create a new R package.
#'
#' This function creates a new R package with the specified name and author information.
#'
#' @param pkg_name The name of the package to create.
#' @param user.name The name of the package author.
#' @param user.email The email address of the package author.
#' @param location The location where the package should be created.
#' @param open A logical value indicating whether to open the package directory in a new window.
#' @importFrom gert git_init
#' @importFrom usethis create_package
#' @export
#' @examples
#' create_data_pkg("my_package", "John Doe", "johndoe@example.com")
create_data_pkg <- function(pkg_name,
                            user.name = "Your Name",
                            user.email = "Your Email",
                            location = NULL,
                            open = FALSE){
  if(is.null(location)){
    pkg_path <- file.path(dirname(getwd()), pkg_name)
  } else {
    pkg_path <- pkg_name
  }

  use_git_config(
    scope = "project",
    user.name = user.name,
    user.email = user.email
  )


  create_package(pkg_path, open = open)
  git_init(pkg_path)
  # curr_dir <- getwd()
  # setwd(pkg_path)
  # use_github("openwashdata",protocol = "ssh")
  # setwd(curr_dir)
}


# issue is get_remotes()
# because the current directory has a remote orign, it is being used.
debug(use_github)
create_data_pkg("moodata")
