shinyServer(function(input, output){
  
  output$nrm_plot <- renderPlot({
    
    D <- switch(input$D, "1" = 1, "2" = 1.702)
    
    
    p1num=1
    for(j in 1:N){
        p2num[j] <- p2fun(D=D, theta=thetas[j], alpha=input$alpha1, delta1=input$delta1)
        p3num[j] <- p3fun(D=D, theta=thetas[j], alpha=input$alpha2, delta2=input$delta2)
        p4num[j] <- p4fun(D=D, theta=thetas[j], alpha=input$alpha3, delta3=input$delta3)
        p5num[j] <- p5fun(D=D, theta=thetas[j], alpha=input$alpha4, delta4=input$delta4)
    }
    
    pdenom <- 1+p2num+p3num+p4num+p5num
    
    p1 <- p1num/pdenom
    p2 <- p2num/pdenom
    p3 <- p3num/pdenom
    p4 <- p4num/pdenom
    p5 <- p5num/pdenom
    
    graphics::plot(NULL, ylab="P(X=m|theta)", xlab=expression(theta), main="Nominal Response Model", 
              sub="Note: Baker's (1992) reparametrization is used.", xlim=c(-6,6), ylim=c(0,1))
    
    lines(thetas, p1, type="l",  xlim=c(-6,6), col=2)
    lines(thetas, p2, type="l",  xlim=c(-6,6), col=3)
    lines(thetas, p3, type="l",  xlim=c(-6,6), col=4)
    lines(thetas, p4, type="l",  xlim=c(-6,6), col=5)
    lines(thetas, p5, type="l",  xlim=c(-6,6), col=6)
    legend(legend=c("P(X=a|theta)", "P(X=b|theta)","P(X=c|theta)","P(X=d|theta)","P(X=e|theta)"), col=2:6, lty=1, "right")

  })
  
})
  