shinyUI(bootstrapPage(

  titlePanel("Graded Response Model (Samejima, 1969)"),

    inputPanel(
        selectInput("D", label = "Scaling Constant",
                  list("1" = 1, "1.702"=2), selected = 1),
        sliderInput("alpha", label = "Discrimination",
                  min = -3, max = 3, value = 1.5, step = .5),
        sliderInput("delta1", label = "Difficulty 1",
                  min = -2.5, max = -1.5, value = -2, step = .1),
        sliderInput("delta2", label = "Difficulty 2",
                    min = -1.25, max = -0.25, value = -0.75, step = .1),
        sliderInput("delta3", label = "Difficulty 3",
                    min = 0, max = 1.25, value = 0.75, step = .1),
        sliderInput("delta4", label = "Difficulty 4",
                    min = 1.5, max = 2.5, value = 2, step = .1)
      ),

    plotOutput(outputId="grm_plot",width="60%", height="500px")
  )
)
