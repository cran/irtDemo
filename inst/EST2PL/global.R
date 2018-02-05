N <- 50
thetas <- seq(from=-3, to=3, length.out = N)
deltas <- seq(from=-3, to=3, by=0.1)
alphas <- seq(from=-3, to=3, by=0.1)
k <- length(deltas)
# define probability function for 2PL model
Pfun <- function(theta, alpha, delta, D=1, u=1){
  z = D*alpha*(theta-delta)
  P = exp(u*z) / (1 + exp(z))
  return(P)
}