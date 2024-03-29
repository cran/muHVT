% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mlayerHVT.R
\name{mlayerHVT}
\alias{mlayerHVT}
\title{Predict which cell and what level each point in the test dataset belongs to}
\usage{
mlayerHVT(
  data,
  hvt_mapA,
  hvt_mapB,
  hvt_mapC,
  mad.threshold = 0.2,
  normalize = T,
  distance_metric = "L1_Norm",
  error_metric = "max",
  child.level = 1,
  line.width = c(0.6, 0.4, 0.2),
  color.vec = c("#141B41", "#6369D1", "#D8D2E1"),
  yVar = NULL,
  ...
)
}
\arguments{
\item{data}{Data Frame. A dataframe containing test dataset. The dataframe should have atleast one variable used while training. The variables from
this dataset can also be used to overlay as heatmap}

\item{hvt_mapA}{A list of hvt.results.model obtained from HVT function while performing hierarchical vector quantization on train data}

\item{hvt_mapB}{A list of removed outlier rows using removedOutliers function}

\item{hvt_mapC}{A list of hvt.results.model obtained from HVT function while performing hierarchical vector quantization on train data without outlier(s)}

\item{mad.threshold}{A numeric values indicating the permissible Mean Absolute Deviation}

\item{normalize}{Logical. A logical value indicating if the columns in your
dataset should be normalized. Default value is TRUE.}

\item{distance_metric}{character. The distance metric can be 'Euclidean" or "Manhattan". Euclidean is selected by default.}

\item{error_metric}{character. The error metric can be "mean" or "max". mean is selected by default}

\item{child.level}{A number indicating the level for which the heat map is to be plotted.(Only used if hmap.cols is not NULL)}

\item{line.width}{Vector. A line width vector}

\item{color.vec}{Vector. A color vector}

\item{yVar}{character. Name of the dependent variable(s)}

\item{...}{color.vec and line.width can be passed from here}
}
\description{
Predict which cell and what level each point in the test dataset belongs to
}
\examples{
data(USArrests)

#Split in train and test
train <- USArrests[1:40,]
test <- USArrests[41:50,] 

hvt_mapA <- list()
hvt_mapA <- HVT(train, min_compression_perc = 70, quant.err = 0.2, 
                   distance_metric = "L1_Norm", error_metric = "mean",
                   projection.scale = 10, normalize = TRUE,
                   quant_method="kmeans")


identified_outlier_cells <- c(2, 10)
output_list <- removeOutliers(identified_outlier_cells, hvt_mapA)
hvt_mapB <- output_list[[1]]
dataset_without_outliers <- output_list[[2]] 


mapA_scale_summary = hvt_mapA[[3]]$scale_summary
hvt_mapC <- list()
hvt_mapC <- HVT(dataset_without_outliers, n_cells = 15, 
                 depth = 2, quant.err = 0.2, distance_metric = "L1_Norm",
                 error_metric = "max", quant_method = "kmeans",
                 projection.scale = 10, normalize = FALSE, scale_summary = mapA_scale_summary)

predictions <- list()
predictions <- mlayerHVT(test, hvt_mapA, hvt_mapB, hvt_mapC)

}
\seealso{
\code{\link{HVT}} \cr \code{\link{hvtHmap}}
}
\author{
Shubhra Prakash <shubhra.prakash@mu-sigma.com>, Sangeet Moy Das <sangeet.das@mu-sigma.com>, Shantanu Vaidya <shantanu.vaidya@mu-sigma.com>
}
\keyword{mlayer}
