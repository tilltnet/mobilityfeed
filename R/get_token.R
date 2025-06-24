#' Obtain bearer token
#'
#' Provided a refresh token will return a bearer token and store it as option
#' `MOBILITY_FEED_API_ACCESS_TOKEN`.
#' @param refresh_token Character. Refresh token can be obtained in user area
#' at [https://mobilitydatabase.org/](https://mobilitydatabase.org/).
#' @export
get_token <- function(refresh_token = Sys.getenv("MOBILITY_FEED_API_REFRESH_TOKEN")) {
  resp <- request("https://api.mobilitydatabase.org/v1/tokens") |>
    req_body_json(list(refresh_token = refresh_token)) |>
    req_perform()

  access_token <- resp_body_json(resp)$access_token
  options(MOBILITY_FEED_API_ACCESS_TOKEN = access_token)
  invisible(access_token)
}
