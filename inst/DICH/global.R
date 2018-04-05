la <- seq(from=0.05, to=0.6, by=0.1)
ua <- seq(from=0.05, to=0.6, by=0.1)
thetas <- seq(from=-6, to=6, by=0.1)
deltas <- seq(from=-6, to=6, by=0.1)
alphas <- seq(from=-6, to=6, by=0.1)
N = length(thetas)

p1 <- matrix(NA,nrow=N,1)

# define a generic probability function 
Pfun <- function(la=0, ua=1, alpha=1, theta, delta, D=1){
  z = D*alpha*(theta-delta)
  P = la + ((ua-la)/(1 + exp(-z)))
  return(P)
}
