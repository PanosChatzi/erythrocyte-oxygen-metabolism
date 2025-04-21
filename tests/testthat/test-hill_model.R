# Tests for hill_model function
test_that("hill_model returns values between 0 and 1", {
  # Test at different partial pressures
  expect_true(hill_model(po2 = 10) >= 0)
  expect_true(hill_model(po2 = 100) <= 1)
  expect_true(hill_model(po2 = 150) >= 0 && hill_model(po2 = 150) <= 1)
})

test_that("hill_model returns numeric values", {
  expect_type(hill_model(po2 = 50), "double")
  expect_true(is.numeric(hill_model(po2 = 25)))
})

test_that("hill_model returns appropriate values for invalid inputs", {
  # Negative po2 values are physiologically impossible
  expect_error(hill_model(po2 = -10), NA) # Check that it doesn't error (but result may not be meaningful)
  expect_true(hill_model(po2 = -10) <= 0 || is.nan(hill_model(po2 = -10)))

  # Negative p50 values are physiologically impossible
  expect_error(hill_model(po2 = 100, p50 = -5), NA)
  # Result should either be NaN, NA, or outside [0,1] range to indicate a problem
  neg_p50_result <- hill_model(po2 = 100, p50 = -5)
  expect_true(is.nan(neg_p50_result) || is.na(neg_p50_result) || neg_p50_result > 1 || neg_p50_result < 0)
})
