test_that("plot_hill executes without error with default parameters", {
  # Set up graphics device that doesn't display
  pdf(NULL)

  # Run the plot function with default parameters
  # We're primarily testing that the function executes without errors
  expect_no_error(plot_hill())

  # Close the graphics device
  dev.off()
})

test_that("plot_hill handles different p50 values properly", {
  # Set up graphics device that doesn't display
  pdf(NULL)

  # Create plots with different p50 values
  # Test that it successfully plots when using different p50 values
  expect_no_error(plot_hill(p50_pre = 20, p50_post = 30, add.second.curve = TRUE))

  # Check that a second curve is added when add.second.curve = TRUE
  # We can't directly verify this in a test, but we can check for no errors
  expect_no_error(plot_hill(p50_pre = 26.8, p50_post = 35, add.second.curve = TRUE,
                            add.std.p50 = TRUE, add.new.p50 = TRUE))

  # Close the graphics device
  dev.off()
})

test_that("plot_hill handles all optional visual elements correctly", {
  # Set up graphics device that doesn't display
  pdf(NULL)

  # Test with all visual elements enabled
  expect_no_error(
    plot_hill(
      p50_pre = 26.8,
      p50_post = 30,
      add.std.p50 = TRUE,
      add.new.p50 = TRUE,
      add.text = TRUE,
      add.arrow = TRUE,
      add.second.curve = TRUE
    )
  )

  # Test p50 arrow direction when p50_post < p50_pre
  expect_no_error(
    plot_hill(
      p50_pre = 30,
      p50_post = 20,
      add.arrow = TRUE
    )
  )

  # Close the graphics device
  dev.off()
})
