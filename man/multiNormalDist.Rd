% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/multiNormalDist.R
\name{multiNormalDist}
\alias{multiNormalDist}
\title{Multivariate normal distribution}
\usage{
multiNormalDist(sample.size = 2500, ncol = 5)
}
\arguments{
\item{sample.size}{Numeric. Indicating the sample size for distribution}

\item{ncol}{Numeric. Indicating the number of columns}
}
\description{
Function to generate multivariate normal distribution where each variable has a standard normal distribution N(0,1)
}
\details{
The multivariate normal distribution, multivariate Gaussian distribution, or 
joint normal distribution is a generalization of the one-dimensional (univariate) 
normal distribution to higher dimensions. It is a vector in multiple normally distributed variables, 
such that any linear combination of the variables is also normally distributed.
}
\examples{
multiNormalDist(2500,2) 
x=multiNormalDist(2500,2)
hist(x[,1])
}
\author{
Shubhra Prakash <shubhra.prakash@mu-sigma.com>
}
