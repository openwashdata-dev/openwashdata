library(openwashdata)
library(usethis)

# Create Data Package Skeleton ####

create_data_pkg(pkg_name = "pkgname",
                pkg_title = "Diving Deep",
                description = "A scuba gear for R",
                maintainer = person(
                  "Matt", "Bunny",
                  email = "matt@openwashdata.org",
                  role = c("aut", "cre")),
                location = "../../openwashdata/")

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

# Write the CITATION file
# This is based on the DESCRIPTION file of the
# active working directory
# remember current working directory
# in case we want to switch back later
cwd <- getwd()
setwd(proj_get())

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












