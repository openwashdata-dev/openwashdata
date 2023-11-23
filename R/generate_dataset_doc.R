#' Create Documentation from Dictionary Bootstrap File
#'
#' Use a dictionary file to create a roxygen2 style R data package documentation entry.
#'
#' @param dataset_name character vector names of the dataset.
#' @param dataset_title character vector short, one line description of the dataset.
#' @param dict_path character path to the dictionary .csv files. Defaults to NULL (bootstrap folder).
#' @param output_path character path for the output. Defaults to NULL, using the R/ folder.
#' @importFrom readr read_csv
#' @export
generate_dataset_documentation <- function(dataset_name,
                                           dataset_title,
                                           dataset_text = "placeholder",
                                           dataset_source = "placeholder 2",
                                           dict_path = NULL,
                                           output_path = NULL){
  if(is.null(dict_path)){
    dict_path <- "bootstrap/dictionary.csv"
  }

  if(is.null(output_path)){
    output_path <- "R"
  }

  dict <- read_csv(dict_path)
  d_list <- split(dict, dict$file_name)
  nms <- gsub(".rda|.Rda|.RData","", names(d_list))


  generate_string <- function(d, d_name, d_title){
    guess <- c(obs = d$nobs[1], vars = length(unique(d$variable_name)))
    items <- sprintf("#' \\item{%s}{%s %s}",
                     d$variable_name,
                     d$variable_type,
                     d$description)
    items_collapsed <- paste(items, collapse = "\n")
    out <- sprintf("#' %s: %s\n#'\n#'%s\n#'\n#' @format A tibble with %s observations and %s variables\n#' \\describe{%s}\n'%s'",
                   dataset_name,
                   dataset_title,
                   dataset_text,
                   guess["obs"],
                   guess["vars"],
                   items_collapsed,
                   dataset_name)
    out
  }


  l <- lapply(seq_along(d_list), function(x){
    o <- generate_string(d_list[[x]],nms[x], dataset_title)
    cat(o, file = file.path(output_path, paste0(dataset_name[x],".R")))
    message(sprintf("Dataset %s written", dataset_name[x]))
  })
}


