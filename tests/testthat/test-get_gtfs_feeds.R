test_that("get_gtfs_feeds() works", {
  expect_no_error({
    gtfs_feeds <- get_gtfs_feeds(limit = 100, subdivision_name = "Florida")

    gtfs_feeds |>
      tidyr::unnest(external_ids) |>
      tidyr::unnest(latest_dataset, names_sep = "_") |>
      tidyr::unnest(source_info) |>
      dplyr::select(id,
                    data_type,
                    feed_name,
                    provider,
                    producer_url,
                    latest_dataset_hosted_url)
  })

})
