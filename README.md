
<!-- README.md is generated from README.Rmd. Please edit that file -->

# openwashdata

<!-- badges: start -->
<!-- badges: end -->

> “openwashdata is an active global community that applies FAIR
> principles to data generated in the greater water, sanitation, and
> hygiene (WASH) sector” – openwashdata.org

The openwashdata R package guides the user through building an R package
for data publication. The package facilitates data publication that is
in line with FAIR principles and streamlines the process of creating
publicly available, machine readable datasets with meta information,
Zenodo hosting including DOIs.

- Learn more about openwashdata on
  [openwashdata.org](https://openwashdata.org/)
- Find a status list of currently available data:
  <https://openwashdata.org/pages/gallery/data/>
- browse datasets on <https://github.com/openwashdata>

## Installation

You can install the development version of openwashdata from
[GitHub](https://github.com/openwashdata-dev/openwashdata) with:

``` r
# install.packages("remotes")
remotes::install_github("openwashdata-dev/openwashdata")
```

or, alternatively, use the devtools package to install from GitHub.

``` r
# install.packages("devtools")
devtools::install_github("openwashdata-dev/openwashdata")
```

## Basic Usage

The basic approach of the *openwashdata* package is to walk the user
through all the steps necessary to create an R data package.. The first
step is to create a package skeleton and start a fresh RStudio project
from the skeleton.

``` r
library(openwashdata)

init_data_pkg("my-data-pkg",
              path = "location-of-the-package-folder")
```

The above will create a skeleton package called `my-data-pkg` in the
location `location-of-the-package-folder` that contains the following
features:

- basic R package folder structure, DESCRIPTION and NAMESPACE files
  based on `usethis` package bootstrapping.
- a bootstrap folder with two placeholder files to fill out:
  `authors.csv` and a bootstrap_pkg.R file.
- a `data-raw` folder with a `data_processing.R` template script.

The [walkthrough guide](articles/walkthrough.qmd) guides you through
using this template to create an R data package from collecting
information about to others to its automated publication on Github.
