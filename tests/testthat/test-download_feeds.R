test_that("download_feeds() works", {
  gtfs_de <-
    get_gtfs_feeds(country_code = "DE", offset = 10) |>
    dplyr::slice(1:3)

  tmp_download_path <- tempdir()

  download_feeds(gtfs_de, tmp_download_path)
  #browseURL(tmp_download_path)
})
