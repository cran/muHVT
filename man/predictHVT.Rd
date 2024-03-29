% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/predictHVT.R
\name{predictHVT}
\alias{predictHVT}
\title{Predict which cell and what level each point in the test dataset belongs to}
\usage{
predictHVT(
  data,
  hvt.results.model,
  child.level = 1,
  mad.threshold = 0.2,
  line.width = c(0.6, 0.4, 0.2),
  color.vec = c("#141B41", "#6369D1", "#D8D2E1"),
  normalize = T,
  distance_metric = "L1_Norm",
  error_metric = "max",
  yVar = NULL,
  ...
)
}
\arguments{
\item{data}{List. A dataframe containing test dataset. The dataframe should have atleast one variable used while training. The variables from
this dataset can also be used to overlay as heatmap}

\item{hvt.results.model}{A list of hvt.results.model obtained from HVT function while performing hierarchical vector quantization on train data}

\item{child.level}{A number indicating the level for which the heat map is to be plotted.(Only used if hmap.cols is not NULL)}

\item{mad.threshold}{A numeric values indicating the permissible Mean Absolute Deviation}

\item{line.width}{Vector. A line width vector}

\item{color.vec}{Vector. A color vector}

\item{normalize}{Logical. A logical value indicating if the columns in your
dataset should be normalized. Default value is TRUE.}

\item{distance_metric}{character. The distance metric can be 'Euclidean" or "Manhattan". Euclidean is selected by default.}

\item{error_metric}{character. The error metric can be "mean" or "max". mean is selected by default}

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

hvt.results <- list()
hvt.results <- HVT(train, n_cells = 15, depth = 1, quant.err = 0.2, 
                   distance_metric = "L1_Norm", error_metric = "mean",
                   projection.scale = 10, normalize = TRUE,
                   quant_method="kmeans",diagnose=TRUE)

predictions <- predictHVT(test,hvt.results, child.level=2,mad.threshold = 0.2)
print(predictions$scoredPredictedData)
}
\seealso{
\code{\link{HVT}} \cr \code{\link{hvtHmap}}
}
\author{
Shubhra Prakash <shubhra.prakash@mu-sigma.com>, Sangeet Moy Das <sangeet.das@mu-sigma.com>
}
\keyword{predict}
