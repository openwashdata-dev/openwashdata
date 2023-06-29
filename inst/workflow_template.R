library(openwashdata)
library(usethis)

# Process after running init_data_pkg(). #########


# Add Additional authors ####
# This not only the basis for license file creation, but
# also for the CITATION file and data publication.
# Make to add all authors at this stage.
# To do so simply add multiple use_author() calls here.

use_author(
  given = "Donald",
  family = "Duck",
  role = "aut",
  comment = c(ORCID = "YOUR-ORCID-ID")
  )

# or read as a bulk import of multiple authors from a .csv file.
use_authors_skeleton()
a <- use_authors_from_csv()

# edit the skeleton & read in csv.
# Write the CITATION file
# This is based on the DESCRIPTION file of the
# active working directory

# ! MAKE SURE ORCIDs are correct ####
# OR left out as these are being validated !!
# add CITATION file to the data package skeleton
use_cff()


# Initialize git once all the files are there.
init_git()


# DATA Manipulation Stage START #############



# DATA Manipulation Stage END #############


# openwashdata GitHub
push_package()












