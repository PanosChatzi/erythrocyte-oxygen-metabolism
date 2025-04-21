\name{model_oxy_dash()}
\alias{model_oxy_dash()}
\title{Oxygen saturation model}
\description{Model of hemoglobin oxygen saturation based on Dash and Bassingthwaighte.}
\arguments{
\item{dpg_rbc}{A numeric value. 2,3-bisphosphoglycerate (2,3-BPG) in erythrocytes (mol/L).}

\item{po2}{A numeric value. Partial pressure of oxygen (mmHg).}

\item{pco2}{A numeric value. Partial pressure of carbon dioxide (mmHg).}

\item{ph}{A numeric value. Blood pH in standard or baseline conditions.}

\item{temp}{A numeric value. Erythrocyte temperature (degrees celsius).}

\item{w_pl}{A numeric value. Fractional water space of plasma.}

\item{p50.var}{A logical evaluating to TRUE or FALSE indicating whether p50 should be in standard conditions or calculated based on experimental values.}

\item{k4.var}{A logical evaluating to TRUE or FALSE indicating whether the parameter K4' in standard conditions.}

}
\usage{
model_oxy_dash()
}
\details{This model was created based on the equations and data from
Dash & Bassingthwaighte. 2010 and Dash et al. 2016 (PMID: 20162361; PMID: 26298270).
For more information, please refer to the original papers by Dash & Bassingthwaighte,
or the review paper by Chatzinikolaou PN et al 2024 in PubMed (PMID: 38270467).
Data used in the example can be found in Table 1 of Dash et al. 2016.
}
\value{
Returns a list of three numeric values. The first list contains the hemoglobin
oxygen saturation, similar to the Hill model. The second list contains a key
parameter in Dash and Bassingthwaighte's model, the K4prime. The third list
contains the apparent equilibrium constant of hemoglobin and oxygen binding.
}
\examples{
model_oxy_dash(
dpg_rbc = 4.65 * (10 ^ (-3)),   # 2,3-BPG standard conditions.
po2 = 100,                      # Partial pressure of oxygen in standard conditions.
pco2 = 40,                      # Partial pressure of carbon dioxide in standard conditions
ph = 7.4,                       # Blood pH in standard conditions.
temp = 37,                      # Temperature in standard conditions.
w_pl = 0.94,                    # Fractional water space of plasma.
p50.var = TRUE,                 # Evaluate if p50 is in standard conditions.
k4.var = TRUE                   # Evaluate if K4' in standard conditions.
)
}
