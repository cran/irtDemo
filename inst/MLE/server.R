shinyServer(function(input, output) {

   output$MLEIRT_plot <- renderPlot({
     patt <- c(rep(1,input$r), rep(0,5-input$r))
     logLike[,1] <- thetas
     for (j in 1:N) {
       for (i in 1:n) {
         u <- patt[i]
         pji[j,i] <- Pfun(theta=thetas[j], delta=deltas[i], u=patt[i])
       }
       logLike[j,2] <- sum(log(pji[j,]))
       logLike[j,3] <- prod(pji[j,])
     }

     thetahat <- logLike[logLike[,2]==max(logLike[,2]), 1]
     maxLL <- logLike[logLike[,2]==max(logLike[,2]), 2]

     t <- logLike[,1]
     ll <- logLike[,2]
     t_0 <- input$t_0

     for(i in 1:input$iter){
        graphics::plot(t, ll, type='l', xlab=expression(theta), ylab='LogLikelihood',
            xlim=c(-6,6), ylim=c(-15, 1))
       abline(h=0, col=8)
       spline <- smooth.spline(ll ~ t)
       lines(spline, col='black')

       fderiv0 <- predict(spline, x=t_0, deriv=0)
       fderiv1 <- predict(spline, x=t_0, deriv=1)
       fderiv2 <- predict(spline, x=t_0, deriv=2)
       points(fderiv0, col='black', pch=21, bg = "red", cex=1.5) # point to predict tangent
       text(fderiv0$x, fderiv0$y-1, expression(hat(theta)^0))

       t_1 <- t_0 - (fderiv1$y/fderiv2$y)

       theta0 <- t_0
       output$iterinfo <- renderText({
         paste(sep="",
               "Newton-Raphson step:", "\n",
               "theta1 = theta0 - (LL' / LL'')", "\n",
               round(t_1,4)," = ", round(theta0,4), " - ", "(", round(fderiv1$y,4), " / ",round(fderiv2$y,4), ")", "\n",
               "\n",
               "Acute angle with abscissa = ", round(deg, digits=0), " degrees"
         )
       })

       yint <- fderiv0$y - (fderiv1$y*t_0)
       xint <- -yint/fderiv1$y
       lines(t, yint + fderiv1$y*t, col='blue') # tangent (1st deriv. of spline at t_0)

       rad <- atan(fderiv0$y/(xint-t_0))
       deg <- rad*180/pi
       if(round(abs(deg), digits=0)>0){polygon(x=c(xint, t_0, t_0) , y=c(0,0,fderiv0$y), density = c(30))}

       y_1 <- predict(spline, x=t_1, deriv=0)
       points(t_1, y_1$y, col='black', pch=21, bg = "green", cex=1.5)
       text(t_1, y_1$y-1, expression(hat(theta)^1))

       abline(v=t_0, col=8, lty='dotted')
       abline(v=t_1, col=8, lty='dotted')

       t_0 <- t_1

     }
   })
})
