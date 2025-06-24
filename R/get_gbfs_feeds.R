#' Get GBFS Feeds
#'
#' Get GBFS feeds from the Mobility Database.
#' @inheritParams get_gtfs_feeds
#' @inherit get_gtfs_feeds return
#' @export
get_gbfs_feeds <- function(limit = 10,
                           offset = 0,
                           status = NULL,
                           provider = NULL,
                           producer_url = NULL,
                           entity_types = NULL,
                           country_code = NULL,
                           subdivision_name = NULL,
                           municipality = NULL,
                           system_id = NULL,
                           version = NULL,
                           base_url = "https://api.mobilitydatabase.org/",
                           access_token = getOption("MOBILITY_FEED_API_ACCESS_TOKEN")) {
  resp <-
    url_modify_query(
      base_url,
      limit = limit,
      offset = offset,
      status = status,
      provider = provider,
      producer_url = producer_url,
      country_code = country_code,
      subdivision_name = subdivision_name,
      municipality = municipality,
      system_id = system_id,
      version = version
    ) |>
    url_modify(path = "/v1/gbfs_feeds") |>
    request() |>
    req_auth_bearer_token(access_token) |>
    req_perform()

  return_resp_as_tibble(resp)
}
