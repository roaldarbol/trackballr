% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_trackball.R
\name{read_trackball}
\alias{read_trackball}
\title{Read trackball data}
\usage{
read_trackball(
  paths,
  setup = c("of_free", "of_fixed", "fictrac"),
  sampling_rate,
  col_time = "time",
  col_dx = "x",
  col_dy = "y",
  ball_calibration = NULL,
  ball_diameter = NULL,
  distance_scale = NULL,
  distance_unit = NULL,
  verbose = FALSE
)
}
\arguments{
\item{paths}{Two file paths, one for each sensor (although one is allowed for a fixed setup, \code{of_fixed}).}

\item{setup}{Which type of experimental setup was used. Expects either \code{of_free}, \code{of_fixed} or \code{fictrac} (soon).}

\item{sampling_rate}{Sampling rate tells the function how long time it should integrate over. A sampling rate of 60(Hz) will mean windows of 1/60 sec are used to integrate over.}

\item{col_time}{Which column contains the information about time. Can be specified either by the column number (numeric) or the name of the column if it has one (character). Should either be a datetime (POSIXt) or seconds (numeric).}

\item{col_dx}{Column name for x-axis values}

\item{col_dy}{Column name for y-axis values}

\item{ball_calibration}{When running an \code{of_fixed} experiment, you may (but it is not necessary) provide a calibration factor. This factor is the number recorded after a 360 degree spin. You can use the \code{calibrate_trackball} function to get this number. Alternatively, provide the \code{ball_diameter} and a \code{distance_scale} (e.g. mouse dpcm).}

\item{ball_diameter}{When running a \code{of_fixed} experiment, the ball diameter is needed together with either \code{ball_calibration} or \code{distance_scale}.}

\item{distance_scale}{If using computer mice, you might be getting unit-less data out. However, computer mice have a factor called "dots-per-cm", which you can use to convert your estimates into centimeters.}

\item{distance_unit}{Which unit should be used. If \code{distance_scale} is also used, the unit will be for the scaled data. E.g. for trackball data with optical flow sensors, you can use the mouse dots-per-cm (dpcm) of 394 by setting \code{distance_unit = "cm"} and \code{distance_scale = 394}.}

\item{verbose}{If \code{FALSE} (default), suppress most warning messages.}
}
\value{
a movement dataframe
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#experimental}{\figure{lifecycle-experimental.svg}{options: alt='[Experimental]'}}}{\strong{[Experimental]}}

Read trackball data from a variety of setups and configurations.
}
