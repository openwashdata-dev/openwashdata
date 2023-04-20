library(usethis)


create_data_pkg <- function(pkg_name, location = NULL,
                            open = FALSE){
  if(is.null(location)){
    pkg_path <- file.path(dirname(getwd()), pkg_name)
  } else {
    pkg_path <- pkg_name
  }


  curr_dir <- getwd()
  create_package(pkg_path, open = open)
  setwd(pkg_path)
  git()
  setwd(curr_dir)
}


create_data_pkg("moodata")
