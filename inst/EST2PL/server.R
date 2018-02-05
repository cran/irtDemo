shinyServer(function(input, output) {

    # simulate reponses for 2PL model

    pcorrmtx <- reactive({
      pcorrmtx <- matrix(NA, nrow=N, ncol=1)
      for(j in 1:N){
        pcorrmtx[j] <- Pfun(theta=thetas[j], delta=input$delta, alpha=input$alpha)
      }
      pcorrmtx
    })


    datamtx <- reactive({
      pcorrmtx <- pcorrmtx()
      datamtx <- matrix(NA, nrow=N, ncol=1)
      for(j in 1:N){
        datamtx[j] <- rbinom(1,1,pcorrmtx[j])
      }
      datamtx
    })


    logLike <- reactive({
      datamtx <- datamtx()
      # calculate the joint log-likelihood
      pik <- array(NA, dim=c(k,k,N))
      logLike <- matrix(NA,k,k)
        for (m in 1:k){
          for(n in 1:k){
            for (j in 1:N){
              pik[m,n,j] <- Pfun(theta=thetas[j], alpha=alphas[m], delta=deltas[n], u=datamtx[j])
            }
            logLike[m,n] <- sum(log(pik[m,n,]))
          }
        }
       logLike
      })

    xy <- reactive({
      logLike <- logLike()
      which(logLike==max(logLike), TRUE)
      })

    output$est2PL_plot <- renderPlot({
      xy <- xy()
      logLike <- logLike()
        # plot joint log-likelihood as function of alpha and delta
        logLike3D <-  graphics::persp(alphas, deltas, logLike,
                             theta=input$angle1, phi=input$angle2,
                             col="#347AB6", #rgb(52,122,182)
                             xlab="Discrimination",
                             ylab="Difficulty",
                             zlab="Log-Likelihood")
        points(trans3d(alphas[xy[1,1]], deltas[xy[1,2]], logLike[xy[1,1],xy[1,2]], logLike3D), col='black', cex=1.5, pch=21, bg = "red")
      })
})
