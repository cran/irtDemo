shinyServer(function(input, output){
  
  
  output$dich_plot <- renderPlot({
    
    D <- switch(input$D, "1" = 1, "2" = 1.702)
    
    for(j in 1:N){
      p1[j] <- Pfun(D=D, la=input$la, ua=input$ua, theta=thetas[j], delta=input$delta, alpha=input$alpha)
    }
    
    if(input$la==0 & input$ua==1 & input$alpha==1){title <- c("Rasch Model")}
    if(input$la==0 & input$ua==1 & input$alpha!=1){title <- c("1PL or 2PL Model")} 
    if(input$ua==1 & input$la!=0){title <- c("3PL Model")} 
    if(input$la!=0 & input$ua!=1){title <- c("4PL Model")} 
    
    output$feedback <- renderText({
      ifelse(input$ua!=1 & input$la==0, "No such model!", paste(title, ": a=",input$alpha," b=",input$delta, " c=", input$la, " d=", input$ua))
    })
    
      
    graphics::plot(NULL, ylab=expression(P(X)), xlab=expression(theta), xlim=c(-6,6), ylim=c(0,1))

    modprob <- switch(input$modprob, "1" = 1, "2" = 2)
    
    if(modprob==1){
      lines(thetas, p1, type="l",  xlim=c(-6,6), col=1)
      legend(legend="P(X=1|theta)", col=1, lty=1, "right")
    }
    
    if(modprob==2){
      lines(thetas, p1, type="l",  xlim=c(-6,6), col=1)
      lines(thetas, 1-p1, type="l",  xlim=c(-6,6), col=2)
      legend(legend=c("P(X=1|theta)", "P(X=0|theta)"), col=c(1,2), lty=1, "right")
    }
  })
})
  