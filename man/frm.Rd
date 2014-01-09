\name{frm}
\alias{frm}

\title{
Fitting Fractional Regression Models
}

\description{
\code{frm} is used to fit fractional regression models, i.e. regression models for proportions, percentages or fractions.
}

\usage{
frm(y, x, x2 = x, linkbin, linkfrac, type = "1P", inflation = 0, intercept = T,
	table = T, variance = T, ...)
}

\arguments{
  \item{y}{
a numeric vector containing the values of the response variable.
}
  \item{x}{
a numeric matrix containing the values of the covariates.
}
  \item{x2}{
a numeric matrix containing the values of the covariates in the fractional component of two-part models if 
option \code{type = "2P"} is defined. Defaults to \code{x}.
}
  \item{linkbin}{
a description of the link function to use in the binary component of a two-part fractional regression model. 
Available options: \code{logit}, \code{probit}, \code{cauchit}, \code{loglog}, \code{cloglog}.
}
  \item{linkfrac}{
a description of the link function to use in standard fractional regression models or in the fractional component 
of a two-part fractional regression model. Available options: \code{logit}, \code{probit}, \code{cauchit}, 
\code{loglog}, \code{cloglog}.
}
  \item{type}{
a description of the model to estimate: a standard one-part model (\code{1P}, the default), a two-part model 
(\code{2P}), the binary component of a two-part model (\code{2Pbin}) or the fractional component of a two-part 
model (\code{2Pfrac}).
}
  \item{inflation}{
a numeric value indicating which of the extreme values of \code{0} (the default) or \code{1} is the relevant boundary value for 
defining two-part fractional regression models.
}
  \item{intercept}{
a logical value indicating whether the model should include a constant term or not.
}
  \item{table}{
a logical value indicating whether a summary table with the regression results should be printed.
}
  \item{variance}{
a logical value indicating whether the variance of the estimated parameters should be calculated. Defaults to 
\code{TRUE} whenever \code{table = TRUE}.
}
  \item{\dots}{
Arguments to pass to \link[stats]{glm}.
}
}

\details{
\code{frm} estimates one- and two-part fractional regression models; see
Ramalho, Ramalho and Murteira (2011) for details on those models. The one-part
models and the fractional component of two-part models are estimated by
Bernoulli-based quasi-maximum likelihood, while the binary component of
two-part models is estimated by maximum likelihood. \code{frm} uses the standard
\link[stats]{glm} command to perform the estimations. Therefore,
\code{frm} is essentially a convenience command, allowing estimation of several
alternative fractional regression models using the same command. In addition,
\code{frm} provides an R-squared measure for all models (calculated as the square
of the correlation coefficient between the actual and fitted values of the
dependent variable), calculates the fitted values of the dependent variable in
two-part models and stores the information needed to implement some very useful
commands for fractional regression models: \link{frm.reset} (RESET test),
\link{frm.ptest} (P test), \link{frm.ggoff} (GGOFF tests) and \link{frm.pe} 
(partial effects).
}

\value{
When \code{type = "1P" or "2Pfrac"}, \code{frm} returns a list with the following elements:
  \item{class}{"frm".
}
  \item{formula}{the model formula.
}
  \item{type}{the name of the estimated model.
}
  \item{link}{the name of the specified link.
}
  \item{method}{estimation method. Currently, "QML" (quasi-maximum likelihood) for fractional components or models and
"ML" (maximum likelihood) for the binary component of two-part models.
}
  \item{p}{a named vector of coefficients.
}
  \item{yhat}{the fitted mean values.
}
  \item{xbhat}{the fitted mean values of the linear predictor.
}
  \item{converged}{logical. Was the algorithm judged to have converged?
}
  \item{x.names}{a vector containing the names of the covariates.
}

If \code{variance = TRUE} or \code{table = TRUE}, the previous list also contains the following element:
  \item{p.var}{a named covariance matrix.
}

When \code{type = "2Pbin"}, \code{frm} returns a similar list with the following additional element:
  \item{LL}{the value of the log-likelihood.
}

When \code{type = "2P"}, \code{frm} returns the two previous lists, indexed by the prefixes \code{resBIN} and 
\code{resFRAC}, and the following additional elements:
  \item{class}{see above.
}
  \item{type}{see above.
}
  \item{ybase}{a numeric vector containing the values of the response variable.
}
  \item{x2base}{a numeric matrix containing the values of the covariates.
}
  \item{yhat2P}{the overall fitted mean values.
}
  \item{converged}{see above.
}
}

\references{
Ramalho, E.A., J.J.S. Ramalho and J.M.R. Murteira (2011), "Alternative
estimating and testing empirical strategies for fractional regression models",
\emph{Journal of Economic Surveys}, 25(1), 19-68.
}

\author{
Joaquim J.S. Ramalho <jsr@uevora.pt>
}

\seealso{
\code{\link{frm.reset}} and \code{\link{frm.ggoff}}, for specification tests.\cr
\code{\link{frm.ptest}}, for non-nested hypothesis tests.\cr
\code{\link{frm.pe}}, for computing partial effects.
}

\examples{
## See the website http://evunix.uevora.pt/~jsr/FRM.htm.
}

