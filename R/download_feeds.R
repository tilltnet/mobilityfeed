#' Download GTFS, real-time GTFS, and GBFS feed files
#'
#' This is a helper function to download feed files from URLs obtained with any of the
#' `get_*_feed()` functions from the `mobilityfeed` package.
#' @param feeds_tbl `Tibble` of feed details.
#' @param download_path `Character.` Path to download location.
#' @param source `Character.` If `source = "provider"` will use `producer_url` for download, if `source = "hosted"` will use `latest_dataset_hosted_url`. Default: "provider".
#' @export
download_feeds <- function(feeds_tbl, download_path, source = c("provider", "hosted")) {
  feed_details <-
    feeds_tbl |>
    tidyr::unnest(external_ids) |>
    tidyr::unnest(latest_dataset, names_sep = "_") |>
    tidyr::unnest(source_info) |>
    dplyr::select(
      id,
      data_type,
      status,
      official,
      feed_name,
      provider,
      producer_url,
      latest_dataset_hosted_url
    )

  if (source[1] == "provider") url_var <- "producer_url"
  else url_var <- "latest_dataset_hosted_url"

  feed_details |>
    dplyr::mutate(
      path = file.path(download_path, paste0(id, ".zip")),
      zipped_data = purrr::map2(
        path,
        .data[[url_var]],
        purrr::possibly(\(x, y) request(y) |> req_perform(path = x))
      )
    ) |>
    #filter(!is.null(zipped_data)) |>
    dplyr::pull(path)
}
