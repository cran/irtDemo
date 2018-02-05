thetas <- seq(from=-6, to=6, by=0.1)
deltas <- seq(from=-6, to=6, by=0.1)
alphas <- seq(from=-6, to=6, by=0.1)
N = length(thetas)

# define probability function 
p2num <- matrix(NA,nrow=N,ncol=1)
p3num <- matrix(NA,nrow=N,ncol=1)
p4num <- matrix(NA,nrow=N,ncol=1)
p5num <- matrix(NA,nrow=N,ncol=1)

p2fun <- function(alpha1, theta, delta1, D){
  z1 <- D*alpha1*(theta-delta1)
  p2num <- exp(z1)
  return(p2num)
}

p3fun <- function(alpha2, theta, delta2, D){
  z2 <- D*alpha2*(theta-delta2)
  p3num <- exp(z2)
  return(p3num)
}

p4fun <- function(alpha3, theta, delta3, D){
  z3 <- D*alpha3*(theta-delta3)
  p4num <- exp(z3)
  return(p4num)
}

p5fun <- function(alpha4, theta, delta4, D){
  z4 <- D*alpha4*(theta-delta4)
  p5num <- exp(z4)
  return(p5num)
}