thetas <- seq(from=-6, to=6, by=0.1)
N = length(thetas)

# define a generic probability function 
Pfun <- function(alpha=1, theta, delta, D=1){
  z = D*alpha*(theta-delta)
  P = 1/(1 + exp(-z))
  return(P)
}


