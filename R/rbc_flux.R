compute_transit_time <- function(cap_diameter,    # mean capillary diameter (μm)
                                 cap_density,     # capillary density (capillaries / mm^2)
                                 blood_flow_rate, # mL/s per g
                                 tortuosity_constant = 1.2) {


  # Calculate individual capillary cross-sectional area from capillary diameter.
  compute_cap_area <- function(cap_diameter = cap_diameter) {

    cap_radius <- cap_diameter / 2      # individual capillary radius (μm)

    cap_area <- pi * (cap_radius^2)     # individual capillary CSA (μm^2)

    return(cap_area)                    # individual capillary CSA (μm^2)
  }

  cap_area <- compute_cap_area(cap_diameter = cap_diameter)

  # Calculate total capillary area
  total_cap_area <- cap_area * cap_density

  # Calculate the capillary fractional area per fiber area (1 mm^2 or 1.000.000 μm^2)
  fiber_area <- 1000000
  fractional_area_per_fiber <- total_cap_area / fiber_area

  # Adjust for tortuosity and branching using a constant of 1.2
  # (1.0 = perfect anisotropy & 2.0 = random orientation).
  adjusted_area_per_fiber <- fractional_area_per_fiber * tortuosity_constant

  # Divide by muscle blood_flow_rate (mL/s per g).
  transit_time <- adjusted_area_per_fiber / blood_flow_rate

  return(transit_time)
}

# References
#
# 1. Richardson RS et al. Red blood cell transit time in man: theoretical effects of capillary density.
#    Adv Exp Med Biol. 1994;361:521-32. doi: 10.1007/978-1-4615-1875-4_91. PMID: 7597979.
#
# 2. Richardson RS et al. High muscle blood flow in man: is maximal O2 extraction compromised?
#    J Appl Physiol (1985). 1993 Oct;75(4):1911-6. doi: 10.1152/jappl.1993.75.4.1911. PMID: 8282650.
