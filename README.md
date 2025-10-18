
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `{pitchxg}`

<!-- badges: start -->

<!-- badges: end -->

## Installation

You can install the development version of `{pitchxg}` like so:

``` r
# FILL THIS IN! HOW CAN PEOPLE INSTALL YOUR DEV PACKAGE?
```

## Run

You can launch the application by running:

``` r
pitchxg::run_app()
```

## About

You are reading the doc about version : 0.0.0.9000

This README has been compiled on the

``` r
Sys.time()
#> [1] "2025-10-18 13:36:20 BST"
```

Here are the tests results and package coverage:

``` r
devtools::check(quiet = TRUE)
#> ══ Documenting ═════════════════════════════════════════════════════════════════
#> ℹ Installed roxygen2 version (7.3.2) doesn't match required (7.1.1)
#> ✖ `check()` will not re-document this package
#> ── R CMD check results ───────────────────────────────── pitchxg 0.0.0.9000 ────
#> Duration: 30.1s
#> 
#> ❯ checking DESCRIPTION meta-information ... NOTE
#>   Non-standard licence specification:
#>     What license is it under?
#>   Standardisable: FALSE
#> 
#> ❯ checking top-level files ... NOTE
#>   File
#>     LICENSE
#>   is not mentioned in the DESCRIPTION file.
#> 
#> 0 errors ✔ | 0 warnings ✔ | 2 notes ✖
```

``` r
covr::package_coverage()
#> pitchxg Coverage: 0.00%
#> R/app_config.R: 0.00%
#> R/app_ui.R: 0.00%
#> R/run_app.R: 0.00%
```
