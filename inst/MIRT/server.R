shinyServer(function(input, output) {

    pjj <- reactive({

      if(input$alpha1==0 | input$alpha2==0){stop("Select a discrimination value other than 0 (zero)!")}

      D <- switch(input$D, "1" = 1, "2" = 1.702)
      comp <- switch(input$comp, "1" = 1, "2" = 2)
      pjj <- matrix(NA,nrow=N,ncol=N)
      if(comp==1){
        for(j1 in 1:N){
          for (j2 in 1:N){
            pjj[j1,j2] <- Pfun(theta1=thetas1[j1], theta2=thetas2[j2], c=input$c, d=input$d, alpha1=input$alpha1,
                               alpha2=input$alpha2, delta1=input$delta1, delta2=input$delta2, D=D)
          }
        }
      }

      if(comp==2){
        for(j1 in 1:N){
          for (j2 in 1:N){
            pjj[j1,j2] <- Pfun2(theta1=thetas1[j1], theta2=thetas2[j2], c=input$c, d=input$d, alpha1=input$alpha1,
                               alpha2=input$alpha2, delta1=input$delta1, delta2=input$delta2, D=D)
          }
        }
      }
      pjj

    })

    output$plotpersp <- renderPlot({
      pjj <- pjj()
      # plot probability as function of theta1 and theta2
      p3D <-  graphics::persp(thetas1, thetas2, pjj,
                              theta=input$angle1, phi=input$angle2,
                              zlim=c(0,1),
                              xlab=input$nametheta1,
                              ylab=input$nametheta2,
                              zlab="P(Y=1)", las = 1,
                              nticks = 5, ticktype = "detailed"
      )
    })


    output$plotcont <- renderPlot({

      pjj <- pjj()
      c <- input$c
      d <- input$d
      alpha1 <- input$alpha1
      alpha2 <- input$alpha2
      delta1 <- input$delta1
      delta2 <- input$delta2
      gamma <- -(alpha1*delta1+alpha2*delta2)
      omega1 <- acos(alpha1/sqrt(alpha1^2+alpha2^2)) #in radians
      omega2 <- acos(alpha2/sqrt(alpha1^2+alpha2^2)) #in radians

      Ai <- sqrt(alpha1^2+alpha2^2) #multidimensional discrimination
      Di <- -gamma/Ai

      # plot probability as function of theta1 and theta2
       graphics::contour(thetas1, thetas2, pjj, nlevels=input$nlevels, cex=1.5,
                   xlab=input$nametheta1,
                   ylab=input$nametheta2
                   )
        abline(h=0,v=0)
        if(c==0 & d==1){
          cont <- contourLines(thetas1, thetas2, pjj, levels=0.5)
          lines(cont[[1]]$x, cont[[1]]$y, lwd=2)
        }
        if(c>0 & d==1){
          cont <- contourLines(thetas1, thetas2, pjj, levels=(c+1)/2)
          lines(cont[[1]]$x, cont[[1]]$y, lwd=2)
        }
        if(c>0 & d<1){
          cont <- contourLines(thetas1, thetas2, pjj, levels=(c+d)/2)
          lines(cont[[1]]$x, cont[[1]]$y, lwd=2)
        }

        comp <- switch(input$comp, "1" = 1, "2" = 2)
        if(comp==1){
          if(alpha2>0){
            arrows(Di*cos(omega1), Di*sin(omega1),
                   x1=(Di+Ai)*cos(omega1),
                   y1=(Di+Ai)*sin(omega1), code=2, length=0.1, col="blue")
          }
          if(alpha2<0){
            arrows((Di+Ai)*cos(omega1), -(Di+Ai)*sin(omega1),
                   x1=Di*cos(omega1),
                   y1=-Di*sin(omega1), code=1, length=0.1, col="blue")
          }
        }
    })

    output$infopersp <- renderPlot({
      c <- input$c
      d <- input$d
      alpha1 <- input$alpha1
      alpha2 <- input$alpha2
      Ai <- sqrt(alpha1^2+alpha2^2) #multidimensional discrimination
      pjj <- pjj()
      info <- matrix(NA,nrow=N,ncol=N)
      for(j1 in 1:N){
        for (j2 in 1:N){
          info[j1,j2] <- (Ai^2)*((pjj[j1,j2]-c)^2)*((d-pjj[j1,j2])^2)/((d-c)^2)*((1-pjj[j1,j2])/pjj[j1,j2]) # (Magis, 2013)
        }
      }
      graphics::persp(thetas1, thetas2, info,
                      theta=input$angleinfo1, phi=input$angleinfo2,
                      zlim=c(0,max(info)),
                      xlab=input$nametheta1,
                      ylab=input$nametheta2,
                      zlab="Information",
                      nticks = 5, ticktype = "detailed"
      )
    })


    output$parms1 <- renderText({
      paste("Item parameters: ","a1=",input$alpha1,
            ", a2=",input$alpha2,", b1=",input$delta1,
            ", b2=",input$delta2,", c=",input$c,
            ", d=",input$d, sep="")
    })

    output$parms2 <- renderText({
      paste("Item parameters: ","a1=",input$alpha1,
            ", a2=",input$alpha2,", b1=",input$delta1,
            ", b2=",input$delta2,", c=",input$c,
            ", d=",input$d, sep="")
    })

    output$parms3 <- renderText({
      paste("Item parameters: ","a1=",input$alpha1,
            ", a2=",input$alpha2,", b1=",input$delta1,
            ", b2=",input$delta2,", c=",input$c,
            ", d=",input$d, sep="")
    })

})
