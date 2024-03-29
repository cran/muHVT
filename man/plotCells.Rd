% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotCells.R
\name{plotCells}
\alias{plotCells}
\title{Plot the identified outlier cell(s) in the voronoi tessellations map.

Plotting function to construct hierarchical voronoi tessellations and highlight the cells using the 
compressed HVT map.}
\usage{
plotCells(
  plot.cells,
  hvt.map,
  line.width = c(0.6),
  color.vec = c("#141B41"),
  pch1 = 21,
  centroid.size = 0.5,
  title = NULL,
  maxDepth = 1
)
}
\arguments{
\item{plot.cells}{Vector. A vector indicating the cells to be highlighted in the map}

\item{hvt.map}{List. A list containing the output of \code{HVT} function
which has the details of the tessellations to be plotted.}

\item{line.width}{Numeric Vector. A vector indicating the line widths of the
tessellation boundaries for each level.}

\item{color.vec}{Vector. A vector indicating the colors of the boundaries of
the tessellations at each level.}

\item{pch1}{Numeric. Symbol type of the centroids of the tessellations
(parent levels). Refer \code{\link{points}}. (default = 21)}

\item{centroid.size}{Numeric. Size of centroids of first level
tessellations. (default = 3)}

\item{title}{String. Set a title for the plot. (default = NULL)}

\item{maxDepth}{Numeric. An integer indicating the number of levels. (default = NULL)}
}
\description{
Plot the identified outlier cell(s) in the voronoi tessellations map.

Plotting function to construct hierarchical voronoi tessellations and highlight the cells using the 
compressed HVT map.
}
\seealso{
\code{\link{HVT}} \cr \code{\link{hvtHmap}}
}
\author{
Shantanu Vaidya <shantanu.vaidya@mu-sigma.com>
}
\keyword{hplot}
