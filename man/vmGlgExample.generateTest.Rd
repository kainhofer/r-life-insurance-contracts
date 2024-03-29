% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/showVmGlgExamples.R
\name{vmGlgExample.generateTest}
\alias{vmGlgExample.generateTest}
\title{Generate testthat output for unit-testing a tarif implementation}
\usage{
vmGlgExample.generateTest(contract, prf = 10, t = 10, t_prf = 12, ...)
}
\arguments{
\item{contract}{The insurance contract to calculate and generate unit-testing code.
If an InsuranceTarif object is given, a new contract with default
values is generated.}

\item{prf}{Time of premium waiver (premium-free)}

\item{t}{Time for which to calculate all values (except premium-free values)}

\item{t_prf}{Time for which to calculated all values after the premium waiver}

\item{...}{Further parameters for generating the contract for a tariff object}
}
\description{
This function calculates the required reference values for the given
insurance contract as required by the Austrian regulation (LV-VMGLV, "LV
Versicherungsmathematische Grundlagen Verordnung") and generates the
code for unit-testing the contract with these values. The code printed
can be directly copied into a unit test file.
}
\examples{
library(MortalityTables)
mortalityTables.load("Austria_Annuities_AVOe2005R")
# A trivial deferred annuity tariff with no costs:
tariff = InsuranceTarif$new(name="Test Annuity", type="annuity",
    mortalityTable = AVOe2005R.unisex, i=0.01)
vmGlgExample.generateTest(tariff,
    age = 35, YOB = 1981,
    policyPeriod = 30, premiumPeriod = 15, deferralPeriod = 15,
    sumInsured = 1000,
    contractClosing = as.Date("2016-10-01")
)

}
