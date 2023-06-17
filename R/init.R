#' Copy Workflow Template
#'
#' Copies workflow template file into the current working directory
#' and opens the file if RStudio is the editor.
#'
#' @export
init <- function(target = file.path(getwd(),"bootstrap_pkg.R")){
  p <- system.file("workflow_template.R", package = "openwashdata")
  file.copy(p, target)
}
