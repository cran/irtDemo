shinyServer(function(input, output){

  output$grm_plot <- renderPlot({

    D <- switch(input$D, "1" = 1, "2" = 1.702)

    p <- matrix(NA,nrow=N,4)
    for(j in 1:N){
      p[j,1] <- Pfun(D=D, theta=thetas[j], delta=input$delta1, alpha=input$alpha)
      p[j,2] <- Pfun(D=D, theta=thetas[j], delta=input$delta2, alpha=input$alpha)
      p[j,3] <- Pfun(D=D, theta=thetas[j], delta=input$delta3, alpha=input$alpha)
      p[j,4] <- Pfun(D=D, theta=thetas[j], delta=input$delta4, alpha=input$alpha)
    }

     graphics::plot(NULL, ylab="P(X=m|theta)", xlab=expression(theta), main="Graded Response Model", xlim=c(-6,6), ylim=c(0,1))

    lines(thetas, 1-p[,1], type="l",  xlim=c(-6,6), col=2)
    lines(thetas, p[,1]-p[,2], type="l",  xlim=c(-6,6), col=3)
    lines(thetas, p[,2]-p[,3], type="l",  xlim=c(-6,6), col=4)
    lines(thetas, p[,3]-p[,4], type="l",  xlim=c(-6,6), col=5)
    lines(thetas, p[,4]-0, type="l",  xlim=c(-6,6), col=6)
    legend(legend=c("P(X=1|theta)", "P(X=2|theta)","P(X=3|theta)","P(X=4|theta)","P(X=5|theta)"), col=2:6, lty=1, "right")

  })
})
