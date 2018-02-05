require(shinydashboard)
require(fGarch)
# define probability or likelihood function for 2PL model
PLfun <- function(theta, alpha, delta, D=1, u=1){
  z = D*alpha*(theta-delta)
  P = exp(u*z) / (1 + exp(z))
  return(P)
}

alphas <- c(1,1,1,1,1) # discriminations
deltas <- c(-2.155, -.245, .206, .984, 1.211) # de Ayala difficulty estimates (Table 4.4)
n <- length(deltas)