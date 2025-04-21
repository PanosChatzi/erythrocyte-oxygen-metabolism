# Tests for compute_oxygen_capacity
test_that("compute_oxygen_capacity returns expected value for standard inputs", {
  result <- compute_oxygen_capacity(bind = 1.39, hb = 15, sat = 0.972, po2 = 100)
  expected <- (1.39 * 15 * 0.972) + (0.0225 * (100 / 7.50062))
  expect_equal(result, expected)
})

test_that("compute_oxygen_capacity returns positive value for valid inputs", {
  result <- compute_oxygen_capacity(bind = 1.34, hb = 12, sat = 0.9, po2 = 80)
  expect_true(result > 0)
})

# Tests for compute_oxygen_capacity_2
test_that("compute_oxygen_capacity_2 returns expected value for standard inputs", {
  result <- compute_oxygen_capacity_2(bind = 1.36, hb = 150, sat = 0.972, po2 = 100)
  expected <- (1.36 * 150 * 0.972) + (0.03 * 100)
  expect_equal(result, expected)
})

test_that("compute_oxygen_capacity_2 returns higher value when hemoglobin increases", {
  result1 <- compute_oxygen_capacity_2(hb = 150)
  result2 <- compute_oxygen_capacity_2(hb = 160)
  expect_true(result2 > result1)
})

# Tests for compute_oxygen_dash
test_that("compute_oxygen_dash returns positive value for standard inputs", {
  result <- compute_oxygen_dash(po2 = 100, hct = 0.45, sat = 0.972)
  expect_true(result > 0)
})

test_that("compute_oxygen_dash increases with higher saturation", {
  result1 <- compute_oxygen_dash(sat = 0.9)
  result2 <- compute_oxygen_dash(sat = 0.95)
  expect_true(result2 > result1)
})

# Tests for compute_oxygen_delivery
test_that("compute_oxygen_delivery returns product of cardiac output and total oxygen", {
  result <- compute_oxygen_delivery(co = 5, total.oxygen = 20)
  expect_equal(result, 5 * 20)
})

test_that("compute_oxygen_delivery increases with higher cardiac output", {
  result1 <- compute_oxygen_delivery(co = 5, total.oxygen = 20)
  result2 <- compute_oxygen_delivery(co = 6, total.oxygen = 20)
  expect_true(result2 > result1)
})
