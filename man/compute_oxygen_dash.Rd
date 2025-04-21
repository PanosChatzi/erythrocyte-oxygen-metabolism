\name{compute_oxygen_dash()}
\alias{compute_oxygen_dash()}
\title{Total oxygen concentration in blood}
\description{Calculates the total oxygen concentration in whole blood.}
\arguments{
\item{po2}{A numeric value. Partial pressure of oxygen (mmHg).}

\item{hct}{A numeric value. Hematocrit.}

\item{sat}{A numeric value. Oxygen saturation of hemoglobin.}

\item{blood_hb}{A numeric value. Hemoglobin concentration in blood (g / L).}

\item{temp}{A numeric value. Blood temperature (degrees celsius).}

\item{water_plasma}{A numeric value. Fractional water space of plasma.}

\item{water_rbc}{A numeric value. Fractional water space of erythrocytes.}

}
\usage{
compute_oxygen_dash()
}
\details{This model was created based on the equations and data from Dash et al. 2016
(PMID: 26298270). Data used in the example can be found in Table 1 of Dash et al. 2016.
}
\value{
A numeric value representing the total oxygen concentration in whole blood in M (mol/L).
}
\examples{
compute_oxygen_dash(
po2 = 100,               # Partial pressure of oxygen.
hct = 0.45,              # Hematocrit.
sat = 0.972,             # Oxygen saturation of hemoglobin.
blood_hb = 150,          # Hemoglobin concentration in blood (g / L).
temp = 37,               # Temperature in standard conditions.
water_plasma = 0.94,     # Fractional water space of plasma.
water_rbc = 0.65         # Fractional water space of erythrocytes.
)
}
