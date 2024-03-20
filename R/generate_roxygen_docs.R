#' Generate roxygen2 documentation from a CSV file
#'
#' This function takes a CSV table with columns `variable_name` and `description` as input,
#' optionally filters it by `variable_name`, and outputs roxygen2 documentation for `\describe` and `\item`.
#'
#' @param input_file_path Path to the input CSV file.
#' @param output_file_path Path to the output file that will contain the roxygen2 documentation.
#' @param df_name Optional name of the variable to filter the input dataframe by. Default is NULL.
#'
#' @return NULL
#'
#' @examples \dontrun{
#' # Generate roxygen2 documentation from example.csv
#' generate_roxygen_docs("example.csv", "output.R")
#' # Generate roxygen2 documentation from example.csv for a specific variable name
#' generate_roxygen_docs("example.csv", "output.R", df_name = "specific_variable")
#' }
#'
#' @export

generate_roxygen_docs <- function(input_file_path, output_file_path, df_name = NULL) {

  # Read input CSV file
  input_df <- read.csv(input_file_path)

  # Check if df_name is provided and not NULL, then filter input_df
  if (!is.null(df_name)) {
    library(dplyr)
    input_df <- filter(input_df, file_name == paste0(df_name, ".rda"))
    # Update output_file_path to have the same name as df_name with .R extension
    output_file_path <- paste0("R/", df_name, ".R")
  }

  # Initialize output character vector
  output <- character()

  # Create \describe block
  output <- c(output, paste0("#' ", "\\describe{"))

  # Iterate over input rows and create \item blocks
  for (i in seq_len(nrow(input_df))) {
    variable_name <- input_df[i, "variable_name"]
    description <- input_df[i, "description"]

    # Create \item block
    item <- paste0("#'   ", "\\item{", variable_name, "}{", description, "}")

    # Append to output
    output <- c(output, item)
  }

  # Close \describe block
  output <- c(output, "#' }")

  # set output file path
  output_file_path <- paste0("R/", df_name, ".R")

  # Write output to file
  writeLines(output, output_file_path)
}
