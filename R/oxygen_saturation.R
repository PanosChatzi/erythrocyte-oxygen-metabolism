# Erythrocyte pH function Based on Siggaard-Andersen and colleagues (1971)
rbc_ph <- function (ph = 7.4) { # Plasma pH in standard conditions

  y <- 0.795 * ph + 1.357

  return(y)
}

# Function to calculate p50 (mmHg) based on pH, pCO2, 2,3-BPG and temperature.
# Equations 9a-9d and equation 10. Data derived from Table 1.
model_p50 <- function(pH_blood = 7.4,                # pH standard conditions
                      pco2 = 40,                    # pco2 standard conditions
                      dpg_rbc = 4.65 * (10 ^ (-3)), # 2,3-BPG standard conditions
                      temp = 37,                    # Temperature standard conditions
                      p50_s = 26.8,                 # p50 in standard conditions
                      pH_s = 7.24,                  # pH standard conditions
                      pco2_s = 40,                  # pco2 standard conditions
                      dpg_s = 4.65 * (10 ^ (-3)),   # 2,3-BPG standard conditions
                      temp_s = 37,
                      is_blood_ph = TRUE) {         # pH in blood or rbc

  if(is_blood_ph == TRUE){
    pH_rbc <- rbc_ph(pH_blood)
  } else {
    pH_rbc <- pH_blood
  }

  p50dpH <-  p50_s - 25.535 * (pH_rbc - pH_s) + 10.646 * ((pH_rbc - pH_s) ^ 2) -
    1.764 * ((pH_rbc - pH_s) ^ 3)

  p50dco2 <-  p50_s + 0.1273 * (pco2 - pco2_s) + 1.083 * (10 ^ (- 4)) * ((pco2 - pco2_s) ^ 2)

  p50dBPG <-  p50_s + 795.63 * (dpg_rbc - dpg_s) - 19660.89 * ((dpg_rbc - dpg_s) ^ 2)

  p50dtemp <-  p50_s + 1.435 * (temp - temp_s) + (4.163 * (10 ^ (- 2))) * ((temp - temp_s) ^ 2) +
    (6.86 * (10 ^ (- 4))) * ((temp - temp_s) ^ 3)

  p50 <- p50_s * (p50dpH / p50_s) * (p50dco2 / p50_s) * (p50dBPG / p50_s) * (p50dtemp / p50_s)

  return(p50)
}

# Helper functions
# Calculate the Hill coefficient nH using equation 11 (Dash et al, 2016)
compute_nHill <- function(po2 = po2) { # Partial pressure of oxygen in standard conditions

  # Assign the parameter values based on Table 1
  alpha <- 2.82
  beta <- 1.20
  gamma <- 29.25

  nH <-  alpha - beta * (10 ^ (- (po2 / gamma)))
  nH
}

# Function to calculate free oxygen in the water space of erythrocytes in M/mmHg (Equation 2a).
oxy_bl <- function(po2 = 100,      # Partial oxygen pressure in standard conditions
                   temp = 37,      # Temperature in standard conditions
                   w_pl = 0.94) {  # Fractional water space of plasma

  ao2 <- (1.37 - 0.0137 * (temp - 37) + 0.00058 *
            ((temp - 37) ^ 2)) * ((10 ^ (-6)) / w_pl)

  x <- ao2 * po2

  return(x)
}

# Function to calculate free carbon dioxide in the water space of erythrocytes in M/mmHg (Equation 2b).
co2_bl <- function(pco2 = 40,       # Partial carbon dioxide pressure in standard conditions
                   temp = 37,       # Temperature in standard conditions
                   w_pl = 0.94) {   # Fractional water space of plasma

  aco2 <- (3.07 - 0.057 * (temp - 37) + 0.002 *
             (temp - 37) ^ 2) * ((10 ^ (-5)) / w_pl)

  x <- aco2 * pco2

  return(x)
}

# Function to calculate F1, F2, F3, F4 (Equations 4a-d)
compute_F <- function (ph = 7.4) { # Plasma pH in standard conditions.

  # First, calculate erythrocyte pH.
  pHrbc <- 0.795 * ph + 1.357

  # Second, calculate hydrogen concentration in erythrocytes.
  hydrogen_con <- 10 ^ (- pHrbc)

  # Third, assign standard parameters based on Table 1.
  K2_prime2 <- 10 ^ -6
  K3_prime2 <- 10 ^ -6
  K5_prime2 <- 2.4 * (10 ^ -8)
  K6_prime2 <- 1.2 * (10 ^ -8)

  # Fourth, calculate F1, F2, F3 and F4.
  F1 <- 1 + (K2_prime2 / hydrogen_con)

  F2 <- 1 + (K3_prime2 / hydrogen_con)

  F3 <- 1 + (hydrogen_con / K5_prime2)

  F4 <- 1 + (hydrogen_con / K6_prime2)

  # Fifth, combine all F values into a vector.
  Fvec <- c(F1, F2, F3, F4)

  return(Fvec)
}

