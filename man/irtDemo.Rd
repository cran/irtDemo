
\name{irtDemo}
\alias{irtDemo}
\title{
  Item Response Theory Demo Collection
}

\description{
  Includes a collection of shiny applications to demonstrate
  or to explore fundamental item response theory (IRT) concepts
  such as estimation, scoring, and multidimensional IRT models.
}

\usage{
  irtDemo(text)
}

\arguments{
  \item{text}{argument in quotes refering to the name of shiny application. See details for the list of applications.}
}

\details{
  \command{text} argument can be one of the followings:
    \itemize{
      \item{\dQuote{\command{mle}} for \emph{Maximum Likelihood Estimation}}
      \item{\dQuote{\command{est2pl}} for \emph{Estimation in 2PL Model}}
      \item{\dQuote{\command{est3pl}} for \emph{Estimation in 3PL Model}}
      \item{\dQuote{\command{eapmap}} for \emph{Expected a Posteriori (EAP) and Maximum a Posteriori (MAP) Estimation}}
      \item{\dQuote{\command{dich}} for \emph{Dichotomous IRT Models}}
      \item{\dQuote{\command{gpcm}} for \emph{Generalized Partial Credit and Partial Credit Models}}
      \item{\dQuote{\command{grm}} for \emph{Graded Response Model}}
      \item{\dQuote{\command{grsm}} for \emph{Generalized Rating Scale and Rating Scale Models}}
      \item{\dQuote{\command{nrm}} for \emph{Nominal Response Model}}
      \item{\dQuote{\command{mirt}} for \emph{Multidimensional Item Response Theory Model}}
    }
}

\author{
  Metin Bulus
  \email{bulusmetin@gmail.com} and
  Wes Bonifay
  \email{bonifayw@missouri.edu}
}

\examples{
  \dontrun{

    irtDemo("eapmap")
    irtDemo("mirt")
  }
}

\keyword{irtDemo}
