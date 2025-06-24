test_that("get_feeds_by_id() works", {
  expect_no_error(
    get_feeds_by_id(id = "mdb-1210")
  )
})
