% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/open-api-spec.R
\name{api_spec}
\alias{api_spec}
\alias{glue_spec_summary}
\alias{glue_spec_summary.default}
\alias{glue_spec_summary.data.frame}
\alias{glue_spec_summary.array}
\title{Update the OpenAPI specification using model metadata}
\usage{
api_spec(spec, vetiver_model, path, all_docs = TRUE)

glue_spec_summary(ptype, return_type)

\method{glue_spec_summary}{default}(ptype, return_type = NULL)

\method{glue_spec_summary}{data.frame}(ptype, return_type = "predictions")

\method{glue_spec_summary}{array}(ptype, return_type = "predictions")
}
\arguments{
\item{spec}{An OpenAPI Specification formatted list object}

\item{vetiver_model}{A deployable \code{\link[=vetiver_model]{vetiver_model()}} object}

\item{path}{The endpoint path}

\item{all_docs}{Should the interactive visual API documentation be created
for \emph{all} POST endpoints in the router \code{pr}? This defaults to \code{TRUE}, and
assumes that all POST endpoints use the \code{vetiver_model$ptype} input data
prototype.}

\item{ptype}{An input data prototype from a model}

\item{return_type}{Character string to describe what endpoint returns, such
as "predictions"}
}
\value{
\code{api_spec()} returns the updated OpenAPI Specification object. This
function uses \code{glue_spec_summary()} internally, which returns a \code{glue}
character string.
}
\description{
Update the OpenAPI specification using model metadata
}
\examples{
library(plumber)
cars_lm <- lm(mpg ~ ., data = mtcars)
v <- vetiver_model(cars_lm, "cars_linear")

glue_spec_summary(v$ptype)

modify_spec <- function(spec) api_spec(spec, v, "/predict")
pr() \%>\% pr_set_api_spec(api = modify_spec)

}
