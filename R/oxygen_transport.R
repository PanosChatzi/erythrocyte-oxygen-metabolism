# Function to calculate the oxygen delivery capacity based on Dunn 2016.
compute_oxygen_capacity <- function(bind = 1.39,     # Binding capacity can vary between 1.30, 1.34 and 1.39.
                                    hb = 15,         # Hemoglobin concentration in grams per dL.
                                    sat = 0.972,     # Oxygen saturation.
                                    po2 = 100) {     # Partial pressure of oxygen in arterial blood.

  # Equation from Dunn 2016
  oxygen <- (bind * hb * sat) + (0.0225 * (po2 / 7.50062))

  return(oxygen)
}

# Define function based on the equation from Deranged Physiology.
compute_oxygen_capacity_2 <- function(bind = 1.36,     # Binding capacity can vary between 1.30, 1.34 and 1.39.
                                      hb = 150,        # Hemoglobin concentration in grams per dL.
                                      sat = 0.972,     # Oxygen saturation.
                                      po2 = 100) {     # Partial pressure of oxygen in arterial blood.

  oxygen <- (bind * hb * sat) + (0.03 * po2)

  return(oxygen)
}

# Based on the oxygen equation in Table 1 in Dash et al, 2016.
compute_oxygen_dash <- function(po2 = 100,               # Partial pressure of oxygen.
                                hct = 0.45,              # Hematocrit.
                                sat = 0.972,             # Oxygen saturation of hemoglobin.
                                blood_hb = 150,          # Hemoglobin concentration in blood (g / L).
                                temp = 37,               # Temperature in standard conditions.
                                water_plasma = 0.94,     # Fractional water space of plasma.
                                water_rbc = 0.65) {      # Fractional water space of erythrocytes.

  # 1. Fractional water space of blood.
  blood_w <- (1 - hct) * water_plasma + hct * water_rbc

  # 2. Solubility of oxygen in water at temperature = temp.
  ao2 <- (1.37 - 0.0137 * (temp - 37) + 0.00058 *
            ((temp - 37) ^ 2)) * ((10 ^ (-6)) / water_plasma)

  # 3. Hemoglobin concentration in erythrocytes.
  hb <- blood_hb / 64458
  erythro_hb <- hb / hct

  # 4. Total oxygen content in blood.
  total_oxygen <- blood_w * ao2 * po2 + 4 * hct * erythro_hb * sat

  # 5. Convert oxygen mol/l (M) to mL oxygen per 100 mL blood.
  converting_factor <- 22.256 # (L of gas/mol)
  converted.o2 <- total_oxygen * converting_factor * 100

  return(converted.o2)
}

# Oxygen delivery capacity in blood.
compute_oxygen_delivery <- function(co = 5,       # Cardiac out in L/min.
                                    total.oxygen) {

  do2 <- co * total.oxygen

  return(do2)
}

# References ----
# 1) Dunn. 2016. https://academic.oup.com/bjaed/article/16/10/341/2288629
# 2) Deranged Physiology website https://bit.ly/42kDXbm
