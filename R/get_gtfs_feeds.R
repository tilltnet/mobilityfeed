# R/get_feeds.R
#' Get GTFS Feeds
#'
#' Get some (or all) GTFS feeds from the Mobility Database.
#' @param limit `Integer.` The number of items to be returned.
#' @param offset `Integer.` Offset of the first item to return.
#' @param provider `Character.` List only feeds with the specified value. Can be a partial match. Case insensitive.
#' @param producer_url `Character.` List only feeds with the specified value. Can be a partial match. Case insensitive.
#' @param country_code `Character.` Filter feeds by their exact country code.
#' @param subdivision_name `Character.` List only feeds with the specified value (e.g. "Oregon", "Niedersachsen"). Can be a partial match. Case insensitive.
#' @param municipality `Character.` List only feeds with the specified value. Can be a partial match. Case insensitive.
#' @param dataset_latitudes,dataset_longitudes `Numeric vector.` Specify the minimum and maximum latitudes/longitudes of the bounding box to use for filtering. Filters by the bounding box of the LatestDataset for a feed.
#' @param bounding_filter_method `Character.` Specify the filtering method to use with the dataset_latitudes and dataset_longitudes parameters. Available values : `completely_enclosed`, `partially_enclosed`, `disjoint.` Default value: `completely_enclosed.`
#' @param is_official `Logical.` If true, only return official feeds.
#' @param base_url `Character.` URL of mobility database API.
#' @param access_token `Character.` Access/bearer token. Can be obtained with [mobilityfeed::get_token()] and will be stored as option `MOBILITY_FEED_API_ACCESS_TOKEN`.
#' @returns A `tibble` of mobility data results.
#' @export
get_gtfs_feeds <- function(limit = 10L,
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
      dataset_latitudes = dataset_latitudes,
      dataset_longitudes = dataset_longitudes,
      bounding_filter_method = bounding_filter_method,
      is_official = is_official
    ) |>
    url_modify(path = "/v1/gtfs_feeds") |>
    request() |>
    req_auth_bearer_token(access_token) |>
    req_perform()

  return_resp_as_tibble(resp)
}
