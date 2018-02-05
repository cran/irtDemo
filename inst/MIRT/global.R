N <- 50
# independent thetas
 thetas1 <- seq(from=-4, to=4, length.out = N)
 thetas2 <- seq(from=-4, to=4, length.out = N)

pjj <- matrix(NA,nrow=N,ncol=N)

# define probability function for M3PL compensatory model
Pfun <- function(theta1, theta2, c, d, alpha1, alpha2, delta1, delta2, D){
  gamma <- -(alpha1*delta1 + alpha2*delta2)
  alpha <- matrix(c(alpha1,alpha2), nrow=2, ncol=1)
  theta <- matrix(c(theta1,theta2), nrow=2, ncol=1)
  z <- D*(t(alpha)%*%theta + gamma)
  P <- c + (d-c)*(1/(1+exp(-z)))
  return(P)
}

# define probability function for M3PL noncompensatory model
Pfun2 <- function(theta1, theta2, c, d, alpha1, alpha2, delta1, delta2, D){
  gamma1 <- -(alpha1*delta1)
  gamma2 <- -(alpha2*delta2)
  z1 <- D*(alpha1*theta1 + gamma1)
  z2 <- D*(alpha2*theta2 + gamma2)
  P <- c + (d-c)*(1/(1+exp(-z1)))*(1/(1+exp(-z2)))
  return(P)
}
