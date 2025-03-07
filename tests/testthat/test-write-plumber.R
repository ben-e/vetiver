library(pins)

test_that("create plumber.R with packages", {
    skip_on_cran()
    b <- board_folder(path = "/tmp/test")
    tmp <- tempfile()
    cars_lm <- lm(mpg ~ cyl + disp, data = mtcars)
    v <- vetiver_model(cars_lm, "cars1")
    v$metadata$required_pkgs <- c("beepr", "janeaustenr")
    vetiver_pin_write(b, v)
    vetiver_write_plumber(b, "cars1", file = tmp)
    expect_snapshot(cat(readr::read_lines(tmp), sep = "\n"))
})

test_that("create plumber.R with args in dots", {
    skip_on_cran()
    b <- board_folder(path = "/tmp/test")
    tmp <- tempfile()
    cars_lm <- lm(mpg ~ cyl + disp, data = mtcars)
    v <- vetiver_model(cars_lm, "cars1")
    v$metadata$required_pkgs <- c("beepr", "janeaustenr")
    vetiver_pin_write(b, v)
    vetiver_write_plumber(b, "cars1",
                          debug = TRUE, endpoint = "/predict2", type = "numeric",
                          file = tmp)
    expect_snapshot(cat(readr::read_lines(tmp), sep = "\n"))
})

test_that("create plumber.R with no packages", {
    skip_on_cran()
    b <- board_folder(path = "/tmp/test")
    tmp <- tempfile()
    cars_lm <- lm(mpg ~ cyl + disp, data = mtcars)
    v <- vetiver_model(cars_lm, "cars1")
    vetiver_pin_write(b, v)
    vetiver_write_plumber(b, "cars1", file = tmp)
    expect_snapshot(cat(readr::read_lines(tmp), sep = "\n"))
})
