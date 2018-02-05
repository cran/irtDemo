shinyUI(bootstrapPage(

  titlePanel("Rasch PCM (default) and 2PL GPCM"),

    inputPanel(
        selectInput("D", label = "Scaling Constant",
                  list("1" = 1, "1.702"=2), selected = 1),
        sliderInput("alpha", label = "Discrimination",
                  min = -3, max = 3, value = 1, step = .5),
        sliderInput("delta1", label = "Step parameter 1",
                  min = -3, max = 3, value = -2, step = .5),
        sliderInput("delta2", label = "Step parameter 2",
                    min = -3, max = 3, value = -0.75, step = .5),
        sliderInput("delta3", label = "Step parameter 3",
                    min = -3, max = 3, value = 0.75, step = .5),
        sliderInput("delta4", label = "Step parameter 4",
                    min = -3, max = 3, value = 2, step = .5)
      ),

    plotOutput(outputId="gpcm_plot",width="60%", height="500px")
  )
)
