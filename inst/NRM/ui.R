shinyUI(bootstrapPage(

  titlePanel("Nominal Response Model (Bock, 1972)"),

    inputPanel(
        selectInput("D", label = "Scaling Constant",
                  list("1" = 1, "1.702"=2), selected = 1),
        sliderInput("alpha1", label = "Discrimination 1",
                  min = -3, max = 3, value = 0.5, step = .5),
        sliderInput("alpha2", label = "Discrimination 2",
                    min = -3, max = 3, value = 1, step = .5),
        sliderInput("alpha3", label = "Discrimination 3",
                    min = -3, max = 3, value = 1.5, step = .5),
        sliderInput("alpha4", label = "Discrimination 4",
                    min = -3, max = 3, value = 2, step = .5),
        sliderInput("delta1", label = "Difficulty 1",
                    min = -3, max = 3, value = -1, step = .5),
        sliderInput("delta2", label = "Difficulty 2",
                  min = -3, max = 3, value = -0.5, step = .5),
        sliderInput("delta3", label = "Difficulty 3",
                    min = -3, max = 3, value = -0.5, step = .5),
        sliderInput("delta4", label = "Difficulty 4",
                    min = -3, max = 3, value = 1, step = .5)
      ),

    plotOutput(outputId="nrm_plot",width="60%", height="500px")
  )
)
