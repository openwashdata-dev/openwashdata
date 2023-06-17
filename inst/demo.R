# create data package skeleton (stage 1)
# - basic usethis R package
# - support naming and conventions check
# - create README

create_data_pkg(pkg_name = "blubb",
                pkg_title = "diving",
                description = "an R scuba device",
                maintainer = person(
                  "Jane", "Doe",
                  email = "jane@example.com",
                  role = c("aut", "cre"),
                  comment = c(ORCID = "YOUR-ORCID-ID")),
                location = "../../openwashdata/")

# - add license
# - add .cff with author info
# - add basic data processing template file
# - add data_raw folder
# - echo next steps and end first stage, maybe save this status ?
# - add citation Info
# - maybe work with a README template /w placeholder, replaced later throughout
# the process


# support data processing (stage 3)
# - helper functions to pivot data the right way
# - helper functions to extract meta data
# - generate overview of datasets in table, automatically add to README
# - set status publication ready
# statr

# fill pkgdown documentation (stage 4)

# git pushery (stage 4)
# - check status (saved to a .status.RData /.json)
# - check whether package can be built (devtools)
# - move R package to the openwashdata org
# require RSA stuff
# PAT

# how to organize repos and orgs
# openwashdata org contains
# - R package (pinned)
# - github.io page
# - pkgdown docs of the openwashdata package
# possibly have another organization 'openwashdata-submission'
# for incoming data



# ait
# this could be what's ck up things.
# Root criterion: one of
# - contains a file ".here"
# - contains a file matching "[.]Rproj$" with contents matching "^Version: " in the first line
# - contains a file "DESCRIPTION" with contents matching "^Package: "
# - contains a directory ".git"
# - contains a file ".git" with contents matching "^gitdir: "
# - contains a file "remake.yml"
# - contains a file ".projectile"
#
#
#
#
#
#
#
#
#
#
#
