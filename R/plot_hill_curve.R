# Function to plot the oxygen dissociation curve.
plot_hill <- function(po2 = 0:100,            # Create a vector of values for PO2.
                      p50_pre = 26.8,           # p50 dynamic.
                      p50_post = 26.8,       # p50 in standard conditions.
                      add.std.p50 = FALSE,
                      add.new.p50 = FALSE,
                      add.text = FALSE,
                      add.arrow = FALSE,
                      add.second.curve = FALSE,
                      ...) { # Optional further arguments passed on the plot.

  # Calculate SHbO2 based on the defined range of PO2 values.
  SHbO2_pre <- hill_model(po2 = po2, p50 = p50_pre) * 100
  SHbO2_post <- hill_model(po2 = po2, p50 = p50_post) * 100

  # Generate the plot with optional arguments.
  plot(x = po2, y = SHbO2_pre,
       type = "l", lty = 1, lwd = 2,
       main= "Oxygen dissociation curve",
       xlab = "Partial pressure of oxygen (mmHg)",
       ylab = "Hemoglobin oxygen saturation (%)",
       xlim = c(0, 100), ylim = c(0, 100),
       las = 1, xaxs = "i", yaxs = "i",
       font.lab = 2, font.axis = 2,
       ...)

  # If add.second.curve is TRUE, add a second curve on 'y' axis on top the previous plot
  if(add.second.curve == TRUE) {
    lines(x = po2, y = SHbO2_post,
          type = "l", lty = 1, lwd = 2, col = "red")
  }

  # If add.std.50 is TRUE, add a vertical line for the standard p50 (26.8).
  if(add.std.p50 == TRUE) {
    abline(v = p50_pre, col = "black", lty = 2, lwd = 1)
  }

  # If add.new.50 is TRUE, add a vertical line for the calculated p50.
  if(add.new.p50 == TRUE) {
    abline(v = p50_post, col = "red", lty = 2, lwd = 1)
  }

  # If add.text is TRUE, add text showing the calculated p50 value.
  if(add.text == TRUE) {
    text(SHbO2_post[p50_post], SHbO2_post[p50_post] + 3, paste0("p50= ", round(p50_post, 2), " mmHg"))
  }

  # If add.arrow is TRUE, add arrow to the direction of p50.
  if(add.arrow == TRUE) {

    # Change the direction of the arrow if p50 shifted to the left or right.
    if(p50_post > p50_pre) {
      arrows(x0 = p50_pre - 2, y0 = 85,
             x1 = p50_post, y1 = 85,
             length = .075, lwd = 1.75,
             col = "red")
    } else {
      arrows(x0 = p50_pre + 2, y0 = 85,
             x1 = p50_post, y1 = 85,
             length = .075, lwd = 1.75,
             col = "red")
    }
  }
}
