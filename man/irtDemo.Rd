
\name{irtDemo}
\alias{irtDemo}
\alias{irtApp}
\alias{irtShiny}

\title{
  Item Response Theory Demo Collection
}

\description{
  Includes a collection of
  shiny applications to demonstrate
  or to explore fundamental item response
  theory (IRT) concepts such as estimation,
  scoring, and multidimensional IRT models.
}

\usage{
  irtDemo(text)
}

\arguments{
  \item{text}{argument in quotes refering to a demo. See details for demos available in the package.}
}

\details{
  \command{text} argument can be one of the followings:
   \itemize{
   \item{\dQuote{\command{mle}} for \emph{Maximum Likelihood Estimation} demo}
   \item{\dQuote{\command{est2pl}} for \emph{Estimation in 2PL Model} demo}
   \item{\dQuote{\command{est3pl}} for \emph{Estimation in 3PL Model} demo}
   \item{\dQuote{\command{eapMap}} for \emph{Expected a Posteriori (EAP) and Maximum a Posteriori (MAP) Estimation} demo}
   \item{\dQuote{\command{dich}} for \emph{Dichotomous IRT Models} demo}
   \item{\dQuote{\command{gpcm}} for \emph{Generalized Partial Credit and Partial Credit Models} demo}
   \item{\dQuote{\command{grm}} for \emph{Graded Response Model} demo}
   \item{\dQuote{\command{grsm}} for \emph{Generalized Rating Scale and Rating Scale Models} demo}
   \item{\dQuote{\command{nrm}} for \emph{Nominal Response Model} demo}
   \item{\dQuote{\command{mirt}} for \emph{Multidimensional Item Response Theory Model} demo}
   }
}

\author{
  Metin Bulus
   \email{bulusmetin@gmail.com}
}
\note{
\command{irtDemo} calls \command{runGist} function in \command{shiny} package, which requires internet connection.
}

\examples{
  \dontrun{
    irtDemo("eapMap")
    irtDemo("mirt")
  }
}

\keyword{IRT demo}
\keyword{IRT shiny applications}
