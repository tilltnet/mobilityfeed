#' Get GBFS feed from the Mobility Database.
#'
#' Get the specified GBFS feed from the Mobility Database.
#' @inheritParams get_datasets_gtfs_by_id
#' @inheritParams get_gtfs_feeds
#' @inherit get_gtfs_feeds return
#' @export
get_gbfs_feeds_by_id <- function(id,
                            base_url = "https://api.mobilitydatabase.org/v1",
                            access_token = getOption("MOBILITY_FEED_API_ACCESS_TOKEN")) {
  resp <-
    request(file.path(base_url, "gbfs_feeds", id)) |>
    req_auth_bearer_token(access_token) |>
    req_perform()

  return_resp_as_tibble(resp = resp, single = TRUE)
}
