shinyUI(bootstrapPage(

  titlePanel("RSM (default) and GRSM"),

    inputPanel(
        selectInput("D", label = "Scaling Constant",
                  list("1" = 1, "1.702"=2), selected = 1),
        sliderInput("alpha", label = "Discrimination",
                  min = -3, max = 3, value = 1, step = .5),
        sliderInput("delta", label = "Difficulty",
                    min = -3, max = 3, value = 0, step = .5),
        sliderInput("tau1", label = "Threshold 1",
                  min = -3, max = 3, value = -1, step = .5),
        sliderInput("tau2", label = "Threshold 2",
                    min = -3, max = 3, value = -0.4, step = .5),
        sliderInput("tau3", label = "Threshold 3",
                    min = -3, max = 3, value = 0.4, step = .5),
        sliderInput("tau4", label = "Threshold 4",
                    min = -3, max = 3, value = 1, step = .5)
      ),

    plotOutput(outputId="grsm_plot",width="60%", height="500px")
  )
)
