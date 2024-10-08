% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/validator_trackball.R
\name{validate_trackball}
\alias{validate_trackball}
\title{Validate trackball files}
\usage{
validate_trackball(paths, setup, col_time)
}
\arguments{
\item{paths}{Path to the file(s).}

\item{setup}{Experimental setup used. Expects either "of_free", "of_fixed" or "fictrac".}

\item{col_time}{Column which contains time}
}
\description{
The validator ensures that:
\itemize{
\item A valid setup is given.
\item A valid number of files are provided.
\item Identical suffixes when tewo files are given.
}
}
\keyword{internal}
