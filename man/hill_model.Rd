\name{hill_model}
\alias{hill_model}
\title{Hill Model}
\description{Hill's model of oxygen binding to hemoglobin.}
\arguments{
\item{po2}{A numeric value. Partial pressure of oxygen.}

\item{p50}{A numeric value. Partial pressure of oxygen where hemoglobin is 50\% saturated.}

\item{nhill.var}{A logical evaluating to TRUE or FALSE indicating if the nhill parameter should be vary or not.}

}
\usage{
hill_model(po2 = 100, p50 = 26.8, nhill.var = TRUE)
}
\value{
A numeric value representing hemoglobin's oxygen saturation. Under standard conditions, hemoglobin oxygen saturation is 97.6\%.
}
\examples{
hill_model()*100
}
\details{The Hill equation was originally formulated by Archibald Hill in 1910 to describe the sigmoidal O2 binding curve of hemoglobin (Wikipedia, 2025).}
