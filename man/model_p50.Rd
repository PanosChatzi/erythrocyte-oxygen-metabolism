\name{model_p50()}
\alias{model_p50()}
\title{P50}
\description{The partial pressure of oxygen at which hemoglobin achieves 50\% saturation.}
\arguments{
\item{pH_blood}{A numeric value. Represents the pH measured in blood.}

\item{pco2}{ A numeric value. Represents the partial pressure of carbon dioxide (mmHg).}

\item{dpg_rbc}{A numeric value. 2,3-bisphosphoglycerate (2,3-BPG) in erythrocytes (mol/L).}

\item{temp}{A numeric value. Temperature in erythrocytes (degrees celsius).}

\item{p50_s}{A numeric value. p50 in standard or baseline conditions.}

\item{pH_s}{A numeric value. Erythrocyte pH in standard or baseline conditions.}

\item{pco2_s}{A numeric value. PCO2 in standard or baseline conditions (mmHg).}

\item{dpg_s}{A numeric value. 2,3-BPG in standard or baseline conditions.}

\item{temp_s}{A numeric value. Temperature in standard or baseline conditions (degrees celsius).}

\item{is_blood_ph}{A logical evaluating to TRUE or FALSE indicating whether pH_blood was measured in blood or erythrocytes.}

}
\usage{
model_p50()
}
\details{This model was created based on the equations and data from
Dash & Bassingthwaighte. 2010 and Dash et al. 2016 (PMID: 20162361; PMID: 26298270).
For more information, please refer to the original papers by Dash & Bassingthwaighte,
or the review paper by Chatzinikolaou PN et al 2024 in PubMed (PMID: 38270467).
Data used in the example can be found in Table 1 of Dash et al. 2016.
}
\value{
A numeric value of the p50 partial pressure of oxygen. Under standard conditions,
p50 is 26.8 mmHg.
}
\examples{
model_p50(pH_blood = 7.4,     # pH standard conditions
pco2 = 40,                    # pco2 standard conditions
dpg_rbc = 4.65 * (10 ^ (-3)), # 2,3-BPG standard conditions
temp = 37,                    # Temperature standard conditions
p50_s = 26.8,                 # p50 in standard conditions
pH_s = 7.24,                  # pH standard conditions
pco2_s = 40,                  # pco2 standard conditions
dpg_s = 4.65 * (10 ^ (-3)),   # 2,3-BPG standard conditions
temp_s = 37,                  # Temperature standard conditions
is_blood_ph = TRUE)           # Logical index evaluating if pH was measured in blood or erythrocyte
}
