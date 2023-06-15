library(devtools)
library(usethis)
library(cffr)
#library(filesstrings)

# Initialize pkg path
cat("Enter the data package name: ");
pkgname <- readLines("stdin", n=1);
pkgpath <- file.path("~", "projects", pkgname);
print(paste0("Package will be created at: ", pkgpath));

# Edit DESCRIPTION file
## Title and Description 
cat("What is your package title: ");
pkgtitle <- readLines("stdin", n = 1);
cat("What is your package description: ");
pkgdescrp <- readLines("stdin", n = 1);

# Create package
usethis::create_package(path = pkgpath,
                        fields = list(Title = pkgtitle, Description = pkgdescrp),
                       open = FALSE);
usethis::proj_set(path = pkgpath);
usethis::use_ccby_license();

# Create data_raw directory and data_processing.R into it
usethis::use_data_raw(name = "data_processing", open=FALSE);
# Create README and remove bad lines
usethis::use_readme_rmd(open = FALSE)
readme <- readLines("./README.Rmd")
readme <- readme[1:39]
write(readme, "./README.Rmd")

# Initialize Git
# usethis::use_git(message = "Add data_raw directory and LICENSE. Please edit DESCRIPTION and readme!")

# TODO:
# cat("Enter the path of your raw data file")

# create citation cff file
# cffr::cff_write()

# devtools::document()
