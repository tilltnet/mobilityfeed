return_resp_as_tibble <- function(resp, single = FALSE) {
  if (single) {
    out <-
      resp_body_json(resp) |>
      purrr::map(\(x) ifelse(length(x) == 1 | is.list(x), x, list(x))) |>
      tibble::as_tibble()
    return(out)
  }

  resp_body_string(resp) |> jsonlite::fromJSON() |> tibble::as_tibble()
}

