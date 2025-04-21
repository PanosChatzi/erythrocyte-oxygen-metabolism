\name{plot_hill}
\alias{plot_hill}
\title{Oxygen Dissociation Curve}
\description{The hemoglobin oxygen dissociation curve plot.}
\arguments{
\item{po2}{A numeric value represeting the partial pressure of oxygen.}

\item{p50_pre}{A numeric value. Baseline partial pressure of oxygen where hemoglobin is 50\% saturated.}

\item{p50_post}{A numeric value. Follow-up p50 value.}

\item{add.second.curve}{A logical evaluating to TRUE or FALSE indicating whether to plot the second curve based on the p50 post value.}

\item{add.std.p50}{A logical evaluating to TRUE or FALSE indicating whether to add a vertical line of baseline p50 value.}

\item{add.new.p50}{A logical evaluating to TRUE or FALSE indicating whether to add a vertical line of follow-up p50 value.}

\item{add.arrow}{A logical evaluating to TRUE or FALSE indicating whether to add an arrow showing the direction of p50 change.}

\item{add.text }{A logical evaluating to TRUE or FALSE indicating whether to add show p50 value in the plot.}

}
\usage{
plot_hill()
}
\details{The Hill equation models hemoglobin oxygen dissociation as a sigmoidal curve.}
\value{
Plot of the oxygen dissociation curve.
}
\examples{
plot_hill()

plot_hill(p50_post = 30,
add.second.curve = TRUE,
add.std.p50 = TRUE,
add.new.p50 = TRUE,
add.arrow = TRUE,
add.text = TRUE)
}
