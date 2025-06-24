#' Get dataset from the Mobility Database.
#'
#' Get the specified dataset from the Mobility Database.
#' @param id `Character.` The ID of the requested dataset.
#' @inheritParams get_gtfs_feeds
#' @inherit get_gtfs_feeds return
#' @export
get_datasets_gtfs_by_id <- function(id,
                                    base_url = "https://api.mobilitydatabase.org/v1",
                                    access_token = getOption("MOBILITY_FEED_API_ACCESS_TOKEN")) {
  path <- file.path(base_url, "datasets", "gtfs", id)

  resp <-
    request(path) |>
    req_auth_bearer_token(access_token) |>
    req_perform()

  return_resp_as_tibble(resp = resp, single = TRUE)
}
