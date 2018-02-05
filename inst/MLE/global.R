# define prob function
Pfun <- function(theta, delta, D=1, u=1){
  z = D*(theta-delta)
  P = exp(u*z) / (1 + exp(z))
  return(P)
}

deltas <- c(-1.90, -0.60, -0.25, 0.30, 0.45)
thetas <- seq(from=-6, to=6, by=0.001)
N <- length(thetas)
n <- length(deltas)
pji <- matrix(NA,N,n)
logLike <- matrix(NA,N,3)
colnames(logLike) <- c("thetas", "LogLike", "Like")