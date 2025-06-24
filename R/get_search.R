#' Search feeds on feed name, location and provider's information.
#'
#' The current implementation leverages the text search functionalities from PostgreSQL, in particularly `plainto_tsquery`.
#'
#' @param search_query `Character.` General search query to match against transit provider, location, and feed name.
#' @param feature `Character.` Filter feeds by their GTFS features. [GTFS features definitions defined here](https://gtfs.org/getting-started/features/overview/).
#' @param status description Filter feeds by their status. Available values: active, `deprecated`, `inactive`, `development`, `future`.
#' @param version `Character.` Comma separated list of GBFS versions to filter by.
#' @param data_type Comma separated list of data types to filter by. Valid values are `gtfs`, `gtfs_rt` and `gbfs`.
#' @inheritParams get_gtfs_feeds
#' @inherit get_gtfs_feeds return
#' @export
get_search <- function(search_query = NULL,
                       feature = NULL,
                       limit = 10,
                       offset = 0,
                       status = NULL,
                       feed_id = NULL,
                       data_type = NULL,
                       is_official = NULL,
                       version = NULL,
                       base_url = "https://api.mobilitydatabase.org/",
                       access_token = getOption("MOBILITY_FEED_API_ACCESS_TOKEN")) {
  resp <-
    url_modify_query(
      base_url,
      search_query = search_query,
      feature = feature,
      limit = limit,
      offset = offset,
      status = status,
      feed_id = feed_id,
      data_type = data_type,
      version = version,
      is_official = is_official
    ) |>
    url_modify(path = "/v1/search") |>
    request() |>
    req_auth_bearer_token(access_token) |>
    req_perform()

  return_resp_as_tibble(resp)
}
