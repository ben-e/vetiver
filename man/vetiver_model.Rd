% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vetiver-model.R
\name{vetiver_model}
\alias{vetiver_model}
\alias{new_vetiver_model}
\title{Create a vetiver object for deployment of a trained model}
\usage{
vetiver_model(
  model,
  model_name,
  ...,
  description = NULL,
  metadata = list(),
  save_ptype = TRUE,
  versioned = NULL
)

new_vetiver_model(model, model_name, description, metadata, ptype, versioned)
}
\arguments{
\item{model}{A trained model, such as an \code{lm()} model or a tidymodels
\code{\link[workflows:workflow]{workflows::workflow()}}.}

\item{model_name}{Model name or ID.}

\item{...}{Other method-specific arguments passed to \code{\link[=vetiver_ptype]{vetiver_ptype()}}
to compute an input data prototype.}

\item{description}{A detailed description of the model. If omitted, a brief
description of the model will be generated.}

\item{metadata}{A list containing additional metadata to store with the pin.
When retrieving the pin, this will be stored in the \code{user} key, to
avoid potential clashes with the metadata that pins itself uses.}

\item{save_ptype}{Should an input data prototype be stored with the model?
The options are \code{TRUE} (the default, which stores a zero-row slice of the
training data), \code{FALSE} (no input data prototype for checking), or a
dataframe to be used for both checking at prediction time \emph{and} examples in
API visual documentation.}

\item{versioned}{Should the model object be versioned when stored with
\code{\link[=vetiver_pin_write]{vetiver_pin_write()}}? The default, \code{NULL}, will use the default for the
\code{board} where you store the model.}

\item{ptype}{An input data prototype. If \code{NULL}, there is no checking of
new data at prediction time.}
}
\value{
A new \code{vetiver_model} object.
}
\description{
A \code{vetiver_model()} object collects the information needed to store, version,
and deploy a trained model. Once your \code{vetiver_model()} object has been
created, you can:
\itemize{
\item store and version it as a pin with \code{\link[=vetiver_pin_write]{vetiver_pin_write()}}
\item create an API endpoint for it with \code{\link[=vetiver_pr_predict]{vetiver_pr_predict()}}
}
}
\details{
You can provide your own data to \code{save_ptype} to use as examples in the
visual documentation created by \code{\link[=vetiver_pr_predict]{vetiver_pr_predict()}}. If you do this,
consider checking that your input data prototype has the same structure
as your training data (perhaps with \code{\link[hardhat:scream]{hardhat::scream()}}) and/or simulating
data to avoid leaking PII via your deployed model.
}
\examples{

cars_lm <- lm(mpg ~ ., data = mtcars)
vetiver_model(cars_lm, "cars_linear", pins::board_temp())

}
