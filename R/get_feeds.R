#' Get Feeds
#'
#' Get feeds from the Mobility Database.
#' @inheritParams get_gtfs_feeds
#' @inherit get_gtfs_feeds return
#' @export
#' @export
get_feeds <- function(limit = 10,
                      offset = 0,
                      status = NULL,
                      provider = NULL,
                      producer_url = NULL,
                      is_official = NULL,
                      base_url = "https://api.mobilitydatabase.org/v1",
                      access_token = getOption("MOBILITY_FEED_API_ACCESS_TOKEN")) {
  req <-
    url_modify_query(
      base_url,
      limit = limit,
      offset = offset,
      status = status,
      provider = provider,
      producer_url = producer_url,
      is_official = is_official
    ) |>
    url_modify(path = "/v1/feeds") |>
    request() |>
    req_auth_bearer_token(access_token) |>
    req_perform()

  return_resp_as_tibble(resp)
}

#get_feeds(limit = 100, provider = "Florida")
