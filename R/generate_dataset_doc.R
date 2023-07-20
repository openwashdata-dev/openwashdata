# inspired by https://github.com/rudeboybert/fivethirtyeight/blob/master/R/data.R


#' Create Docu
#'
#'
#' @param dataset_name character vector names of the dataset.
#' @param dataset_title character vector short, one line description of the dataset.
#' @param dict_path character path to the dictionary .csv files.
#' Defaults to NULL (bootstrap folder).
#' @param output_path character path for the output. Defaults to NULL,
#' using the R/ folder.
#' @importFrom readr read_csv
#' @export
generate_dataset_documentation <- function(dataset_name,
                                           dataset_title,
                                           dict_path = NULL,
                                           output_path = NULL,
                                           split_by_dataset = TRUE){
  if(is.null(dict_path)){
    dict_path <- "bootstrap/dictionary.csv"
  }

  if(is.null(output_path)){
    output_path <- "R"
  }

  dict <- read_csv(dict_path)
  # function is defined in here
  # to benefit from lexical scoping
  gen_output_vector <- function(d, d_name, d_title){
    nvars <- length(unique(d$variable_name))
    out_title <- sprintf("#' %s: %s", d_name, d_title)
    # TODO add observations to meta information then extract it from there
    out_format <- sprintf("#' @format a dataset with %d variables", nvars)
    out_text <- sprintf("#'\n#' Basic Dataset Description goes here.\n#'")
    items <- apply(d,1, function(x){
      sprintf("#' \\item{%s}{%s %s}", x['variable_name'], x['variable_type'],
              x['description'])
    })
    out_description <- sprintf("#' \\describe{
%s
#' }",
                               paste(items, collapse = "\n"))
    out <- sprintf('%s\n%s\n%s\n%s\n"%s"',
                   out_title,
                   out_text,
                   out_format,
                   out_description,
                   dataset_name)
    out
  }


  d_list <- split(dict, dict$file_name)
  stopifnot(length(dataset_name) == length(d_list))
  stopifnot(length(dataset_title) == length(d_list))

  l <- lapply(seq_along(d_list), function(x){
    o <- gen_output_vector(d_list[[x]], d_name = dataset_name[x], dataset_title[x])
    cat(o, file = file.path(output_path, paste0(dataset_name[x],".R")))
    message(sprintf("Dataset %s written", dataset_name[x]))
  })

}

#' Generate Dataset Documentation
generate_datapkg_documentation <- function(){

}
