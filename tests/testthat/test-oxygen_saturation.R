# Tests for model_p50 function
test_that("model_p50 returns standard p50 value with standard inputs", {
  # When all parameters are at standard values, should return p50_s
  result <- model_p50(pH_blood = 7.4,
                      pco2 = 40,
                      dpg_rbc = 4.65 * (10 ^ (-3)),
                      temp = 37,
                      p50_s = 26.8,
                      pH_s = 7.24,
                      pco2_s = 40,
                      dpg_s = 4.65 * (10 ^ (-3)),
                      temp_s = 37)

  expect_equal(result, 26.8)
})

test_that("model_p50 increases with temperature", {
  # p50 should increase with higher temperature
  result_normal <- model_p50(temp = 37)
  result_fever <- model_p50(temp = 39)

  expect_gt(result_fever, result_normal)
})

# Tests for model_oxy_dash function
test_that("model_oxy_dash returns a list with expected components", {
  result <- model_oxy_dash()

  expect_type(result, "list")
  expect_named(result, c("SHbO2", "K4prime", "KHbO2"))
  expect_length(result, 3)
})

test_that("model_oxy_dash SHbO2 value is between 0 and 1", {
  result <- model_oxy_dash(po2 = 100)

  expect_true(result$SHbO2 >= 0 && result$SHbO2 <= 1)
})
