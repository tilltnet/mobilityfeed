#' Get Metadata
#'
#' Get metadata from the Mobility Database.
#' @inheritParams get_gtfs_feeds
#' @inherit get_gtfs_feeds return
#' @export
get_metadata <- function(base_url = "https://api.mobilitydatabase.org/v1",
                         access_token = getOption("MOBILITY_FEED_API_ACCESS_TOKEN")) {
  resp <-
    request(base_url) |>
    req_url_path("v1", "metadata") |>
    req_auth_bearer_token(access_token) |>
    req_perform()

  return_resp_as_tibble(resp, single = TRUE)
}
