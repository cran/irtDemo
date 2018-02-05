thetas <- seq(from=-6, to=6, by=0.1)
deltas <- seq(from=-6, to=6, by=0.1)
alphas <- seq(from=-6, to=6, by=0.1)
N = length(thetas)

# define probability function 
p1num <- matrix(NA,nrow=N,ncol=1)
p2num <- matrix(NA,nrow=N,ncol=1)
p3num <- matrix(NA,nrow=N,ncol=1)
p4num <- matrix(NA,nrow=N,ncol=1)
p5num <- matrix(NA,nrow=N,ncol=1)

p2fun <- function(alpha, theta, delta, tau1, D){
  z1 <- D*alpha*(theta-(delta+tau1))
  p2num <- exp(0+z1)
  return(p2num)
}

p3fun <- function(alpha, theta, delta, tau1, tau2, D){
  z1 <- D*alpha*(theta-(delta+tau1))
  z2 <- D*alpha*(theta-(delta+tau2))
  p3num <- exp(0+z1+z2)
  return(p3num)
}

p4fun <- function(alpha, theta, delta, tau1, tau2, tau3, D){
  z1 <- D*alpha*(theta-(delta+tau1))
  z2 <- D*alpha*(theta-(delta+tau2))
  z3 <- D*alpha*(theta-(delta+tau3))
  p4num <- exp(0+z1+z2+z3)
  return(p4num)
}

p5fun <- function(alpha, theta, delta, tau1, tau2, tau3, tau4, D){
  z1 <- D*alpha*(theta-(delta+tau1))
  z2 <- D*alpha*(theta-(delta+tau2))
  z3 <- D*alpha*(theta-(delta+tau3))
  z4 <- D*alpha*(theta-(delta+tau4))
  p5num <- exp(0+z1+z2+z3+z4)
  return(p5num)
}