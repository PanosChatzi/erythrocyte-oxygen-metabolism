# Hill model based on equations 6 and 11 from Dash et al, 2016.
hill_model <- function(po2 = 100,     # partial oxygen pressure in standard conditions.
                       p50 = 26.8,    # p50 in standard conditions.
                       nhill.var = TRUE) {

  # Calculate the Hill coefficient nH using equation 11 (Dash et al, 2016)
  compute_nHill <- function(po2 = po2) { # Partial pressure of oxygen in standard conditions

    # Assign the parameter values based on Table 1
    alpha <- 2.82
    beta <- 1.20
    gamma <- 29.25

    nH <-  alpha - beta * (10 ^ (- (po2 / gamma)))
    nH
  }

  # If nHill coefficient is dynamic, then calculate it using compute_nHill
  if(nhill.var == TRUE) {

    nH <-  compute_nHill(po2 = po2)

  } else {
    # If nHill.var is FALSE, then assign the standard value.
    nH <- 2.7
  }

  # Calculate the oxygen saturation of hemoglobin
  x <- ((po2 / p50) ^ nH) / (1 + (po2 / p50) ^ nH)

  x_rounded <- round(x, 3)

  return(x_rounded)
}

# References ----
# 1) Dash & Bassingthwaighte. 2010. (PMID: 20162361)
# 2) Dash et al. 2016. (PMID: 26298270)
