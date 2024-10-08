% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/validator_files.R
\name{ensure_file_has_expected_headers}
\alias{ensure_file_has_expected_headers}
\title{Ensure file has expected headers}
\usage{
ensure_file_has_expected_headers(path, expected_headers = c("x", "y", "time"))
}
\arguments{
\item{path}{Path(s) to the file.}

\item{expected_headers}{Expected column name(s) to be present among the header names. Default is c("x", "y", "time").}
}
\description{
Ensure file has expected headers
}
\keyword{internal}
