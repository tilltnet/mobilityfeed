#' Get GTFS feed from the Mobility Database.
#'
#' Get the specified GTFS feed from the Mobility Database.
#' @inheritParams get_datasets_gtfs_by_id
#' @inheritParams get_gtfs_feeds
#' @inherit get_gtfs_feeds return
#' @export
get_gtfs_feeds_by_id <- function(id,
                                 additional_path = NULL,
                                 single = TRUE,
                                 base_url = "https://api.mobilitydatabase.org/v1",
                                 access_token = getOption("MOBILITY_FEED_API_ACCESS_TOKEN")) {
  path <- file.path(base_url, "gtfs_feeds", id)

  if (!is.null(additional_path))
    path <- file.path(base_url, "gtfs_feeds", id, additional_path)

  resp <-
    request(path) |>
    req_auth_bearer_token(access_token) |>
    req_perform()

  return_resp_as_tibble(resp = resp, single = single)
}

#' Get related datasets
#'
#' Get datasets related to specified GTFS feed
#' @inheritParams get_datasets_gtfs_by_id
#' @inheritParams get_gtfs_feeds
#' @inherit get_gtfs_feeds return
#' @export
get_gtfs_feed_related_datasets <- function(id,
                                           base_url = "https://api.mobilitydatabase.org/v1",
                                           access_token = getOption("MOBILITY_FEED_API_ACCESS_TOKEN")) {
  get_gtfs_feeds_by_id(id = id,
                       additional_path = "datasets",
                       single = FALSE,
                       base_url = base_url,
                       access_token = access_token)
}

#' Get related real-time GTFS feeds
#'
#' Get real-time GTFS feeds related to specified GTFS feed
#' @inheritParams get_datasets_gtfs_by_id
#' @inheritParams get_gtfs_feeds
#' @inherit get_gtfs_feeds return
#' @export
get_gtfs_feed_related_rt_feeds <- function(id,
                                           base_url = "https://api.mobilitydatabase.org/v1",
                                           access_token = getOption("MOBILITY_FEED_API_ACCESS_TOKEN")) {
  get_gtfs_feeds_by_id(id = id,
                       additional_path = "gtfs_rt_feeds",
                       single = FALSE,
                       base_url = base_url,
                       access_token = access_token)
}
