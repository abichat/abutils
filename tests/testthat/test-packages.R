context("Packages and sources fetching")


test_that("output is correct", {
  df_pkg <- fetch_installed_packages(all_info = TRUE)
  mat_pkg <- installed.packages()
  expect_is(df_pkg, "tbl")
  expect_equal(nrow(df_pkg), nrow(mat_pkg))
  expect_equal(ncol(df_pkg), ncol(mat_pkg) + 2)
  expect_equal(ncol(fetch_installed_packages()), 5)
})
