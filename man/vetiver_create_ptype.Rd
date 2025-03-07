% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/caret.R, R/lm.R, R/mlr3.R, R/ptype.R,
%   R/tidymodels.R, R/xgboost.R
\name{vetiver_ptype.train}
\alias{vetiver_ptype.train}
\alias{vetiver_ptype.lm}
\alias{vetiver_ptype.Learner}
\alias{vetiver_ptype}
\alias{vetiver_ptype.default}
\alias{vetiver_create_ptype}
\alias{vetiver_ptype.workflow}
\alias{vetiver_ptype.xgb.Booster}
\title{Create a vetiver input data prototype}
\usage{
\method{vetiver_ptype}{train}(model, ...)

\method{vetiver_ptype}{lm}(model, ...)

\method{vetiver_ptype}{Learner}(model, ...)

vetiver_ptype(model, ...)

\method{vetiver_ptype}{default}(model, ...)

vetiver_create_ptype(model, save_ptype, ...)

\method{vetiver_ptype}{workflow}(model, ...)

\method{vetiver_ptype}{xgb.Booster}(model, ...)
}
\arguments{
\item{model}{A trained model, such as an \code{lm()} model or a tidymodels
\code{\link[workflows:workflow]{workflows::workflow()}}.}

\item{...}{Other method-specific arguments passed to \code{\link[=vetiver_ptype]{vetiver_ptype()}}
to compute an input data prototype.}

\item{save_ptype}{Should an input data prototype be stored with the model?
The options are \code{TRUE} (the default, which stores a zero-row slice of the
training data), \code{FALSE} (no input data prototype for checking), or a
dataframe to be used for both checking at prediction time \emph{and} examples in
API visual documentation.}
}
\value{
A \code{vetiver_ptype} method returns a zero-row dataframe, and
\code{vetiver_create_ptype()} returns either such a zero-row dataframe, \code{NULL},
or the dataframe passed to \code{save_ptype}.
}
\description{
Optionally find and return an input data prototype for a model.
}
\details{
These are developer-facing functions, useful for supporting new model types.
A \code{\link[=vetiver_model]{vetiver_model()}} object optionally stores an input data prototype for
checking at prediction time.
\itemize{
\item The default for \code{save_ptype}, \code{TRUE}, finds an input data prototype (a
zero-row slice of the training data) via \code{\link[=vetiver_ptype]{vetiver_ptype()}}.
\item \code{save_ptype = FALSE} opts out of storing any input data prototype.
\item You may pass your own data to \code{save_ptype}, but be sure to check that it
has the same structure as your training data, perhaps with
\code{\link[hardhat:scream]{hardhat::scream()}}.
}
}
\examples{

cars_lm <- lm(mpg ~ cyl + disp, data = mtcars)

vetiver_create_ptype(cars_lm, TRUE)

## calls the right method for `model` via:
vetiver_ptype(cars_lm)

## can also turn off `ptype`
vetiver_create_ptype(cars_lm, FALSE)

}
