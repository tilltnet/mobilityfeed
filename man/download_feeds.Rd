% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/download_feeds.R
\name{download_feeds}
\alias{download_feeds}
\title{Download GTFS, real-time GTFS, and GBFS feed files}
\usage{
download_feeds(feeds_tbl, download_path, source = c("provider", "hosted"))
}
\arguments{
\item{feeds_tbl}{\code{Tibble} of feed details.}

\item{download_path}{\code{Character.} Path to download location.}

\item{source}{\code{Character.} If \code{source = "provider"} will use \code{producer_url} for download, if \code{source = "hosted"} will use \code{latest_dataset_hosted_url}. Default: "provider".}
}
\description{
This is a helper function to download feed files from URLs obtained with any of the
\verb{get_*_feed()} functions from the \code{mobilityfeed} package.
}
