\name{frm.ggoff}
\alias{frm.ggoff}

\title{
GGOFF Tests for Fractional Regression Models
}

\description{
\code{frm.ggoff} is used to test the specification of fractional regression models.
}

\usage{
frm.ggoff(object, version = "LM", table = T, ...)
}

\arguments{
  \item{object}{
an object containing the results of an \code{frm} command.
}
  \item{version}{
a vector containing the test versions to use. Available options: \code{Wald}, \code{LM} (the default) and, for the binary 
component of two-part models, \code{LR}. More than one option may be chosen.
}
  \item{table}{
a logical value indicating whether a summary table with the test results should be printed.
}
  \item{\dots}{
Arguments to pass to \link[stats]{glm}, which is used to estimate the model under the alternative hypothesis when
\code{version} is vector containing \code{"Wald"} or \code{"LR"}.
}
}

\details{
\code{frm.ggoff} applies the GGOFF, GOFF1 and GOOFF2 test statistics to fractional regression
models estimated via \code{frm}. \code{frm.ggoff} may be used to test the link
specification of: (i) one-part fractional regression models; (ii) the binary
component of two-part fractional regression models; and (iii) the fractional
component of two-part fractional regression models. See Ramalho, Ramalho
and Murteira (2013) for details on the application of the GGOFF, GOFF1 and GOOFF2 tests in the
fractional regression framework.
}

\value{
\code{frm.ggoff} returns a named vector with the test results.
}

\references{
Ramalho, E.A., J.J.S. Ramalho and J.M.R. Murteira (2014), "A generalized
goodness-of-functional form test for binary and fractional regression models",
\emph{Manchester School}, forthcoming.
}

\author{
Joaquim J.S. Ramalho <jsr@uevora.pt>
}

\seealso{
\code{\link{frm}}, for fitting fractional regression models.\cr
\code{\link{frm.reset}}, for asymptotically equivalent specification tests.\cr
\code{\link{frm.ptest}}, for non-nested hypothesis tests.\cr
\code{\link{frm.pe}}, for computing partial effects.
}

\examples{
## See the website http://evunix.uevora.pt/~jsr/FRM.htm.
}
