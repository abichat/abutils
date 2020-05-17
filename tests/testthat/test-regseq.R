context("Regular sequences")

ex_dbl <- 1:100
ex_chr <- month.name
ex_fct <- as.factor(month.name)

seq_dbl <- create_reg_seq(ex_dbl)
seq_chr <- create_reg_seq(ex_chr, prefix = "test")
seq_fct <- create_reg_seq(ex_fct, suffix = ".txt")

test_that("length is constant", {
  expect_true(all(nchar(seq_dbl) == nchar(seq_dbl[1])))
  expect_true(all(nchar(seq_chr) == nchar(seq_chr[1])))
  expect_true(all(nchar(seq_fct) == nchar(seq_fct[1])))
})

test_that("suffix and prefix are present", {
  expect_true(all(str_detect(seq_chr, "^test")))
  expect_true(all(str_detect(seq_fct, ".txt$")))
})
