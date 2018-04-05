N <- 50
guesses <- seq(from=0.05, to=0.6, by=0.05)
thetas <- seq(from=-3, to=3, length.out = N)
deltas <- seq(from=-3, to=3, by=0.15)
alphas <- seq(from=-3, to=3, by=0.15)
k <- length(deltas)
# define probability function for 3PL model
Pfun <- function(guess, theta, alpha, delta, D=1, u=1){
  z = D*alpha*(theta-delta)
  P = guess + ((1-guess)* exp(z)/(1 + exp(z)))
  if(u==1){return(P)}
  if(u==0){return(1-P)}
}
# assing space for array and matrix
pik <- array(NA,dim=c(k,k,N))
logLike <- matrix(NA,k,k)
