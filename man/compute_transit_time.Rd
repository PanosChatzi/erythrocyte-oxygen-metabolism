\name{compute_transit_time()}
\alias{compute_transit_time()}
\title{Capillary transit time}
\description{The transit time of erythrocytes within a capillary.}
\arguments{
\item{cap_diameter}{A numeric value. Mean diameter of an individual capillary (μm).}

\item{cap_density}{A numeric value. Mean capillary density (capillaries per mm^2).}

\item{blood_flow_rate}{A numeric value. Muscle blood flow rate (mL/s per g).}

}
\usage{
compute_transit_time()
}
\details{This model was created based on the equations and data from
Richardson RS et al. 1993 and 1994 (PMID: 7597979; PMID: 8282650). For more information,
please refer to the original papers by Richardson RS et al, or the review paper
by Chatzinikolaou PN et al 2024 in PubMed (PMID: 38270467).
}
\value{
A numeric value of capillary transit time in seconds.
}
\examples{
compute_transit_time(
cap_diameter = 6,               # mean capillary diameter (μm)
cap_density = 200,              # capillary density (capillaries / mm^2)
blood_flow_rate = 0.06416667)   # muscle blood flow rate (mL/s per g)
}
