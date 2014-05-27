\name{frm.reset}
\alias{frm.reset}

\title{
RESET Test for Fractional Regression Models
}

\description{
\code{frm.reset} is used to test the specification of fractional regression models.
}

\usage{
frm.reset(object, lastpower.vec = 3, version = "LM", table = T, ...)
}

\arguments{
  \item{object}{
an object containing the results of an \code{frm} command.
}
  \item{lastpower.vec}{
a numeric vector containing the maximum powers of the linear predictors to be used in RESET tests.
}
  \item{version}{
a vector containing the test versions to use. Available options: \code{Wald}, \code{LM} (the default) and, only
for the binary component of two-part models, \code{LR}. More than one option may be chosen.
}
  \item{table}{
a logical value indicating whether a summary table with the test results should be printed.
}
  \item{\dots}{
Arguments to pass to \link[stats]{glm}, which is used to estimate the model under the alternative hypothesis when
\code{version} is a vector containing \code{"Wald"} or \code{"LR"}.
}
}

\details{
\code{frm.reset} applies the RESET test statistic to fractional regression
models estimated via \code{frm}. \code{frm.reset} may be used to test the link
specification of: (i) one-part fractional regression models; (ii) the binary
component of two-part fractional regression models; and (iii) the fractional
component of two-part fractional regression models. When the \code{Wald} 
version is implemented, it is taken into account the option that was chosen for 
computing standard errors in the model under evaluation. For the \code{LM} version,
a robust version is computed in cases (i) and (iii) and a conventional version in
case (ii). See Ramalho, Ramalho and Murteira (2011) for details on the 
application of the RESET test in the fractional regression framework.
}

\value{
\code{frm.reset} returns a named vector with the test results.
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
\code{\link{frm}}, for fitting fractional regression models.\cr
\code{\link{frm.ggoff}}, for asymptotically equivalent specification tests.\cr
\code{\link{frm.ptest}}, for non-nested hypothesis tests.\cr
\code{\link{frm.pe}}, for computing partial effects.
}

\examples{
## See the website http://evunix.uevora.pt/~jsr/FRM.htm.
}
