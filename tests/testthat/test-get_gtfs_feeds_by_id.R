test_that("get_gtfs_feeds_by_id() works", {
  expect_no_error(
    get_gtfs_feeds_by_id(id = "mdb-1210")
  )
  expect_no_error(
    get_gtfs_feeds_by_id(id = "mdb-1210", additional_path = "datasets", single = FALSE)
  )
  expect_no_error(
    get_gtfs_feed_related_datasets(id = "mdb-1210")
  )
  expect_no_error(
    get_gtfs_feeds_by_id(id = "mdb-1210", additional_path = "gtfs_rt_feeds", single = FALSE)
  )
})
