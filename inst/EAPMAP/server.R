shinyServer(function(input, output) {

     Xr <- reactive({
       seq(-4,4,length=input$quad) # equal distance abilities for quadrature
     })

     pattInput <- reactive({
      c(rep(1,input$r), rep(0,5-input$r)) # response pattern
     })

     # plot prior
     AXr <- reactive({
       Xr <- Xr()
       fGarch::dsnorm(Xr, mean=input$mean, sd=input$sd, xi = input$skew, log = FALSE)/sum(fGarch::dsnorm(Xr, mean=input$mean, sd=input$sd, xi = input$skew, log = FALSE))
     })

     pji <- reactive({
       Xr <- Xr()
       N <- length(Xr)
       pji <- matrix(NA,N,n)
       for(j in 1:N){
           for(i in 1:n){
               patt <- pattInput()
               Xr <- Xr()
               pji[j,i] <- PLfun(theta=Xr[j], alpha=alphas[i], delta=deltas[i], u=patt[i])
           }
       }
       pji
     })

     LXr <- reactive({
       pji <- pji()
       Xr <- Xr()
       N <- length(Xr)
       LXr <- matrix(NA,N,1)
       for(j in 1:N){
             LXr[j] <- prod(pji[j,])
       }
       LXr
     })

     output$Prior_plot <- renderPlot({
       Xr <- Xr()
       AXr <- AXr()
       graphics::plot(Xr, AXr, type='l', xlab=expression(X[r]), ylab=expression(A(X[r])),
            xlim=c(-6,6),
            main=expression(paste("Prior Distribution of ", theta)))
       inc <- (abs(Xr[2]-Xr[1])/2)
         for(i in 1:length(Xr)){
           polygon(x=c(Xr[i]-inc, Xr[i]+inc,Xr[i]+inc, Xr[i]-inc) , y=c(0,0,AXr[i],AXr[i]), density = c(30))
         }
       })


     output$TraceLines_plot <- renderPlot({
       Xr <- Xr()
       pji <- pji()
       patt <- pattInput()
       # plot trace lines
       graphics::plot(NULL, xlim=c(-3,3), ylim=c(0,1), xlab=expression(X[r]),
            ylab=expression(P(X[r])),
            main=expression(paste("Item Tracelines")))
       for(i in 1:n){
         lines(Xr, pji[,i], type='l', col=2+patt[i]*2)
       }
       legend(legend=c(1,0), col=c(4,2), lty=1, title="Response", "right")
     })


     output$Likelihood_plot <- renderPlot({
       Xr <- Xr()
       LXr <- LXr()
       # plot likelihood
       graphics::plot(Xr, LXr, type='l', xlab=expression(X[r]), ylab=expression(L(X[r])),
            xlim=c(-3,3),
            main=expression(paste("Likelihood")))
     })

     output$Posterior_plot<- renderPlot({
       Xr <- Xr()
       AXr <- AXr()
       LXr <- LXr()
       # plot posterior
       graphics::plot(Xr, AXr*LXr, type='l', xlab=expression(X[r]), ylab=expression(paste(A(X[r])," * ", L(X[r]))),
            xlim=c(-2.5,2.5),
            main=expression(paste("Posterior Distribution of ", theta)))
       EAP <- sum(Xr*AXr*LXr)/sum(AXr*LXr)
       PSD <- sqrt(sum((Xr-EAP)^2*LXr*AXr)/sum(LXr*AXr))
       MAP <- Xr[which.max(AXr*LXr)]
       abline(v=EAP, col=4)
       abline(v=MAP,col=2)
       text(-1.8, max(AXr*LXr)*.9, paste('EAP =',round(EAP,4)),col=4)
       text(1.8, max(AXr*LXr)*.9, paste('MAP =',round(MAP,4)),col=2)
     })

     output$Combined_plot<- renderPlot({
       Xr <- Xr()
       AXr <- AXr()
       LXr <- LXr()
       # plot posterior
       graphics::plot(Xr, 5*AXr*LXr, type='l', xlab=expression(X[r]), ylab=expression(f(X[r])), ylim=c(0,0.20), xlim=c(-4,4),
                                    main=expression(paste("Prior, Likelihood, and Posterior Distributions")),
                                    sub=expression(paste("Note: Posterior distribution is rescaled for comperability!")))
       # plot likelihood
       lines(Xr, LXr, type='l', col="blue")
       # plot prior
       lines(Xr, AXr, type='l', col="red")

       EAP <- sum(Xr*AXr*LXr)/sum(AXr*LXr)
       text(-3.5, 0.2, paste('Posterior Mean =',round(EAP,2)), col="black")
       text(3.5, 0.2, paste('Prior Mean =', input$mean), col="red")
       abline(v=input$mean,col="red", lty=2)
       abline(v=EAP, col="black", lty=2)

       legend(legend=c("Prior","Likelihood", "Posterior"), col=c("red","blue","black"), lty=1, title="Distribution", "right")
     })
})
