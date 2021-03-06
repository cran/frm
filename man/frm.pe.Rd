\name{frm.pe}
\alias{frm.pe}

\title{
Fractional Regression Models - Partial Effects
}

\description{
\code{frm.pe} is used to compute average and/or conditional partial effects in fractional regression models.
}

\usage{
frm.pe(object, APE = T, CPE = F, at = NULL, which.x = NULL, variance = T, table = T)
}

\arguments{
  \item{object}{
an object containing the results of an \code{frm} command.
}
  \item{APE}{
a logical value indicating whether average partial effects are to be computed.
}
  \item{CPE}{
a logical value indicating whether conditional partial effects are to be computed.
}
  \item{at}{
a numeric vector containing the covariates' values at which the conditional partial effects are to be computed or 
the strings \code{"mean"} (the default) or \code{"median"}, in which cases the covariates are evaluated at their 
mean or median values (or mode, in case of dummy variables), respectively.
}
  \item{which.x}{
a vector containing the names of the covariates to which the partial effects are to be computed.
}
  \item{variance}{
a logical value indicating whether the variance of the estimated partial effects should be calculated. Defaults to 
\code{TRUE} whenever \code{table = TRUE}.
}
  \item{table}{
a logical value indicating whether a summary table with the results should be printed.
}
}

\details{
\code{frm.pe} calculates partial effects for fractional regression models estimated via
\code{frm}. \code{frm.pe} may be used to compute average or conditional partial effects for:
(i) one-part fractional regression models; (ii) the binary component of two-part fractional
regression models; (iii) the fractional component of two-part fractional regression
models; and (iv) two-part fractional regression models. For calculating standard errors, it 
is taken into account the option that was previously chosen for estimating the model. See 
Ramalho, Ramalho and Murteira (2011) for details on the computation of partial effects in 
the fractional regression framework.
}

\value{
\code{frm.pe} returns a list with the following element:
  \item{PE.p}{a named vector of partial effects.
}

If \code{variance = TRUE} or \code{table = TRUE}, the previous list also contains the following element:
  \item{PE.sd}{a named vector of standard errors of the estimated partial effects.
}

When both average and conditional partial effects are requested, two lists containing the previous elements are 
returned, indexed by the prefixes \code{ape} and \code{cpe}.
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
\code{\link{frm.reset}} and \code{\link{frm.ggoff}}, for specification tests.\cr
\code{\link{frm.ptest}}, for non-nested hypothesis tests.
}

\examples{
N <- 250
u <- rnorm(N)

X <- cbind(rnorm(N),rnorm(N))
dimnames(X)[[2]] <- c("X1","X2")

ym <- exp(X[,1]+X[,2]+u)/(1+exp(X[,1]+X[,2]+u))
y <- rbeta(N,ym*20,20*(1-ym))
y[y > 0.9] <- 1

#Computing average partial effects for a logit fractional regression model
res <- frm(y,X,linkfrac="logit",table=FALSE)
frm.pe(res)

#Computing average partial effects for a binary logit + fractional probit
#two-part model
res <- frm(y,X,linkbin="logit",linkfrac="probit",type="2P",inf=1,table=FALSE)
frm.pe(res)

#Computing conditional partial effects for X2 in the logit component
#of a two-part fractional regression model, with the covariates evaluated
#at their median values
res <- frm(y,X,linkfrac="logit",type="2Pfrac",inf=1,table=FALSE)
frm.pe(res,APE=FALSE,CPE=TRUE,at="median",which.x="X2")

## See the website http://evunix.uevora.pt/~jsr/FRM.htm for more examples.
}
