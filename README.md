
<!-- README.md is generated from README.Rmd. Please edit that file -->

# pitchxg

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html)
<!-- badges: end -->

## A Shiny app for exploring expected goals (xG) using StatsBomb open data

{pitchxg} is a prototype Shiny app built with `{golem}` for analysing
shot locations and outcomes on football pitches.  
It currently visualises matches from the Women’s EURO 2025.

{pitchxg} is in early development (v0.0.0.9000).  
See Issues for planned features and progress.

View app [here](https://o-mohammed-pitchxg.share.connect.posit.cloud/).

------------------------------------------------------------------------

## Deployment

The app is currently hosted on Posit Connect Cloud for early testing and
feedback.  
To minimise compute resources during deployment, all match event data is
pre-processed and stored as static `.rds` files in `inst/app/data/`.  
The app reads this data at runtime rather than querying live sources.

A future version may include dynamic updates from `{StatsBombR}` once
performance constraints are addressed.

------------------------------------------------------------------------

## Data

This app uses public event data provided by **StatsBomb Open Data**,
accessed via the `{StatsBombR}` package.

All analysis and visualisation within the app is independent and not
affiliated with or endorsed by StatsBomb.

------------------------------------------------------------------------

## Installation & Development

Clone the repository, open the project in RStudio, and run:

``` r
golem::run_dev()
```
