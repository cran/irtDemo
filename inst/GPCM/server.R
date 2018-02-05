shinyServer(function(input, output){

  output$gpcm_plot <- renderPlot({

    D <- switch(input$D, "1" = 1, "2" = 1.702)

    if(input$alpha==0){stop("0 (zero) discrimination?!")}

    p1num=1
    for(j in 1:N){
        p2num[j] <- p2fun(D=D, theta=thetas[j], alpha=input$alpha, delta1=input$delta1)
        p3num[j] <- p3fun(D=D, theta=thetas[j], alpha=input$alpha, delta1=input$delta1, delta2=input$delta2)
        p4num[j] <- p4fun(D=D, theta=thetas[j], alpha=input$alpha, delta1=input$delta1, delta2=input$delta2, delta3=input$delta3)
        p5num[j] <- p5fun(D=D, theta=thetas[j], alpha=input$alpha, delta1=input$delta1, delta2=input$delta2, delta3=input$delta3, delta4=input$delta4)
    }

    pdenom <- 1+p2num+p3num+p4num+p5num

    p1 <- p1num/pdenom
    p2 <- p2num/pdenom
    p3 <- p3num/pdenom
    p4 <- p4num/pdenom
    p5 <- p5num/pdenom

    title <- ifelse(input$alpha==1, "Partial Credit Model (Masters, 1982)",
                          "Generalized Partial Credit Model (Muraki, 1992)")

     graphics::plot(NULL, ylab=expression(P(X)), xlab=expression(theta), main=paste(title), xlim=c(-6,6), ylim=c(0,1))

    lines(thetas, p1, type="l",  xlim=c(-6,6), col=2)
    lines(thetas, p2, type="l",  xlim=c(-6,6), col=3)
    lines(thetas, p3, type="l",  xlim=c(-6,6), col=4)
    lines(thetas, p4, type="l",  xlim=c(-6,6), col=5)
    lines(thetas, p5, type="l",  xlim=c(-6,6), col=6)
    legend(legend=c("P(X=1|theta)", "P(X=2|theta)","P(X=3|theta)","P(X=4|theta)","P(X=5|theta)"), col=2:6, lty=1, "right")

  })

})
