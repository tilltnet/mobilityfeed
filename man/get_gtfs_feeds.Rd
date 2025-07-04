% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_gtfs_feeds.R
\name{get_gtfs_feeds}
\alias{get_gtfs_feeds}
\title{Get GTFS Feeds}
\usage{
get_gtfs_feeds(
  limit = 10L,
  offset = 0L,
  status = NULL,
  provider = NULL,
  producer_url = NULL,
  country_code = NULL,
  subdivision_name = NULL,
  municipality = NULL,
  dataset_latitudes = NULL,
  dataset_longitudes = NULL,
  bounding_filter_method = NULL,
  is_official = NULL,
  base_url = "https://api.mobilitydatabase.org/",
  access_token = getOption("MOBILITY_FEED_API_ACCESS_TOKEN")
)
}
\arguments{
\item{limit}{\code{Integer.} The number of items to be returned.}

\item{offset}{\code{Integer.} Offset of the first item to return.}

\item{provider}{\code{Character.} List only feeds with the specified value. Can be a partial match. Case insensitive.}

\item{producer_url}{\code{Character.} List only feeds with the specified value. Can be a partial match. Case insensitive.}

\item{country_code}{\code{Character.} Filter feeds by their exact country code.}

\item{subdivision_name}{\code{Character.} List only feeds with the specified value (e.g. "Oregon", "Niedersachsen"). Can be a partial match. Case insensitive.}

\item{municipality}{\code{Character.} List only feeds with the specified value. Can be a partial match. Case insensitive.}

\item{dataset_latitudes, dataset_longitudes}{\verb{Numeric vector.} Specify the minimum and maximum latitudes/longitudes of the bounding box to use for filtering. Filters by the bounding box of the LatestDataset for a feed.}

\item{bounding_filter_method}{\code{Character.} Specify the filtering method to use with the dataset_latitudes and dataset_longitudes parameters. Available values : \code{completely_enclosed}, \code{partially_enclosed}, \code{disjoint.} Default value: \code{completely_enclosed.}}

\item{is_official}{\code{Logical.} If true, only return official feeds.}

\item{base_url}{\code{Character.} URL of mobility database API.}

\item{access_token}{\code{Character.} Access/bearer token. Can be obtained with \code{\link[=get_token]{get_token()}} and will be stored as option \code{MOBILITY_FEED_API_ACCESS_TOKEN}.}
}
\value{
A \code{tibble} of mobility data results.
}
\description{
Get some (or all) GTFS feeds from the Mobility Database.
}
