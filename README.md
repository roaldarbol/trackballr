
# trackballr
<!-- badges: start -->
[![DOI](https://zenodo.org/badge/773406370.svg)](https://zenodo.org/doi/10.5281/zenodo.13235277)
[![R-CMD-check](https://github.com/roaldarbol/trackballr/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/roaldarbol/trackballr/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of {trackballr} is to make analysis of trackball data easy.

## Installation

You can install the development version of trackballr from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("roaldarbol/trackballr")
```
or from my R-universe:
```
install.packages("trackballr", repos = c("https://roaldarbol.r-universe.dev", "https://cran.r-project.org"))
```

## Example
### Load data
This is a basic example which shows you how to solve a common problem:

``` r
library(trackballr)

# The read_trackball_data function requires two file paths one for each sensor
# You can find pairs with variations of `list.files()` and for loops. We've included two files as example data in the package:
system.file("extdata", package = "trackballr") |> list.files()
filepaths <- system.file("extdata", package = "trackballr") |> list.files(full.names = TRUE)

# Once we have two paths, we can read the data
# The current experiment uses a freely rotating configuration
data <- read_trackball_data(filepaths, configuration = "free")
```

Once we have loaded the data, we can then augment it to compute positions, velocities, rotations, etc.
``` r
# Augment all data in list
data <- augment_trackball(
    data, 
    x, 
    y, 
    sampling_rate = 125,
    rollmean_k = 30,
    mouse_dpcm = 394
    )
```

## Summarise multiple trials
Once the data has been pre-processed (and metadata has been appended, such as ID and date), it can then easily generate useful summaries. This code won't run, as we have only read a single trial, but is an example of how further analysis could look like.

```r
# Compute translational summary
translation_summary <- data |> 
  na.omit()  |> 
  group_by(id, date) |> 
  filter(abs(x) > 0 | abs(y) > 0) |> # Only keep rows containing movement
  summarise(total_translation = sum(distance),
            v_translation_mean = mean(v_translation),
            v_translation_sd = sd(v_translation),
            sinuosity = sqrt(last(cum_x)^2 + last(cum_y)^2)/sum(distance)
            ) |> 
  mutate(trial = if_else(date <= min(date), "first", "second")) |> # Each animal has been on the trackball on two days - here we assign which day/trial
  slice(1:2) |> 
  filter(total_translation > 0) |> # Filter away trials with no translation
  filter(n() == 2) # Keep only observations where both trials are present

# Compute rotational summary
# Here wa are also filtering out trials with a faulty sensor/no data for one sensor
rotation_summary <- data |> 
  na.omit() |>
  group_by(id, date) |> 
  filter(v_rotation > 0) |>
  summarise(total_rotation = sum(rotation, na.rm = TRUE),
            v_rotation_mean = mean(v_rotation, na.rm = TRUE)) |>
  mutate(trial = if_else(date <= min(date), "first", "second")) |> 
  slice(1:2) |>
  filter(n() == 2)
```
