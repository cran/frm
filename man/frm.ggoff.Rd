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
\code{frm.ggoff} applies the GGOFF, GOFF1 and GOOFF2 test statistics to fractional regression
models estimated via \code{frm}. \code{frm.ggoff} may be used to test the link
specification of: (i) one-part fractional regression models; (ii) the binary
component of two-part fractional regression models; and (iii) the fractional
component of two-part fractional regression models. When the \code{Wald} 
version is implemented, it is taken into account the option that was chosen for 
computing standard errors in the model under evaluation. For the \code{LM} version,
a robust version is computed in cases (i) and (iii) and a conventional version in
case (ii). See Ramalho, Ramalho and Murteira (2014) for details on the application of the 
GGOFF, GOFF1 and GOOFF2 tests in the fractional regression framework.
}

\value{
\code{frm.ggoff} returns a named vector with the test results.
}

\references{
Ramalho, E.A., J.J.S. Ramalho and J.M.R. Murteira (2014), "A generalized
goodness-of-functional form test for binary and fractional regression models",
\emph{Manchester School}, 82(4), 488-507.
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
N <- 250
u <- rnorm(N)

X <- cbind(rnorm(N),rnorm(N))
dimnames(X)[[2]] <- c("X1","X2")

ym <- exp(X[,1]+X[,2]+u)/(1+exp(X[,1]+X[,2]+u))
y <- rbeta(N,ym*20,20*(1-ym))
y[y > 0.9] <- 1

#Testing the logit specification of a standard fractional regression model
#using LM and Wald versions of the GGOFF test, based on 1 or 2 fitted powers of
#the linear predictor
res <- frm(y,X,linkfrac="logit",table=FALSE)
frm.ggoff(res,c("Wald","LM"))

#Testing the probit specification of the binary component of a two-part fractional
#regression model using a LR-based GGOFF test
res <- frm(y,X,linkbin="probit",type="2Pbin",inf=1,table=FALSE)
frm.ggoff(res,"LR")

## See the website http://evunix.uevora.pt/~jsr/FRM.htm for more examples.
}