# Model of HbO2 saturation (SHbO2; equation 1a) based on Dash et al, 2016.
model_oxy_dash <- function(dpg_rbc = 4.65 * (10 ^ (-3)), # 2,3-BPG standard conditions.
                           po2 = 100,       # Partial pressure of oxygen in standard conditions.
                           pco2 = 40,       # Partial pressure of carbon dioxide in standard conditions.
                           ph = 7.4,        # Plasma pH in standard conditions.
                           temp = 37,       # Temperature in standard conditions.
                           w_pl = 0.94,     # Fractional water space of plasma.
                           p50.var = TRUE,  # Evaluate if p50 is in standard conditions.
                           k4.var = TRUE) { # Evaluate if K4' in standard conditions.

  # Step 1. Set the parameters based on Table 1.
  K2_prime1 <- 21.5 # or 23.65
  K3_prime1 <- 11.3 # or 14.7

  # Step 2. Calculate the free oxygen and carbon dioxide with equations 2a & 2b.
  free_oxy_bl <- oxy_bl(po2 = po2, temp = temp)
  free_co2_bl <- co2_bl(pco2 = pco2, temp = temp)

  # Step 3. Calculate F1-F4 using equations 4a-d.
  F1 <- compute_F(ph = ph)[1]
  F2 <- compute_F(ph = ph)[2]
  F3 <- compute_F(ph = ph)[3]
  F4 <- compute_F(ph = ph)[4]

  # Step 4. Calculate p50 using custom functions of equations 9a-d and 10.
  # Note: that way, we make SHbO2 dependent on all physiological variables,
  # namely 2,3-BPG, temperature, pH and PCO2.
  if(p50.var == TRUE) {

    p50 <- model_p50(pH_blood = ph, temp = temp,
                     pco2 = pco2, dpg_rbc = dpg_rbc)

  } else {

    # If p50 is in standard conditions.
    p50 <- 26.8
  }

  # Step 5. Evaluate if k4.var is TRUE.
  # If TRUE, the calculate K4_prime1 based on equation 7.
  if(k4.var == TRUE) {

    #  a. Calculate nH using equation 11.
    nH <-  compute_nHill(po2 = po2)

    #  b. Calculate ao2 using equation 2a.
    ao2 <- (1.37 - 0.0137 * (temp - 37) + 0.00058 *
              ((temp - 37) ^ 2)) * ((10 ^ (-6)) / w_pl)

    #  c. Calculate aco2 using equation 2b.
    aco2 <- (3.07 - 0.057 * (temp - 37) + 0.002 *
               (temp - 37) ^ 2) * ((10 ^ (-5)) / w_pl)

    #  d. Now calculate K4prime.
    K4_prime1 <- (((ao2 * po2) ^ (nH - 1)) * ((K2_prime1 * aco2 * pco2 * F1) + F3)) /
      (((ao2 * p50) ^ nH) * ((K3_prime1 * aco2 * pco2 * F2) + F4))

  } else {

    # If false then assign the standard value from Table 1 (Dash et al 2016).
    K4_prime1 <- 2.03 * (10 ^ 5)
  }

  # Step 6. Calculate KHbO2 using equation 3a.
  khbo2 <- (K4_prime1 * ((K3_prime1 * free_co2_bl * F2) + F4)) / ((K2_prime1 * free_co2_bl * F1) + F3)

  # Step 7. Calculate SHbO2 using equation 1a.
  shbo2 <-  (khbo2 * free_oxy_bl) / (1 + (khbo2 * free_oxy_bl))

  # Step 8. Combine the SHbO2, K4_prime, and KHbO2 values into a list.
  out <- list(shbo2, K4_prime1, khbo2)

  names(out) <- c("SHbO2", "K4prime", "KHbO2")

  return(out)
}

# References ----
# 1) Dash & Bassingthwaighte. 2010. (PMID: 20162361)
# 2) Dash et al. 2016. (PMID: 26298270)
