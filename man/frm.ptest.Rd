\name{frm.ptest}
\alias{frm.ptest}

\title{
P Test for Fractional Regression Models
}

\description{
\code{frm.ptest} is used to test the specification of alternative non-nested fractional regression models.
}

\usage{
frm.ptest(object1, object2, version = "Wald", table = T)
}

\arguments{
  \item{object1}{
an object containing the results of an \code{frm} command.
}
  \item{object2}{
an object containing the results of another \code{frm} command.
}
  \item{version}{
a vector containing the test versions to use. Available options: \code{Wald} (the default) and \code{LM}. 
Both options may be chosen at the same time.
}
  \item{table}{
a logical value indicating whether a summary table with the test results should be printed.
}
}

\details{
\code{frm.ptest} applies the P test statistic proposed by Davidson and
MacKinnon (1981) to fractional regression models estimated via
\code{frm}. \code{frm.ptest} may be used to test against each other two alternative
specifications for the link function  in: (i) one-part fractional regression models;
(ii) the binary component of two-part fractional regression models; (iii) the
fractional component of two-part fractional regression models; and (iv) two-part
fractional regression models. In addition, \code{frm.ptest} may be used to test
one-part models against two-part models and in cases where the link functions are the
same but the regressors are non-nested. See Ramalho, Ramalho and Murteira (2011)
for details on the application of the P test in the fractional regression framework.
}

\value{
\code{frm.reset} returns a named vector with the test results.
}

\references{
Davidson, R. and J.G. MacKinnon (1981), "Several tests for model specification
on the presence of alternative hypotheses", \emph{Econometrica}, 49(3), 781-793.

Ramalho, E.A., J.J.S. Ramalho and J.M.R. Murteira (2011), "Alternative
estimating and testing empirical strategies for fractional regression models",
\emph{Journal of Economic Surveys}, 25(1), 19-68.
}

\author{
Joaquim J.S. Ramalho <jsr@uevora.pt>
}

\seealso{
\code{\link{frm}}, for fitting fractional regression models.\cr
\code{\link{frm.reset}} and \code{\link{frm.ggoff}}, for specification tests.\cr
\code{\link{frm.pe}}, for computing partial effects.
}

\examples{
## See the website http://evunix.uevora.pt/~jsr/FRM.htm.
}
