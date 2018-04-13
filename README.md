
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![Project Status: Active - The project has reached a stable, usable
state and is being actively
developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
[![Travis-CI Build
Status](https://travis-ci.org/tmsalab/shinyecdm.svg?branch=master)](https://travis-ci.org/tmsalab/shinyecdm)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/shinyecdm)](https://cran.r-project.org/package=shinyecdm)
[![CRAN RStudio mirror
downloads](http://cranlogs.r-pkg.org/badges/shinyecdm)](http://www.r-pkg.org/pkg/shinyecdm)

# `shinyecdm`

The goal of `shinyecdm` is to provide a user interface for the
estimation routines in the [`ecdm`](https://github.com/tmsalab/ecdm) R
package.

## Installation

You can install `shinyecdm` from github with:

``` r
# install.packages("devtools")
devtools::install_github("tmsalab/shinyecdm")
```

## Usage

Load the `shinyecdm` package into *R*:

``` r
library(shinyecdm)
```

Exploratory CDM models can be estimated with:

``` r
shiny_edina()
```

## Details

The `shinyecdm` package is designed to provide a method for non-R
aficionados to use the `ecdm` estimation routines. To do so, the `ecdm`
routines are *wrapped* into a web interface that is powered by the
`shiny` package. As a result, the estimation methods can be served
either *locally* or *remotely* through a server equipped with shiny.

# License

GPL (\>= 2)
