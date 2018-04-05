shinyServer(function(input, output) {

    # simulate reponses for 3PL model
    pcorrmtx <- reactive({
      pcorrmtx <- matrix(NA, nrow=N, ncol=1)
      for(j in 1:N){
        pcorrmtx[j] <- Pfun(guess=input$guess, theta=thetas[j], delta=input$delta, alpha=input$alpha)
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


    logLike1 <- reactive({
      datamtx <- datamtx()
      # calculate the joint log-likelihood
        for (m in 1:k){
          for(n in 1:k){
            for (j in 1:N){
              pik[m,n,j] <- Pfun(guess=guesses[1], theta=thetas[j], alpha=alphas[m], delta=deltas[n], u=datamtx[j])
            }
            logLike[m,n] <- sum(log(pik[m,n,]))
          }
        }
       logLike
      })

    logLike2 <- reactive({
      datamtx <- datamtx()
      # calculate the joint log-likelihood
      for (m in 1:k){
        for(n in 1:k){
          for (j in 1:N){
            pik[m,n,j] <- Pfun(guess=guesses[2], theta=thetas[j], alpha=alphas[m], delta=deltas[n], u=datamtx[j])
          }
          logLike[m,n] <- sum(log(pik[m,n,]))
        }
      }
      logLike
    })

    logLike3 <- reactive({
      datamtx <- datamtx()
      # calculate the joint log-likelihood
      for (m in 1:k){
        for(n in 1:k){
          for (j in 1:N){
            pik[m,n,j] <- Pfun(guess=guesses[3], theta=thetas[j], alpha=alphas[m], delta=deltas[n], u=datamtx[j])
          }
          logLike[m,n] <- sum(log(pik[m,n,]))
        }
      }
      logLike
    })

    logLike4 <- reactive({
      datamtx <- datamtx()
      # calculate the joint log-likelihood
      for (m in 1:k){
        for(n in 1:k){
          for (j in 1:N){
            pik[m,n,j] <- Pfun(guess=guesses[4], theta=thetas[j], alpha=alphas[m], delta=deltas[n], u=datamtx[j])
          }
          logLike[m,n] <- sum(log(pik[m,n,]))
        }
      }
      logLike
    })

    logLike5 <- reactive({
      datamtx <- datamtx()
      # calculate the joint log-likelihood
      for (m in 1:k){
        for(n in 1:k){
          for (j in 1:N){
            pik[m,n,j] <- Pfun(guess=guesses[5], theta=thetas[j], alpha=alphas[m], delta=deltas[n], u=datamtx[j])
          }
          logLike[m,n] <- sum(log(pik[m,n,]))
        }
      }
      logLike
    })

    logLike6 <- reactive({
      datamtx <- datamtx()
      # calculate the joint log-likelihood
      for (m in 1:k){
        for(n in 1:k){
          for (j in 1:N){
            pik[m,n,j] <- Pfun(guess=guesses[6], theta=thetas[j], alpha=alphas[m], delta=deltas[n], u=datamtx[j])
          }
          logLike[m,n] <- sum(log(pik[m,n,]))
        }
      }
      logLike
    })

    logLike7 <- reactive({
      datamtx <- datamtx()
      # calculate the joint log-likelihood
      for (m in 1:k){
        for(n in 1:k){
          for (j in 1:N){
            pik[m,n,j] <- Pfun(guess=guesses[7], theta=thetas[j], alpha=alphas[m], delta=deltas[n], u=datamtx[j])
          }
          logLike[m,n] <- sum(log(pik[m,n,]))
        }
      }
      logLike
    })

    logLike8 <- reactive({
      datamtx <- datamtx()
      # calculate the joint log-likelihood
      for (m in 1:k){
        for(n in 1:k){
          for (j in 1:N){
            pik[m,n,j] <- Pfun(guess=guesses[8], theta=thetas[j], alpha=alphas[m], delta=deltas[n], u=datamtx[j])
          }
          logLike[m,n] <- sum(log(pik[m,n,]))
        }
      }
      logLike
    })

    logLike9 <- reactive({
      datamtx <- datamtx()
      # calculate the joint log-likelihood
      for (m in 1:k){
        for(n in 1:k){
          for (j in 1:N){
            pik[m,n,j] <- Pfun(guess=guesses[9], theta=thetas[j], alpha=alphas[m], delta=deltas[n], u=datamtx[j])
          }
          logLike[m,n] <- sum(log(pik[m,n,]))
        }
      }
      logLike
    })

    logLike10 <- reactive({
      datamtx <- datamtx()
      # calculate the joint log-likelihood
      for (m in 1:k){
        for(n in 1:k){
          for (j in 1:N){
            pik[m,n,j] <- Pfun(guess=guesses[10], theta=thetas[j], alpha=alphas[m], delta=deltas[n], u=datamtx[j])
          }
          logLike[m,n] <- sum(log(pik[m,n,]))
        }
      }
      logLike
    })

    logLike11 <- reactive({
      datamtx <- datamtx()
      # calculate the joint log-likelihood
      for (m in 1:k){
        for(n in 1:k){
          for (j in 1:N){
            pik[m,n,j] <- Pfun(guess=guesses[11], theta=thetas[j], alpha=alphas[m], delta=deltas[n], u=datamtx[j])
          }
          logLike[m,n] <- sum(log(pik[m,n,]))
        }
      }
      logLike
    })

    logLike12 <- reactive({
      datamtx <- datamtx()
      # calculate the joint log-likelihood
      for (m in 1:k){
        for(n in 1:k){
          for (j in 1:N){
            pik[m,n,j] <- Pfun(guess=guesses[12], theta=thetas[j], alpha=alphas[m], delta=deltas[n], u=datamtx[j])
          }
          logLike[m,n] <- sum(log(pik[m,n,]))
        }
      }
      logLike
    })

    xy1 <- reactive({
      logLike1 <- logLike1()
      which(logLike1==max(logLike1), TRUE)
      })

    xy2 <- reactive({
      logLike2 <- logLike2()
      which(logLike2==max(logLike2), TRUE)
    })

    xy3 <- reactive({
      logLike3 <- logLike3()
      which(logLike3==max(logLike3), TRUE)
    })

    xy4 <- reactive({
      logLike4 <- logLike4()
      which(logLike4==max(logLike4), TRUE)
    })

    xy5 <- reactive({
      logLike5 <- logLike5()
      which(logLike5==max(logLike5), TRUE)
    })

    xy6 <- reactive({
      logLike6 <- logLike6()
      which(logLike6==max(logLike6), TRUE)
    })

    xy7 <- reactive({
      logLike7 <- logLike7()
      which(logLike7==max(logLike7), TRUE)
    })

    xy8 <- reactive({
      logLike8 <- logLike8()
      which(logLike8==max(logLike8), TRUE)
    })

    xy9 <- reactive({
      logLike9 <- logLike9()
      which(logLike9==max(logLike9), TRUE)
    })

    xy10 <- reactive({
      logLike10 <- logLike10()
      which(logLike10==max(logLike10), TRUE)
    })

    xy11 <- reactive({
      logLike11 <- logLike11()
      which(logLike11==max(logLike11), TRUE)
    })

    xy12 <- reactive({
      logLike12 <- logLike12()
      which(logLike12==max(logLike12), TRUE)
    })

    observe({
      if(input$submit>0) {

      output$est3PL_plot_all <- renderPlot({
        xy1 <- isolate(xy1())
        logLike1 <- isolate(logLike1())
        xy2 <- isolate(xy2())
        logLike2 <- isolate(logLike2())
        xy3 <- isolate(xy3())
        logLike3 <- isolate(logLike3())
        xy4 <- isolate(xy4())
        logLike4 <- isolate(logLike4())
        xy5 <- isolate(xy5())
        logLike5 <- isolate(logLike5())
        xy6 <- isolate(xy6())
        logLike6 <- isolate(logLike6())
        xy7 <- isolate(xy7())
        logLike7 <- isolate(logLike7())
        xy8 <- isolate(xy8())
        logLike8 <- isolate(logLike8())
        xy9 <- isolate(xy9())
        logLike9 <- isolate(logLike9())
        xy10 <- isolate(xy10())
        logLike10 <- isolate(logLike10())
        xy11 <- isolate(xy11())
        logLike11 <- isolate(logLike11())
        xy12 <- isolate(xy12())
        logLike12 <- isolate(logLike12())

          # plot joint log-likelihood as function of guess, alpha and delta parameters
          logLike3D1 <-  graphics::persp(alphas, deltas, logLike1,
                               theta=input$angle1, phi=input$angle2,
                               ltheta = 120, shade = 0.75, col=2,
                               xlab="Discrimination",
                               ylab="Location",
                               zlab="Log-Likelihood",
                               nticks = 5, ticktype = "detailed")

          par(new=TRUE)
          logLike3D2 <-  graphics::persp(alphas, deltas, logLike2,
                              ltheta = 120, shade = 0.75,
                              theta=input$angle1, phi=input$angle2, col=3,
                              xlab="",
                              ylab="",
                              zlab="")

          par(new=TRUE)
          logLike3D3 <-  graphics::persp(alphas, deltas, logLike3,
                              ltheta = 120, shade = 0.75,
                              theta=input$angle1, phi=input$angle2, col=4,
                              xlab="",
                              ylab="",
                              zlab="")

          par(new=TRUE)
          logLike3D4 <-  graphics::persp(alphas, deltas, logLike4,
                              ltheta = 120, shade = 0.75,
                              theta=input$angle1, phi=input$angle2, col=5,
                              xlab="",
                              ylab="",
                              zlab="")

          par(new=TRUE)
          logLike3D5 <-  graphics::persp(alphas, deltas, logLike5,
                              ltheta = 120, shade = 0.75,
                              theta=input$angle1, phi=input$angle2, col=6,
                              xlab="",
                              ylab="",
                              zlab="")

          par(new=TRUE)
          logLike3D6 <-  graphics::persp(alphas, deltas, logLike6,
                              ltheta = 120, shade = 0.75,
                              theta=input$angle1, phi=input$angle2, col=7,
                              xlab="",
                              ylab="",
                              zlab="")

          par(new=TRUE)
          logLike3D7 <-  graphics::persp(alphas, deltas, logLike7,
                              ltheta = 120, shade = 0.75,
                              theta=input$angle1, phi=input$angle2, col=8,
                              xlab="",
                              ylab="",
                              zlab="")

          par(new=TRUE)
          logLike3D8 <-  graphics::persp(alphas, deltas, logLike8,
                              ltheta = 120, shade = 0.75,
                              theta=input$angle1, phi=input$angle2, col=9,
                              xlab="",
                              ylab="",
                              zlab="")

          par(new=TRUE)
          logLike3D9 <-  graphics::persp(alphas, deltas, logLike9,
                              ltheta = 120, shade = 0.75,
                              theta=input$angle1, phi=input$angle2, col=10,
                              xlab="",
                              ylab="",
                              zlab="")

          par(new=TRUE)
          logLike3D10 <-  graphics::persp(alphas, deltas, logLike10,
                              ltheta = 120, shade = 0.75,
                              theta=input$angle1, phi=input$angle2, col=11,
                              xlab="",
                              ylab="",
                              zlab="")

          par(new=TRUE)
          logLike3D11 <-  graphics::persp(alphas, deltas, logLike11,
                              ltheta = 120, shade = 0.75,
                              theta=input$angle1, phi=input$angle2, col=12,
                              xlab="",
                              ylab="",
                              zlab="")

          par(new=TRUE)
          logLike3D12 <- graphics::persp(alphas, deltas, logLike12,
                              ltheta = 120, shade = 0.75,
                              theta=input$angle1, phi=input$angle2, col=13,
                              xlab="",
                              ylab="",
                              zlab="")

          maxLL  <- max(logLike1[xy1[1,1],xy1[1,2]],
                        logLike2[xy2[1,1],xy2[1,2]],
                        logLike3[xy3[1,1],xy3[1,2]],
                        logLike4[xy4[1,1],xy4[1,2]],
                        logLike5[xy5[1,1],xy3[1,2]],
                        logLike6[xy6[1,1],xy1[1,2]],
                        logLike7[xy7[1,1],xy2[1,2]],
                        logLike8[xy8[1,1],xy3[1,2]],
                        logLike9[xy9[1,1],xy4[1,2]],
                        logLike10[xy7[1,1],xy2[1,2]],
                        logLike11[xy8[1,1],xy3[1,2]],
                        logLike12[xy9[1,1],xy4[1,2]])

              points(trans3d(alphas[xy1[1,1]], deltas[xy1[1,2]], logLike1[xy1[1,1],xy1[1,2]], logLike3D1), col='black', pch=21, bg = 2, cex=1.5)
              points(trans3d(alphas[xy2[1,1]], deltas[xy2[1,2]], logLike2[xy2[1,1],xy2[1,2]], logLike3D2), col='black', pch=21, bg = 3, cex=1.5)
              points(trans3d(alphas[xy3[1,1]], deltas[xy3[1,2]], logLike3[xy3[1,1],xy3[1,2]], logLike3D3), col='black', pch=21, bg = 4, cex=1.5)
              points(trans3d(alphas[xy4[1,1]], deltas[xy4[1,2]], logLike4[xy4[1,1],xy4[1,2]], logLike3D4), col='black', pch=21, bg = 5, cex=1.5)
              points(trans3d(alphas[xy5[1,1]], deltas[xy5[1,2]], logLike5[xy5[1,1],xy3[1,2]], logLike3D5), col='black', pch=21, bg = 6, cex=1.5)
              points(trans3d(alphas[xy6[1,1]], deltas[xy6[1,2]], logLike6[xy6[1,1],xy1[1,2]], logLike3D6), col='black', pch=21, bg = 7, cex=1.5)
              points(trans3d(alphas[xy7[1,1]], deltas[xy7[1,2]], logLike7[xy7[1,1],xy2[1,2]], logLike3D7), col='black', pch=21, bg = 8, cex=1.5)
              points(trans3d(alphas[xy8[1,1]], deltas[xy8[1,2]], logLike8[xy8[1,1],xy3[1,2]], logLike3D8), col='black', pch=21, bg = 9, cex=1.5)
              points(trans3d(alphas[xy9[1,1]], deltas[xy9[1,2]], logLike9[xy9[1,1],xy4[1,2]], logLike3D9), col='black', pch=21, bg = 10, cex=1.5)
          points(trans3d(alphas[xy10[1,1]], deltas[xy10[1,2]], logLike10[xy10[1,1],xy3[1,2]], logLike3D10), col='black', pch=21, bg = 11, cex=1.5)
          points(trans3d(alphas[xy11[1,1]], deltas[xy11[1,2]], logLike11[xy11[1,1],xy1[1,2]], logLike3D11), col='black', pch=21, bg = 12, cex=1.5)
          points(trans3d(alphas[xy12[1,1]], deltas[xy12[1,2]], logLike12[xy12[1,1],xy2[1,2]], logLike3D12), col='black', pch=21, bg = 13, cex=1.5)

          legend(legend=paste("c=", seq(0.05, .60, .05), sep=""), col=2:13, pch=19, title="Lower Asymptote", "right")
        })

      }
    })
})
