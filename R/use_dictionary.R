

#' Extract Dictionary from Data Folder to Create a Pre-Filled Skeleton
#'
#' @param data_location character folder location of the raw_data folder.
#' @param skeleton_dest character folder destination of the skeleton file.
#' @param data_file_pattern character which data files should be parsed.
#' For now, only .Rda is available.
#' @param ignore_pattern character regular expression of file names to ignore
#' @param recursive boolean should this function iterate through
#' subfolders of data-raw? Defaults to TRUE.
#' @importFrom readr read_rds
#' @importFrom dplyr as_tibble
#' @export
use_dictionary_skeleton <- function(data_location = NULL,
                                    skeleton_dest = "bootstrap/dictionary.csv",
                                    data_file_pattern = ".Rds",
                                    ignore_pattern = "codebook.Rda",
                                    recursive = TRUE){
  # TODO add function to expose the dictionary to
  # google sheets for data collection.
  if(is.null(data_location)){
    data_path <- file.path(getwd(),"data")
  } else {
    data_path <- data_location
  }
  f <- list.files(data_path,
                  pattern = data_file_pattern,
                  recursive = recursive)
  tf <- !grepl(ignore_pattern, f)
  data_files <- f[tf]
  list_of_tibbles <- lapply(data_files, function(d){
    # d = file name
    # dname = directory name
    # expand grid of colnames and types
    dname <- gsub("\\.", data_path, dirname(d))
    dta <- as_tibble(readRDS(file.path(data_path,d)))
    nobs <- nrow(dta)
    types <- sapply(dta, typeof)
    tibble(
      directory = dname,
      file_name = d,
      variable_name = names(types),
      variable_type = types,
      nobs = nobs,
      description = rep(NA_character_, length(types))
    )
  })
    vars_tbl <- bind_rows(list_of_tibbles)
    write_csv(vars_tbl, skeleton_dest)
}
